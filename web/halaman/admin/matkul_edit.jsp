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
        <%@page import="function.admin.matkul,function.admin.fmatkul"%>
        <%
            String id = request.getParameter("kdmatkul");
            fmatkul u = matkul.getRecordById(Integer.parseInt(id));
        %>
        <h1>Edit Form</h1>
        <form action="halaman/admin/proses_editmatkul.jsp" method="post">
            <input type="hidden" name="kdmatkul" value="<%=u.getKdmatkul()%>"/>
            <table>
                <tr>
                    <td>Nama Matkul</td>
                    <td><input type="text" name="namamatkul" value="<%= u.getNamamatkul()%>"/></td>
                </tr>
                <tr>
                    <td>Syarat Matkul</td>
                    <td><input type="text" name="syaratmatkul" value="<%= u.getSyaratmatkul()%>"/></td>
                </tr>
                <tr>
                    <td width="120px">Jenis</td>
                    <td>
                        <select name="jenis">
                            <option <%=u.getJenis().equals("Wajib")?"selected":""%> value="Wajib">Wajib</option>
                            <option <%=u.getJenis().equals("Pilihan")?"selected":""%> value="Pilihan">Pilihan</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Edit"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>