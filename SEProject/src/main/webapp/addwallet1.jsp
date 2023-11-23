<%@page import="java.sql.*" %>
<%
String user=(String)session.getAttribute("UserName");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:8083/evento","root","password");
int bal=Integer.parseInt(request.getParameter("bal"));
PreparedStatement p=con.prepareStatement("select * from wallet where username=?");
p.setString(1,user);
ResultSet r=p.executeQuery();
if(r.next())
{
	int obal=r.getInt(3);
	int newbal=obal + bal;
	PreparedStatement p1=con.prepareStatement("update wallet set amount=? where username=?");
	p1.setInt(1,newbal);
	p1.setString(2,user);
	int z=p1.executeUpdate();
	%>
	<script>
	alert("Balance Updated");window.location="wallet.jsp";
	</script>
<%}
else{
PreparedStatement pst=con.prepareStatement("insert into wallet values(?,?,?)");
pst.setString(1,null);
pst.setString(2,user);
pst.setInt(3,bal);
pst.executeUpdate();
%>
<script>
alert("Balance added to wallet");
window.location="wallet.jsp";
</script>
<%
}
%>