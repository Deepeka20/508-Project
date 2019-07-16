/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MyPackage;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Pavi
 */
@WebServlet("/DownloadStudentFile")
public class DownloadStudentFile extends HttpServlet{
    
     private static final int BUFFER_SIZE = 4096;  
    private  String dbdriver = "com.mysql.jdbc.Driver";
    private String dburl = "jdbc:mysql://localhost:3306/DocumentManagement";
    private String dbusername = "root";
    private String dbpassword = "";
    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int uploadId = Integer.parseInt(request.getParameter("id"));
         
        Connection conn = null;
        
     ResultSet rst=null;
     Statement stmt=null;
        try {
            Class.forName(dbdriver);
            conn=DriverManager.getConnection(dburl,dbusername,dbpassword);
            stmt=(Statement) conn.createStatement();
            String sql = "SELECT * FROM studentdocument WHERE id =?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, uploadId);
            rst = statement.executeQuery();
            if(rst.next()) {
                Blob blob = rst.getBlob("attach");
                String title = rst.getString("title")+".pdf";
                InputStream inputStream = blob.getBinaryStream();
                int fileLength = inputStream.available();
                System.out.println("fileLength = " + fileLength);
                ServletContext context = getServletContext();
                String mimeType = "application/octet-stream";
                 response.setContentType(mimeType);
                response.setContentLength(fileLength);
                String headerKey = "Content-Disposition";
                String headerValue = String.format("attachment; filename=\"%s\"", title);
                response.setHeader(headerKey, headerValue);
                 // writes the file to the client
                OutputStream outStream = response.getOutputStream();
                byte[] buffer = new byte[BUFFER_SIZE];
                int bytesRead = -1;
                 
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outStream.write(buffer, 0, bytesRead);
                }
                 
                inputStream.close();
                outStream.close();             
 
            } else {
                response.getWriter().print("File not found for the id: " + uploadId);
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
