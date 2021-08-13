<%-- 
    Document   : chatbox
    Created on : 28-Jun-2020, 21:28:36
    Author     : Lenovo
--%>

<%@page import="servlet.friendList"%>
<%@page import="servlet.regUser"%>
<%@page import="dao.DataAccess"%>
<%@page import="servlet.message"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>JSP Page</title>
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
        <div class="col-md-8 pl-0" id="side-2" >
                                      <div id="chatpanel" class="card " style="display: none;">
                    <div class="card-header ">
                                <div class="row ">
                                    <div class="col-1 col-sm-1 col-md-1 col-lg-1 d-md-none">
                                        <i class="fas fa-list mt-2 d-md-none" style="cursor: pointer;" onclick="showChatList()" ></i>
                            </div>
                            <div class="col-2 col-sm-2 col-md-2 col-lg-1">
                                <img src="bg1.jpg" alt="" class="rounded-circle profile-pic" style="margin-left: 2px;"  />
                            </div>
                            
                                    <div class="col-5 col-sm-5 col-md-5 col-lg-7"> <div class="name" id="chatname">any</div>
                                        <%--  <div class="under-name" id="chatstatus"> date status</div> --%>
                                        
                            </div>
                                    <div class="col-4 col-sm-4 col-md-4 col-lg-3 icon " >
                                <i class="fas fa-search"></i>
                                <i class="fas fa-paperclip ml-4">  </i>
                                <i class="fas fa-ellipsis-v ml-4" ></i>
                            </div>
                        </div>
                    </div>
                       
                    <div class="card-body" id="messages">
                      <%//if(request.getParameter("to_user")!=null){
                      System.out.println("i m sorrry");
                      
                    String from_user_name1=request.getSession().getAttribute("Name").toString();
                   
       String to_user="gaurav";//request.getParameter("to_user") ;
                  
          System.out.println(to_user+" chat,jsp");
          
                        ArrayList lists=da.loadchatmessage(to_user, from_user_name1);
                        System.out.println(lists+" my list");
                         for(int i=0;i<lists.size();i++){
                  user2=(message)lists.get(i);
          // System.out.println(user2.getMessage()+"my user msges");
                         
                         //if(user2.getTo_user() != to_user ){
                            
                          
                            %> <%if(user2.getTo_user()== to_user && user2.getFrom_user_name()!=from_user_name1){ %>   
                        <div class="row">
                           
                            <div class="col-2 col-sm-1 col-md-1"> 
                            <img src="bg1.jpg" class="rounded-circle chat-pic"/>
                            </div>
                            <div class="col-6 col-sm-7 col-md-7">
                               
                                <p class="receive"> <%=user2.getMessage() %>
                                    <span class="datetime"><%=user2.getTime() %> 
                                    </span> 
                                </p>
                                </div>
                                    
                            </div>
               <% }else{ %>
                       <div class="row justify-content-end">
                           <div class="col-6 col-sm-7 col-md-7 ">
                                <p class="sent float-right"><%=user2.getMessage() %>
                       <span class="datetime"><%=user2.getTime() %>
                                    </span>
                                </p>
                            </div>
                              <div class="col-2 col-sm-1 col-md-1"> 
                            <img src="bg1.jpg" class="rounded-circle chat-pic"/>
                            </div>
                        </div> 
                             
                   
             <%   } }
 %><%--    <div class="row justify-content-end">
                           <div class="col-4 col-sm-5 col-md-5 ">
                                <p class="sent float-right">message
                       <span class="datetime">time
                                    </span>
                                </p>
                            </div>
                              <div class="col-2 col-sm-1 col-md-1"> 
                            <img src="bg1.jpg" class="rounded-circle chat-pic"/>
                            </div>
                        </div> 
                   }
                   --%>
                    
                    </div>
                
                <div class="card-footer">
                    <div class="row" style="position: relative;">
                        <div class="col-md-12" id="emoji" style="display: none;">
                            <span class="close" style="cursor: pointer;" onclick="hideEmoji()" >&times; </span>
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#smiley" role="tab" aria-controls="home" aria-selected="true"><i class="fas fa-smile"></i></a>
  </li>
  
  
 
</ul>
                                                      
<div class="tab-content" id="myTabContent">
    <div class="tab-pane fade show active" id="smiley" role="tabpanel" aria-labelledby="home-tab"> 
    </div>
 </div>
                    </div> 
                    </div>
                    
                    <div class="row">
                        <div class="col-2 col-md-1 icon">
                            <i class="far fa-grin fa-2x" onclick="showEmoji()" style="cursor: pointer;"></i>
                        </div>
                        <div class="col-8 col-md-10 ">
                            <input type="text" placeholder="Type here" onfocus="hideEmoji()" id="txtMessage" name="message" onclick="onKeyDown()" class="form-control form-rounded"/>
                             </div>
                        <div class="col-2 col-md-1 icon"> <i class="fas fa-microphone fa-2x"></i></div>
                    </div>
                </div> 
                                      </div> </div>
                   
                   
                   
                   
                  <script src="https://unpkg.com/jquery@3.4.1/dist/jquery.min.js" ></script>
                  <script src="https://unpkg.com/popper.js@1.12.8/dist/umd/popper.min.js" ></script>
                  <script src="https://unpkg.com/bootstrap@4.3.1/dist/js/bootstrap.min.js" ></script> 
                  <script src="chatScript.js" type="text/javascript"></script>
    </body>
</html>
