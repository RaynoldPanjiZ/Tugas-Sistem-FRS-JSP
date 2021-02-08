<%-- 
    Document   : Biodata
    Created on : Nov 3, 2020, 4:12:11 PM
    Author     : Raynold Panji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="function.profile,function.fprofile"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	
        <%
            fprofile u = profile.getRecordById((String)session.getAttribute("user_id"), "mahasiswa");
        %>
    </head>
    <body>
        <div class="wrap">
            <h1 align="center">Profil</h1>
             <hr>
            <table >
                <tr>
                    <td rowspan="10" width="100px">
                        <img src="img/logo_uniku.png" width="200px" 
                             style="border-radius: 50%; margin-right:60px" >
                    </td>
                </tr>
                <tr>
                    <td><b>NIM</b></td>
                    <td>:</td>
                    <td><%=u.getNim()%></td>
                </tr>
                <tr>
                    <td><b>Nama Lengkap</b></td>
                    <td>:</td>
                    <td><%=u.getNama()%></td>
                </tr>
                <tr>
                    <td><b>Kelas</b></td>
                    <td>:</td>
                    <td><%=u.getKelas()%></td>
                </tr>
                <tr>
                    <td><b>No Telp</b></td>
                    <td>:</td>
                    <td><%=u.getNotelp()%></td>
                </tr>
                <tr>
                    <td><b>Alamat Email</b></td>
                    <td>:</td>
                    <td><%=u.getEmail()%></td>
                </tr>
            </table>
        </div>
    </body>

    
</html>
