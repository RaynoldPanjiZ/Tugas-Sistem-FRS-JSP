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
        <%@page import="function.admin.mhs,function.admin.fmhs"%>
        <%
            String nim = request.getParameter("nim");
            fmhs u = mhs.getRecordById(nim);
        %>
        <h1>Edit Form</h1>
        <form action="halaman/admin/proses_editmhs.jsp" method="post">
            
            <table>
                <tr>
                    <td width="120px">NIM</td>
                    <td><input type="text" name="nim" value="<%= nim%>"/></td>
                </tr>
                <tr>
                    <td width="120px">Nama</td>
                    <td><input type="text" name="nama" value="<%=u.getNama()%>"></td>
                </tr>
                <tr>
                    <td width="120px">Kelas</td>
                    <td>
                        <select name="kelas">
                            <optgroup label="Angk. 2019">
                                <option <%= u.getKelas().equals("TI-2019-A")?"selected":""%>>TI-2019-A</option>
                                <option <%= u.getKelas().equals("TI-2019-B")?"selected":""%>>TI-2019-B</option>
                                <option <%= u.getKelas().equals("TI-2019-C")?"selected":""%>>TI-2019-C</option>
                            </optgroup>
                            <optgroup label='Angk. 2018'>
                                <option <%= u.getKelas().equals("TI-2018-A")?"selected":""%>>TI-2018-A</option>
                                <option <%= u.getKelas().equals("TI-2018-B")?"selected":""%>>TI-2018-B</option>
                                <option <%= u.getKelas().equals("TI-2018-C")?"selected":""%>>TI-2018-C</option>
                            </optgroup>
                            <optgroup label="Angk. 2017">
                                <option <%= u.getKelas().equals("TI-2017-A")?"selected":""%>>TI-2017-A</option>
                                <option <%= u.getKelas().equals("TI-2017-B")?"selected":""%>>TI-2017-B</option>
                                <option <%= u.getKelas().equals("TI-2017-C")?"selected":""%>>TI-2017-C</option>
                            </optgroup>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td width="120px">No Telp</td>
                    <td><input type="text" name="notelp" value="<%=u.getNotelp()%>"></td>
                </tr>
                <tr>
                    <td width="120px">Email</td>
                    <td><input type="email" name="email" value="<%=u.getEmail()%>"></td>
                </tr>
                <tr>
                    <td width="120px">Password</td>
                    <td><input type="password" name="password" value="<%=u.getPassword()%>"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Edit Mahasiswa"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>