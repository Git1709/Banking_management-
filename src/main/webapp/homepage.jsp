<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Css.css">
  <style type="text/css">
    
   body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image:url("Background.jpg");
        }

      
        div.main {}
  </style>
  <meta charset="ISO-8859-1">
  <title>Welcome to Our Banking Site</title>
</head>
<body><div class="menu"><h1>
            Bank Of Singapore</h1>
        </div>
    <div class="container">
        <div class="header">
            <h1>Welcome to Our Banking Site</h1>
        </div>

        <div class="menu">
            <a href="homepage.jsp">Home</a>
            <a href="history.html">About</a>
            <a href="Services.jsp">Services</a>
            <a href="contact.jsp">Contact</a>
            <a href="Login.jsp">Sign Out</a>
        </div>
    <div class="container">
        <div class="card">
            <img class="image" src="R.jpeg" alt="Image 1">
            <div class="card-info">
                <h2>Consumer Satisfaction</h2>
                <p>    Standing on 50 rank in terms of costumer reviews.</p>
                <a href="#">Read More</a>
            </div>
        </div>

        <div class="card">
            <img  class="image" src="Safe-1024x538.jpg "  alt="Image 2">
            <div class="card-info">
                <h2>Higher Returns</h2>
                <p>The rate of return offered by DBS bank on <br>
                medium-term RDs is between 7.25% p.a. and 7.50%</p>
                <a href="#">Read More</a>
            </div>
        </div>

        <div class="card">
            <img class="image" src="OIP.jpeg" alt="Image 3">
            <div class="card-info">
                <h2>Trust Of Ages</h2>
                <p>Ruling the trust of millions since 16 July 1968        .</p>
                <a href="history.html">Read More</a>
            </div>
        </div>
    </div>
    

        <div class="footer">
            <p>© 2022 Banking Site. All rights reserved.</p>
        </div>
    </div>
</body>
</html>
