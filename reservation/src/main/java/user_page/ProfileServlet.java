package user_page;

import restaurant_page.Reservation;
import restaurant_page.ReservationDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

    private UserDao userDao;
    private ReservationDao reservationDao;

    @Override
    public void init() throws ServletException {
        String jdbcUrl = "jdbc:postgresql://localhost:5432/mydb";
        userDao = new UserDao(jdbcUrl);
        reservationDao = new ReservationDao(jdbcUrl);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute("userEmail") != null) {
            String userEmail = (String) session.getAttribute("userEmail");
            request.setAttribute("userEmail", userEmail);
            User user = userDao.getUserByEmail(userEmail);

            List<Reservation> reservations = reservationDao.getReservationsByUserId(user.getId());

            request.setAttribute("user", user);
            request.setAttribute("reservations", reservations);

            request.getRequestDispatcher("profile.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}