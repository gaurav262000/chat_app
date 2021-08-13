<%-- 
    Document   : igProfile
    Created on : 04-May-2021, 00:03:48
    Author     : Lenovo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="db.DBUtils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="servlet.regUser"%>
<%@page import="dao.DataAccess"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
        <link href="https://unpkg.com/bootstrap@4.3.1/dist/css/bootstrap.min.css" rel="stylesheet" />
        
        <style>
            
            body{
  margin: 0px auto;
  padding: 0px;
  background: #ddd;
  justify-content: center;
  display: flex;
  font-family: 'Open Sans', sans-serif;
  color: #262626;
  overflow-x: hidden;
}
footer{
  position: fixed;
  bottom: 0px;
  right: 10px;
  color: #888;
}
.mainbox {
    width: 414px;
    height: auto;
    background: #fff;
    position: relative;
    overflow-x: hidden;
    overflow-y: hidden;
    margin-top: 20px;
    margin-right: 15px;
    border-radius: .25rem;
}
.profileTop{
  margin: 20px 25px;
  display: inline-block;
  width: 100%;
  
}
.profileImg{
  width: 100px;
  height: 100px;
  overflow: hidden;
  border-radius: 50px;
}
.profileImg img{
 order: solid 1px #888;
    padding: 0px;
    width: 100px;
    height: 100px;
    border-radius: 50px;
}
.profileFollow{
  width: 50%;
  position: absolute;
  top: 25px;
  right: 40px;
  
}
.profileFollow table{
  width: 100%;
}
.profileFollow table td{
  padding: 10px;
  text-align: center;
  line-height: .3;
}
.profileFollow table .topsub{
  font-size: 14pt;
  color: #222;
  font-weight: 600;
}
.profileFollow table .bottomsub{
  font-size: 11pt;
  color: #777;
}
.profileFollow a{
  border: solid #ddd 2px;
  border-radius: 3px;
  padding: 3px;
  position: absolute;
  top: 52px;
  right: -15px;
  color: #333;
  font-size: 10pt;
  text-align: center;
  width: 110%;
  justify-content: center;
  display: flex;
  text-decoration: none;
}
.profileFollow a:hover{text-decoration: none;}

/* --------- */

.profileDetail{
  padding: 0px 25px;
  line-height: 1.3;
  margin-top: -6px;
}
.profileDetail p{
  width: 50%;
}
.profileDetail p:last-child{
  width: 80%;
  font-size: 10pt;
  margin-top: -15px !important;
}
.story{
  border-top: solid 1px #ddd;
  border-bottom: solid 1px #ddd;
  padding: 8px 25px;
  font-size: 11pt;
  font-weight: 500;
}
.story span{
    content: '';
    display: inline-block;
    height: 8px;
    width: 8px;
    margin-top: 8px;
    transform: rotate(45deg) translateY(-4px);
    border-right: 1.4px solid #262626;
    border-bottom: 1.4px solid #262626;
    position: absolute;
    right: 30px;
}
/* ------------ */

.tabBox{
    display: flex;
    justify-content: space-around;
    padding: 12px 18px;
    border-bottom: 0.5px solid #dbdbdb;
}

/* ---icon-- */
.icon-grid {
    user-select: none;
    cursor: pointer;
}
.icon-grid > .control {
    display: none;
}
input[type=checkbox], input[type=radio] {
    padding: 0;
    margin: 4px 0 0;
    line-height: normal;
    box-sizing: border-box;
}
.icon-grid[data-state="active"] > .icon {
    border-color: #3D95EB;
}
.icon-grid > .icon {
    height: 22px;
    width: 22px;
    border-radius: 2px;
    border: 2px solid #3D95EB;
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
}
.icon-grid[data-state="active"] > .icon::before {
    border-left-color: #3D95EB;
    border-right-color: #3D95EB;
}
.icon-grid > .icon::before {
    content: '';
    position: absolute;
    display: inline-block;
    width: 8px;
    height: 100%;
    border-left: 2px solid #3D95EB;
    border-right: 2px solid #3D95EB;
}
.icon-grid[data-state="active"] > .icon::after {
    border-top-color: #3D95EB;
    border-bottom-color: #3D95EB;
}
.icon-grid > .icon::after {
    content: '';
    position: absolute;
    display: inline-block;
    width: 100%;
    height: 8px;
    border-top: 2px solid #3D95EB;
    border-bottom: 2px solid #3D95EB;
}

.icon-row[data-state="muted"] > .icon {
    border-top-color: #999999;
    border-bottom-color: #999999;
}
.icon-row > .icon {
    width: 20px;
    height: 22px;
    border-top: 2px solid #999999;
    border-bottom: 2px solid #999999;
    display: flex;
    justify-content: center;
    align-items: center;
}
.icon-row[data-state="muted"] > .icon::before {
    border-color: #999999;
}
.icon-row > .icon::before {
    content: '';
    display: inline-block;
    width: 100%;
    height: 16px;
    border: 2px solid #999999;
}
.icon-row {
    user-select: none;
    cursor: pointer;
}
#textchange{
    outline: none;
    
}

.icon-row > .control {
    display: none;
}
input[type=checkbox], input[type=radio] {
    padding: 0;
    margin: 4px 0 0;
    line-height: normal;
    box-sizing: border-box;
}
.icon-tagged {
    width: 20px;
    height: 18px;
    border-radius: 3px;
    border: 2px solid #999999;
    position: relative;
    display: flex;
    justify-content: center;
    align-items: flex-end;
}
.icon-tagged::before {
    content: '';
    position: absolute;
    top: -2px;
    left: 50%;
    width: 4px;
    height: 4px;
    background-color: #fff;
    border-top: 2px solid #999999;
    border-left: 2px solid #999999;
    transform: rotate(45deg) translateX(-64%);
}
.icon-tagged > .avatar {
    width: 12px;
    height: 4px;
    border-left: 2px solid #999999;
    border-top: 2px solid #999999;
    border-right: 2px solid #999999;
    border-top-left-radius: 4px;
    border-top-right-radius: 4px;
    position: relative;
}
.icon-tagged > .avatar::before {
    content: '';
    position: absolute;
    top: -11px;
    width: 8px;
    height: 8px;
    border-radius: 50%;
    border: 2px solid #999999;
}

/* ----------IMG */

.ImgTab{
      width: 100%;
    margin-left: 4px;
}
.ImgPro{
 width: 32%;
    height: 130px;
    overflow: hidden;
    display: inline-block;
}
.ImgPro img{
 width: 100%;
    height: 132px;
}
.close {
  position: absolute;
  right: 0;
  top: 0;
  width: 32px;
  height: 32px;
  opacity: 5;
  
}
.close:hover {
  
  background-color: black;
  color: white;
  border-radius: 50%;
}
.close:before, .close:after {
  position: absolute;
  left: 15px;
  content: ' ';
  height: 33px;
  width: 2px;
  background-color: white;
}
.close:before {
  transform: rotate(45deg);
}
.close:after {
  transform: rotate(-45deg);
}
.top {
    height: 130px;
    width: 100%;
    background-color: #009688;
    position: fixed;
    z-index: -1;
}
.ImgTab1{
        border-bottom: 0.5px solid #dbdbdb;
    padding: 0 0 5px 7px;
} .ImgPro1{
        width: 98%;
    overflow: hidden;
}
        
        
        </style>
    </head>
    <body>
        
         <span class="top"></span>
         <form class="md-form" action="feedImagecollector" method="post" enctype="multipart/form-data" style='display: none;'>
             <div class="popup" style="width: 288px;
    z-index: 1;
    margin-left: 70px;
    margin-top: 100px;
    /* padding-left: 31px; */
    position: absolute;
    border-style: solid;">
                 <div class="up-image" style="height: 300px;">
                    
                    
                     <img src="noimage.png" id="image-up"  style="width: 100%;height: 100%;">
            
                
                 </div>
                 <span class="close">
                 </span>
          
  <div class="file-field">
    <div class="btn btn-primary btn-sm float-left">
      
        <input type="file" name="image" onchange='sendImage(this)' >
        <input type="text" placeholder="write caption" name="caption" style="width: 265px;">
      <input type="submit" value="upload" style="width: 265px;">
    </div>
 
  </div>

            </div>
        </form>
        
        
        
        
        
        
        
        
        
        
         <%
        DataAccess da = new DataAccess();
    regUser user;
    user=da.getUserDetails(session.getAttribute("Id").toString()); 
  String from_user_name=request.getSession().getAttribute("Name").toString();   
   
    %>
        
        
        <div class="mainbox">
            
            
            
            
            
        
  <div class="tabBox">
     
    <div class="tab2" style=" cursor: pointer; ">
      <i class="fas fa-th"></i>
    </div>
 
    <div class="tab1" style=" cursor: pointer; " >
     <i class="fas fa-list" id="roe"></i>
    </div>
   
    <div class="tab" style="margin-top: 5px;">
      <div class="icon-tagged">
        <div class="avatar"></div>
      </div>
    </div>

  </div>

  <div class="ImgTab" style="display: none;">
        <%
 
           
    
           PreparedStatement ps2=DBUtils.getPreparedStatement("select * from feedImage  ORDER BY feed_id desc ");
                ResultSet rs2=ps2.executeQuery();

                while(rs2.next()){
                   
  
  %>
     <div class="ImgPro">
         <img src="getfeedImage.jsp?id=<%=rs2.getString(1) %>" /> </div>
            <%

              }
    %>
    </div>
 
        <%
  String from_user_name1=request.getSession().getAttribute("Name").toString();
           
    
           PreparedStatement ps1=DBUtils.getPreparedStatement("select * from feedImage  ORDER BY feed_id desc");
  int k=0;   
           ResultSet rs1=ps1.executeQuery();
             

                while(rs1.next()){
          
  %>
  
  <div class="ImgTab1" >  
  <div style="display: flex;" >
 <div style="padding: 10px;">
       <img src="getImage.jsp?name=<%=rs1.getString(2) %>" class="rounded-circle friend-pic" style="height: 35px;width: 35px;"/>
 </div>
 <span style="padding: 10px;
margin-top: 2px;">
     <a href="#" style="text-decoration: none;
color: black;"> <%=rs1.getString(2) %></a>
 </span>
 <div style="padding: 10px;
margin-left: 65%;
margin-top: 5px;"><i class="fas fa-ellipsis-v"></i></div>
  </div>
      <div class="ImgPro1">
      <img src="getfeedImage.jsp?id=<%=rs1.getString(1) %>" style="width: 400px;" /> 
  </div>
  <div style="    padding: 2px 2px 1px;">
      <div id="dislike<%=k%>" style="display: contents;">
   <i id="like<%=k%>" class="far fa-heart dislike<%=k%>" style="color: black;font-size: 31px; cursor: pointer;" onclick="like(this.id,'<%=rs1.getInt(1) %>','<%=from_user_name %>')"></i>    
<i id="dislike<%=k%>" class="fas fa-heart "  style="color: red;font-size: 31px; cursor: pointer;display: none; " onclick="dislike(this.id,'<%=rs1.getInt(1) %>','<%=rs1.getString(2)%>')"></i>    
  </div>
   <i class="far fa-comment-alt" id="<%=k%>"  style="font-size: 32px; cursor: pointer;" onclick="hide_showcomment(this.id,<%=rs1.getInt(1)%>)" ></i>
     <% 
          String like="like";
          String dislike="dislike";
        
          PreparedStatement ps7=DBUtils.getPreparedStatement("select * from likesys where feed_id='"+rs1.getInt(1)+"' and from_user_name='"+from_user_name1+"'");
                ResultSet rs7=ps7.executeQuery();
  
                while(rs7.next()){
               
   if(rs7.getString(4).equals(like)&&rs7.getString(3).equals(from_user_name1)){
      %><i id="like<%=k%>"  class="fas fa-heart" style="color: red;margin-left: -72px; font-size: 32px; cursor: pointer; " onclick="dislike(this.id,'<%=rs7.getInt(1)%>')"></i> 
      
    <%
 }  }%>
  
      <% 
PreparedStatement ps8=DBUtils.getPreparedStatement("select count(*) from likesys where feed_id='"+rs1.getInt(1)+"' and status='"+like+"'");
                ResultSet rs8=ps8.executeQuery();

                while(rs8.next()){
    %>
    <div>
      <span id="likescount"> <%=rs8.getInt("count(*)") %></span> <span>likes </span>
   </div>
      <%
   }
   %>
      <span style="display: flex;"><b>caption:  </b> <%=rs1.getString(5) %> </span>
      <div id="div<%=k%>" class="comments"  style="display: none;" >
          <span> comments </span><i class="fas fa-times" id="<%=k%>" style="margin-left: 310px; cursor: pointer;" onclick="closecom(this.id)"></i>
     
      <ul id="stextchange<%=k%>" style="height: 135px;overflow-y: scroll;">
          <li style="list-style: none;margin-left: -40px;padding: 2px 6px 5px 0px;">
              <div style="display: flex;">
              <img src="download.png" class="rounded-circle friend-pic" style="height: 25px;width: 25px;"/>
             
              <div style="    word-break: break-all;">
                  <a style="font-weight: 900;font-family: ui-sans-serif;">gaurav</a>jdskfjjdhfjsdhfjkdhjfshdjkfhsdjfhsdjfhjdhfjdhfkdhfjhdkjf
              </div>
              </div>
          </li>
      </ul>    
      
      
  <div style="background-color: gold;
padding: 7px 0px 7px 0px;
margin-left: -7px;">
      <div style="position: absolute; margin-top: -5px;">   <img  src="getImage.jsp?name=<%=user.getName() %>" class="rounded-circle friend-pic" style="height: 35px;width: 35px;"/>
           </div>
           <input type="hidden" id="username" value="<%=user.getName() %>">
           <input type="hidden" id="userfeedidtextchange<%=k%>" value="<%=rs1.getString(1) %>" >
           <input type="hidden" id="userid"  value="<%=user.getId() %>" >
           
      <input type="text" placeholder="   Add a comment... " id="dtextchange<%=k%>" name="message"  style="width: 80%;
border-radius: 15px;
margin-left: 40px;
position: absolute;
border: none;
background-color: gold;
outline: none;"> 
      <div id="textchange<%=k%>" style="margin-left: 371px;cursor: pointer; " onclick="onKeyDown(this.id),comment(this.id)"> post</div>
      </div>
      </div>
  </div>
  
    </div>
            <%
 k++;  }
              
    %>
     
    

  
  
</div>

   <script src="https://unpkg.com/jquery@3.4.1/dist/jquery.min.js" ></script>
                  <script src="https://unpkg.com/popper.js@1.12.8/dist/umd/popper.min.js" ></script>
                  <script src="https://unpkg.com/bootstrap@4.3.1/dist/js/bootstrap.min.js" ></script> 
                  <script type="text/javascript">
                      function sendImage(event){
                          var file = event.files[0];
                          if(!file.type.match("image.*")){
        alert("plz select image");
    }else{
        var reader= new FileReader();
        
        reader.addEventListener("load",function(){ 
   document.getElementById("image-up").src=reader.result;
        // alert(reader.result);
                          
           },false);
        if(file){
            reader.readAsDataURL(file);
        }
   }
                      }
                      
                      $(document).ready(function(){
  $(".close").click(function(){
    $(".md-form").hide();
  });   
   $(".story").click(function(){
    $(".md-form").show();
  });
   $(".tab1").click(function(){
    $(".ImgPro").hide();
  });$(".tab2").click(function(){
    $(".ImgPro").show();
  });$(".tab2").click(function(){
    $(".ImgTab1").hide();
  });
  $(".tab2").click(function(){
    $(".ImgTab").show();
  });
  $(".tab1").click(function(){
    $(".ImgTab1").show();
  });
                      }); 
                   
function like(event,id,from){
   var likes='like'; 
  // alert(likes);
    
         $.ajax({
        url:'likesystem.jsp',
        data:{id:id,from:from,likes:likes},
      //  dataType: 'json',
               
        success:function(data)
   {
     
//alert(data);
window.location.reload();
// document.getElementById("dis"+event).innerHTML=data;

  }
        
    });
// var likes=document.getElementById("likescount").innerHTML;
// alert(likes);
// likes=parseInt(likes);
// likes++;
// document.getElementById("likescount").innerHTML=likes;
}
function dislike(event,id){
    var likes='dislike'; 
  // alert(likes);
      
         $.ajax({
        url:'dilikesystem.jsp',
        data:{id:id},
      //  dataType: 'json',
               
        success:function(data)
   {
     
//alert(data);
window.location.reload();
//document.getElementById(event).style.display="none";
 //document.getElementById(event).innerHTML=data;
 
    }
        
    });
 
}
     //for comments

         function hide_showcomment(id,feedid){
        // document.getElementById("div"+id).style.display="block";
          $("#div"+id).show("slow");
       //   alert(feedid);
           $.ajax({
        url:'comment.jsp',
        data:{feedid:feedid},
      //  dataType: 'json',
        success:function(data)
   {
 document.getElementById("stextchange"+id).innerHTML=data;    
  
     //alert(data);
 //setInterval(hide_showcomment,1000);
    }
        
    });   
    }  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
          function closecom(id){   
   // document.getElementById("div"+id).style.display="none";
        $("#div"+id).hide("slow");
          }

                  
                  function onKeyDown(event){
    
 if(document.getElementById("d"+event).value!==''){ 
        
         var message= document.getElementById("d"+event).value;
          var username= document.getElementById('username').value;
           var userid= document.getElementById('userid').value;
            var userfeedid= document.getElementById('userfeedid'+event).value;
             //var = document.getElementById(event).value;
          
     // SendMessage();
   //alert(message+" feed--"+userfeedid+" userid--"+userid+" name--"+username);

      
     $.ajax({
        url:'commentcollector.jsp',
        data:{message: message,username:username,userid:userid,userfeedid:userfeedid},
      //  dataType: 'json',
        success:function(data)
   {
     

  }
        
    });   
      
            document.getElementById("d"+event).value='';
    document.getElementById("d"+event).focus();
     
        
        
        } 
       
    
}
    
                  
                   function comment(id){
        // document.getElementById("div"+id).style.display="block";
//          $("#div"+id).show("slow");
        var userfeedid= document.getElementById('userfeedid'+id).value;  
      //  alert(userfeedid);
           $.ajax({
        url:'comment.jsp',
        data:{feedid:userfeedid},
      //  dataType: 'json',
        success:function(data)
   {
 document.getElementById("s"+id).innerHTML=data;    
  
    // alert(data);
 //setInterval(hide_showcomment,1000);
    }
        
    });   
    }  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  </script>
  
        
        </body>
</html>
