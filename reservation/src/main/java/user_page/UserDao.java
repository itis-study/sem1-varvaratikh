package user_page;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    private String jdbcUrl;

    public UserDao(String jdbcUrl) {
        this.jdbcUrl = jdbcUrl;
    }

    public User getUserByEmail(String email) {
        User user = null;
        try (Connection connection = DriverManager.getConnection(jdbcUrl)) {
            String query = "SELECT * FROM users WHERE email=?";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, email);
                ResultSet resultSet = statement.executeQuery();
                if (resultSet.next()) {
                    user = new User();
                    user.setId(resultSet.getInt("id"));
                    user.setEmail(resultSet.getString("email"));
                    user.setName(resultSet.getString("name"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}