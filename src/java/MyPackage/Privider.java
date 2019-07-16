/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MyPackage;


import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Pavi
 */
public class Privider {
    
    public Connection con=null;
    public ResultSet rst=null;
    public Statement stmt=null;
    public String department= "";

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
    
    String dbdriver = "com.mysql.jdbc.Driver";
    String dburl = "jdbc:mysql://localhost:3306/DocumentManagement";
    String dbusername = "root";
    String dbpassword = "";
    String query = "";
    
    
    public boolean getConnection() {
       
        
        try {           
                Class.forName(dbdriver);
           
                con=DriverManager.getConnection(dburl,dbusername,dbpassword);
                
		stmt=(Statement) con.createStatement();
                //JOptionPane.showMessageDialog(null, "connected");
        }
        catch(Exception e){
        }
        
        return true;
        
    }
    
    public  boolean CheckAdminLogin(String query) {
        boolean flag = false;
        login log = new login();
        try {
            System.out.println(query);
            rst = stmt.executeQuery(query);
            
             if(rst.next()){
                 //department = rst.getString("department");
                 flag = true;
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
    
    public  boolean CheckLogin(String query) {
        boolean flag = false;
        login log = new login();
        try {
            System.out.println(query);
            rst = stmt.executeQuery(query);
            
             if(rst.next()){
                 department = rst.getString("department");
                 flag = true;
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
    
    public void insertRecord(String query) throws Exception {
        try {
            stmt.executeUpdate(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    public Connection Connection()
    {
        try 
        {
            Class.forName(dbdriver);
            con = DriverManager.getConnection(dburl,dbusername,dbpassword);
            return con;
        } catch (Exception e) {e.printStackTrace();}
        return null;
    }
    
    public void closeConnection() {
        try {
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public JSONArray fetchChartData(String query) throws Exception {
        JSONArray chartData = new JSONArray();
        JSONObject json = null;
        try {
            rst = stmt.executeQuery(query);
            
             if(rst.next()){
                 json = new JSONObject();
                 json.put("name", rst.getString("department"));
                 json.put("val", rst.getInt("count"));
                 chartData.put(json);
             }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return chartData;
    }
}
