<%@page import="function.admin.dosen"%>
<jsp:useBean id="u" class="function.admin.fdosen"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
    int i = dosen.delete(u);
    
    String redirect = request.getContextPath() + "/index.jsp?folder=halaman/"+session.getAttribute("level")+"&file=dosen.jsp";
    response.sendRedirect(redirect);
%>