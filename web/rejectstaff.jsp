<%-- 
    Document   : approvestudent
    Created on : Apr 14, 2019, 7:44:33 PM
    Author     : Vijay
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<% 
int id = Integer.parseInt(request.getParameter("staffid"));
System.out.println("student id -- >"+id);
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "DocumentManagement";
String userid = "root";
String password = "";
try {
Class.forName(driver);
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="delete from staffdocument where id = "+id;
int result= statement.executeUpdate(sql);
connection.close();
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

%>
<jsp:forward page="ViewStaffDocument.jsp"/>