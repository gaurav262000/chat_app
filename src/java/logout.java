/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dao.DataAccess;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(urlPatterns = {"/logout"})
public class logout extends HttpServlet {
  @Override
       protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

 HttpSession session=request.getSession();  
  DataAccess da = new DataAccess();
    regUser user;
      try { 
          user=da.getUserDetails(session.getAttribute("Id").toString());
          da.updateUserStatusAgain(user.getEmail());
          System.out.println(user.getEmail()+"in log out");
      } catch (SQLException ex) {
          Logger.getLogger(logout.class.getName()).log(Level.SEVERE, null, ex);
      }
            session.invalidate(); 
            
            response.sendRedirect("login.jsp");
    }

  
}
