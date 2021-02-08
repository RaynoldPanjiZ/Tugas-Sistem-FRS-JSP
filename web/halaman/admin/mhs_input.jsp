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
        <form action="halaman/admin/proses_inputmhs.jsp" method="post">
            <table width="500px" border="5">
                <tr>
                    <td width="120px">NIM</td><td><input type="text" name="nim"></td>
                </tr>
                <tr>
                    <td width="120px">Nama</td><td><input type="text" name="nama"></td>
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
                    <td width="120px">No Telp</td><td><input type="text" name="notelp"></td>
                </tr>
                <tr>
                    <td width="120px">Email</td><td><input type="email" name="email"></td>
                </tr>
                <tr>
                    <td width="120px">Password</td><td><input type="password" name="password"></td>
                </tr>
                    <tr>
                    <td></td><td><input type="submit" name="proses" value="Proses"></td>
                </tr>
            </table>
        </form>
    </body>
</html>