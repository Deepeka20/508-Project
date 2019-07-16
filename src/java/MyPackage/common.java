/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MyPackage;

import Bean.Student;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Enumeration;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.json.JSONObject;

/**
 *
 * @author Pavi
 */
public class common {
    
    
    
    public static JSONObject CreateReqObject(HttpServletRequest request) throws Exception {
        JSONObject resultObject = new JSONObject();
        try {
            Enumeration e = request.getParameterNames();
            while(e.hasMoreElements()) {
                String paramName = (String)e.nextElement();
                String value = request.getParameter(paramName);
                resultObject.put(paramName, value);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultObject;
    }
    
    
    public static JSONObject createObjectFromReq(HttpServletRequest request) throws Exception {
		JSONObject resultObject = new JSONObject();
		try {
			Enumeration paramNames = request.getParameterNames();
			while (paramNames.hasMoreElements()) {
                            
				String paramName = (String) paramNames.nextElement();
                                
                                if(paramName.equals("attach")) {
                                    
                                    Part filePart = request.getPart("attach");
                                    InputStream inputStream = filePart.getInputStream();
                                    resultObject.put(paramName, inputStream);
                                    
                                } else {
                                    String[] paramValues = request.getParameterValues(paramName);
				String resVal = paramValues[0];
				if(paramValues.length > 1) {
					for(int i = 1; i < paramValues.length; i++) {
						if(resVal != null && !"".equals(resVal)) {
							resVal = resVal+",";
						}
						resVal = resVal+paramValues[i];
					}
				}
                                resultObject.put(paramName, resVal);
                                }
				
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultObject;
	}

    
    
    public static int RegisterStudent(JSONObject requestValue) throws Exception {
        int row = 0;
        try {
            Privider dbconn=new Privider();
                    Connection conn= dbconn.Connection();
                    
                    String sql = "INSERT INTO studentregistration (id, name, regno, dob, department, gender, password) values (?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, null);
                    statement.setString(2, requestValue.getString("name"));
                    statement.setString(3, requestValue.getString("regno"));
                    statement.setString(4, requestValue.getString("dob"));
                    statement.setString(5, requestValue.getString("department"));
                    statement.setString(6, requestValue.getString("gender"));
                    statement.setString(7, requestValue.getString("password"));
                    row = statement.executeUpdate();
                   conn.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return row;
    }
    public static int RegisterStaff(JSONObject requestValue) throws Exception {
        int row = 0;
        try {
            Privider dbconn=new Privider();
                    Connection conn= dbconn.Connection();
                    
                    String sql = "INSERT INTO staffregistration (id, name, staffcode, department, gender, designation, password) values (?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, null);
                    statement.setString(2, requestValue.getString("name"));
                    statement.setString(3, requestValue.getString("staffcode"));
                    statement.setString(4, requestValue.getString("department"));
                    statement.setString(5, requestValue.getString("gender"));
                    statement.setString(6, requestValue.getString("designation"));
                    statement.setString(7, requestValue.getString("password"));
                    row = statement.executeUpdate();
                    conn.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return row;
    }
    
    public static boolean checkRegno(String regno){
          int row = 0;
        try {
            Privider dbconn = new Privider();
            Connection conn= dbconn.Connection();
            String queryCheck = "SELECT count(*) from studentregistration WHERE regno = ?";
            PreparedStatement ps = conn.prepareStatement(queryCheck);
            ps.setString(1, regno);
            ResultSet resultSet = ps.executeQuery();
            if(resultSet.next()) {
                row = resultSet.getInt(1);
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return row == 0 ? true : false;
    }
    public static boolean checkStaffCode(String regno){
          int row = 0;
        try {
            Privider dbconn = new Privider();
            Connection conn= dbconn.Connection();
            String queryCheck = "SELECT count(*) from staffregistration WHERE staffcode = ?";
            PreparedStatement ps = conn.prepareStatement(queryCheck);
            ps.setString(1, regno);
            ResultSet resultSet = ps.executeQuery();
            if(resultSet.next()) {
                row = resultSet.getInt(1);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return row == 0 ? true : false;
    }
    
    public static int uploadStaffDocument(JSONObject requestValue, InputStream inputStream, Part filePart) throws  Exception {
        int row = 0;
        try {
            
            Privider dbconn=new Privider();
                    Connection conn= dbconn.Connection();
                    
                    String sql = "INSERT INTO staffdocument (id, author1, author2, author3, author4, publications_in_journals, number_of_citations, total_impact_factor, books, paper_presentations, projects, consultancy_services_offered, funding, patents, guidance, visit_abroad, awards_fellowships, best_presentations, invited_talks, attach, staffcode,department,title,link,approve) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?)";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, null);
                    statement.setString(2, requestValue.getString("author1"));
                    statement.setString(3, requestValue.getString("author2"));
                    statement.setString(4, requestValue.getString("author3"));
                    statement.setString(5, requestValue.getString("author4"));
                    statement.setString(6, requestValue.getString("publications_in_journals"));
                    statement.setString(7, requestValue.getString("number_of_citations"));
                    statement.setString(8, requestValue.getString("total_impact_factor"));
                    statement.setString(9, requestValue.getString("books"));
                    statement.setString(10, requestValue.getString("paper_presentations"));
                    statement.setString(11, requestValue.getString("projects"));
                    statement.setString(12, requestValue.getString("consultancy_services_offered"));
                    statement.setString(13, requestValue.getString("funding"));
                    statement.setString(14, requestValue.getString("patents"));
                    statement.setString(15, requestValue.getString("guidance"));
                    statement.setString(16, requestValue.getString("visit_abroad"));
                    statement.setString(17, requestValue.getString("awards_fellowships"));
                    statement.setString(18, requestValue.getString("best_presentations"));
                    statement.setString(19, requestValue.getString("invited_talks"));
                    if (inputStream != null) 
                    {
                        statement.setBinaryStream(20, inputStream, (int) filePart.getSize());
                    }
                    statement.setString(21, requestValue.getString("staffcode"));
                    statement.setString(22, requestValue.getString("department"));
                    statement.setString(23, requestValue.getString("title"));
                    statement.setString(24, requestValue.getString("link"));
                    statement.setInt(25, 0);
                    row = statement.executeUpdate();
                    conn.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return row;
    }
    
    public static int uploadStudentDocument(JSONObject requestValue, InputStream inputStream, Part filePart) throws  Exception {
        int row = 0;
        try {
            
            Privider dbconn=new Privider();
                    Connection conn= dbconn.Connection();
                    
                    String sql = "INSERT INTO studentdocument (id, author1, author2, author3, author4, publications_in_journals, number_of_citations, total_impact_factor, paper_presentations, patents, visit_to_abroad, awards_fellowships, best_presentations, attach, regno,department,title,link,approve) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?)";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, null);
                    statement.setString(2, requestValue.getString("author1"));
                    statement.setString(3, requestValue.getString("author2"));
                    statement.setString(4, requestValue.getString("author3"));
                    statement.setString(5, requestValue.getString("author4"));
                    statement.setString(6, requestValue.getString("publications_in_journals"));
                    statement.setString(7, requestValue.getString("number_of_citations"));
                    statement.setString(8, requestValue.getString("total_impact_factor"));
                    statement.setString(9, requestValue.getString("paper_presentations"));
                    statement.setString(10, requestValue.getString("patents"));
                    statement.setString(11, requestValue.getString("visit_to_abroad"));
                    statement.setString(12, requestValue.getString("awards_fellowships"));
                    statement.setString(13, requestValue.getString("best_presentations"));
                    
                    if (inputStream != null) 
                    {
                        statement.setBinaryStream(14, inputStream, (int) filePart.getSize());
                    }
                    statement.setString(15, requestValue.getString("regno"));
                    statement.setString(16, requestValue.getString("department"));
                    statement.setString(17, requestValue.getString("title"));
                    statement.setString(18, requestValue.getString("link"));
                    statement.setInt(19, 0);
                    row = statement.executeUpdate();
                    conn.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return row;
    }
    
}
