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
                <li><a href="#" class="dropdown-toggle" data-toggle="dropdown"><%= session.getAttribute("username") %><b class="caret"></b></a>
                    <ul class="dropdown-menu multi-level">
                        <li><a href="Logout.jsp">Logout</a></li></li>
            </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav">
                <li class="active"><a href="staff.jsp">Upload Staff Document</a></li>
                <li><a href="StaffOwnDocument.jsp">View My Document</a></li>
<!--                <li>
                    <a href="staffdepartment.jsp" >View Staff Records Department Wise</a>
                    
                </li>
                <li>
                    <a href="Allstaff.jsp" >View All Student Record</a>
                    
                </li>-->
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>
        <form action="uploadStaffDocement" method="post" enctype="multipart/form-data">
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
                        <option value="8">Journals indexed in Scopus/Web of Science</option>
                        <option value="4">Publications in Other UGC referred journals</option>
                        <option value="2">Publications in Proceedings (International Conferences/Seminars)</option>
                        <option value="1">Publications in Proceedings (National Conferences/Seminars)</option>
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label for="formGroupExampleInput">Number of citations during 2018</label>
                    <select class="form-control"name="number_of_citations">
                        <option value="0">---Select---</option>
                        <option value="30">Citations more than 100</option>
                        <option value="25">Citations between 75 and 100</option>
                        <option value="20">Citations between 50 and 75</option>
                        <option value="15">Citations between 25 and 50</option>
                        <option value="10">Citations less than 25</option>
                    </select>
                </div>
            </div>
                    <div class="row">
                <div class="form-group col-md-6">
                    <label for="formGroupExampleInput">Total Impact factor</label>
                    <select class="form-control"name="total_impact_factor">
                        <option value="0">---Select---</option>
                        <option value="30">More than 25 in Scopus indexed journals</option>
                        <option value="20">Between 15 and 25 in Scopus indexed journals</option>
                        <option value="10">Less than 15 in Scopus indexed journals</option>
                        
                    </select>
                </div>
                <div  class="form-group col-md-6">
                    <label for="formGroupExampleInput">Books</label>
                    <select class="form-control"name="books">
                        <option value="0">---Select---</option>
                        <option value="10">Books Authored and Published by International Publishers</option>
                        <option value="8">Books Authored and Published by National Publishers</option>
                        <option value="5">Publication of Chapter in Edited Books</option>
                        
                    </select>
                </div>
            </div>
                    <div class="row">
                <div class="form-group col-md-6">
                    <label for="formGroupExampleInput">Paper Presentations in</label>
                    <select class="form-control" name="paper_presentations">
                        <option value="0">---Select---</option>
                        <option value="5">International Conferences/Seminars</option>
                        <option value="3">National Conferences/Seminars</option>
                        
                        
                    </select>
                </div>
                
            </div>
                </div>
            <div class="frm" style="padding: 0px 0px 15px">
            <div class="accordion">Research Projects and Consultancy</div>
            </div>
                <div class="panel1">
                            <div class="row">
                <div class="form-group col-md-6">
                    <label for="formGroupExampleInput">Major/Minor projects</label>
                    <select class="form-control" name="projects">
                        <option value="0">---Select---</option>
                        <option value="30">More than 20 lacs for Science & more than 10 lacs for arts</option>
                        <option value="20">Below 20 lacs for Science & below 10 lacs for Arts</option>
                        <option value="10">Minor projects</option>
                        <option value="10">Don Bosco Research grant</option>
                        <option value="5">Sacred Heart fellowship</option>
                        <option value="5">TNSCST project (2017-18)</option>
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label for="formGroupExampleInput">Consultancy services offered</label>
                    <select class="form-control"name="consultancy_services_offered">
                        <option value="0">---Select---</option>
                        <option value="20">More than Rs.50,000/-</option>
                        <option value="15">Between Rs. 25,000 and Rs.50,000/-</option>
                        <option value="10">Less than Rs. 25,000</option>
                        
                    </select>
                </div>
            </div>
                    <div class="row">
                <div class="form-group col-md-6">
                    <label for="formGroupExampleInput">Funding for Conferences/Seminars</label>
                    <select class="form-control"name="funding">
                        <option value="0">---Select---</option>
                        <option value="10">Government Funding agencies</option>
                        <option value="5">Private agencies (Only if amount received is more than Rs. 25,000/-)</option>
                        
                    </select>
                </div>
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
           <div class="accordion">Ph.D/M.Phil/PG Guidance</div>
           </div>
                <div class="panel1">
                    <div class="row">
                <div class="form-group col-md-6">
                    <label for="formGroupExampleInput">Guidance</label>
                    <select class="form-control" name="guidance">
                        <option value="0">---Select---</option>
                        <option value="30">Ph.Ds Awarded</option>
                        <option value="15">Ph.Ds Thesis submitted 15</option>
                        <option value="8">M.Phil Dissertation </option>
                        <option value="3">PG Dissertation </option>
                    </select>
                </div>
                
            </div>
                </div>
            <div class="frm" style="padding: 0px 0px 15px">
           <div class="accordion">Abroad visit/Awards/Fellowships/Invited Talks</div>
            </div>
                <div class="panel1">
                    <div class="row">
                <div class="form-group col-md-6">
                    <label for="formGroupExampleInput">Visit to Abroad</label>
                    <select class="form-control" name="visit_abroad">
                        <option value="0">---Select---</option>
                        <option value="10">As resource person/Visiting Scientist</option>
                        <option value="5">Paper presentation</option>
                        
                    </select>
                </div>
                        <div class="form-group col-md-6">
                    <label for="formGroupExampleInput">Awards/Fellowships</label>
                    <select class="form-control" name="awards_fellowships">
                        <option value="0">---Select---</option>
                        <option value="20">International Agencies</option>
                        <option value="10">Government agencies</option>
                        <option value="8">National bodies</option>
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
                        <div class="form-group col-md-6">
                    <label for="formGroupExampleInput">Invited talks</label>
                    <select class="form-control" name="invited_talks">
                        <option value="0">---Select---</option>
                        <option value="20">International (Abroad)</option>
                        <option value="10">International (Within Country)</option>
                        <option value="7">National</option>
                        <option value="5">Others</option>
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