<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link rel="stylesheet" href="Css.css">
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

        p {
            text-align: center;
            font-size: 18px;
        }

        ul {
            list-style-type: none;
            padding: 0;
            text-align: center;
        }

        li {
            margin: 10px 0;
        }

        a {
            text-decoration: none;
            color: #4CAF50;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Contact Us</h2>
         <div class="menu">
            <a href="homepage.jsp">Home</a>
            <a href="https://en.wikipedia.org/wiki/DBS_Bank">About</a>
            <a href="Services.jsp">Services</a>
            <a href="contact.jsp">Contact</a>
            <a href="Login.jsp">Sign Out</a>
        </div>
        <p>Feel free to reach out to us using the following contact details:</p>
        
        <ul>
            <li>Email: <a href="mailto:info@example.com">info@example.com</a></li>
            <li>Phone: <a href="tel:+123456789">+1 (234) 567-89</a></li>
            <li>Address: DBS Bank,Sector-23Agurugram,haryana</li>
        </ul>
        
        <p>Alternatively, you can use the form below to send us a message:</p>
        
        <form action="contact" method="post">
            <!-- Include form fields like name, email, message, etc. -->
            <!-- For simplicity, I'm not including the form fields in this example -->
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><br>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br>

            <label for="message">Message:</label>
            <textarea id="message" name="message" rows="4" required></textarea><br>

            <button type="submit">Send Message</button>
        </form>
    </div>
</body>
</html>
