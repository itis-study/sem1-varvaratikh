package main_page;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/")
public class MainServlet extends HttpServlet {
    private RestaurantDao restaurantDao;

    @Override
    public void init() throws ServletException {
        super.init();
        String jdbcUrl = "jdbc:postgresql://localhost:5432/mydb?user=barbereena&password=F424033D2";
        restaurantDao = new RestaurantDao(jdbcUrl);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Restaurant> restaurants = restaurantDao.getAllRestaurants();
            System.out.println("Number of restaurants: " + restaurants.size());
            request.setAttribute("restaurants", restaurants);
            request.getRequestDispatcher("main_page.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred: " + e.getMessage());
        }
    }
}

