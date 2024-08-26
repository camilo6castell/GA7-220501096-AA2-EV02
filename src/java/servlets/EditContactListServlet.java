package servlets;


import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;



///import jakarta.servlet.http.HttpServlet;
import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

import ga7.pkg220501096.aa2.model.User;

import ga7.pkg220501096.aa2.controller.MyConnection;
import java.io.IOException;
import java.util.ArrayList;

//@WebServlet("/EditContactListServlet")
public class EditContactListServlet extends HttpServlet {

    public EditContactListServlet() {
        super(); // Constructor sin lógica adicional
    }

    //@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("Servlet invoked successfully.");

        String action = request.getParameter("action");
        if ("read".equals(action)) {
            try (Connection myConnection = MyConnection.connect()) {
                // Read all contacts
                String sql = "SELECT * FROM users";
                try (PreparedStatement stmt = myConnection.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
                    ArrayList<User> userList = new ArrayList<>();
                    while (rs.next()) {
                        User user = new User(
                                rs.getInt("user_id"),
                                rs.getString("username"),
                                rs.getString("public_key")
                        );
                        userList.add(user);
                    }
                    request.setAttribute("users", userList);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        }
    }

    //@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("Servlet invoked successfully.");

        String action = request.getParameter("action");
        try (Connection myConnection = MyConnection.connect()) { // Conexión en cada petición
            if ("create".equals(action)) {
                // Insert new contact
                String sql = "INSERT INTO users (username, public_key) VALUES (?, ?)";
                try (PreparedStatement stmt = myConnection.prepareStatement(sql)) {
                    stmt.setString(1, request.getParameter("username"));
                    stmt.setString(2, request.getParameter("publicKey"));
                    stmt.executeUpdate();
                }
            } else if ("update".equals(action)) {
                // Update existing contact
                String sql = "UPDATE users SET username=?, public_key=? WHERE user_id=?";
                try (PreparedStatement stmt = myConnection.prepareStatement(sql)) {
                    stmt.setString(1, request.getParameter("usernameUpdate"));
                    stmt.setString(2, request.getParameter("publicKeyUpdate"));
                    stmt.setInt(3, Integer.parseInt(request.getParameter("idUpdate")));
                    stmt.executeUpdate();
                }
            } else if ("delete".equals(action)) {
                // Delete contact by ID
                String sql = "DELETE FROM users WHERE user_id=?";
                try (PreparedStatement stmt = myConnection.prepareStatement(sql)) {
                    stmt.setInt(1, Integer.parseInt(request.getParameter("idDelete")));
                    stmt.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("index.jsp");
    }

}
