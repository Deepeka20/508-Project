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
        <script src="js/d3.min.js" type="text/javascript"></script>
        <style>
            #chart {
                margin-top: 100px;
            }
            
        </style>
    </head>
    <body style=" background: white;">
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
                <li><a href="#" class="dropdown-toggle" data-toggle="dropdown">User <b class="caret"></b></a>
                    <ul class="dropdown-menu multi-level">
                        <li><a href="Logout.jsp">Logout</a></li></li>
            </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav">
                <li class="active"><a href="user.jsp">Dashboard</a></li>
                <li>
                    <a href="ViewStaffDocument.jsp" >View Staff Records</a>
                    
                </li>
                <li>
                    <a href="ViewStudentDocument.jsp" >View Student Record </a>
                    
                </li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>
        <div class="container-fluid">
        <div class="row" id="chart">
            <div class="col-md-6">
                <div class="panel panel-primary" style="border:none;">
                            <div class="panel-heading">
                                <h3 class="panel-title">Staff Pie Chart Department Wise</h3>

                            </div>
                </div>
                <div id="staffchart"></div>
                
            </div>
            <div class="col-md-6">
                <div class="panel panel-primary"  style="border:none;">
                            <div class="panel-heading">
                                <h3 class="panel-title">Student Pie Chart Department Wise</h3>

                            </div>
                </div>
                <div id="studentchart"></div>
                
            </div>
            
        </div>
            </div>
        
    </body>
    
    <script>
       
        $(document).ready(function() {
        
                $.get('staffdata', {
                        option : "staff"
                }, function(responseText) {
                    console.log(responseText);
                    var data = responseText;
                    
                    
                    var w = 500,
    h = 400,
    r = Math.min(w, h) / 2,
    labelr = r + 30, // radius for label anchor
    color = d3.scale.category20(),
    donut = d3.layout.pie(),
    arc = d3.svg.arc().innerRadius(r*.6).outerRadius(r);

var vis = d3.select("#staffchart")
  .append("svg:svg")
    .data([data])
    .attr("width", w + 150)
    .attr("height", h);
    
var arcs = vis.selectAll("g.arc")
    .data(donut.value(function(d) { return d.val }))
  .enter().append("svg:g")
    .attr("class", "arc")
    .attr("transform", "translate(" + (r + 30) + "," + r + ")");

arcs.append("svg:path")
    .attr("fill", function(d, i) { return color(i); })
    .attr("d", arc);

arcs.append("text")
    .attr("text-anchor", "middle")
    .attr("x", function(d) {
        
        var a = d.startAngle + (d.endAngle - d.startAngle)/2 - Math.PI/2;
        d.cx = Math.cos(a) * (r - 45);
        return d.x = Math.cos(a) * (r+30);
    })
    .attr("y", function(d) {
        var a = d.startAngle + (d.endAngle - d.startAngle)/2 - Math.PI/2;
        d.cy = Math.sin(a) * (r - 45);
        return d.y = Math.sin(a) * (r + 30);
    })
    .text(function(d) { return d.data.name+"-"+d.value.toFixed(2);  })
    .each(function(d) {
        var bbox = this.getBBox();
        d.sx = d.x - bbox.width/2 - 2;
        d.ox = d.x + bbox.width/2 + 2;
        d.sy = d.oy = d.y + 5;
    });
    

	arcs.append("path")
    .attr("class", "pointer")
    .style("fill", "none")
    .style("stroke", "black")
    
    .attr("d", function(d) {
     console.log(d);
        if(d.cx > d.ox) {
            return "M" + d.sx + "," + d.sy + "L" + d.ox + "," + d.oy + " " + d.cx + "," + d.cy;
        } else {
            return "M" + d.ox + "," + d.oy + "L" + d.sx + "," + d.sy + " " + d.cx + "," + d.cy;
        }
    });
                    
                        //$('#ajaxGetUserServletResponse').text(responseText);
                });
        
});
       
    // Feel free to change or delete any of the code you see in this editor!
//    var data = [
//    {name: "A", val: 11975},  
//    {name: "B", val: 5871}, 
//    {name: "C", val: 8916}
//    
//];

$(document).ready(function() {
        
                $.get('staffdata', {
                        option : "student"
                }, function(responseText) {
                    console.log(responseText);
                    var data = responseText;
                    
                    
                    var w = 500,
    h = 400,
    r = Math.min(w, h) / 2,
    labelr = r + 30, // radius for label anchor
    color = d3.scale.category20(),
    donut = d3.layout.pie(),
    arc = d3.svg.arc().innerRadius(r*.6).outerRadius(r);

var vis = d3.select("#studentchart")
  .append("svg:svg")
    .data([data])
    .attr("width", w + 150)
    .attr("height", h);
    
var arcs = vis.selectAll("g.arc")
    .data(donut.value(function(d) { return d.val }))
  .enter().append("svg:g")
    .attr("class", "arc")
    .attr("transform", "translate(" + (r + 30) + "," + r + ")");

arcs.append("svg:path")
    .attr("fill", function(d, i) { return color(i); })
    .attr("d", arc);

arcs.append("text")
    .attr("text-anchor", "middle")
    .attr("x", function(d) {
        
        var a = d.startAngle + (d.endAngle - d.startAngle)/2 - Math.PI/2;
        d.cx = Math.cos(a) * (r - 45);
        return d.x = Math.cos(a) * (r+30);
    })
    .attr("y", function(d) {
        var a = d.startAngle + (d.endAngle - d.startAngle)/2 - Math.PI/2;
        d.cy = Math.sin(a) * (r - 45);
        return d.y = Math.sin(a) * (r + 30);
    })
    .text(function(d) { return d.data.name+"-"+d.value.toFixed(2);  })
    .each(function(d) {
        var bbox = this.getBBox();
        d.sx = d.x - bbox.width/2 - 2;
        d.ox = d.x + bbox.width/2 + 2;
        d.sy = d.oy = d.y + 5;
    });
    

	arcs.append("path")
    .attr("class", "pointer")
    .style("fill", "none")
    .style("stroke", "black")
    
    .attr("d", function(d) {
     console.log(d);
        if(d.cx > d.ox) {
            return "M" + d.sx + "," + d.sy + "L" + d.ox + "," + d.oy + " " + d.cx + "," + d.cy;
        } else {
            return "M" + d.ox + "," + d.oy + "L" + d.sx + "," + d.sy + " " + d.cx + "," + d.cy;
        }
    });
                    
                        //$('#ajaxGetUserServletResponse').text(responseText);
                });
        
});

  </script>
</html>
