<%-- 
    Document   : ViewStaffDocument
    Created on : Mar 24, 2019, 8:20:22 PM
    Author     : Pavi
--%>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "DocumentManagement";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <title>Document Management</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/style.css"/>
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </head>
    <body style="background-color: white;">
        <div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#" class="dropdown-toggle" data-toggle="dropdown"><%= session.getAttribute("username") %><b class="caret"></b></a>
                    <ul class="dropdown-menu multi-level">
                        <li><a href="Logout.jsp">Logout</a></li></li>
            </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav">
                <li><a href="staff.jsp">Upload Staff Document</a></li>
                <li class="active"><a href="StaffOwnDocument.jsp">View My Document</a></li>
<!--                <li >
                    <a href="staffdepartment.jsp" >View Staff Records Department Wise</a>
                    
                </li>
                <li>
                    <a href="Allstaff.jsp" >View All Student Record</a>
                    
                </li>-->
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>
        
        
        
        <div class="container-fluid" style="margin-top: 80px;">
            
<table class="table table-bordered">
    <thead>
<tr>
<td>Author 1</td>
<td>Author 2</td>
<td>Author 3</td>
<td>Author 4</td>
<td>Publications</td>
<td>Research Projects and Consultancy</td>
<td>Ph.D/M.Phil/PG Guidance</td>
<td>Abroad visit/Awards/Fellowships/Invited Talks</td>
<td>Staff Code</td>
<td>Options</td>

</tr>
</thead>
<tbody>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from staffdocument WHERE staffcode = '"+session.getAttribute("username") +"'";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<tr>
    <td><a href="DownloadStaffFile?id=<%=resultSet.getInt("id")%>"><%=resultSet.getString("author1") %></a></td>
<td><%=resultSet.getString("author2") %></td>
<td><%=resultSet.getString("author3") %></td>
<td><%=resultSet.getString("author4") %></td>
<td><%=resultSet.getInt("publications_in_journals")+resultSet.getInt("number_of_citations")+resultSet.getInt("total_impact_factor")+resultSet.getInt("books")+resultSet.getInt("paper_presentations")%></td>
<td><%=resultSet.getInt("projects")+resultSet.getInt("consultancy_services_offered")+resultSet.getInt("funding")+resultSet.getInt("patents")%></td>
<td><%=resultSet.getInt("guidance")%></td>
<td><%=resultSet.getInt("visit_abroad")+resultSet.getInt("awards_fellowships")+resultSet.getInt("best_presentations")+resultSet.getInt("invited_talks")%></td>
<td><%=resultSet.getString("staffcode")%></td>
<td><a href="moreStaff.jsp?staffid=<%=resultSet.getInt("id") %>">View More</a></td>
</tr>

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</tbody>
</table>
</div>     
    </body>
</html>