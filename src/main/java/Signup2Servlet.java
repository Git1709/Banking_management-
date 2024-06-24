import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import jakarta.servlet.AsyncContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(value = "/Signup2Servlet", asyncSupported = true)
public class Signup2Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final ExecutorService executorService = Executors.newFixedThreadPool(10);

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String number = request.getParameter("number");
        String adharNumber = request.getParameter("adhrcode");
        String state = request.getParameter("state");
        String city = request.getParameter("city");
        String parentName = request.getParameter("fname");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String maritalStatus = request.getParameter("marital");
        String pincode = request.getParameter("Pincode");
        String securityCode = request.getParameter("SecurityCode");

        if (!"BankApproved".equals(securityCode)) {
            out.println("<p>Incorrect Security Code. Please enter the correct code to proceed.</p>");
            out.println("<form action='Signup.jsp'><input type='submit' value='Go Back'></form>");
            return; // Exit the method to avoid further processing
        }

        AsyncContext asyncContext = request.startAsync();

        executorService.execute(() -> {
            try {
                // Introduce a 3-second delay
                Thread.sleep(3000);

                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BankDataEntries", "root", "Doflamingo");

                // Continue with the insertion if AadharNumber doesn't exist
                String query = "INSERT INTO Entries (Name, Email, Password, Number, AdharNumber, State, City, ParentName, DOB, Gender, `Marital_Status`, Pincode) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                try (PreparedStatement preparedStatement = con.prepareStatement(query)) {
                    preparedStatement.setString(1, name);
                    preparedStatement.setString(2, email);
                    preparedStatement.setString(3, password);
                    preparedStatement.setString(4, number);
                    preparedStatement.setString(5, adharNumber);
                    preparedStatement.setString(6, state);
                    preparedStatement.setString(7, city);
                    preparedStatement.setString(8, parentName);
                    preparedStatement.setString(9, dob);
                    preparedStatement.setString(10, gender);
                    preparedStatement.setString(11, maritalStatus);
                    preparedStatement.setString(12, pincode);

                    int rowsAffected = preparedStatement.executeUpdate();

                    if (rowsAffected > 0) {
                        try {
                            PrintWriter asyncWriter = asyncContext.getResponse().getWriter();
                            asyncWriter.println("<p>Data stored successfully</p>");
                            asyncWriter.println("<form action='Login.jsp'><input type='submit' value='Login'></form>");
                        } finally {
                            asyncContext.complete(); // Complete the asynchronous processing
                        }
                    } else {
                        try {
                            PrintWriter asyncWriter = asyncContext.getResponse().getWriter();
                            asyncWriter.println("<p>Failed to store data</p>");
                        } finally {
                            asyncContext.complete(); // Complete the asynchronous processing
                        }
                    }
                }
            } catch (InterruptedException | ClassNotFoundException | SQLException | IOException e) {
                try {
                    PrintWriter asyncWriter = null;
                    try {
                        asyncWriter = asyncContext.getResponse().getWriter();
                    } catch (IOException e1) {
                        e1.printStackTrace();
                    }
                    asyncWriter.println("Error: " + e.getMessage());
                } finally {
                    asyncContext.complete(); // Complete the asynchronous processing
                }
            }
        });
    }
}
