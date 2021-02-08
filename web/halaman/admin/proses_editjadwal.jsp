<%-- 
    Document   : prosesedit
    Created on : Dec 22, 2020, 3:29:04 PM
    Author     : Raynold Panji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="function.admin.jadwal"%>
        <jsp:useBean id="u" class="function.admin.fjadwal"></jsp:useBean>
        <jsp:setProperty property="*" name="u"/>
        <%
            int i=jadwal.update(u); 
            
            String redirect = request.getContextPath() + "/index.jsp?folder=halaman/"+session.getAttribute("level")+"&file=jadwal.jsp";
            response.sendRedirect(redirect);
        %>
    </body>
</html>
