package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import ga7.pkg220501096.aa2.model.User;
import service.Service;
import ga7.pkg220501096.aa2.controller.MyConnection;

@WebServlet("/getUser")
public class GetUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String userIdParam = request.getParameter("userId");

        if (userIdParam != null && !userIdParam.isEmpty()) {
            try {
                Long userId = Long.parseLong(userIdParam);
                Connection conn = MyConnection.connect();
                Service service = new Service();
                User user = service.getUserById(conn, userId);

                if (user != null) {
                    out.println("<p>ID: " + user.getUserId() + "</p>");
                    out.println("<p>Username: " + user.getUsername() + "</p>");
                    out.println("<p>Password Hash: " + user.getPasswordHash() + "</p>");
                    out.println("<p>Public Key: " + user.getPublicKey() + "</p>");
                    out.println("<p>Created At: " + user.getCreatedAt() + "</p>");
                } else {
                    out.println("<p>No user found with ID: " + userId + "</p>");
                }
                conn.close();
            } catch (NumberFormatException | SQLException e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
            }
        } else {
            out.println("<p>Please provide a valid User ID.</p>");
        }
    }
}
