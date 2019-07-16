/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MyPackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

/**
 *
 * @author Pavi
 */
public class RegisterStudent extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
            JSONObject requestObject = common.createObjectFromReq(request);
            System.out.println(requestObject);
            if(common.checkRegno(requestObject.getString("regno"))) {
                int row = common.RegisterStudent(requestObject);
                if (row > 0) {
                    out.println("Register Successfully !!!");
                    RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
                    rs.include(request, response);
                }else {
                    out.println("Couldn't Register !!!");
                    RequestDispatcher rs = request.getRequestDispatcher("signup.jsp");
                    rs.include(request, response);
                } 
            
            } else {
                out.println("The Register No Already Exsist !!!!");
                RequestDispatcher rs = request.getRequestDispatcher("signup.jsp");
                rs.include(request, response);
            }
             
            
        } catch (Exception e) {

            e.printStackTrace();
        }

    }
    
    
    

}
