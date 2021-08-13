<%-- 
    Document   : chat
    Created on : 22-May-2020, 15:52:58
    Author     : Lenovo 
--%>

<%@page import="servlet.message"%>
<%@page import="servlet.friendList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DataAccess"%>
<%@page import="servlet.regUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>chatApp</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
        <link href="https://unpkg.com/bootstrap@4.3.1/dist/css/bootstrap.min.css" rel="stylesheet" />
        
        
        <link href="chatStyle.css" rel="stylesheet" />          
    </head>
    <body>
        
    <%
        DataAccess da = new DataAccess();
    regUser user;
    user=da.getUserDetails(session.getAttribute("Id").toString()); 
    friendList user1;
    message user2;
    %>
        <span class="top"></span>
        
        <%int Id = Integer.parseInt(session.getAttribute("Id").toString());%>
        <div class="row h-100 chat-box" >
            <div class="col-md-4 pr-0 d-none d-md-block" id="side-1">
                <div class="card h-100">
                    <div class="card-header">
                        <div class="row">
                             <div class="col-1 col-sm-1 col-md-1 d-md-none">
                            <i class="fas fa-arrow-left  " style="cursor: pointer;" onclick="hideChatList()"></i>
                        </div>
                            <div class="col-2 col-sm-2 col-md-2">
                                <img src="getImage.jsp?name=<%=user.getName() %>" class="rounded-circle profile-pic"/> </div>
                                <div class="col-7 col-sm-7 col-md-7">
                                    <div id="cr_user"> <%=user.getName() %></div>
                            </div>
                            
                        <div class="col-2 col-sm-2 col-md-2">
                            <div class="dropleft">
                                <span class="dropdown-toggle " data-toggle="dropdown" style="float: right;"> 
                               <i class="fas fa-ellipsis-v icon mt-2" style="cursor: pointer;" onclick="hideChatList()"></i>
                                </span>
                                <div class="dropdown-menu mt-2">
                                    <a href="#" class="dropdown-item" data-toggle="modal" data-target="#modalFriendlist"> New Chat</a>
                                    <a href="igProfile.jsp" class="dropdown-item"> Profile</a>
                                  <a href="logout" class="dropdown-item"> Logout</a>
                                </div>
                                <div class="modal fade" id="modalFriendlist">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="card">
                                                <div class="card-header">
                                                    Friend List
                                                    <span class="close" data-dismiss="modal" style="cursor: pointer">&times;</span>
                                                </div>
                                                <ul class="list-group list-group-flush" id="lstfriend">
                                                       <%
               ArrayList list=da.getAllUsers();
              for(int i=0;i<list.size();i++){
                  user=(regUser)list.get(i);
                  if(user.getId()!= Integer.parseInt(session.getAttribute("Id").toString())){
               %>
               <li class="list-group-item list-group-item-action" onclick="storefriend('<%=user.getId()%>','<%=user.getName() %>')" >
                           
                            <div class="row">
                                <div class="col-2 col-sm-2 col-md-2">
                                    <img src="getImage.jsp?name=<%=user.getName() %>" class="rounded-circle friend-pic"/>
                                </div>
                                <div class="col-10 col-sm-10 col-md-10" style="cursor: pointer;">
                                    <div class="name"><%=user.getName() %></div>
                                    
                            </div>
                            </div>
                            
                        </li> 
                        <%  }
                  } %>
                                                    
                                                </ul>
                                                
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                         </div>
                    </div>
                    <ul class="list-group list-group-flush" >
                         <li class="list-group-item" style="background-color: #f8f8f8;">
                            <input type="text" placeholder="search" class="form-control form-rounded">   
                        </li>  
                        <li class="list-group-item" style="background-color: #f8f8f8;">
                            <a href="feed.jsp" class="feed" style="padding-left: 15px;"><i class="fas fa-home"></i></a>
                            <a href="chat1.jsp" class="feed" style="padding-left: 150px;">  <i class="fas fa-user-friends"></i></a>
                            <a href="igProfile.jsp" class="feed" style="padding-left: 150px;" > <i class="fas fa-user"></i></a>
                         
                        
                        </li>
                        
                        <%
                             int from_user_id=Integer.parseInt(request.getSession().getAttribute("Id").toString()) ;
                 
                ArrayList list1=da.getFriendList(from_user_id);
              for(int i=0;i<list1.size();i++){
                  user1=(friendList)list1.get(i);
                  
               %>
               <li class="list-group-item list-group-item-action" onclick="StartChat('<%=user1.getTo_user_id()%>','<%=user1.getTo_user_name()%>'  )" >
                       
                   <a href="chat2.jsp?to_user=<%=user1.getTo_user_name() %>&id=<%=user1.getTo_user_id()%>" style="text-decoration: none"  >           
                            <div class="row">
                                <div class="col-2 col-sm-2 col-md-2">
                                    <img src="getImage.jsp?name=<%=user1.getTo_user_name()%>" class="rounded-circle friend-pic"/>
                                </div>
                                <div class="col-10 col-sm-10 col-md-10" style="cursor: pointer">
                       
                                    <input type="hidden" id="friname" value="<%=user1.getTo_user_name() %>">   
                                    
                                    
                                    <div class="name" id="chatername" ><%=user1.getTo_user_name() %>
                                 
                                    </div>
                                
                                    <%--  <div class="under-name"> </div> --%>
                          
                                </div>
                            </div>
                            </a>
                        </li> 
                        <%  
                  } %>
                       
                    </ul>
  
                </div>
            </div>
                       
            </div>
            
        
        
      
                   
               
               
               
               
       





             
        <script src="demo.js" type="text/javascript"></script>
        
                  <script src="https://unpkg.com/jquery@3.4.1/dist/jquery.min.js" ></script>
                  <script src="https://unpkg.com/popper.js@1.12.8/dist/umd/popper.min.js" ></script>
                  <script src="https://unpkg.com/bootstrap@4.3.1/dist/js/bootstrap.min.js" ></script> 
                 
    </body>
</html>
   