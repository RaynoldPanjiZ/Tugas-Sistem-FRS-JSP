<%-- 
    Document   : index
    Created on : Dec 14, 2020, 9:33:48 PM
    Author     : Raynold Panji
--%>

<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MENU DAN INSTRUKSI HALAMAN</title>
        <link rel="stylesheet" type="text/css" media="screen" href="halaman/tampilan.css">
    </head>
    <body>
            <!--Cek session login-->
        <%
            if (session.getAttribute("session") != "TRUE") {
                String contextpath = request.getContextPath();
                response.sendRedirect(contextpath + "/login.jsp");        
            } else {
                String id_user = (String)session.getAttribute("iduser");
                String level_user = (String)session.getAttribute("level");
        %>
        <!-- header -->
        <div id="header">MENU DAN INSTRUKSI HALAMAN</div>
        
        <!-- Menu Admin -->
        <% if(level_user.equals("admin") ) { %>
        <div id="menu">
            <ul>
                <li><a href="index.jsp">Dashboard</a></li>
                <li><a href="index.jsp?folder=halaman/admin&file=matkul.jsp">Data Matakuliah</a></li>
                <li><a href="index.jsp?folder=halaman/admin&file=jadwal.jsp">Data Jadwal</a></li>
                <li><a href="index.jsp?folder=halaman/admin&file=dosen.jsp">Data Dosen</a></li>
                <li><a href="index.jsp?folder=halaman/admin&file=mhs.jsp">Data Mahasiswa</a></li>
                <li><a href="index.jsp?folder=halaman/admin&file=frs.jsp">Data FRS</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </div>
        <% } else if(level_user.equals("dosen") ) { %>
        <div id="menu">
            <ul>
                <li><a href="index.jsp">Dashboard</a></li>
                <li><a href="index.jsp?folder=halaman/dosen&file=kontrak.jsp">Data Kontrak</a></li>
                <li><a href="index.jsp?folder=halaman/dosen&file=profile.jsp">Data Profile</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </div>
        <% }else if(level_user.equals("mahasiswa") ) { %>
        <div id="menu">
            <ul>
                <li><a href="index.jsp">Dashboard</a></li>
                <li><a href="index.jsp?folder=halaman/mahasiswa&file=inputfrs.jsp">Data FRS</a></li>
                <li><a href="index.jsp?folder=halaman/mahasiswa&file=profile.jsp">Data Profile</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </div>
        <% } else { out.print("Konten Tidak tersedia"); } %>
        
        <div id="konten">
            <% if (request.getParameter("folder")!=null) {
                String dataFile = request.getParameter("folder")+"/"+request.getParameter("file"); 
                File file = new File(request.getServletContext().getRealPath(dataFile));
                if (file.exists()) { %>
                    <jsp:include page="<%=dataFile%>" />
                <% } else { %>
                    <jsp:include page="halaman/${level}/home.jsp" />
                <% }
            } else { %>
                <jsp:include page="halaman/${level}/home.jsp" />
            <% } %>
        </div> <br />
        <div id="footer">Copyright &copy; <a href="http://indowebdev.com" target="_blank" style="color:#FFF">
                Aji Permana, M.Kom - Fakultas Ilmu Komputer - Universitas Kuningan</a></div>
        
        <% } %>
    </body>
</html>