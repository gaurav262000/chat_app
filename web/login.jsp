<%-- 
    Document   : login
    Created on : 20-May-2020, 15:07:35
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="captcha.js">

</script>
        <title>JSP Page</title>
         <link rel="stylesheet" href="regStyle.css">    
    </head>

    <body > <%--  onload="createCaptcha()"--%>
         <div class="wrapper">
    <div class="title">
      Login Form
    </div>
             <form onsubmit="return validat()" action="log" method="post"> <%--//onsubmit="validateCaptcha()" --%>
         <div class="form">
            <div class="inputfield">
            <label for="name">Email</label>
            <input type="text" id="email" placeholder="Enter your full email" name="Email" class="input" required>
           </div>
               <div class="inputfield">
             <label for="password">Password</label>
             <input type="password" id="pass" placeholder="Enter password" class="input" name="password" required>
               </div>
            <%--<div class="inputfield">
              <div id="captcha">
         </div>
                 <input type="text" placeholder="Captcha" class="input" id="cpatchaTextBox"/>
             </div>--%>
      <div class="inputfield">
        <input type="submit" value="Login" class="btn">
      </div>
         </div>     
        </form>
             <br>
             <a href="forgotPass.jsp"><b>Forgot Password ?</b></a> <center>  <a href="reg.jsp">Registration</a></center>
        </div>
     
    </body>
</html>
