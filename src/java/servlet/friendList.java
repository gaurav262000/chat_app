/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

/**
 *
 * @author Lenovo
 */
public class friendList {
    private int to_user_id;
    private int from_user_id;
    private String to_user_name;
    private String from_user_name;

    public friendList(int aInt, int aInt0, int aInt1, String string, String string0) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public String getTo_user_name() {
        return to_user_name;
    }

    public void setTo_user_name(String to_user_name) {
        this.to_user_name = to_user_name;
    }

    public String getFrom_user_name() {
        return from_user_name;
    }

    public void setFrom_user_name(String from_user_name) {
        this.from_user_name = from_user_name;
    }

    public friendList(int to_user_id, int from_user_id, String to_user_name, String from_user_name) {
        this.to_user_id = to_user_id;
        this.from_user_id = from_user_id;
        this.to_user_name = to_user_name;
        this.from_user_name = from_user_name;
    }

    public int getTo_user_id() {
        return to_user_id;
    }

    public void setTo_user_id(int to_user_id) {
        this.to_user_id = to_user_id;
    }

    public int getFrom_user_id() {
        return from_user_id;
    }

    public void setFrom_user_id(int from_user_id) {
        this.from_user_id = from_user_id;
    }

    public friendList(int to_user_id, int from_user_id) {
        this.to_user_id = to_user_id;
        this.from_user_id = from_user_id;
    }
    
}
