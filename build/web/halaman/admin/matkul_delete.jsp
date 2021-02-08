<%@page import="function.admin.matkul"%>
<jsp:useBean id="u" class="function.admin.fmatkul"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
    int i = matkul.delete(u);
    
    String redirect = request.getContextPath() + "/index.jsp?folder=halaman/"+session.getAttribute("level")+"&file=matkul.jsp";
    response.sendRedirect(redirect);
%>