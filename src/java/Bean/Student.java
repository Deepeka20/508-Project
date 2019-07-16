/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import javax.persistence.*;

/**
 *
 * @author Vijay
 */
@Entity
@Table(name="studentregistration")
public class Student {
    
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private long id;
    
    @Column(name="regno")
    private String regno;
    
    @Column(name="name")
    private String name;
           
    @Column(name="password")
    private String password;
    
    @Column(name="gender")
    private String gender;
    
    @Column(name="dob")
    private String dob;
    
    @Column(name="department")
    private String department;
            
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRegno() {
        return regno;
    }

    public void setRegno(String regno) {
        this.regno = regno;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    
    
    
    
}
