<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
	String EmailID = request.getParameter("EmailID");
String mobileNumber= request.getParameter("MobileNumber");
	String Password = request.getParameter("Password");
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Logindata", "root",
				"12345");

		PreparedStatement preparedStatement = connection
				.prepareStatement("update RegData set Password=? where EmailID=? and MobileNumber=?");
		
		preparedStatement.setString(1, Password);
		preparedStatement.setString(2, EmailID);
		preparedStatement.setString(3, MobileNumber);
		ResultSet result = preparedStatement.executeQuery();
		int x=preparedStatement.executeUpdate();
		  if(x>0)
		  {
			  response.sendRedirect("Succesful.html");
		  }	
	}
	else
	{
	response.sendRedirect("password.html");
	}
	
	catch (Exception e)
	{
		System.out.println("error.html");
		e.printStackTrace();
	}
%>
