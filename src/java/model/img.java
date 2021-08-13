package model;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Lenovo
 */
@WebServlet(urlPatterns = {"/img"})
@MultipartConfig(maxFileSize = 16177215)
public class img extends HttpServlet {

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();  
      String name = session.getAttribute("Name").toString();
        
        String connectionURL = "jdbc:mysql://localhost:3306/ChatReg";
		String user = "root";
		String pass = "root";
 
		int result = 0;
		Connection con = null;
		Part part =request.getPart("image");
        System.out.println(part);
		if(part != null){
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
			    con = DriverManager.getConnection(connectionURL, user, pass);
			    
			    PreparedStatement ps = con.prepareStatement("update regUsers set image=? where Name='"+name+"' ");
			    InputStream is = part.getInputStream();
			    ps.setBlob(1, is);
                            System.out.println("1st test");
			    result = ps.executeUpdate();
			}
			catch(Exception e){
				e.printStackTrace();
			}	
			finally{
				if(con != null){
					try{
						con.close();
					}
					catch(Exception e){
						e.printStackTrace();
					}
				}
			}
		}
		
		if(result > 0){
	    	response.sendRedirect("Profile.jsp");
	    }
		else{
			response.sendRedirect("result.jsp?message=Some+Error+Occurred");
		System.out.println("2nd test");
                }
	}
        
    

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */

}
