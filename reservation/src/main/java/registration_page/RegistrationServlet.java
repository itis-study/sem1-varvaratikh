package registration_page;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:postgresql://localhost:5432/mydb";
    private static final String JDBC_USER = "barbereena";
    private static final String JDBC_PASSWORD = "F424033D2";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userEmail = request.getParameter("userEmail");

        String password = request.getParameter("password");

        try {
            Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            if (isUserExists(connection, userEmail)) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Пользователь с таким email уже существует.");
            } else {

                registerUser(connection, userEmail, password);

                response.sendRedirect("registration.jsp");
            }

            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private boolean isUserExists(Connection connection, String userEmail) throws SQLException {
        String query = "SELECT * FROM users WHERE email = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, userEmail);
            ResultSet resultSet = statement.executeQuery();
            return resultSet.next();
        }
    }

    private void registerUser(Connection connection, String userEmail, String password) throws SQLException {
        String query = "INSERT INTO users (email, password) VALUES (?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, userEmail);
            statement.setString(2, password);
            statement.executeUpdate();
        }
    }
}