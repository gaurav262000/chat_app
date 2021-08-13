<%-- 
    Document   : likesystem
    Created on : 17-May-2021, 21:38:53
    Author     : Lenovo
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.DataAccess"%>
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
        int id= Integer.parseInt(request.getParameter("id"));
      String from_user_name=request.getParameter("from") ;
      String likes=request.getParameter("likes") ;
     System.out.println(id+from_user_name+likes+"in a like system");
       
       %>
       <%
   //if (DataAccess.checkExistUser(to_user_id,from_user_id)){
           PreparedStatement ps=DBUtils.getPreparedStatement("insert into likesys(feed_id,from_user_name,status) values('"+id+"','"+from_user_name+"','"+likes+"')");
              ps.executeUpdate();
       
       
   //}
      %>
    </body>
</html>
