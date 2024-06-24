<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 50%;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        form {
            text-align: center;
        }

        label {
            display: block;
            margin: 10px 0;
            font-size: 16px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 12px 20px;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
    <h2>Money Withdrawal</h2>
    
    <form action="balance" method="get">
     <label for="amount">Adhar Number:</label>
        <input type="number" id="adhrcode" name="adhrcode" placeholder="Enter No." required step="any" min="1" required>
    <label for="password">Password:</label>
        <input type="password" id="password" name="password" placeholder="password" required step="any"  required>
    
       <button type="submit">Check</button>
    </form>
</div>
</body>
</html>