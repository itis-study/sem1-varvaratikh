package main_page;

import revieww.Review;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RestaurantDao {
    private String jdbcUrl;

    public RestaurantDao(String jdbcUrl) {
        this.jdbcUrl = jdbcUrl;
    }

    public List<Restaurant> getAllRestaurants() {
        List<Restaurant> restaurants = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(jdbcUrl)) {
            String query = "SELECT * FROM restaurants";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                ResultSet resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    restaurants.add(new Restaurant(
                            resultSet.getInt("id"),
                            resultSet.getString("name"),
                            resultSet.getString("description"),
                            resultSet.getString("image")
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Failed to connect to the database. Check your JDBC URL.");
        }
        return restaurants;
    }

    public Restaurant getRestaurantById(int id) {
        Restaurant restaurant = null;
        try (Connection connection = DriverManager.getConnection(jdbcUrl)) {
            String query = "SELECT * FROM restaurants WHERE id=?";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, id);
                ResultSet resultSet = statement.executeQuery();
                if (resultSet.next()) {
                    restaurant = new Restaurant(
                            resultSet.getInt("id"),
                            resultSet.getString("name"),
                            resultSet.getString("description"),
                            resultSet.getString("image")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return restaurant;
    }

    public String getRestaurantNameById(int id) {
        String restaurantName = null;
        try (Connection connection = DriverManager.getConnection(jdbcUrl)) {
            String query = "SELECT name FROM restaurants WHERE id=?";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, id);
                ResultSet resultSet = statement.executeQuery();
                if (resultSet.next()) {
                    restaurantName = resultSet.getString("name");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return restaurantName;
    }

    public void makeReservation(String id, String tableName, String reservationTime, String userEmail) {
        try (Connection connection = DriverManager.getConnection(jdbcUrl)) {
            if (isTableAvailable(id, tableName, reservationTime)) {

                String query = "INSERT INTO reservations (id, table_name, reservation_time, user_email) " +
                        "VALUES (?, ?, ?, ?)";
                try (PreparedStatement statement = connection.prepareStatement(query)) {
                    statement.setInt(1, Integer.parseInt(id));
                    statement.setString(2, tableName);
                    statement.setString(3, reservationTime);
                    statement.setString(4, userEmail);
                    statement.executeUpdate();
                }
            } else {
                throw new RuntimeException("Selected table is not available at the specified time.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private boolean isTableAvailable(String restaurantId, String tableName, String reservationTime) {
        try (Connection connection = DriverManager.getConnection(jdbcUrl)) {

            String query = "SELECT COUNT(*) FROM reservations " +
                    "WHERE id = ? AND table_name = ? AND reservation_time = ?";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, Integer.parseInt(restaurantId));
                statement.setString(2, tableName);
                statement.setString(3, reservationTime);
                ResultSet resultSet = statement.executeQuery();

                return resultSet.next() && resultSet.getInt(1) == 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void addReview(int restaurantId, String userEmail, int rating, String comment) {
        try (Connection connection = DriverManager.getConnection(jdbcUrl)) {
            String query = "INSERT INTO reviews (restaurant_id, user_email, rating, comment) VALUES (?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, restaurantId);
                statement.setString(2, userEmail);
                statement.setInt(3, rating);
                statement.setString(4, comment);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Review> getReviewsByRestaurantId(int restaurantId) {
        List<Review> reviews = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(jdbcUrl)) {
            String query = "SELECT * FROM reviews WHERE restaurant_id=?";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, restaurantId);
                ResultSet resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    reviews.add(new Review(
                            resultSet.getInt("id"),
                            resultSet.getInt("restaurant_id"),
                            resultSet.getString("user_email"),
                            resultSet.getInt("rating"),
                            resultSet.getString("comment"),
                            resultSet.getTimestamp("created_at").toLocalDateTime()
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }

}