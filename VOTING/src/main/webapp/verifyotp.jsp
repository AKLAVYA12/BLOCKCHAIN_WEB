<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.twilio.Twilio" %>

<%
    String generatedOTP = request.getParameter("generated_otp");

    String userOTP = request.getParameter("user_otp");

    boolean isOTPValid = generatedOTP.equals(userOTP);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OTP Verification</title>
</head>
<body>
    <h1>OTP Verification</h1>
    
    <% if (isOTPValid) { %>
        <p>OTP Verification Successful!</p>
            <script>

        function redirectToAdhar() {
            setTimeout(function () {
                window.location.href = "aadhar.jsp";
            }, 3000); // 3000 milliseconds (3 seconds)
        }


        redirectToAdhar();
    </script>
    <% } else { %>
        <p>OTP Verification Failed. Please try again.</p>
    <% } %>
</body>
</html>