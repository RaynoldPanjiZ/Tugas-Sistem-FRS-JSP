<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INPUT DATA</title>
    </head>
    <body>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@page import="function.admin.*,java.util.*"%>
        <%
            List<fjadwal> list = jadwal.getAllRecords(); request.setAttribute("list", list);
            int idprev = list.size()+1;
        %>
        <h3>INPUT DATA</h3>
        <hr>
        <form action="halaman/admin/proses_inputjadwal.jsp" method="post">
            <table width="500px" border="5">
                <tr>
                    <td width="120px">Kode</td><td><input type="text" name="kdjadwal" value="<%="TINFCW"+idprev%>" readonly></td>
                </tr>
                <tr>
                    <td width="120px">Hari</td>
                    <td>
                        <select name="hari">
                            <option>Senin</option>
                            <option>Selasa</option>
                            <option>Rabu</option>
                            <option>Kamis</option>
                            <option>Jum'at</option>
                            <option>Sabtu</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td width="120px">Jam</td>
                    <td><input type="time" name="jamfrom" required size='6px'> to <input type="time" name="jamto" required size='6px'></td>
                </tr>
                <tr>
                    <td width="120px">SKS</td><td><input type="number" name="sks" min='1' max='3' required></td>
                </tr>
                <tr>
                    <td width="120px">Semester</td><td><input type="number" name="semester" min='1' max='8' required></td>
                </tr>
                <tr>
                    <td width="120px">Kelas</td>
                    <td>
                        <select name="kelas">
                            <optgroup label="Angk. 2019">
                                <option>TI-2019-A</option>
                                <option>TI-2019-B</option>
                                <option>TI-2019-C</option>
                            </optgroup>
                            <optgroup label='Angk. 2018'>
                                <option>TI-2018-A</option>
                                <option>TI-2018-B</option>
                                <option>TI-2018-C</option>
                            </optgroup>
                            <optgroup label="Angk. 2017">
                                <option>TI-2017-A</option>
                                <option>TI-2017-B</option>
                                <option>TI-2017-C</option>
                            </optgroup>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td width="120px">Matkul</td>
                    <td>
                        <select name="kdmatkul" required>
                            <option value="" disabled selected>-- Pilih Kode Matkul --</option>
                            <%
                                List<fmatkul> lstmatkul = matkul.getAllRecords();
                                request.setAttribute("list2", lstmatkul);
                            %>
                            <c:forEach items="${list2}" var="u">
                                <option value='${u.getKdmatkul()}'> ${u.getNamamatkul()} (${u.getKdmatkul()})</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td width="120px">Dosen</td>
                    <td>
                        <select name="nip" required>
                            <option value="" disabled selected>-- Pilih NIP dosen --</option>
                            <%
                                List<fdosen> lstdosen = dosen.getAllRecords();
                                request.setAttribute("list3", lstdosen);
                            %>
                            <c:forEach items="${list3}" var="u">
                                <option value='${u.getNip()}'> ${u.getNip()} </option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                    <tr>
                    <td></td><td><input type="submit" name="proses" value="Proses"></td>
                </tr>
            </table>
        </form>
    </body>
</html>