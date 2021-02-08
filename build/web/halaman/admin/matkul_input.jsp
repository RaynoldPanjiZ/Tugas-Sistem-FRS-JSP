<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INPUT DATA</title>
    </head>
    <body>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@page import="function.admin.matkul,function.admin.fmatkul,java.util.*"%>
        <%
            List<fmatkul> list = matkul.getAllRecords(); request.setAttribute("list", list);
            int id = Integer.parseInt(list.get(list.size()-1).getKdmatkul())+1;
        %>
        <h3>INPUT DATA</h3>
        <hr>
        <form action="halaman/admin/proses_inputmatkul.jsp" method="post">
            <table width="500px" border="5">
                <tr>
                    <td width="120px">Kode</td><td><input type="text" name="kdmatkul" value="<%=id%>" readonly></td>
                </tr>
                <tr>
                    <td width="120px">Nama Matkul</td><td><input type="text" name="namamatkul" required></td>
                </tr>
                <tr>
                    <td width="120px">Syarat Matkul</td><td><input type="text" name="syaratmatkul" required></td>
                </tr>
                <tr>
                    <td width="120px">Jenis</td>
                    <td>
                        <select name="jenis">
                            <option value="Wajib">Wajib</option>
                            <option value="Pilihan">Pilihan</option>
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