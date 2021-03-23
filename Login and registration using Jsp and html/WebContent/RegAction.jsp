<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
	String FirstName = request.getParameter("FirstName");
	String LastName = request.getParameter("LastName");
	String EmailID = request.getParameter("EmailID");
	String MobileNumber = request.getParameter("MobileNumber");
	String Password = request.getParameter("Password");
	String ConfirmPassword = request.getParameter("ConfirmPassword");

	try
	{
		if(Password.equals(ConfirmPassword))
		{
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/LoginData", "root",
				"12345");
		
			PreparedStatement preparedStatement = connection.prepareStatement(
					"insert into RegisteredData(FirstName,LastName,EmailID,MobileNumber,Password,ConfirmPassword) values(?,?,?,?,?,?);");
			preparedStatement.setString(1, FirstName);
			preparedStatement.setString(2, LastName);
			preparedStatement.setString(3, EmailID); 
			preparedStatement.setString(4, MobileNumber);
			preparedStatement.setString(5, Password);
			preparedStatement.setString(6, ConfirmPassword);
			int x=preparedStatement.executeUpdate();
			  if(x>0)
			  {
				  response.sendRedirect("Succesful.html");
			  }	
		}
		else
		{
		response.sendRedirect("notmatchedpass.html");
		}
	}	
	catch (Exception e) {
		System.out.println("error.html");
		e.printStackTrace();
	}
%>














