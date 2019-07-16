/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MyPackage;

import javax.servlet.http.HttpSession;

/**
 *
 * @author Pavi
 */
public class login {
    
     
    
    private String username;
    private String password;   
    private String department;
    
    
    Privider provider = new Privider();

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
    
    
    public boolean ValidateLogin() {
    boolean flag = false;
        try {
            
            if(provider.getConnection()) {
                System.out.println("inside validate login");
               String query = "select * from users where username = '"+getUsername()+"' and password = '"+getPassword()+"'";
              flag = provider.CheckAdminLogin(query);
            }
        
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return flag;
    }
    
    public boolean stafflogin() {
        boolean flag = false;
        try {
            
            if(provider.getConnection()) {
                System.out.println("inside validate login");
               String query = "select * from staffregistration where staffcode = '"+getUsername()+"' and password = '"+getPassword()+"'";
              flag = provider.CheckLogin(query);
              department = provider.getDepartment();
            }
        
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return flag;
    }
    
    public boolean studentlogin() {
        boolean flag = false;
        try {
            
            if(provider.getConnection()) {
                System.out.println("inside validate login");
               String query = "select * from studentregistration where regno = '"+getUsername()+"' and password = '"+getPassword()+"'";
              flag = provider.CheckLogin(query);
              department = provider.getDepartment();
            }
        
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return flag;
    }
    
    
}
