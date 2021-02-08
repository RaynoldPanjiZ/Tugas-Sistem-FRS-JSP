<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INPUT DATA</title>
    </head>
    <body>
        <h3>INPUT DATA</h3>
        <hr>
        <form action="halaman/admin/proses_inputdosen.jsp" method="post">
            <table width="500px" border="5">
                <tr>
                    <td width="120px">NIP</td><td><input type="text" name="nip"></td>
                </tr>
                <tr>
                    <td width="120px">Nama</td><td><input type="text" name="nama"></td>
                </tr>
                <tr>
                    <td width="120px">No Telp</td><td><input type="text" name="notelp"></td>
                </tr>
                <tr>
                    <td width="120px">Email</td><td><input type="text" name="email"></td>
                </tr>
                <tr>
                    <td width="120px">Password</td><td><input type="password" name="password"></td>
                </tr>
                <tr>
                    <td width="120px">Status</td>
                    <td>
                        <select name="status" required>
                            <option value="" disalbled selected>-- Pilih Status Dosen --</option>
                            <option>Pembimbing</option>
                            <option>Pengajar</option>
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