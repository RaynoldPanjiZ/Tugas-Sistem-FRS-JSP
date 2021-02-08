<%-- 
    Document   : editform
    Created on : Dec 22, 2020, 3:12:39 PM
    Author     : Raynold Panji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Form</title>
    </head>
    <body>
        <%@page import="function.admin.dosen,function.admin.fdosen"%>
        <%
            String id = request.getParameter("nip");
            fdosen u = dosen.getRecordById(id);
        %>
        <h1>Edit Form</h1>
        <form action="halaman/admin/proses_editdosen.jsp" method="post">
            
            <table>
                <tr>
                    <td>NIP</td>
                    <td><input type="text" name="nip" value="<%=u.getNip()%>"/></td>
                </tr>
                <tr>
                    <td>Nama</td>
                    <td><input type="text" name="nama" value="<%= u.getNama()%>"/></td>
                </tr>
                <tr>
                    <td>No Telp</td>
                    <td><input type="text" name="notelp" value="<%= u.getNotelp()%>"/></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="email" value="<%= u.getEmail()%>"/></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="password" value="<%= u.getPassword()%>"/></td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td>
                        <select name="status">
                            <option <%=u.getStatus().equals("Pembimbing")?"selected":""%>>Pembimbing</option>
                            <option <%=u.getStatus().equals("Pengajar")?"selected":""%>>Pengajar</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Edit Dosen"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>