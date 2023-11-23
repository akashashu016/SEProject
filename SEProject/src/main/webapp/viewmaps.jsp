

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>  
	<%
	String loc=request.getParameter("loc");
	%>
          
            <div class="mapouter">
            <div class="gmap_canvas">
<iframe width="600" height="500" id="gmap_canvas" 
  src="https://maps.google.com/maps?q=<%= loc %>%20&t=&z=13&ie=UTF8&iwloc=&output=embed"
                frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                <a href="https://www.maps-erstellen.de"></a>
            </div>
            <style>
                    .mapouter{text-align:right;height:500px;width:600px;}
                    .gmap_canvas {overflow:hidden;background:none!important;height:500px;width:600px;}
                </style>
        </div>
          
    </body>
</html>
