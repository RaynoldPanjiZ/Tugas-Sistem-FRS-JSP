<%-- 
    Document   : admin
    Created on : Dec 14, 2020, 9:48:35 PM
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
        <h1>HALAMAN FRS</h1>
        <%
            List<fjadwal> list = jadwal.getAllRecords(); request.setAttribute("list", list);
            
            List<fkontrakfrs> list_apprv = kontrakfrs.getRecordById((String)session.getAttribute("user_id")); request.setAttribute("list2", list_apprv);
            
            String[] check = jadwal.getSelectedfrs((String)session.getAttribute("user_id")); 
            request.setAttribute("checked", check);
        
            // cek apakah sudah di approve pembimbing
            int temp = 0;
            for(fkontrakfrs a : list_apprv){
                temp = temp + a.getApprove();
            } 
        %>
        <form action="halaman/mahasiswa/prosessinputfrs.jsp">
            NIM Anda : <input type="text" readonly name="nim" value="${user_id}" size="8px"><br><br>
        <table border='1' width="80%" id="datatable" class="display">
            <thead>
                <tr>
                    <th>Pilih</th><th>Kode Jadwal</th><th>Matkul</th><th>Jadwal</th><th>Dosen</th><th>Kelas</th><th>Semester</th><th>SKS</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="u" varStatus="loop">
                <tr>
                    <td><input type="checkbox" <%=temp>0?"disabled":""%> name="frsjadwal" value="${u.getKdjadwal()}" <%for(String s:check){ request.setAttribute("s", s);%> ${s==u.getKdjadwal()?"checked":""} <%}%>></td>
                    <td>${u.getKdjadwal()}</td>
                    <td>${u.getKdmatkul()}</td>
                    <td>${u.getHari()}, ${u.getJam()}</td>
                    <td>${u.getNip()}</td>
                    <td>${u.getKelas()}</td>
                    <td>${u.getSemester()}</td>
                    <td>${u.getSks()}</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        <br><br>
        
        <input type="submit" <%=temp>0?"value='Sudah Diapprove' disabled":"value='Submit FRS'"%>>
        </form>
    </body>
</html>
