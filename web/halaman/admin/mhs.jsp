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
        <h1>DATA MAHASISWA</h1>
        <%
            List<fmhs> list = mhs.getAllRecords();
            request.setAttribute("list", list);
        %>
        <table border='1' width="80%" id="datatable" class="display">
            <thead>
                <tr>
                    <th>NIM</th><th>Nama</th><th>No Telp</th><th>Email</th><th>Password</th><th>Kelas</th><th>Edit</th><th>Delete</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="u">
                <tr>
                    <td>${u.getNim()}</td>
                    <td>${u.getNama()}</td>
                    <td>${u.getNotelp()}</td>
                    <td>${u.getEmail()}</td>
                    <td>${u.getPassword()}</td>
                    <td>${u.getKelas()}</td>
                    <td><a href="index.jsp?folder=halaman/admin&file=mhs_edit.jsp&nim=${u.getNim()}">Edit</a></td>
                    <td><a href="halaman/admin/mhs_delete.jsp?nim=${u.getNim()}">Delete</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <br><br>
    <a href="index.jsp?folder=halaman/admin&file=mhs_input.jsp"><button>Input Data Mahasiswa</button></a>
</body>
</html>
