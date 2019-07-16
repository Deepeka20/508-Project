<%-- 
    Document   : staff
    Created on : Mar 19, 2019, 11:15:56 PM
    Author     : Pavi
--%>

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
        
        <style>
            .accordion {
  background-color: #ccc;
  color: #444;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
  transition: 0.4s;
}

.active, .accordion:hover {
  background-color: #ccc; 
}

.panel1 {
  padding: 0 18px;
  display: none;
  background-color: white;
  overflow: hidden;
}
        </style>
        
    </head>
    <body style="background: white;">
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
                <li><a href="#" class="dropdown-toggle" data-toggle="dropdown"><%= session.getAttribute("username") %> <b class="caret"></b></a>
                    <ul class="dropdown-menu multi-level">
                        <li><a href="Logout.jsp">Logout</a></li></li>
            </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav">
                <li class="active"><a href="student.jsp">Upload Document</a></li>
                <li><a href="StudentDocument.jsp">View My Document</a></li>
<!--                <li>
                    <a href="studentdepartment.jsp" >View Student Document</a>
                    
                </li>
                <li><a href="StaffDocument.jsp" >View Staff Document</a></li>-->
                
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>
        <form action="uploadStudentDocement" method="post" enctype="multipart/form-data">
            <div class="container" style="margin-top: 80px;">
            <div class="row">
                <div class="form-group col-md-12">
                    <label for="formGroupExampleInput">Title</label>
                    <input type="text" name="title" class="form-control" id="formGroupExampleInput" placeholder="Title">
                </div>
             </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="formGroupExampleInput">Author 1</label>
                    <input type="text" name="author1" class="form-control" id="formGroupExampleInput" placeholder="Author 1">
                </div>
                <div class="form-group col-md-6">
                    <label for="formGroupExampleInput">Author 2</label>
                    <input type="text" name="author2" class="form-control" id="formGroupExampleInput" placeholder="Author 2">
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="formGroupExampleInput">Author 3</label>
                    <input type="text" name="author3" class="form-control" id="formGroupExampleInput" placeholder="Author 3">
                </div>
                <div class="form-group col-md-6">
                    <label for="formGroupExampleInput">Author 4</label>
                    <input type="text" name="author4" class="form-control" id="formGroupExampleInput" placeholder="Author 4">
                </div>
            </div>
            <div class="frm" style="padding: 0px 0px 15px">
            <div class="accordion">Publications</div>
            </div>
                <div class="panel1">
                       <div class="row">
                <div class="form-group col-md-6">
                    <label for="formGroupExampleInput">Publications in Journals/Proccedings</label>
                    <select class="form-control" name="publications_in_journals">
                        <option value="0">---Select---</option>
                        <option value="5">Journals indexed in Scopus/Web of Science</option>
                        <option value="3">Publications in Other UGC referred journals</option>
                        <option value="2">Publications in Proceedings (International Conferences/Seminars)</option>
                        <option value="1">Publications in Proceedings (National Conferences/Seminars)</option>
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label for="formGroupExampleInput">Number of citations (To be verified with Google scholar)</label>
                    <select class="form-control" name="number_of_citations">
                        <option value="0">---Select---</option>
                        <option value="30">Citations more than 10</option>
                        <option value="20">Citations between 10 and 5</option>
                        <option value="10">Less than 5</option>
                        
                    </select>
                </div>
            </div>
                    <div class="row">
                <div class="form-group col-md-6">
                    <label for="formGroupExampleInput">Total Impact factor</label>
                    <select class="form-control" name="total_impact_factor">
                        <option value="0">---Select---</option>
                        <option value="30">More than 10 in Scopus indexed journals</option>
                        <option value="20">Between 10 and 5 in Scopus indexed journals</option>
                        <option value="10">Less than 5 in Scopus indexed journals</option>
                        
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label for="formGroupExampleInput">Paper Presentations in</label>
                    <select class="form-control" name="paper_presentations">
                        <option value="0">---Select---</option>
                        <option value="5">International Conferences/Seminars</option>
                        <option value="3">National Conferences/Seminars</option>
                        
                        
                    </select>
                </div>
            </div>
                    <div class="row">
                <div class="form-group col-md-6">
                    <label for="formGroupExampleInput">Patents</label>
                    <select class="form-control" name="patents">
                        <option value="0">---Select---</option>
                        <option value="20">Patent Registered (International)</option>
                        <option value="10">Patent (National)</option>
                        
                        
                    </select>
                </div>
                
            </div>
                </div>
              <div class="frm" style="padding: 0px 0px 15px">
            <div class="accordion">Abroad Visit/Awards/Fellowships</div>
              </div>
                <div class="panel1">
                            <div class="row">
                <div class="form-group col-md-6">
                    <label for="formGroupExampleInput">Visit to Abroad</label>
                    <select class="form-control" name="visit_to_abroad">
                        <option value="0">---Select---</option>
                        <option value="5">Paper presentation</option>
                        
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label for="formGroupExampleInput">Awards/Fellowships</label>
                    <select class="form-control" name="awards_fellowships">
                        <option value="0">---Select---</option>
                        <option value="10">International Agencies</option>
                        <option value="8">Government agencies</option>
                        <option value="5">National bodies</option>
                        
                    </select>
                </div>
            </div>
                    <div class="row">
                <div class="form-group col-md-6">
                    <label for="formGroupExampleInput">Best Presentations Award</label>
                    <select class="form-control" name="best_presentations">
                        <option value="0">---Select---</option>
                        <option value="5">International Conferences/Seminars</option>
                        <option value="3">National Conferences/Seminars</option>
                        
                    </select>
                </div>
                
            </div>
                </div>

           
                
          <div class="frm" style="padding: 0px 0px 15px">
           <div class="accordion">File Upload</div>
            </div>
            <div class="panel1">
                <div class="form-group col-md-6">
                    <label for="formGroupExampleInput">File Upload</label>
                    <input type="file" name="attach">
                </div>
                <div class="form-group col-md-6">
                    <label for="formGroupExampleInput">Link</label>
                    <input type="text" name="link" class="form-control" placeholder="Link">
                </div>
            </div>
            <div class="row" style="padding: 10px 20% 5% 20%;"> <button type="submit" class="btn btn-success btn-block" name="submitstaff" value="Submit Document">Submit Document</button></div>
                
            
        </div>
            </form>
    </body>
</html>
<script>
var acc = document.getElementsByClassName("frm");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.display === "block") {
      panel.style.display = "none";
    } else {
      panel.style.display = "block";
    }
  });
}
</script>