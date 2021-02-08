<%@page import="function.admin.jadwal"%>
<jsp:useBean id="u" class="function.admin.fjadwal"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
    int i = jadwal.delete(u);
    
    String redirect = request.getContextPath() + "/index.jsp?folder=halaman/"+session.getAttribute("level")+"&file=jadwal.jsp";
    response.sendRedirect(redirect);
%>