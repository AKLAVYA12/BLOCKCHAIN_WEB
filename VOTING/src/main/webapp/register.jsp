<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

 String name = request.getParameter("name");
 String aadhar1 = request.getParameter("aadhar");
 String number = request.getParameter("number");

 int aadhar = Integer.parseInt(aadhar1);
 //int number1 = Integer.parseInt(number);
 
 String url = "jdbc:mysql://localhost:3306/voting";
 String username = "root";
 String password = "root";
 
 Connection connection = null; 
 
 try{
	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 
	 connection = DriverManager.getConnection(url,username,password);
	 
	 if(connection!=null){
		
		 
		 String insertsql = "INSERT INTO register (name,aadhar,phonenumber) VALUES(?,?,?)";
		 
		 PreparedStatement preparedStatement = connection.prepareStatement(insertsql);
		 
		 preparedStatement.setString(1, name);
		 preparedStatement.setInt(2, aadhar);
		 preparedStatement.setString(3, number);
		 
		 
		 int rowsInserted = preparedStatement.executeUpdate();
		 
		 preparedStatement.close();    
		 connection.close();
		 
		 response.sendRedirect("index.jsp?number=" + number);
		 
		 
     } else {
         out.println("<p>Failed to establish a database connection.</p>");
     }  } catch (Exception e) {
         out.println("<p>Error: " + e.getMessage() + "</p>");
     } finally {
         // Close the database connection
         try {
             if (connection != null) {
                 connection.close();
             }
         } catch (SQLException e) {
             out.println("<p>Error closing the database connection: " + e.getMessage() + "</p>");
         }
     }
 

     %>

 </body>
 </html>
