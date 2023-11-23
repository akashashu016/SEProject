<%@page import="java.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8083/evento","root","password");
int eid=Integer.parseInt(request.getParameter("eid"));
PreparedStatement pst=con.prepareStatement("delete from event_details where eid=?");
pst.setInt(1,eid);
int i=pst.executeUpdate();
%>
<script>
alert("Successfully deleted ");
window.location="adminhome.jsp";
</script>
 