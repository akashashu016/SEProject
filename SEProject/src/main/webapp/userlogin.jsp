<%-- 
    Document   : userlogin
    Created on : 8 Jun, 2018, 1:43:19 PM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>user login</title>
    </head>
    <body>
        <%  
String username=request.getParameter("user");
String password=request.getParameter("pwd");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8083/evento","root","password");
String query= "select *from user_register where username=? and password=?";
PreparedStatement ps = con.prepareStatement(query);
ps.setString(1,username);
ps.setString(2,password);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
	session.setAttribute("UserName",username);
	response.sendRedirect("userhome.jsp");
	%>

      
      
    <%
      }
	else
	{%>
	<script>alert("Wrong username,Try again");window.location="user.html";
	</script>
	<%}

%>
    </body>
</html>
