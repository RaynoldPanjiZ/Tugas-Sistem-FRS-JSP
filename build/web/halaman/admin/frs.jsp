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
        <%@page import="function.*,java.util.*"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <h1>HALAMAN DATA FRS MAHASISWA</h1>
        <%
            List<fkontrakfrs> list = kontrakfrs.getAllRecords();
            request.setAttribute("list", list);
        %>
        <table border='1' width="80%" id="datatable" class="display">
            <thead>
                <tr>
                    <th>Kode</th><th>Kode Jadwal</th><th>NIM</th><th>Approve</th><th>Nilai</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="u">
                <tr>
                    <td>${u.getKdkontrak()}</td>
                    <td>${u.getKdjadwal()}</td>
                    <td>${u.getNim()}</td>
                    <td>${u.getApprove()}</td>
                    <td>${u.getNilai()}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
