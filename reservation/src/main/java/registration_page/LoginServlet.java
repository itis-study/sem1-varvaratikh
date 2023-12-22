package registration_page;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:postgresql://localhost:5432/registration";
    private static final String JDBC_USER = "barbereena";
    private static final String JDBC_PASSWORD = "F424033D2";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userEmail = request.getParameter("userEmail");
        String password = request.getParameter("password");


        try {
            Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);


            if (isValidUser(connection, userEmail, password)) {

                HttpSession session = request.getSession();
                session.setAttribute("userEmail", userEmail);

                response.sendRedirect("profile.jsp");
            }

            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private boolean isValidUser(Connection connection, String userEmail, String password) throws SQLException {
        String query = "SELECT * FROM users WHERE email = ? AND password = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, userEmail);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            return resultSet.next();
        }
    }
}