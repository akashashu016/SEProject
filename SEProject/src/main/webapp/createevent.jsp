
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
        <% String EName=request.getParameter("eventname");       
           String EDate=request.getParameter("eventdate");
           String ECategory=request.getParameter("eventcategory");
           String ETicket=request.getParameter("eventticketprice");
           String EVenue=request.getParameter("eventvenue");
           String EArea=request.getParameter("eventarea");
		   String ECity=request.getParameter("eventcity");
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8083/evento","root","password");
   
			String query= "INSERT INTO event_details(EName,EDate,Ecategory,ETicket,EVenue,orgname,EArea,ECity) VALUES (?,?,?,?,?,?,?,?);";
			String oname=(String)session.getAttribute("ONAME");
           PreparedStatement ps = con.prepareStatement(query);
           ps.setString(1,EName);
           ps.setString(2,EDate);   
           ps.setString(3,ECategory);
           ps.setString(4,ETicket);
           ps.setString(5,EVenue);
		   ps.setString(6,oname);
		   ps.setString(7,EArea);
		   ps.setString(8,ECity);
           int n=ps.executeUpdate();
           if(n==0)
           {%>
           <script>alert("registration failed");window.location="addevents.jsp";
		   </script>
           <%}
           else
           {
               session.setAttribute("CATEGORY",ECategory);
         PreparedStatement p=con.prepareStatement("select max(eid) from event_details");
         ResultSet rs=p.executeQuery();
         rs.next();
         int id=rs.getInt(1);
             response.sendRedirect("imageuploading.jsp?eid="+id);
           }            
           
        %>
    </body>
</html>
