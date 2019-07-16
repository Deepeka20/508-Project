<%
    session.removeAttribute("username");
    session.removeAttribute("department");
    
%>
<jsp:forward page="index.jsp"/>