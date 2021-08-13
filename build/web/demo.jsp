<%-- 
    Document   : demo
    Created on : 06-Apr-2021, 17:11:04
    Author     : Lenovo
--%>



<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="servlet.message"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DBUtils"%>
<%@page import="dao.DataAccess"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
        <link href="https://unpkg.com/bootstrap@4.3.1/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
       
        <title>JSP Page</title>
    </head>
    <body>
         <% 
        //   System.out.println("i m in chat");
      
      
      
      String to_user=request.getParameter("touser") ;
      
      String from_user_name=request.getSession().getAttribute("Name").toString();
           
    
           PreparedStatement ps=DBUtils.getPreparedStatement("select * from msgcollector where from_user_name='"+from_user_name+"' AND to_user='"+to_user+"'  OR from_user_name='"+to_user+"' AND to_user='"+from_user_name+"'  ");
                ResultSet rs=ps.executeQuery();
              
                while(rs.next()){
    
 if(!rs.getString(2).equals(to_user)) { 
        if(rs.getString(4)!=null  ){
        %>
                

               <div class="row">
                           
                            <div class="col-2 col-sm-1 col-md-1"> 
                            <img src="getImage.jsp?name=<%=to_user %>" class="rounded-circle chat-pic"/>
                            </div>
                            <div class="col-6 col-sm-7 col-md-7">
                              
                                <p class="receive"> <%=rs.getString(4) %>
                                    <span class="datetime"><%=rs.getString(5) %> 
                                    </span> 
                                </p>
                                </div>
                                
                            </div>   <% }else if(rs.getString(4)== null){ %>
               
               <div class="row">
                           
                            <div class="col-2 col-sm-1 col-md-1"> 
                            <img src="getImage.jsp?name=<%=to_user %>" class="rounded-circle chat-pic"/>
                            </div>
                            <div class="col-6 col-sm-7 col-md-7">
                              
                                <p class="receive"> <img src="msggetImage.jsp?touser=<%=rs.getInt(1) %>" />
                                    <span class="datetime"><%=rs.getString(5) %> 
                                    </span> 
                                </p>
                                </div>
                                
                            </div> 
        <%
             } } else if(rs.getString(2).equals(to_user)){ 
                            if(rs.getString(4)!= null){
                            %>
                <div class="row justify-content-end">
                           <div class="col-4 col-sm-5 col-md-5 " >
                                <p class="sent float-right"><%=rs.getString(4) %>
                       <span class="datetime"><%=rs.getString(5)%>
                                    </span>
                                </p>
                            </div>
                              <div class="col-2 col-sm-1 col-md-1"> 
                            <img src="getImage.jsp?name=<%=from_user_name %>" class="rounded-circle chat-pic"/>
                            </div>
                        </div> 

              
                
                            <% }else if(rs.getString(4)==null){ %>

                <div class="row justify-content-end">
                           <div class="col-4 col-sm-5 col-md-5 " >
                               <p class="sent float-right"><img src="msggetImage.jsp?touser=<%=rs.getInt(1) %>" />
                       <span class="datetime"><%=rs.getString(5)%>
                                    </span>
                                </p>
                            </div>
                              <div class="col-2 col-sm-1 col-md-1"> 
                            <img src="getImage.jsp?name=<%=from_user_name %>" class="rounded-circle chat-pic"/>
                            </div>
                        </div> 
          <%                  
}
}
             }

       %>
       
       
       <script src="https://unpkg.com/jquery@3.4.1/dist/jquery.min.js" ></script>
                  <script src="https://unpkg.com/popper.js@1.12.8/dist/umd/popper.min.js" ></script>
                  <script src="https://unpkg.com/bootstrap@4.3.1/dist/js/bootstrap.min.js" ></script> 
                     
    </body>
</html>
