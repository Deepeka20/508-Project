/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MyPackage;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import org.json.JSONObject;

/**
 *
 * @author Pavi
 */
@MultipartConfig(maxFileSize = 16177215)
public class uploadStudentDocement extends HttpServlet {
    
    
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
                
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                      
                HttpSession session=request.getSession(false);
                try 
                {
                    Part filePart = request.getPart("attach");
                    InputStream ip = filePart.getInputStream();
                    System.out.println(ip);
                    JSONObject requestObject = common.createObjectFromReq(request);
                    requestObject.put("regno", session.getAttribute("username").toString());
                    requestObject.put("department", session.getAttribute("department").toString());
                    int row = common.uploadStudentDocument(requestObject, ip, filePart);
                if (row > 0) {
                    out.println("Upload Successfully !!!");
                    RequestDispatcher rs = request.getRequestDispatcher("student.jsp");
                    rs.include(request, response);
                }else {
                    out.println("Couldn't Upload !!!");
                    RequestDispatcher rs = request.getRequestDispatcher("student.jsp");
                    rs.include(request, response);
                }
                    
                    System.out.println(requestObject);   

                }catch(Exception e){e.printStackTrace();}     
    }  
    
}
