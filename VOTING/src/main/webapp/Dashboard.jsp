<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <h1>Username Registration</h1>
    
    <h1>Aadhar Details</h1>
    <p>Name: <%= request.getParameter("name") %></p>
    <p>Aadhar Number: <%= request.getParameter("aadhar") %></p>
    <p>Password: <%= request.getParameter("password") %></p>

    <div id="message"></div>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/web3/1.5.2/web3.min.js"></script>

    <script src="back.js"></script>
</body>
</html>