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

@WebServlet("/deposit")
public class deposit extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String adharNumber = request.getParameter("adhrcode");
        String password = request.getParameter("password");
        String depositAmount = request.getParameter("amount");
        String securityCode = request.getParameter("SecurityCode");
        if (!"BankApproved".equals(securityCode)) {
            out.println("<p>Incorrect Security Code. Please enter the correct code to proceed.</p>");
            out.println("<form action='Signup.jsp'><input type='submit' value='Go Back'></form>");
            return; // Exit the method to avoid further processing
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BankDataEntries", "root", "Doflamingo");

            // Check if AdharNumber and Password are correct
            String checkQuery = "SELECT * FROM Entries WHERE AdharNumber = ? AND Password = ?";
            try (PreparedStatement checkStatement = con.prepareStatement(checkQuery)) {
                checkStatement.setString(1, adharNumber);
                checkStatement.setString(2, password);
                ResultSet checkResult = checkStatement.executeQuery();

                if (checkResult.next()) {
                    // Correct AdharNumber and Password, proceed with deposit
                    double currentBalance = checkResult.getDouble("Balance");
                    double depositAmountDouble = Double.parseDouble(depositAmount);
                    
                    // Deduct 0.5% from the deposit amount
                    double deduction = depositAmountDouble * 0.005;
                    double updatedAmount = depositAmountDouble - deduction;

                    double newBalance = currentBalance + updatedAmount;

                    // Update the balance in the database
                    String updateQuery = "UPDATE Entries SET Balance = ? WHERE AdharNumber = ?";
                    try (PreparedStatement updateStatement = con.prepareStatement(updateQuery)) {
                        updateStatement.setDouble(1, newBalance);
                        updateStatement.setString(2, adharNumber);
                        int rowsAffected = updateStatement.executeUpdate();

                        if (rowsAffected > 0) {
                            out.println("<p>Successfully Deposited</p>");
                            out.println("<form action='homepage.jsp'><input type='submit' value='Home'></form>");
                        } else {
                            out.println("<p>Failed to update balance</p>");
                        }
                    }
                } else {
                    out.println("<p>Invalid Adhar Number or Password</p>");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            out.println("Error: " + e.getMessage());
        }
    }
}
