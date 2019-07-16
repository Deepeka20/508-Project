/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MyPackage;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Pavi
 */
@WebServlet("/staffdata")
public class staffdata extends HttpServlet{
    
    
    private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                
                response.setContentType("application/json;charset=UTF-8");

                ServletOutputStream out = response.getOutputStream();

            
                String option = request.getParameter("option");
                String student = "SELECT COUNT(*) as count, department FROM studentdocument GROUP BY department";
                String staff = "SELECT COUNT(*) as count, department FROM staffdocument GROUP BY department";
		Privider provider = new Privider();
                if(provider.getConnection()) {
                    String query = option.equals("staff") ? staff : student;
                    String chartData = "";
                    try {
                        chartData = provider.fetchChartData(query).toString();
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                    System.out.println("chart Data --->"+chartData);
                    
                   out.print(chartData);
                }
	}
    
}
