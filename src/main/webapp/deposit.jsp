<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Money Deposit</title>
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
</head>
<body>
    <div class="container">
        <h2>Money Deposit</h2>
        <p style="font-size:x-small; text-align: center; color:red">(0.5% is reduced for taxes)</p>
        <form action="deposit" method="post">
            <label for="adhrcode">Adhar Number:</label>
            <input type="text" id="adhrcode" name="adhrcode" placeholder="Enter Adhar Number" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter password" required>
            
            

            <label for="amount">Enter Amount to Deposit (in $):</label>
            <input type="number" id="amount" name="amount" placeholder="Enter amount" required step="any" min="5" required>
 
  <p style="font-size:x-small; text-align: center; color:red">(To be filled by branch manager)</p>
 <label for=SecurityCode>Safety Pin:</label>
            <input type="password" id="SecurityCode" name="SecurityCode" placeholder="Enter SecurityCode" required>
            <button type="submit">Deposit</button>
        </form>
    </div>
</body>
</html>
