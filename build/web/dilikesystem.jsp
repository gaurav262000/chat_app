<%-- 
    Document   : dilikesystem
    Created on : 18-May-2021, 13:02:58
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
       <%  int id= Integer.parseInt(request.getParameter("id"));

      String from_user_name=request.getParameter("from") ;
      String likes=request.getParameter("likes") ;
     System.out.println(id+from_user_name+likes+"in a like system");
       
       
   //if (DataAccess.checkExistUser(to_user_id,from_user_id)){
           PreparedStatement ps=DBUtils.getPreparedStatement("delete from likesys where id='"+id+"'");
              ps.executeUpdate();
       System.out.println(id+from_user_name+likes+"in a dislike system");
       
   //} %>
    </body>
</html>
