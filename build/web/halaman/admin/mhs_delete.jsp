<%@page import="function.admin.mhs"%>
<jsp:useBean id="u" class="function.admin.fmhs"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
    int i = mhs.delete(u);
    
    String redirect = request.getContextPath() + "/index.jsp?folder=halaman/"+session.getAttribute("level")+"&file=mhs.jsp";
    response.sendRedirect(redirect);
%>