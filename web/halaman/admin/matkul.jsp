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
        <%@page import="function.admin.*,java.util.*"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <h1>DATA MATKUL</h1>
        <%
            List<fmatkul> list = matkul.getAllRecords(); request.setAttribute("list", list);
        %>
        <table border='1' width="80%" id="datatable" class="display">
            <thead>
                <tr>
                    <th>Kode</th><th>Nama</th><th>Syarat</th><th>Jenis</th><th>Edit</th><th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="u">
                <tr>
                    <td>${u.getKdmatkul()}</td>
                    <td>${u.getNamamatkul()}</td>
                    <td>${u.getSyaratmatkul()}</td>
                    <td>${u.getJenis()}</td>
                    <td><a href="index.jsp?folder=halaman/admin&file=matkul_edit.jsp&kdmatkul=${u.getKdmatkul()}">Edit</a></td>
                    <td><a href="halaman/admin/matkul_delete.jsp?kdmatkul=${u.getKdmatkul()}">Delete</a></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <br><br>
        <a href="index.jsp?folder=halaman/admin&file=matkul_input.jsp"><button>Input Data Matkul</button></a>
    </body>
</html>
