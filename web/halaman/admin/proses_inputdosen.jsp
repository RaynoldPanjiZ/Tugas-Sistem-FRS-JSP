<%-- 
    Document   : prosesinputuser
    Created on : Dec 15, 2020, 5:23:04 PM
    Author     : Raynold Panji
--%>

<%@page import="function.admin.dosen"%>
<jsp:useBean id="u" class="function.admin.fdosen"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
    int i=dosen.save(u); 
    if(i>0){
        out.print("<center><b>Input data berhasil !</b></center>");
    }else{
        out.print("<center><b>Input data gagal !</b></center>");
    }
    
    String redirect = request.getContextPath() + "/index.jsp?folder=halaman/"+session.getAttribute("level")+"&file=dosen.jsp";
    response.sendRedirect(redirect);
%>
<%--<jsp:include page="index.jsp"></jsp:include>--%>