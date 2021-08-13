<%-- 
    Document   : msgcollector
    Created on : 24-Jun-2020, 11:45:00
    Author     : Lenovo
--%>


<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
        
         HttpSession session1=request.getSession();
         String message=request.getParameter("message") ; 
       System.out.println(message+"1byy im in msgcollector");
        
       String to_user=request.getParameter("to_user") ; 
         // session.setAttribute("to_user1",to_user);
          
            System.out.println(to_user+"2byy im in msgcollector");
      // System.out.println(request.getSession().getAttribute("to_user1").toString()+"2 i m in sesssion byy im in msgcollector");
       
       String from_user_name=request.getSession().getAttribute("Name").toString();
       
          
        System.out.println(from_user_name+"3byy im in msgcollector");
        
        String originalString=request.getParameter("date") ;
        
        
       System.out.println(originalString +"4byy im in msgcollector");
        
       String time=request.getParameter("time") ; 
       
         System.out.println(time+"5byy im in msgcollector");
        
        
        %>
          <%
 
         PreparedStatement ps=DBUtils.getPreparedStatement("insert into msgcollector(to_user, from_user_name,message,date,time) values('"+to_user+"', '"+from_user_name+"','"+message+"','"+originalString+"','"+time+"')");
              ps.executeUpdate();
       
       
   
       %>
    </body>
</html>
