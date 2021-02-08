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
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@page import="function.admin.*,java.util.*"%>
        <%
            String id = request.getParameter("kdjadwal");
            fjadwal u = jadwal.getRecordById(id);
        %>
        <h1>Edit Form</h1>
        <form action="halaman/admin/proses_editjadwal.jsp" method="post">
            <input type="hidden" name="kdjadwal" value="<%= u.getKdjadwal()%>"/>
            <table>
                <tr>
                    <td>Hari</td>
                    <td>
                        <select name="hari">
                            <option <%=u.getHari().equals("Senin")?"selected":""%>>Senin</option>
                            <option <%=u.getHari().equals("Selasa")?"selected":""%>>Selasa</option>
                            <option <%=u.getHari().equals("Rabu")?"selected":""%>>Rabu</option>
                            <option <%=u.getHari().equals("Kamis")?"selected":""%>>Kamis</option>
                            <option <%=u.getHari().equals("Jum'at")?"selected":""%>>Jum'at</option>
                            <option <%=u.getHari().equals("Sabtu")?"selected":""%>>Sabtu</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Jam</td>
                    <td>
                        <input type="time" name="jamfrom"/> to <input type="time" name="jamto"/>
                    </td>
                </tr>
                <tr>
                    <td>SKS</td>
                    <td><input type="number" name="sks" value="<%= u.getSks()%>" min='1' max='3' required/></td>
                </tr>
                <tr>
                    <td>Semester</td>
                    <td><input type="number" name="semester" value="<%= u.getSemester()%>" min='1' max='8' required/></td>
                </tr>
                <tr>
                    <td>Kelas</td>
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
                    <td>Matkul</td>
                    <td>
                        <select name="kdmatkul" required>
                            <option value="" disabled selected>-- Pilih Kode Matkul --</option>
                            <%
                                List<fmatkul> lstmatkul = matkul.getAllRecords();                                
                                
                                for(fmatkul s:lstmatkul){ %>
                                <option <%=s.getKdmatkul().equals(u.getKdmatkul())?"selected":""%> value='<%=s.getKdmatkul()%>'> <%=s.getNamamatkul()+" Kode : "+s.getKdmatkul()%></option>
                            <% } %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Dosen</td>
                    <td>
                        <select name="nip" required>
                            <option value="" disabled selected>-- Pilih Kode Matkul --</option>
                            <%
                                List<fdosen> lstdosen = dosen.getAllRecords();                                
                                
                                for(fdosen s:lstdosen){ %>
                                <option <%=s.getNip().equals(u.getNip())?"selected":""%> value='<%=s.getNip()%>'> <%=s.getNip()%></option>
                            <% } %>
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