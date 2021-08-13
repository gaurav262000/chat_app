<%-- 
    Document   : commentcollector
    Created on : 21-May-2021, 21:26:49
    Author     : Lenovo
--%>

<%@page import="db.DBUtils"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String message=request.getParameter("message");
        String username=request.getParameter("username");
        String userid=request.getParameter("userid");
        String userfeedid=request.getParameter("userfeedid");
        System.out.println(message+" feed--"+userfeedid+" userid--"+userid+" name--"+username);
         PreparedStatement ps=DBUtils.getPreparedStatement("insert into comments(feedId,username,comment,useid) values('"+userfeedid+"','"+username+"','"+message+"','"+userid+"')");
              ps.executeUpdate();
        %>
    </body>
</html>
