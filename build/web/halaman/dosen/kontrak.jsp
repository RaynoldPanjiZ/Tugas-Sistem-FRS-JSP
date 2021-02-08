<%-- 
    Document   : berita
    Created on : Dec 14, 2020, 9:48:49 PM
    Author     : Raynold Panji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" 
              href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
        <script type="text/javascript" charset="UTF-8" 
        src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.2.min.js"></script>
        <script type="text/javascript" charset="UTF-8" 
        src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
        <script type="text/javascript" language="javascript">
            $(document).ready(function() {
                $('#datatable').DataTable();
            });
        </script>
    </head>
    <body>
        <%@page import="function.*,java.util.*"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <h1>HALAMAN FRS MAHASISWA</h1>
        <%
            List<fkontrakfrs> list = kontrakfrs.getAllRecords(); request.setAttribute("list", list);
            
            fprofile dosen = profile.getRecordById((String)session.getAttribute("user_id"), "dosen");
            request.setAttribute("dosen", dosen);
        %>
        
        <table border='1' width="80%" id="datatable" class="display">
            <thead>
                <tr>
                    <th>Kode</th><th>Kode Jadwal</th><th>NIM</th><th>Approve</th>
                    <th>Nilai Grade</th>
                    <c:if test="${dosen.getStatus().equals('Pembimbing')}">
                        <th>Edit</th>
                    </c:if>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="u" varStatus="loop">
                <tr>
                    <td>${u.getKdkontrak()}</td>
                    <td>${u.getKdjadwal()}</td>
                    <td>${u.getNim()}</td>
                    <td>
                        ${u.getApprove()}

                        <!--Mengambil data data yang sudah diapprove untuk proses approve all-->    
                        <input type='hidden' name='approve' form='form2' value='${u.getApprove()}'>
                    </td>
                    <td>
                        <c:if test="${u.getApprove() == 1}">
                        <form action='halaman/dosen/approve.jsp' id="form1">
                            <input type='hidden' name='kdkontrak' value='${u.getKdkontrak()}'>
                            <center>
                                <input type='text' name='nilai' value='${u.getNilai()}' size='2' maxlength='2' onkeypress='return /[A-E]/i.test(event.key)' title='Beri Nilai A, AB, B, BC, C, CD, E'>
                                <input type="submit" name="submit" value="Beri_Nilai">
                            </center>
                        </form>
                        </c:if>
                    </td>
                    <c:if test="${dosen.getStatus().equals('Pembimbing')}">
                    <td>
                        <a href="halaman/dosen/approve.jsp?submit=approve_by_id&kdkontrak=${u.getKdkontrak()}&approve=${u.getApprove()}">${u.getApprove()==0?"Approve":"Un-Approve"}</a>
                    </td>
                    </c:if>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        
            <br><br>
            
        <form action="halaman/dosen/approve.jsp" id="form2">
            <c:if test="${dosen.getStatus().equals('Pembimbing')}">
                <select name="select">
                    <option value="all">All</option>
                    <c:forEach items="${list}" var="u">
                        <option value="${u.getNim()}">by NIM : ${u.getNim()}</option>
                    </c:forEach>
                </select>
                <input type="submit" name="submit" value="Approve All">
            </c:if>
        </form>
    </body>
</html>
