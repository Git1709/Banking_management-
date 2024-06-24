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

@WebServlet("/withdraw")
public class withdraw extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String adhrcode = request.getParameter("adhrcode");
        String password = request.getParameter("password");
        String withdrawalAmountStr = request.getParameter("amount");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BankDataEntries", "root", "Doflamingo");

            // Validate adhrcode and password
            String validationQuery = "SELECT * FROM Entries WHERE AdharNumber = ? AND Password = ?";
            try (PreparedStatement validationStatement = con.prepareStatement(validationQuery)) {
                validationStatement.setString(1, adhrcode);
                validationStatement.setString(2, password);
                ResultSet validationResult = validationStatement.executeQuery();

                if (validationResult.next()) {
                    // Validation successful, proceed with withdrawal
                    int balance = validationResult.getInt("Balance");
                    double withdrawalAmount = Double.parseDouble(withdrawalAmountStr);

                    if (balance - withdrawalAmount >= 100) {
                        // Sufficient funds, update the Balance
                        String updateQuery = "UPDATE Entries SET Balance = ? WHERE AdharNumber = ?";
                        try (PreparedStatement updateStatement = con.prepareStatement(updateQuery)) {
                            updateStatement.setInt(1, (int) (balance - withdrawalAmount));
                            updateStatement.setString(2, adhrcode);

                            int rowsAffected = updateStatement.executeUpdate();

                            if (rowsAffected > 0) {
                                out.println("<p>Withdrawal successful. Updated Balance: " + (balance - withdrawalAmount) + "</p>");
                                out.println("<form action='homepage.jsp'><input type='submit' value='Home'></form>");
                            } else {
                                out.println("<p>Error updating Balance</p>");
                                out.println("<form action='homepage.jsp'><input type='submit' value='Home'></form>");
                            }
                        }
                    } else {
                        out.println("<p>Transaction failed,Account on minimum balance</p>");
                        out.println("<form action='homepage.jsp'><input type='submit' value='Home'></form>");
                    }
                } else {
                    out.println("<p>Invalid Adhar Number or Password</p>");
                    out.println("<form action='homepage.jsp'><input type='submit' value='Home'></form>");
                }
            }
        } catch (ClassNotFoundException | SQLException | NumberFormatException e) {
            out.println("Error: " + e.getMessage());
        }
    }
}
