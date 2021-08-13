<%-- 
    Document   : Profile
    Created on : 30-May-2020, 17:57:52
    Author     : Lenovo
--%>

<%@page import="servlet.regUser"%>
<%@page import="dao.DataAccess"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <link rel="stylesheet" type="text/css" href="ProfileStyle.css">
      <script>
          $(document).ready(function(){
              $("#image").click(function(){
                 $("#show").show(); 
                  
              });
          });
          
      </script> 
      <title>chatApp</title>
    </head>
    <body>

  <%
        DataAccess da = new DataAccess();
    regUser user;
    user=da.getUserDetails(session.getAttribute("Id").toString()); 
    
   
    %>

<div class="container emp-profile">
    
            <form action="img" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                            <img src="getImage.jsp?name=<%=user.getName() %>" alt=""/>
                            <div class="file btn btn-lg btn-primary">
                                Change Photo
                                <input type="file" name="image" id="image"/>
                                
                                
                            </div>
                        </div>
                            
                    </div>
                            <div class="col-md-1">
                            </div>
                    <div class="col-md-5">
                        <div class="profile-head">
                                    <h5>
                                       <%=user.getName() %>
                                    </h5>
                                    <h6>
                                        Web Developer and Designer
                                    </h6>
                                    <p class="proile-rating">RANKINGS : <span>8/10</span></p>
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">About</a>
                                </li>
                                
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <a class="profile-edit-btn" name="btnAddMore" href="editprofile.jsp"> edit profile
                       </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-work">
                           <input type="submit" value="submit" id="show" class="profile-edit-btn" style="display: none" ><br/>
                           <p style="text-align: 23px;">features</p>
                           <a class="profile-edit-btn" name="btnAddMore"  href="chat1.jsp"> friend list</a>
                        
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Name</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%=user.getName() %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Email</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p> <%=user.getEmail() %> </p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>DOB</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p> <%=user.getDOBDay() %>/<%=user.getDOBMonth() %>/<%=user.getDOBYear() %> </p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Phone</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%=user.getContact() %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Bio</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%=user.getBio() %></p>
                                            </div>
                                        </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </form>           
        </div>
    </body>
</html>

