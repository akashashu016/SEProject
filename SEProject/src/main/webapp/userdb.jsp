<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>userdb</title>

</head>


<body>  

<%   
String FirstName=request.getParameter("fname");
String LastName=request.getParameter("lname");
String email=request.getParameter("email");
String PhoneNum=request.getParameter("Phno");
int age=Integer.parseInt(request.getParameter("age"));
String username=request.getParameter("uname");
String password=request.getParameter("psw");
String remainder=request.getParameter("rem");

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8083/evento","root","password");
String query= "INSERT INTO user_register(FirstName,LastName,email,PhoneNum,age,username,password,remainder) VALUES (?,?,?,?,?,?,?,?);";
PreparedStatement ps = con.prepareStatement(query);
ps.setString(1,FirstName);
ps.setString(2,LastName);
ps.setString(3,email);
ps.setString(4,PhoneNum);
ps.setInt(5,age);
ps.setString(6,username);
ps.setString(7,password);
ps.setString(8,remainder);
int n=ps.executeUpdate();
if(n==0)
{%>
<script>alert("registration failed");window.location="newuser.html";</script>
<%}
else
{%>
   <script>alert("registration successfull");window.location="user.html";</script>
<%}
%>

</body>
</html>