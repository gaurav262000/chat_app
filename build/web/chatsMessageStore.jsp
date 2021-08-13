<%-- 
    Document   : chatsMessageStore
    Created on : 03-Jun-2020, 16:46:25
    Author     : Lenovo
--%>

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
    <body><form>
       <% 
         //  System.out.println("i m in chat");
      
      
      int to_user_id= Integer.parseInt(request.getParameter("to_user_id"));
      String to_user_name=request.getParameter("name") ;
      int from_user_id=Integer.parseInt(request.getSession().getAttribute("Id").toString()) ;
      String from_user_name=request.getSession().getAttribute("Name").toString();
            %> 
        
       <%
   if (DataAccess.checkExistUser(to_user_id,from_user_id)){
           PreparedStatement ps=DBUtils.getPreparedStatement("insert into friendList(to_user_id, from_user_id,from_user_name,to_user_name) values('"+to_user_id+"', '"+from_user_id+"','"+from_user_name+"','"+to_user_name+"')");
              ps.executeUpdate();
       
       
   }
       %>
        </form>
    </body>
</html>
