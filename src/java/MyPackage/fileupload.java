/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MyPackage;

import java.io.File;
import java.io.FileInputStream;

/**
 *
 * @author Pavi
 */
public class fileupload {
    
    
    public String attach;
    public String name;
    
    Privider provider = new Privider();

    public String getAttach() {
        return attach;
    }

    public void setAttach(String attach) {
        this.attach = attach;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public boolean UploadFile() {
    boolean flag = false;
        try {
            if(provider.getConnection()) {
                System.out.println("working"+getAttach());
                File file = new File(getAttach());
                FileInputStream fis = new FileInputStream(file);
                String query = "insert into researchdocument values('', '"+getName()+"', '"+fis+"')";
                provider.insertRecord(query);
            }
        } catch (Exception e) {
        }
     return flag;
    }
    
}
