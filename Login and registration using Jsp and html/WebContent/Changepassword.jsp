<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
	String EmailID = request.getParameter("EmailID");
	String MobileNumber = request.getParameter("MobileNumber");
	String Password = request.getParameter("Password");
	String ConfirmPassword = request.getParameter("ConfirmPassword");
	try
	{
		
		if (Password.equals(ConfirmPassword)) 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/LoginData", "root",
					"12345");

			PreparedStatement preparedStatement = connection
					.prepareStatement("update RegisteredData  set Password=?, ConfirmPassword=?  where EmailID=? and MobileNumber=?");
		
		
				
			
			preparedStatement.setString(1, Password);
			preparedStatement.setString(2, ConfirmPassword);
			preparedStatement.setString(3, EmailID);
			preparedStatement.setString(4, MobileNumber);

			int x = preparedStatement.executeUpdate();
			if (x > 0)
			{
				response.sendRedirect("Succesfulreset.html");
			}
			
		}
		else
		{

			response.sendRedirect("password.html");
		}
		
	}

	catch (Exception e) {
		System.out.println("error.html");
		e.printStackTrace();
	}
%>
