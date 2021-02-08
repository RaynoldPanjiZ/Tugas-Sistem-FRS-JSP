<%-- 
    Document   : Biodata
    Created on : Nov 3, 2020, 4:12:11 PM
    Author     : Raynold Panji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
	<title>Biodata</title>
	<style>
            .wrap {
                width: 700px;
                color:black;
                margin: 20px auto;
                padding:15px;
            } footer {
                position:absolute;
                bottom:0;
                width:100%;
            }
	</style>
	<%!
            String nama = "Raynold Panji Zulfiandi";
            String nim = "20180810078";
            String kelas = "TI 2018 C";

            String alamat = "Bandorasa Wetan";
            String ttl = "Bandung, 24 Mei 1999";
            String email = "20180810078@uniku.ac.id";
            String notelp = "+6288971497297";
	%>
    </head>
    <body>
        <div class="wrap">
            <h1 align="center">BIODATA DIRI</h1>
             <hr>
            <table >
                <tr>
                    <td rowspan="10" width="100px">
                        <img src="img/logo_uniku.png" width="200px" 
                             style="border-radius: 50%; margin-right:60px" >
                    </td>
                </tr>
                <tr>
                    <td><b>Nama Lengkap</b></td>
                    <td>:</td>
                    <td><%=nama%></td>
                </tr>
                <tr>
                    <td><b>NIM</b></td>
                    <td>:</td>
                    <td><%=nim%></td>
                </tr>
                <tr>
                    <td><b>Kelas</b></td>
                    <td>:</td>
                    <td>TI 2018 C</td>
                </tr>
                <tr>
                    <td><b>Alamat</b></td>
                    <td>:</td>
                    <td><%=alamat%></td>
                </tr>
                <tr>
                    <td><b>Tempat Tanggal Lahir</b></td>
                    <td>:</td>
                    <td><%=ttl%></td>
                </tr>
                <tr>
                    <td><b>Email</b></td>
                    <td>:</td>
                    <td><%=email%></td>
                </tr>
                <tr>
                    <td><b>Nomor Telp.</b></td>
                    <td>:</td>
                    <td><%=notelp%></td>
                </tr>
            </table>
        </div>
    </body>

    
</html>
