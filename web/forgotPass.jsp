<%-- 
    Document   : forgotPass
    Created on : 20-May-2020, 19:19:00
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot password</title>
        <link rel="stylesheet" href="regStyle.css">
    </head>
    <body>    <div class="wrapper">
    <div class="title">
      Forgot password
    </div>
        <form action="reg" method="post">
         <div class="form">
         <div class="inputfield">
               <label for="email">Email</label>
              <input type="email" placeholder="email" class="input" name="Email" required>
               </div> 
          <div class="inputfield">
        <input type="submit" value="Submit" class="btn">
      </div>
         </div>
        </form>
            <br>
            <center>  <a href="login.jsp">LOGIN</a></center>
        </div>
            
    </body>
</html>
