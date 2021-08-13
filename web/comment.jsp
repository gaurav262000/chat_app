<%-- 
    Document   : comment
    Created on : 21-May-2021, 21:57:23
    Author     : Lenovo
--%>

<%@page import="db.DBUtils"%>
<%@page import="java.sql.ResultSet"%>
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
       String id=request.getParameter("feedid");
       PreparedStatement ps7=DBUtils.getPreparedStatement("select * from comments where feedId='"+id+"'");
                ResultSet rs7=ps7.executeQuery();
  
                while(rs7.next()){
               
   
      %>   <li style="list-style: none;margin-left: -40px;padding: 2px 6px 5px 0px;">
              <div style="display: flex;background-color: aliceblue;" >
              <img src="getImage.jsp?name=<%=rs7.getString(3)%>" class="rounded-circle friend-pic" style="height: 25px;width: 25px;"/>
             
              <div style="    word-break: break-all;">
                  <a href="FriendProfile.jsp?to_user=<%=rs7.getString(3)%>&id=<%=rs7.getString(5) %>" style="text-decoration: none;
padding: 5px;
color: black;font-weight: 900;font-family: ui-sans-serif;"><%=rs7.getString(3)%></a><%=rs7.getString(4) %>
              </div>
              </div>
          </li>
    <%
  }

       %>
    </body>
</html>
