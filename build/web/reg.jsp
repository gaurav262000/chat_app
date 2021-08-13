<%-- 
    Document   : reg
    Created on : 18-May-2020, 17:05:15
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration form</title>
        <link rel="stylesheet" href="regStyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript">

    $(document).ready(function () {
            
            var DOBYear = document.getElementById("DOBYear");
        var d = new Date();
        var currentYear = d.getFullYear();
        for (var i = 1940; i <= currentYear; i++) {
            var option = document.createElement("OPTION");
            option.innerHTML = i;
            option.value = i;
            DOBYear.appendChild(option); }
        });
    </script>
    </head>
    <body>
        <div class="wrapper">
    <div class="title">
      Registration Form
    </div>
        <form action="reg" method="post">
         <div class="form">
            <div class="inputfield">
            <label for="name">Name</label>
            <input type="text" placeholder="Enter your full name" name="Name" class="input" required>
           </div>
               <div class="inputfield">
             <label for="password">Password</label>
             <input type="password" id="pass" placeholder="Enter password" class="input" name="password" required>
               </div>
               <div class="inputfield">
              <label for="psw-repeat">Repeat Password</label>
              <input type="password" class="input" placeholder="Repeat password" name="psw-repeat" required>
               </div>
               <div class="inputfield">
               <label for="email">Email</label>
              <input type="email" placeholder="email" class="input" name="Email" required>
               </div>  <div class="inputfield">
                   
                  
                   
                   
                   
                   <label for="email">  Birthday</label>              
<div class="custom_select1">
    <select name="DOBDay" required>
<option>- Day -</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
<option value="31">31</option>
</select>
</div><div class="custom_select1">
<select name="DOBMonth" required>
<option>- Month -</option>
<option value="January">January</option>
<option value="Febuary">February</option>
<option value="March">March</option>
<option value="April">April</option>
<option value="May">May</option>
<option value="June">June</option>
<option value="July">July</option>
<option value="August">August</option>
<option value="September">September</option>
<option value="October">October</option>
<option value="November">November</option>
<option value="December">December</option>
</select></div><div class="custom_select1">
              
              <select id="DOBYear" name="DOBYear" required><option>- year -</option></select>
</div>
               </div>
              <div class="inputfield">
          <label>Gender</label>
          <div class="custom_select" >
              <select name="Gender" required>
              <option value="">Select</option>
              <option value="male">Male</option>
              <option value="female">Female</option>
               <option value="other">other</option>
            </select>
          </div>
       </div> 
             
              
              <div class="inputfield">
        <input type="submit" value="Register" class="btn">
      </div>
         </div>     
        </form>
            <br>
            <center>  <a href="login.jsp">LOGIN</a></center>
        </div>
    </body>
</html>
