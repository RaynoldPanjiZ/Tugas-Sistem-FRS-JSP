<%-- 
    Document   : admin
    Created on : Dec 14, 2020, 9:48:35 PM
    Author     : Raynold Panji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" 
              href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
        <script type="text/javascript" charset="UTF-8" 
        src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.2.min.js"></script>
        <script type="text/javascript" charset="UTF-8" 
        src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
        <script type="text/javascript" language="javascript">
            $(document).ready(function() {
                $('#datatable').DataTable();
            });
        </script>
    </head>
    <body>
        <%@page import="function.*,java.util.*"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <h1>HALAMAN ADMIN</h1>
        <%
            List<fuser> list = user.getAllRecords(); request.setAttribute("list", list);
        %>
        <table border='1' width="80%" id="datatable" class="display">
            <thead>
                <tr>
                    <th>Nama</th><th>Username</th><th>Password</th><th>Edit</th><th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="u">
                <tr>
                    <td>${u.getLevel()}</td>
                    <td>${u.getUsername()}</td>
                    <td>${u.getPassword()}</td>
                    <td><a href="editform.jsp?iduser=${u.getIduser()}">Edit</a></td>
                    <td><a href="deleteuser.jsp?iduser=${u.getIduser()}">Delete</a></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
