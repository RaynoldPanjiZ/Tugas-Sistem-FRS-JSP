<%-- 
    Document   : prosesinputuser
    Created on : Dec 15, 2020, 5:23:04 PM
    Author     : Raynold Panji
--%>

<%@page import="function.kontrakfrs"%>
<jsp:useBean id="u" class="function.fkontrakfrs"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
    String x = request.getParameter("submit");
    
    if(x!=null && x.equals("approve_by_id")) kontrakfrs.approve(u); 
    else if(x!=null && x.equals("Beri_Nilai")) kontrakfrs.saveNilai(u);
    else if(x!=null && x.equals("Approve All")) {
        String[] apprv = request.getParameterValues("approve");
        int appr = 1;
        for(String a : apprv){
            appr = appr * Integer.parseInt(a);
        }
        kontrakfrs.approveall(request.getParameter("select"), appr);
    }
    
    String redirect = request.getContextPath() + "/index.jsp?folder=halaman/"+session.getAttribute("level")+"&file=kontrak.jsp";
    response.sendRedirect(redirect); 
%>
<%--<jsp:include page="index.jsp"></jsp:include>--%>