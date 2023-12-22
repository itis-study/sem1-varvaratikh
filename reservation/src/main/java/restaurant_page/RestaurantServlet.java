package restaurant_page;

import main_page.Restaurant;
import main_page.RestaurantDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/restaurant")
public class RestaurantServlet extends HttpServlet {
    private RestaurantDao restaurantService;

    @Override
    public void init() throws ServletException {
        restaurantService = new RestaurantDao("jdbc:postgresql://localhost:5432/mydb");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String restaurantIdString = request.getParameter("id");

        if (restaurantIdString != null && !restaurantIdString.isEmpty()) {
            try {
                int restaurantId = Integer.parseInt(restaurantIdString);

                Restaurant restaurant = restaurantService.getRestaurantById(restaurantId);

                request.setAttribute("restaurant", restaurant);

                RequestDispatcher dispatcher = request.getRequestDispatcher("/restaurant.jsp");
                dispatcher.forward(request, response);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid restaurant id format");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Restaurant id is required");
        }
    }
}


