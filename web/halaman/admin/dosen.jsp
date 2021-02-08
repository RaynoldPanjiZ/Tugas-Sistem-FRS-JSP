<%-- 
    Document   : kategori
    Created on : Dec 14, 2020, 9:49:13 PM
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
            $(document).ready(function () {
                $('#datatable').DataTable();
            });
        </script>
    </head>
    <body>
        <%@page import="function.admin.*,java.util.*"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <h1>DATA DOSEN</h1>
        <%
            List<fdosen> list = dosen.getAllRecords();
            request.setAttribute("list", list);
        %>
        <table border='1' width="80%" id="datatable" class="display">
            <thead>
                <tr>
                    <th>NIP</th><th>Nama</th><th>No Telp</th><th>Email</th><th>Password</th><th>Status</th><th>Edit</th><th>Delete</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="u">
                <tr>
                    <td>${u.getNip()}</td>
                    <td>${u.getNama()}</td>
                    <td>${u.getNotelp()}</td>
                    <td>${u.getEmail()}</td>
                    <td>${u.getPassword()}</td>
                    <td>${u.getStatus()}</td>
                    <td><a href="index.jsp?folder=halaman/admin&file=dosen_edit.jsp&nip=${u.getNip()}">Edit</a></td>
                    <td><a href="halaman/admin/dosen_delete.jsp?nip=${u.getNip()}">Delete</a></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <br><br>
        <a href="index.jsp?folder=halaman/admin&file=dosen_input.jsp"><button>Input Data Dosen</button></a>
</body>
</html>
