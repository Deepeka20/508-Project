<jsp:useBean id="loginbean" class="MyPackage.login" scope="request"/>
<jsp:setProperty name="loginbean" property="*"/>
<jsp:useBean id="uploadbean" class="MyPackage.fileupload" scope="request"/>
<jsp:setProperty name="uploadbean" property="*"/>
<%! 
    String option = "";
%>


<%
    try{
        
        option = request.getParameter("option");
          
        if(option.equals("login")) {
            System.out.println("working");
            if(loginbean.ValidateLogin()) {
                session.setAttribute("username", loginbean.getUsername());
                %>
                <jsp:forward page="user.jsp"/>
                <%
            }else if(loginbean.stafflogin()) {
                session.setAttribute("username", loginbean.getUsername());
                session.setAttribute("department", loginbean.getDepartment());
                System.out.println(session.getAttribute("department"));
                %>
                <jsp:forward page="staff.jsp"/>
                <%
            }else if(loginbean.studentlogin()) {
                session.setAttribute("username", loginbean.getUsername());
                session.setAttribute("department", loginbean.getDepartment());
                System.out.println(session.getAttribute("department"));
                %>
                <jsp:forward page="student.jsp"/>
                <%
            }else {
                   %>
                <jsp:forward page="index.jsp"/>
                <%
            }
        }
        if(option.equals("upload")) {
            System.out.println(request.getParameter("attach"));
            uploadbean.UploadFile();
        }
    }
    catch(Exception e){
        e.printStackTrace();
    }
%>
