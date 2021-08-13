/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DBUtils;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import servlet.friendList;
import servlet.message;
import servlet.regUser;

/**
 *
 * @author Lenovo
 */
public class DataAccess {
    public void RegUser(regUser r) {
        
       try {
            PreparedStatement ps=DBUtils.getPreparedStatement("insert into regUsers(Name,password,Email,DOBDay,DOBMonth,DOBYear,Gender) values(?,?,?,?,?,?,?)");
            ps.setString(1,r.getName());
            ps.setString(2,r.getPassword());
            ps.setString(3,r.getEmail());
            ps.setInt(4,r.getDOBDay());
            ps.setString(5,r.getDOBMonth());
            ps.setInt(6,r.getDOBYear());
            ps.setString(7,r.getGender());
            ps.executeUpdate();
        } catch (ClassNotFoundException ex) {
           System.out.println(ex);
        } catch (SQLException ex) {
           System.out.println(ex);
           
        }
    
    }
    public boolean LoginUser(String Email , String password) throws SQLException{
        try {
            PreparedStatement ps=DBUtils.getPreparedStatement("select * from regUsers where Email=?");
            ps.setString(1,Email);
            ResultSet rs=ps.executeQuery();
            String emailId;
            String pass;
            while(rs.next()){
            emailId=rs.getString("Email");
            pass=rs.getString("password");
            System.out.println(emailId);
          System.out.println(pass);
            if(pass.equals(password)){
                System.out.println("i m in if state");
               boolean res=updateUserStatus(emailId);
                System.out.println(res);
                return res;
            }
                    }
        } catch (ClassNotFoundException ex) {
             System.out.println(ex);
        } 
    return false;
    }
    
    public static boolean updateUserStatus(String Email) throws SQLException{
    PreparedStatement ps1;
        try {
            System.out.println("i m in update");
            ps1 = DBUtils.getPreparedStatement("update regUsers set status='active' where Email=?");
             ps1.setString(1,Email); 
            ps1.executeUpdate();
           
            return true;

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
             
            return false;


}
     public static boolean updateUserStatusAgain(String Email) throws SQLException{
    PreparedStatement ps1;
        try {
            System.out.println("i m in update");
            ps1 = DBUtils.getPreparedStatement("update regUsers set status='offline' where Email=?");
             ps1.setString(1,Email); 
            ps1.executeUpdate();
           
            return true;

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
             
            return false;


}
    
    
    
    public int getuesrid(String Email) throws SQLException{
    int str=0;
    
    PreparedStatement ps;
        try {
            ps = DBUtils.getPreparedStatement("select * from regUsers where Email=?");
             ps.setString(1,Email);
              ResultSet rs=ps.executeQuery();
              while(rs.next()){
                  str=rs.getInt("Id");
              }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
     return str;
    }
    
    
    
   
    
     public String getuesrName(String Email) throws SQLException{
    String str=null;
    
    PreparedStatement ps;
        try {
            ps = DBUtils.getPreparedStatement("select * from regUsers where Email=?");
             ps.setString(1,Email);
              ResultSet rs=ps.executeQuery();
              while(rs.next()){
                  str=rs.getString("Name");
              }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
     return str;
    }
   
    
    
    
    
    
    public String getuesrsStatus(String Email) throws SQLException{
    String str=null;
    
    PreparedStatement ps;
        try {
            ps = DBUtils.getPreparedStatement("select * from regUsers where Email=?");
             ps.setString(1,Email);
              ResultSet rs=ps.executeQuery();
              while(rs.next()){
                  str=rs.getString("status");
              }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
     return str;
    }
    
    
    
    
     public regUser getUserStatusAll(String Name) throws SQLException{
    regUser userDetails=null;
    PreparedStatement ps;
        try {
            ps = DBUtils.getPreparedStatement("select * from regUsers where Name=?");
            ps.setString(1, Name);
             ResultSet rs=ps.executeQuery();
              while(rs.next()){
              
               userDetails=new regUser(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getString(6),rs.getInt(7),rs.getString(8),rs.getString(9),rs.getString(10));
     
      }
     ps.close();
              } catch (ClassNotFoundException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    
        return userDetails;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    public regUser getUserDetails(String Id) throws SQLException{
    regUser userDetails=null;
    PreparedStatement ps;
        try {
            ps = DBUtils.getPreparedStatement("select * from regUsers where Id=?");
            ps.setString(1, Id);
             ResultSet rs=ps.executeQuery();
              while(rs.next()){
              
              userDetails=new regUser(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getString(6),rs.getInt(7),rs.getString(8),rs.getString(9),rs.getString(11),rs.getString(12));
      }
     ps.close();
              } catch (ClassNotFoundException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    
        return userDetails;
    }
    
  
     
    
     public ArrayList getAllUsers() throws ClassNotFoundException{
        ArrayList list=new ArrayList();
        regUser user=null;
        PreparedStatement pstm;
    
        try {
            pstm =DBUtils.getPreparedStatement("select * from regUsers ");
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                user =new regUser(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getString(6),rs.getInt(7),rs.getString(8),rs.getString(9));
            list.add(user);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            
        }
        return list;
    }
     
    
     
  public ArrayList getFriendList(int from_user_id) throws ClassNotFoundException{
        ArrayList list1=new ArrayList();
        friendList user1=null;
        PreparedStatement pstm;
    
        try {
            pstm =DBUtils.getPreparedStatement("select * from friendList where from_user_id="+from_user_id+"");
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                user1 =new friendList(rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5));
                System.out.println(user1);
            list1.add(user1);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            
        }
        return list1;
    }
     ///fuction chat user already exist
  public static boolean checkExistUser(int to_user_id , int from_user_id) throws ClassNotFoundException, SQLException{
 boolean flag = true;
 int count=0;
  PreparedStatement pstm;
  
         String query="select * from friendList where from_user_id ="+ from_user_id +" And to_user_id="+to_user_id+"";
            pstm =DBUtils.getPreparedStatement(query);
            System.out.println(query);
            ResultSet rs=pstm.executeQuery();
           while(rs.next()){
             count++;   
            
            }
           if(count>0)
            flag=false;
           
  //System.out.println(count);
  return flag;
  }
      






////////chat messsages fetching//////////////


  public ArrayList loadchatmessage(String to_user,String from_user_name) throws ClassNotFoundException{
        ArrayList list1=new ArrayList();
        message user1=null;
        PreparedStatement pstm;
    
        try {
            if(to_user!=null){
            String quey="select * from msgcollector where from_user_name='"+from_user_name+"' AND to_user='"+to_user+"'  OR from_user_name='"+to_user+"' AND to_user='"+from_user_name+"'  ";
              System.out.println(quey+"lodere");
            pstm =DBUtils.getPreparedStatement(quey);
            
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
               user1 =new message(rs.getString(2),rs.getString(3),rs.getString(4),rs.getDate(5),rs.getTime(6));
                System.out.println(user1+"i m in loadchatmsg");
            list1.add(user1);
            }}
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            
        }
        return list1;
    }

  



}
