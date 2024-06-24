<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>APPLICATION FORM</title>
    <style>
 body {
    font-family: Arial, sans-serif;
}

header {
    background-color: bisque;
    padding: 20px;
    text-align: center;
}

h1 {
    margin: 0;
}

form {
    width: 100%;
    max-width: 500px;
    margin: 0 auto;
    padding: 20px;
    box-sizing: border-box;
}

input[type="text"], input[type="email"], input[type="password"] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

input[type="submit"] {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
}

input[type="submit"]:hover {
    opacity: 0.8;
}

    </style>
</head>
<body>
    <div align="center">
        <h1>APPLICATION FORM</h1>
        
        <h2>Personal Details</h2>

        <form action="Signup2Servlet" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><br>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br>

            <label for="fname">Father's Name:</label>
            <input type="text" id="fname" name="fname" required><br>

            <label for="dob">Date of Birth:</label>
            <input type="text" id="dob" name="dob" placeholder="yyyy-mm-dd" required><br>
<br> <br> 
            <label>Gender:</label>
            <input type="radio" id="male" name="gender" value="Male" required> Male
            <input type="radio" id="female" name="gender" value="Female" required> Female<br> <br> <br> <br> 

            <label for="number">Number:</label>
            <input type="text" id="number" name="number" required><br>

            <label for="pincode">Pin Code:</label>
            <input type="text" id="pincode" name="Pincode" required><br>

            <label>Marital Status:</label>
            <input type="radio" id="married" name="marital" value="Married" required> Married
            <input type="radio" id="unmarried" name="marital" value="Unmarried"required> Unmarried
            <input type="radio" id="other" name="marital" value="Other" required> Other<br>

            <label for="city">City:</label>
            <input type="text" id="city" name="city" required><br>

            <label for="adhrcode">Aadhar Code:</label>
            <input type="text" id="adhrcode" name="adhrcode" required><br>

            <label for="state">State:</label>
            <input type="text" id="state" name="state" required><br>
<p>A minimum balance of $100 must be paid before hand <br>
 After paying,ask the branch manger to fill the security code </p>
 <label for="SecurityCode">Security Code:</label>
            <input type="password" id="SecurityCode" name="SecurityCode" required><br>
            <input type="submit" value="Next">
        </form>
       <p  style="text-align:center">Already a Member? <a href="Login.jsp"><input type="submit" value="Login"></a></p>
        </div>
</body>
</html>
