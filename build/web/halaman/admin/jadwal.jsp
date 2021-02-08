<%-- 
    Document   : berita
    Created on : Dec 14, 2020, 9:48:49 PM
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
        <%@page import="function.admin.*,java.util.*"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <h1>DATA JADWAL</h1>
        <%
            List<fjadwal> list = jadwal.getAllRecords(); request.setAttribute("list", list);
        %>
        <table border='1' width="80%" id="datatable" class="display">
            <thead>
                <tr>
                    <th>Kode Jadwal</th><th>Matkul</th><th>Jadwal</th><th>Dosen</th><th>Kelas</th><th>Semester</th><th>SKS</th><th>Edit</th><th>Hapus</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="u" varStatus="loop">
                <tr>
                    <td>${u.getKdjadwal()}</td>
                    <td>${u.getKdmatkul()}</td>
                    <td>${u.getHari()}, ${u.getJam()}</td>
                    <td>${u.getNip()}</td>
                    <td>${u.getKelas()}</td>
                    <td>${u.getSemester()}</td>
                    <td>${u.getSks()}</td>
                    <td><a href="index.jsp?folder=halaman/admin&file=jadwal_edit.jsp&kdjadwal=${u.getKdjadwal()}">Edit</a></td>
                    <td><a href="halaman/admin/jadwal_delete.jsp?kdjadwal=${u.getKdjadwal()}">Delete</a></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <br><br>
        <a href="index.jsp?folder=halaman/admin&file=jadwal_input.jsp"><button>Input Data Jadwal</button></a>
    </body>
</html>
