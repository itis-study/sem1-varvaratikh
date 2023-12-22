package restaurant_page;

import main_page.RestaurantDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/reservation")
public class ReservationServlet extends HttpServlet {

    private RestaurantDao restaurantDao;

    @Override
    public void init() throws ServletException {
        String jdbcUrl = "jdbc:postgresql://localhost:5432/registration";
        restaurantDao = new RestaurantDao(jdbcUrl);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String restaurantId = request.getParameter("id");

        String tableName = request.getParameter("tableName");
        String reservationTime = request.getParameter("reservationTime");

        String restaurantName = getRestaurantNameById(restaurantId);

        request.getSession().setAttribute("restaurantName", restaurantName);

        String userEmail = (String) request.getSession().getAttribute("userEmail");

        handleReservation(restaurantId, tableName, reservationTime, userEmail);

        response.sendRedirect("confirmation.jsp");

        int rating = Integer.parseInt(request.getParameter("rating"));
        String comment = request.getParameter("comment");

        addReview(Integer.parseInt(restaurantId), userEmail, rating, comment);
    }

    private String getRestaurantNameById(String restaurantId) {
        int id = Integer.parseInt(restaurantId);
        return restaurantDao.getRestaurantNameById(id);
    }

    private void handleReservation(String restaurantId, String tableName, String reservationTime, String userEmail) {
        restaurantDao.makeReservation(restaurantId, tableName, reservationTime, userEmail);
    }

    private void addReview(int restaurantId, String userEmail, int rating, String comment) {
        restaurantDao.addReview(restaurantId, userEmail, rating, comment);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("reservation.jsp").forward(request, response);
    }
}
