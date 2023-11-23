<%@page import="java.sql.*" %>
<%@page import="java.util.*"  %>
<%@page import="javax.mail.*" %> 
<%@page import="javax.mail.internet.*" %>  
<%@page import="javax.activation.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="DBConn.jsp" %>
<%
String user=(String)session.getAttribute("UserName");
String event=(String)session.getAttribute("event");
PreparedStatement pst=con.prepareStatement("select email from user_register where username=?");
pst.setString(1,user);
ResultSet rs=pst.executeQuery();
String email="";
if(rs.next())
email=rs.getString(1);

final String to=email;//change accordingly 
final String from="eventoproj@gmail.com";//change accordingly 
final String password="eventoproj29";//change accordingly 
String msg="Your Booking for the event has been Confirmed\nPlease find the QR code link below in this mail.";
String durl="https://chart.googleapis.com/chart?chs=500x500&cht=qr&chl="+event+"&choe=UTF-8";

//Get the session object 
Properties props = new Properties(); 
props.put("mail.smtp.host", "smtp.gmail.com"); 
props.put("mail.smtp.socketFactory.port", "465"); 
props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory"); 
props.put("mail.smtp.auth", "true"); 
props.put("mail.smtp.port", "465"); 

final Session session1 = Session.getInstance(props, 
new javax.mail.Authenticator() { 
protected PasswordAuthentication getPasswordAuthentication() { 
return new PasswordAuthentication(from,password);
} 
}); 

//compose message 
try { 
MimeMessage message = new MimeMessage(session1); 
message.setFrom(new InternetAddress(from)); 
message.addRecipient(Message.RecipientType.TO,new InternetAddress(to)); 
message.setSubject("Important Message from Evento"); 
message.setText(msg+durl); 
//message.setText(durl);
//send message 
Transport.send(message); 
%>
<Script>
alert("Mail sent successfully");
window.location="userhome.jsp";
</script>
<%
} catch (MessagingException e) {throw new RuntimeException(e);}  

%>
</body>
</html>