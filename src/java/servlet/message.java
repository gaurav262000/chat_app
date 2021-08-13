/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.sql.*;

import java.util.Date;


/**
 *
 * @author Lenovo
 */
public class message {
private String to_user;
private String from_user_name;
private String message;
private Date date;
private Time time;

    public message(String to_user, String from_user_name, String message, Date date, Time time) {
        this.to_user = to_user;
        this.from_user_name = from_user_name;
        this.message = message;
        this.date = date;
        this.time = time;
    }

    public message(int aInt, String string, String string0, String string1, Date date, Time time) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public message(String to_user) {
        this.to_user=to_user;
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public String getTo_user() {
        return to_user;
    }

    public void setTo_user(String to_user) {
        this.to_user = to_user;
    }

    public String getFrom_user_name() {
        return from_user_name;
    }

    public void setFrom_user_name(String from_user_name) {
        this.from_user_name = from_user_name;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }
}
