package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import ga7.pkg220501096.aa2.model.User;
import service.Service;
import ga7.pkg220501096.aa2.controller.MyConnection;

@WebServlet("/createUser")
public class CreateUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String passwordHash = request.getParameter("passwordHash");
        String publicKey = request.getParameter("publicKey");

        if (username != null && !username.isEmpty() && passwordHash != null && !passwordHash.isEmpty() && publicKey != null && !publicKey.isEmpty()) {
            try {
                Connection conn = MyConnection.connect();
                Service service = new Service();

                User newUser = new User();
                newUser.setUsername(username);
                newUser.setPasswordHash(passwordHash);
                newUser.setPublicKey(publicKey);
                service.createUser(conn, newUser);

                out.println("<p>User created with ID: " + newUser.getUserId() + "</p>");
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
            }
        } else {
            out.println("<p>Please provide all user details.</p>");
        }
    }
}
