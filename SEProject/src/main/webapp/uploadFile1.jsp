<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
<div style="position: absolute; width: 669px; height: 37px; z-index: 2; left:130px; top:324px" id="layer2">
         <font color="#74CC39">
         <%!
         String saveFile;
         %>
        <%
            String contentType = request.getContentType();
            if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0))
            {
            DataInputStream in = new DataInputStream(request.getInputStream());
            int formDataLength = request.getContentLength();
            byte dataBytes[] = new byte[formDataLength];
            int byteRead = 0;
            int totalBytesRead = 0;
            while (totalBytesRead < formDataLength)
            {
            byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
            totalBytesRead += byteRead;
            }
            String file = new String(dataBytes);
            saveFile = file.substring(file.indexOf("filename=\"") + 10);
                                                                        //out.print("FileName:" + saveFile.toString());
            saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
                                                                        //out.print("FileName:" + saveFile.toString());
            saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
                                                                        //out.print("FileName:" + saveFile.toString());
                                                                        //out.print(dataBytes);
            int lastIndex = contentType.lastIndexOf("=");
            String boundary = contentType.substring(lastIndex + 1,contentType.length());
                                                                        //out.println(boundary);
            int pos;
            pos = file.indexOf("filename=\"");
            pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;
            int boundaryLocation = file.indexOf(boundary, pos) - 4;
            int startPos = ((file.substring(0, pos)).getBytes()).length;
            int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
            
           // String appPath = application.getRealPath("/");  
//            java.io.File file1 = new File("C://Tomcat 7.0//webapps//Evento//images");
            java.io.File file1 = new File("C://Tomcat 7.0//webapps//Evento//images");
            
            if(!file1.exists())
                file1.mkdirs();
                
            FileOutputStream fileOut = new FileOutputStream(file1+"//"+saveFile);
            saveFile=saveFile;
           
            fileOut.write(dataBytes, startPos, (endPos - startPos));
            fileOut.flush();
        fileOut.close();
            %>
            </font>
            <b>
            <script>alert("File has been successfully uploaded");
			</script>
      <% 
        }
      %>
        </font>
        </div> 
        
        <%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:8083/evento","root","password");
		java.util.Date d=new java.util.Date();
		String d1=""+d;
        String id=request.getParameter("id");
        String mname=(String)session.getAttribute("ONAME");
	 Statement pst = con.createStatement();
	  int i=  pst.executeUpdate("insert into fileupload values('"+id+"','"+mname+"','"+saveFile+"','"+d1+"')");
           
        %>
        <script>window.location="orgHome.jsp";</script>
    </body>
</html>
