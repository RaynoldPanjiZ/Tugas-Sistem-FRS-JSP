<%-- 
    Document   : logout
    Created on : Dec 14, 2020, 9:49:29 PM
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
        <% 
            session.invalidate();
        %>
            <jsp:forward page="index.jsp"/>
    </body>
</html>
