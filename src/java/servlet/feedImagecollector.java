/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Lenovo
 */
@MultipartConfig(maxFileSize = 16177215)
@WebServlet(name = "feedImagecollector", urlPatterns = {"/feedImagecollector"})
public class feedImagecollector extends HttpServlet {
  @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      //  HttpSession session=request.getSession();  


        
        
        
        String connectionURL = "jdbc:mysql://localhost:3306/ChatReg";
		String user = "root";
		String pass = "root";
 
		int result = 0;
		Connection con = null;
		Part part =request.getPart("image");
         System.out.println(part +"4byy im in msgcollector");
                String caption=request.getParameter("caption") ; 
         // session.setAttribute("to_user1",to_user);
          //String id=request.getParameter("to_id") ; 
            System.out.println(caption+"2byy im in msgcollector");
      // System.out.println(request.getSession().getAttribute("to_user1").toString()+"2 i m in sesssion byy im in msgcollector");
       
       String from_user_name=request.getSession().getAttribute("Name").toString();
       
          Date d=new Date();
          SimpleDateFormat originalString= new SimpleDateFormat("yyyy-MM-dd");
          
         
        System.out.println(from_user_name+"3byy im in msgcollector");
        
     //   String originalString=request.getParameter("date") ;
          SimpleDateFormat time= new SimpleDateFormat("hh:mm:ss");
         System.out.println(originalString.format(d)+"   "+time.format(d));
       
        
       
       
         
 
		if(part != null){
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
			    con = DriverManager.getConnection(connectionURL, user, pass);
			    
			    PreparedStatement ps = con.prepareStatement("insert into feedImage(feed_img,status, from_user_name,date,Time) values(?,'"+caption+"', '"+from_user_name+"','"+originalString.format(d)+"','"+time.format(d)+"') ");
			    InputStream is = part.getInputStream();
			    ps.setBlob(1, is);
                            System.out.println("1st test"+is);
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
		
		if(result < 0){
	    	response.sendRedirect("result.jsp?message=Some+Error+Occurred");
		System.out.println("2nd test");
	    }else{
                response.sendRedirect("igProfile.jsp");
                }
		
        
        
        
        
        
        
        
    }
}
