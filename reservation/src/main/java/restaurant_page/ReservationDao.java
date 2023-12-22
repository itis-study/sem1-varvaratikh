package restaurant_page;

import main_page.Restaurant;
import main_page.RestaurantDao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReservationDao {
    private String jdbcUrl;

    public ReservationDao(String jdbcUrl) {
        this.jdbcUrl = jdbcUrl;
    }

    public List<Reservation> getReservationsByUserId(int userId) {
        List<Reservation> reservations = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(jdbcUrl)) {
            String query = "SELECT * FROM reservations WHERE user_id=?";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, userId);
                ResultSet resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    Reservation reservation = new Reservation();
                    reservation.setId(resultSet.getInt("id"));
                    reservation.setTableName(resultSet.getString("table_name"));
                    reservation.setReservationTime(resultSet.getString("reservation_time"));

                    int restaurantId = resultSet.getInt("restaurant_id");
                    reservation.setRestaurant(getRestaurantById(restaurantId));

                    reservations.add(reservation);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reservations;
    }

    private Restaurant getRestaurantById(int restaurantId) {
        RestaurantDao restaurantDao = new RestaurantDao(jdbcUrl);
        return restaurantDao.getRestaurantById(restaurantId);
    }
}
