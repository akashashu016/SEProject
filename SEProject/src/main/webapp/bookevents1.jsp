<%@page import="java.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:8083/evento","root","password");
int eid=Integer.parseInt(request.getParameter("eid"));
String ename=request.getParameter("ename");
String edate=request.getParameter("edate");
String ecate=request.getParameter("ecate");
int price=Integer.parseInt(request.getParameter("eprice"));
String evenue=request.getParameter("evenue");
int etickets=Integer.parseInt(request.getParameter("etickets"));
int ticketPrice = price * etickets;
String user=(String)session.getAttribute("UserName");
session.setAttribute("event", ename);
PreparedStatement pst=con.prepareStatement("select * from wallet where username=?");
pst.setString(1,user);
ResultSet rs=pst.executeQuery();
int wbal=0;
if(rs.next())
 wbal=rs.getInt(3);
if(wbal < ticketPrice)
{%>
  <script>alert("Not Enough balnce in wallet, Please add balance");
  window.location="wallet.jsp";
  </script>
<%}
else
{
	
	PreparedStatement pst2=con.prepareStatement("update wallet set amount=? where username=?");
	pst2.setString(2,user);pst2.setInt(1,wbal-ticketPrice);
    int k=pst2.executeUpdate();

	PreparedStatement pst3=con.prepareStatement("select orgname from event_details where eid=?");
    pst3.setInt(1,eid);
	ResultSet rs3=pst3.executeQuery();
	rs3.next();
    String orgname=rs3.getString(1);
    
PreparedStatement pst1=con.prepareStatement("insert into payments values(?,?,?,?,?,?,?,?,?,?,?)");
	pst1.setString(1,null);
	pst1.setInt(2,eid);pst1.setString(3,ename);pst1.setString(4,edate);pst1.setString(5,ecate);
	pst1.setInt(6,price);pst1.setString(7,evenue);pst1.setInt(8,etickets);
	pst1.setInt(9,ticketPrice);
	pst1.setString(10,user);
	pst1.setString(11,orgname);
	int j=pst1.executeUpdate();



	PreparedStatement pst4=con.prepareStatement("Select * from owallet where username=?");
	pst4.setString(1,orgname);
	ResultSet rs4=pst4.executeQuery();
    if(rs4.next())
	{
	PreparedStatement pst7=con.prepareStatement("select amount from owallet where username=?");
	pst7.setString(1,orgname);
	ResultSet rs7=pst7.executeQuery();
	rs7.next();
	int owbal=rs7.getInt(1);

	PreparedStatement pst6=con.prepareStatement("update owallet set amount=? where username=?");
	pst6.setString(2,orgname);pst6.setInt(1,owbal+ticketPrice);
    pst6.executeUpdate();

    }
	else
	{
      PreparedStatement pst5=con.prepareStatement("insert into owallet values(?,?,?)");
	  pst5.setString(1,null);
	  pst5.setString(2,orgname);
	  pst5.setInt(3,ticketPrice);
	  pst5.executeUpdate();
	}
	%>
   <script>
   alert("Booking Confirmed,You will get confirmation Mail");
	window.location="sendmail1.jsp";
	</script>

<%}

%>

  