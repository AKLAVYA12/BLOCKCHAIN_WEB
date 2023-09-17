<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.twilio.Twilio" %>
<%@ page import="com.twilio.rest.api.v2010.account.Message" %>

<%

    String ACCOUNT_SID = "ACa2658d5ed56945ce04480236c829aad7";
    String AUTH_TOKEN = "c69699c988ac087d0ee58841be8bfc36";

    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    String phoneNumber = request.getParameter("number");

    String phoneNumber1 = "+91"+phoneNumber;
    
    String twilioPhoneNumberSID = "+16198212526";

    String otp = String.valueOf((int) (Math.random() * 900000 + 100000));

   
    Message message = Message.creator(
            new com.twilio.type.PhoneNumber(phoneNumber1),
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
        <input type="submit" value="Verify OTP">
    </form>
</body>
</html>

