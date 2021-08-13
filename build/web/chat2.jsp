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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="chatScript.js" type="text/javascript"> </script>
        <script>                                 
        setInterval(loadmessage,1000);
       
    function loadmessage(){
       <% String from_user_name1=request.getSession().getAttribute("Name").toString();
    String to_user=request.getParameter("to_user") ; %> 
       
              $.ajax({
        url:'demo.jsp',
        data:{  fromuser:'<%=from_user_name1 %>',
                touser:'<%=to_user %>'
              },
      //  dataType: 'json',
        success:function(data)
   {
       
       document.getElementById("messages").innerHTML=data;
     

  }
        
    }); 
        }
        
        
        
        
        
        
        </script>
                  
    </head>
    <body id="chatmessage" >
        
    <%
        DataAccess da = new DataAccess(); 
     regUser user;
   
        user=da.getUserStatusAll(request.getParameter("to_user")); 
         String id = request.getParameter("id");
 
        friendList user1;
    
    message user2;
    %>
    <%--   String to_user=(String)session.getAttribute("to_user"); --%>
    
    <span class="top"></span>
        
       
        <div class="row h-100 chat-box1" >
          
                        <div class="col-md-8 pl-0" id="side-2" >
                <div id="chatpanel" class="card " >
                    <div class="card-header ">
                                <div class="row ">
                                    
                            <div class="col-2 col-sm-2 col-md-2 col-lg-1">
                                <img src="getImage.jsp?name=<%=request.getParameter("to_user")%>" alt="" class="rounded-circle profile-pic" style="margin-left: 2px;"  />
                            </div>
                           
                                    <div class="col-5 col-sm-5 col-md-5 col-lg-7"> <div class="name" id="chatname"><%=request.getParameter("to_user")%></div>
                                         <div class="under-name" id="chatstatus"> <%=user.getStatus() %></div> 
                                        
                            </div>
                                    <div class="col-4 col-sm-4 col-md-4 col-lg-3 icon " >
                                <i class="fas fa-search" style="display: none"></i>
                                <i class="fas fa-paperclip ml-4" style="display: none">  </i>
                                </div>
                                  <div class="col-1 col-sm-1 col-md-1">
                              <div class="dropleft">
                                <span class="dropdown-toggle " data-toggle="dropdown" style="float: right;"> 
                               <i class="fas fa-ellipsis-v icon mt-2" style="cursor: pointer;" onclick="hideChatList()"></i>
                                </span>
                                <div class="dropdown-menu mt-2">
                                    
                                    <a href="FriendProfile.jsp?to_user=<%=request.getParameter("to_user")%>&id=<%=request.getParameter("id")%>" class="dropdown-item"> Profile</a>
                                  <a href="logout" class="dropdown-item"> Logout</a>
                                </div>
                               
                            </div>
                                  </div>
                            
                        </div>
                    </div>
                       
                    <div class="card-body" id="messages">
                      
                       
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
    <div class="tab-pane fade show active"  role="tabpanel" id="smiley" aria-labelledby="home-tab"> 
    
    </div>
 </div>
                    </div> 
                    </div>
                           <div class="row" style="position: relative;">
                        <div class="col-md-12" id="image" style="display: none;">
                            <span class="close" style="cursor: pointer;" onclick="hideImage()" >&times; </span>
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
      <a class="nav-link active" id="home-tab" data-toggle="tab" href="#image" role="tab" aria-controls="home" aria-selected="true"><i class="fas fa-camera-retro"></i>
      </a>
  </li>
  
  
 
</ul>
                            <form action="imagestorer"  method="post" enctype="multipart/form-data" >                                  
<div class="tab-content" id="myTabContent">
    <div class="tab-pane fade show active"  role="tabpanel" id="image" aria-labelledby="home-tab">
        <input type="hidden"  name="to_id" id="touserid" value="<%=id %>" style="display: flex;">
        <input type="hidden"  name="touserName" id="touserName" style="display: flex;">
        <input type="file" name="image" id="imagesender"  >
    <input type="submit" value="send" style="display: flex;">
    </div>
</div>
                    </form>
                    </div> 
                    </div>
                    <div class="row">
                        
                        <div class="col-2 col-md-1 icon">
                            <i class="far fa-grin fa-2x" onclick="showEmoji()" style="cursor: pointer;"></i>
                        </div>
                        <div class="col-8 col-md-10 ">
                            <input type="text" placeholder="Type here" onfocus="hideEmoji()" id="txtMessage" name="message" onclick="onKeyDown()" class="form-control form-rounded"/>
                             </div>
                        <div class="col-2 col-md-1 icon"> <i class="fas fa-paperclip  fa-2x" onclick="showImage();sendName()" style="cursor: pointer;">
                                
                               
                                
                            </i></div>
                    </div>
                </div> 
        </div>
                
        </div>
            </div>
    
        
        <%//  response.setIntHeader("Refresh", 5); %>
      
                   
               
               
               
               
       





             
<link href="chatStyle.css" rel="stylesheet" />

 
                  <script src="https://unpkg.com/jquery@3.4.1/dist/jquery.min.js" ></script>
                  <script src="https://unpkg.com/popper.js@1.12.8/dist/umd/popper.min.js" ></script>
                  <script src="https://unpkg.com/bootstrap@4.3.1/dist/js/bootstrap.min.js" ></script> 
               
      
                
    </body>
</html>
   