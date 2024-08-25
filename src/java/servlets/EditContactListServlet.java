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
public class EditContactListServlet extends HttpServlet {
    
    private final Connection myConnection;
    private final Service service;
    
    public EditContactListServlet(Service service){
        this.myConnection = MyConnection.connect();
        this.service = service;
    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse
response)
throws ServletException, IOException {
String action = request.getParameter("action");
  try (Connection conn = getConnection()) {
if ("create".equals(action)) {
// Insert new contact
String sql = "INSERT INTO contacts (name, phone, email) VALUES (?, ?, ?)";
try (PreparedStatement stmt = conn.prepareStatement(sql)) {
stmt.setString(1, request.getParameter("name"));
stmt.setString(2, request.getParameter("phone"));
stmt.setString(3, request.getParameter("email"));
stmt.executeUpdate();
}
  } else if ("update".equals(action)) {
// Update existing contact
String sql = "UPDATE contacts SET name=?, phone=?, email=? WHERE id=?";
try (PreparedStatement stmt = conn.prepareStatement(sql)) {
stmt.setString(1, request.getParameter("name"));
stmt.setString(2, request.getParameter("phone"));
stmt.setString(3, request.getParameter("email"));
stmt.setInt(4, Integer.parseInt(request.getParameter("id")));
stmt.executeUpdate();
}
  } else if ("delete".equals(action)) {
// Delete contact by ID
String sql = "DELETE FROM contacts WHERE id=?";
try (PreparedStatement stmt = conn.prepareStatement(sql)) {
stmt.setInt(1, Integer.parseInt(request.getParameter("id")));
stmt.executeUpdate();
}
}
} catch (Exception e) {
e.printStackTrace();
}
response.sendRedirect("index.jsp");
}
    
}
