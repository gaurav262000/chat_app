<%-- 
    Document   : msggetImage
    Created on : 28-Apr-2021, 20:59:54
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
               <%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
 String to_user=request.getParameter("touser") ;
      
     // String from_user_name=request.getParameter("fromUser");
 
String connectionURL = "jdbc:mysql://localhost:3306/ChatReg";
String user = "root";
String pass = "root";
 
Connection con = null;
 
try{
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection(connectionURL, user, pass);
    
    PreparedStatement ps = con.prepareStatement("select * from msgcollector where msg_id='"+to_user+"' ");
   
    ResultSet rs = ps.executeQuery();
 
    while(rs.next()){
        Blob blob = rs.getBlob("msgImage");
        byte byteArray[] = blob.getBytes(1, (int)blob.length());
 
        response.setContentType("image/gif");
        OutputStream os = response.getOutputStream();
        os.write(byteArray);
        os.flush();
        os.close();
    }
}
catch(Exception e){
    e.printStackTrace();
}   
finally{
    if(con != null){
        try{
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}
%>
    </body>
</html>
