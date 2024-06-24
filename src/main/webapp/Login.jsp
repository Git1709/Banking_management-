<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bank Management System</title>
    <style>
        h1 {
            color: #333;
            text-align: center;
            background-color: bisque;
            font-size: xxxx-large;
        }

        body {
            font-family: Arial, sans-serif;
        }

        .container {
            width: 100%;
            height: 100vh;
            align-items: center;
        }

        form {
            width: 300px;
            margin: 0 auto;
        }

        label {
            display: block;
            margin: 10px 0;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        input[type="submit"],
        input[type="reset"] {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        input[type="reset"] {
            background-color: #f44336;
            color: white;
        }

        input[type="reset"]:hover {
            background-color: #e53935;
        }
    </style>
</head>
<body>
    <h1>Login Page</h1>
    <br>
    <div class="container">
        <form action="LoginServlet" method="get">
            <label for="cardNo">Adhar No:</label>
            <input type="text" id="cardNo" name="adhrcode" required><br>

            <label for="pin">Password:</label>
            <input type="password" id="pin" name="pin" required><br>

            <input type="submit" value="SIGN IN">
            <input type="reset" value="CLEAR">
        </form>

        <form action="Signup.jsp" method="get">
            <input type="submit" value="SIGN UP">
        </form>
    </div>

</body>
</html>
