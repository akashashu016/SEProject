<%-- 
    Document   : organizerlogin
    Created on : 8 Jun, 2018, 9:49:27 PM
    Author     : Kavya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>organizer login</title>
    </head>
    <body>
          <%   
String username=request.getParameter("user");
String password=request.getParameter("pwd");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8083/evento","root","password");
String query= "select * from organizer_register where Oname=? and Password=?";
PreparedStatement ps = con.prepareStatement(query);
ps.setString(1,username);
ps.setString(2,password);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
session.setAttribute("ONAME", username);         %>
<jsp:forward page="orgHome.jsp" />
   <%
}
else
{%>
    <script>alert("unsuccessfull");window.location="organizer.html";</script>
<%}
%>
    </body>
</html>