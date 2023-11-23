<%@page import="java.io.BufferedReader" %>
<%@page import="java.io.*,java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%!
String response1;
%>
<%
String mno=new String("");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:8083/evento","root","password");
PreparedStatement pst=con.prepareStatement("select username,edate from payments where DATE(eDate)=DATE(NOW())+1");
ResultSet rs=pst.executeQuery();
while(rs.next())
{
PreparedStatement p=con.prepareStatement("select phonenum from user_register where remainder='on' AND username=?");
p.setString(1,rs.getString(1));
ResultSet r1=p.executeQuery();
while(r1.next())
	{
	mno=mno.concat(r1.getString(1))+",";
	}
}
HttpURLConnection connection= null; 
String url = "http://www.siegsms.com/PostSms.aspx"; 
	String agent = "Mozilla/4.0"; 
 	String rawData="userid=deepu555&pass=deepu555@123&phone="+mno+"&msg= You have an event booked from Evento"; 
	 	String charset = "UTF-8"; 
	 	OutputStream output = null; 
	 	BufferedReader in=null; 
	 	response1=""; 
	 	String responseContent=""; 
 	   	String encodedData = URLEncoder.encode(rawData,charset);
  	   	connection=(HttpURLConnection)new URL(url).openConnection();
  	   	connection.setRequestMethod("POST");
  	   	connection.setDoOutput(true); 
 	   	connection.setRequestProperty("Accept-Charset", charset);
  	   	connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=" + charset);  	   	
                connection.setRequestProperty( "User-Agent", agent ); 
	 	connection.setRequestProperty( "Content-Length",Integer.toString(encodedData.length()));  	   	
                output = connection.getOutputStream();
          	output.write(rawData.getBytes(charset)); 
                in = new BufferedReader(new InputStreamReader(connection.getInputStream())); 
                while((responseContent = in.readLine()) != null) 
                { 
	          	response1 += responseContent; 
                } 
                System.out.println(response); 

			%>
			<script>
			 alert("SMS Sent");
			 window.location="adminhome.jsp";
			 </script>

