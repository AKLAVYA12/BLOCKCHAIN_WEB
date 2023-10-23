<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.twilio.*" %>

<%
    String generatedOTP = request.getParameter("generated_otp");
    String userOTP = request.getParameter("user_otp");
    String name = request.getParameter("name");
    String aadhar = request.getParameter("aadhar");
    String password = request.getParameter("password");
    String phone = request.getParameter("number");

    boolean isOTPValid = generatedOTP.equals(userOTP);

    if (isOTPValid) {
        // Use JavaScript to redirect to "aadhar.jsp" with the parameters in the URL
        String redirectURL = "back.js?name=" + name + "&aadhar=" + aadhar + "&phone="+ phone +  "&password=" + password;
    %>
    <p>OTP Verification Successful!</p>
    <script>
        function redirectToAdhar() {
            setTimeout(function () {
                window.location.href = "<%= redirectURL %>";
            }, 3000); // 3000 milliseconds (3 seconds)
        }
        redirectToAdhar();
    </script>
    <%
    } else {
    %>
    <p>OTP Verification Failed. Please try again.</p>
    <%
    }
%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/web3/1.5.2/web3.min.js"></script>

    <script src="back.js"></script>