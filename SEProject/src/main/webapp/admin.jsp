
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%  
String username=request.getParameter("user");
String password=request.getParameter("pwd");
if(username.equalsIgnoreCase("admin") && password.equals("123@admin"))
{%>
<jsp:forward page="adminhome.jsp" />
<%  }
else
{
	%>
		<script>alert("Wrong UserName/Password");
	            window.location="admin.html";
				</script>
<%}

%>