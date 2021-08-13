package model;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dao.DataAccess;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servlet.regUser;
/**
 *
 * @author Lenovo
 */
@WebServlet(urlPatterns = {"/reg"})
public class reg extends HttpServlet { 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String Name=request.getParameter("Name");
       String password=request.getParameter("password");
       String Email=request.getParameter("Email");
       int DOBDay=Integer.parseInt(request.getParameter("DOBDay"));
       String DOBMonth=request.getParameter("DOBMonth");
       int DOBYear=Integer.parseInt(request.getParameter("DOBYear"));
       String Gender=request.getParameter("Gender");
       
       
       regUser r=new regUser(0,Name,password,Email,DOBDay,DOBMonth,DOBYear,Gender);
       DataAccess da = new DataAccess();
            da.RegUser(r);
            response.sendRedirect("login.jsp");
      
    }

    
}
