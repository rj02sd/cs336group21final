<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LOG IN | BuyMe</title>
</head>
<body style="background-color:#DC143C;">

<%
	ApplicationDB db = new ApplicationDB();	
    String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
    Connection con = db.getConnection();
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from accounts where username='" + userid + "' and password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("user", userid); // the username will be stored in the session
        session.removeAttribute("matchTested");
        out.println("welcome " + userid);
        out.println("<a href='logout.jsp'></a>");
        response.sendRedirect("home.jsp");
    } else {
    	session.setAttribute("matchTested", "true");
    	response.sendRedirect("Login.jsp");
    }
%>
