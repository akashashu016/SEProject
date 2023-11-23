<%@ page import="java.sql.*" %>

<%@include file="DBConn.jsp" %>
   

<%   
String FirstName=request.getParameter("ofname");
String LastName=request.getParameter("olname");
String Email=request.getParameter("oemail");
String PhoneNum=request.getParameter("oPhno");
int Age=Integer.parseInt(request.getParameter("age"));
String Oname=request.getParameter("ouname");
String Password=request.getParameter("opsw");
Class.forName("com.mysql.jdbc.Driver");
Connection com = DriverManager.getConnection("jdbc:mysql://localhost:8083/evento","root","password");
String query= "INSERT INTO organizer_register(FirstName,LastName,Email,PhoneNum,Age,Oname,Password) VALUES (?,?,?,?,?,?,?);";
PreparedStatement ps = com.prepareStatement(query);
ps.setString(1,FirstName);
ps.setString(2,LastName);
ps.setString(3,Email);
ps.setString(4,PhoneNum);
ps.setInt(5,Age);
ps.setString(6,Oname);
ps.setString(7,Password);
int n=ps.executeUpdate();
if(n==0)
{%>
<script>alert("registration failed");window.location="neworganizer.html";</script>
<%}
else
{%>
   <script>alert("registration successfull");window.location="organizer.html";</script>
<%}
%>


</html>