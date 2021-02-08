<%-- 
    Document   : proseslogin
    Created on : Nov 26, 2020, 9:22:39 PM
    Author     : Raynold Panji
--%>


<%@page import="function.login" %>
<jsp:useBean id="obj" class="function.flogin"/>
<jsp:setProperty property="*" name="obj"/>

<%  boolean status=login.validate(obj);
    if(status){
        out.println("You r successfully logged in");
        session.setAttribute("session", "TRUE");
        if(obj.getNim()!=null){
            session.setAttribute("user_id",obj.getNim());
        } else if(obj.getNip()!=null){
            session.setAttribute("user_id",obj.getNip());
        } else if(obj.getIdadmin()!=null){
            session.setAttribute("user_id",obj.getIdadmin());
        }
        session.setAttribute("level",obj.getLevel());
%>
        <jsp:forward page="index.jsp"/>
<%  } else {
        out.print("<center><b>Sorry, email or password error</b></center>");
%>
        <jsp:include page="login.jsp"></jsp:include>
<%  }   %>
