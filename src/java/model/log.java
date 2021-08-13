/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import dao.DataAccess;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import servlet.regUser;

/**
 *
 * @author Lenovo
 */
@WebServlet(name = "log", urlPatterns = {"/log"})
public class log extends HttpServlet {
 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("i m in log servlet q");
     HttpSession session=request.getSession();  
        try {
         DataAccess da = new DataAccess();
       //  System.out.println(request.getParameter("email"));
         // System.out.println(request.getParameter("password"));
         if(da.LoginUser(request.getParameter("Email"),request.getParameter("password")))
         {
             System.out.println("i m in log servlet");
             session.setAttribute("Id",da.getuesrid(request.getParameter("Email")));
             session.setAttribute("status",da.getuesrsStatus(request.getParameter("Email")));
             session.setAttribute("Name", da.getuesrName(request.getParameter("Email")));
             response.sendRedirect("chat1.jsp");
              
         }
         else{
         response.sendRedirect("error.jsp");
         
         }
         
         
        
     } catch (SQLException ex) {
         Logger.getLogger(log.class.getName()).log(Level.SEVERE, null, ex);
     }
}
}
      
    
    
    
    

    

