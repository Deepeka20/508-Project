package MyPackage;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.RequestDispatcher;

@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)

public class UploadFileController extends HttpServlet 
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        System.out.print("working");
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
        
                InputStream inputStream = null;

                Random rand = new Random();
                int  n = rand.nextInt(9999) + 1;
                String idTemp=(String.valueOf(n));

                
                String title=(request.getParameter("name"));
                Part filePart = request.getPart("file_uploaded");
                
                if (filePart != null) 
                {
                    System.out.println(filePart.getName());
                    System.out.println(filePart.getSize());
                    System.out.println(filePart.getContentType());

                    inputStream = filePart.getInputStream();
                }
        
                try 
                {
                    Privider dbconn=new Privider();
                    Connection conn= dbconn.Connection();
                    
                    String sql = "INSERT INTO researchdocument (id, name, attach) values (?, ?, ?)";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, null);
                    statement.setString(2, title);
             
                    if (inputStream != null) 
                    {
                        statement.setBinaryStream(3, inputStream, (int) filePart.getSize());
                    }
                    System.out.println(inputStream);
                    int row = statement.executeUpdate();
                    if (row > 0) 
                    {
                        out.println("File uploaded!!!");
                        
                        conn.close();
                        
                        RequestDispatcher rs = request.getRequestDispatcher("user.jsp");
                        rs.include(request, response);
                    }
                    else
                    {
                        out.println("Couldn't upload your file!!!");
                        
                        conn.close();
                        
                        RequestDispatcher rs = request.getRequestDispatcher("user.jsp");
                        rs.include(request, response);
                    }    

                }catch(Exception e){e.printStackTrace();}     
    }   
}