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
    <form id="usernameForm">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
        <button type="button" id="registerButton">Register</button>
    </form>

    <div id="message"></div>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/web3/1.5.2/web3.min.js"></script>

    <script src="back.js"></script>
</body>
</html>