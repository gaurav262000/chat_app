<%-- 
    Document   : getImage
    Created on : 26-Mar-2021, 18:04:57
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
String name = request.getParameter("name");
 
String connectionURL = "jdbc:mysql://localhost:3306/ChatReg";
String user = "root";
String pass = "root";
 
Connection con = null;
 
try{
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection(connectionURL, user, pass);
    
    PreparedStatement ps = con.prepareStatement("select * from regUsers where Name='"+name+"'");
   
    ResultSet rs = ps.executeQuery();
 
    if(rs.next()){
        Blob blob = rs.getBlob("image");
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
