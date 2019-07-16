<%-- 
    Document   : viewmoreStudent
    Created on : Apr 14, 2019, 2:52:44 PM
    Author     : Pavi
--%>
<%  
int id  = Integer.parseInt(request.getParameter("staffid"));

%>

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
        
        <title>Document Management</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/style.css"/>
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </head>
    <body style="background-color: white;">
        
        
        <%
    try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from staffdocument where id = "+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
    int total = resultSet.getInt("publications_in_journals")+resultSet.getInt("number_of_citations")+resultSet.getInt("total_impact_factor")+resultSet.getInt("books")+resultSet.getInt("paper_presentations")+resultSet.getInt("projects")+resultSet.getInt("consultancy_services_offered")+resultSet.getInt("funding")+resultSet.getInt("patents")+resultSet.getInt("guidance")+resultSet.getInt("visit_abroad")+resultSet.getInt("awards_fellowships")+resultSet.getInt("best_presentations")+resultSet.getInt("invited_talks");
    int percent = total/10;
    int pulication = resultSet.getInt("publications_in_journals")+resultSet.getInt("number_of_citations")+resultSet.getInt("total_impact_factor")+resultSet.getInt("books")+resultSet.getInt("paper_presentations");
    int pub_percent = pulication/10;
    
int research = resultSet.getInt("projects")+resultSet.getInt("consultancy_services_offered")+resultSet.getInt("funding")+resultSet.getInt("patents");
int research_percent = research/10;
int gindance = resultSet.getInt("guidance");
int gui_percent = gindance/10;
int abord = resultSet.getInt("visit_abroad")+resultSet.getInt("awards_fellowships")+resultSet.getInt("best_presentations")+resultSet.getInt("invited_talks");
int aboard_percent = abord/10;
%>

        
        <div class="container-fluid" style="margin-top: 80px;">
            <div class="row">
               <div class="col-md-6">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Author Details</h3>
						
					</div>
					
					<table class="table table-hover" id="dev-table">
						<thead>
							<tr>
                                                            <th><%=resultSet.getString("author1") %></th>
								<th><%=resultSet.getString("author2") %></th>
								<th><%=resultSet.getString("author3") %></th>
								<th><%=resultSet.getString("author4") %></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><%=total %></td>
								<td><%=(percent*5) %></td>
								<td><%=(percent*3) %></td>
								<td><%=(percent*2) %></td>
							</tr>
							
							
						</tbody>
					</table>
				</div>
			</div>
                                                        <div class="col-md-6">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Marks Based On Section</h3>
						
					</div>
					
					<table class="table table-hover" id="dev-table">
						<thead>
							<tr>
                                                            <th>Publications</th>
<th>Research Projects and Consultancy</th>
<th>Ph.D/M.Phil/PG Guidance</th>
<th>Abroad visit/Awards/Fellowships/Invited Talks</th>
                                                            
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><%=resultSet.getInt("publications_in_journals")+resultSet.getInt("number_of_citations")+resultSet.getInt("total_impact_factor")+resultSet.getInt("books")+resultSet.getInt("paper_presentations")%></td>
<td><%=resultSet.getInt("projects")+resultSet.getInt("consultancy_services_offered")+resultSet.getInt("funding")+resultSet.getInt("patents")%></td>
<td><%=resultSet.getInt("guidance")%></td>
<td><%=resultSet.getInt("visit_abroad")+resultSet.getInt("awards_fellowships")+resultSet.getInt("best_presentations")+resultSet.getInt("invited_talks")%></td>
							</tr>
							
							
						</tbody>
					</table>
				</div>
			</div>
                                                        <div class="row">
                    <div class="col-md-12" style="margin-top: 30px;">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">Marks Based On Section and Author Wise</h3>

                            </div>

                            <table class="table table-hover" id="dev-table">
                                <thead>
                                    <tr>
                                        <th>Author Name</th>
                                        <th>Publications</th>
                                        <th>Research Projects and Consultancy</th>
                                        <th>Ph.D/M.Phil/PG Guidance</th>
                                        <th>Abroad visit/Awards/Fellowships/Invited Talks</th>


                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th><%=resultSet.getString("author1")%></th>
                                        <td><%=pulication%></td>
                                        <td><%=research%></td>
                                        <td><%=gindance%></td>
                                        <td><%=abord%></td>

                                    </tr>
                                    <tr>
                                        <th><%=resultSet.getString("author2")%></th>
                                        <td><%=(pub_percent * 5)%></td>
                                        <td><%=(research_percent * 5)%></td>
                                        <td><%=(gui_percent * 5)%></td>
                                        <td><%=(aboard_percent * 5)%></td>

                                    </tr>
                                    <tr>
                                        <th><%=resultSet.getString("author3")%></th>
                                        <td><%=(pub_percent * 3)%></td>
                                        <td><%=(research_percent * 3)%></td>
                                        <td><%=(gui_percent * 3)%></td>
                                        <td><%=(aboard_percent * 3)%></td>

                                    </tr>
                                    <tr>
                                        <th><%=resultSet.getString("author4")%></th>
                                        <td><%=(pub_percent * 2)%></td>
                                        <td><%=(research_percent * 2)%></td>
                                        <td><%=(gui_percent * 2)%></td>
                                        <td><%=(aboard_percent * 2)%></td>

                                    </tr>


                                </tbody>
                            </table>
                        </div></div>
                </div>
                                                        <div class="row">
                                                            <div class="col-md-6">
<!--                                                                <a href="approvestaff.jsp?staffid=<%=id%>" class="btn btn-success btn-block btn-sm">Approve</a>-->
                                                            </div>
                                                            <div class="col-md-6">
                                                                <a href="DownloadStaffFile?id=<%=resultSet.getInt("id")%>" class="btn btn-success btn-block btn-sm">Download Document</a>
                                                            </div>
                                                        </div>
        </div>
</div>     
<%
}
}catch(Exception e) {
 e.printStackTrace();
}
%>
    </body>
</html>

