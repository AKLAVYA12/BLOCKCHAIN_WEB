<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.twilio.*" %>
<%@ page import="com.twilio.rest.api.v2010.account.Message" %>

<%
    String name = request.getParameter("name");
    String aadhar = request.getParameter("aadhar");
    String number = request.getParameter("phone"); // Renamed to "phone"
    String password = request.getParameter("password");

    // Use the phone number as provided in the form
    String phoneNumber = "+91" + number;

    String ACCOUNT_SID = "ACa2658d5ed56945ce04480236c829aad7";
    String AUTH_TOKEN = "7d3fc24169cf4a0b624d809fcba80961";

    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    String twilioPhoneNumberSID = "+16198212526";

    String otp = String.valueOf((int) (Math.random() * 900000 + 100000));

    Message message = Message.creator(
        new com.twilio.type.PhoneNumber(phoneNumber),
        new com.twilio.type.PhoneNumber(twilioPhoneNumberSID), 
        "Your OTP is: " + otp)
        .create();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OTP Sent</title>
</head>
<body>
    <h1>OTP Sent</h1>
    <p>An OTP has been sent to your phone number. Please check your messages and enter the OTP below to verify:</p>
    
    <form action="verifyotp.jsp" method="post">
        <input type="text" name="user_otp" placeholder="Enter OTP" required>
        <input type="hidden" name="generated_otp" value="<%= otp %>">
        <input type="hidden" name="name" id="name" value="<%= name %>">
        <input type="hidden" name="aadhar" id="aadhar" value="<%= aadhar %>">
        <input type="hidden" name="password" id="password" value="<%= password %>">
        <input type="hidden" name="phone" id="number" value="<%= number %>">
        <input type="submit" value="Verify OTP">
    </form>
</body>
</html>
