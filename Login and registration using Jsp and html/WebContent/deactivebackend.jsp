<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
	String EmailID = request.getParameter("EmailID");
	String Password = request.getParameter("Password");
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/LoginData", "root",
				"12345");

		PreparedStatement preparedStatement = connection
				.prepareStatement("delete from RegisteredData where EmailID=? and Password=?");
		preparedStatement.setString(1, EmailID);
		preparedStatement.setString(2, Password);
		
		boolean result =preparedStatement.execute();
		
		if (result==false) 
		{
			response.sendRedirect("SuccessfullyDeactivated.html");
		}
		else
		{
			response.sendRedirect("Wrongcredentials.html");
		}
	} 
	
	catch (Exception e)
	{
		System.out.println("error.html");
		e.printStackTrace();
	}
%>
