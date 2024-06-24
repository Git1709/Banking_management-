import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/balance")
public class balance extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String adharNumber = request.getParameter("adhrcode");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BankDataEntries", "root", "Doflamingo");

            // Check if AdharNumber exists
            String checkQuery = "SELECT * FROM Entries WHERE AdharNumber = ?";
            try (PreparedStatement checkStatement = con.prepareStatement(checkQuery)) {
                checkStatement.setString(1, adharNumber);
                ResultSet checkResult = checkStatement.executeQuery();

                if (checkResult.next()) {
                    // AdharNumber exists, retrieve the balance
                    int balance = checkResult.getInt("Balance");
                    out.println("<p>Balance for Adhar Number " + adharNumber + ": $" + balance + "</p>");
                    out.println("<form action='homepage.jsp'><input type='submit' value='Home'></form>");
                } else {
                    out.println("<p>Adhar Number not found</p>");
                    out.println("<form action='homepage.jsp'><input type='submit' value='Home'></form>");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            out.println("Error: " + e.getMessage());
        }
    }
}
