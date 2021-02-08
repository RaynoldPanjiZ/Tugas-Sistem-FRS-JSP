<%-- 
    Document   : index
    Created on : Nov 26, 2020, 9:04:19 PM
    Author     : Raynold Panji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>FORM LOGIN</title>
    </head>
    <body>
        <%
            String login_msg=(String)request.getAttribute("session");
                if(login_msg!=null){
                out.print(login_msg);
            }
        %>
        <form action="proseslogin.jsp" method="post">
            <div id="menu"><center><h1>Halaman Login</h1></center></div>
            <hr />
            <table align="center">
                <tr>
                    <td width="100px">Email</td>
                    <td><input type="text" name="email" 
                               placeholder="input email anda" required></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" 
                               placeholder="input password anda" required></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" name="submit" value="Login"></td>
                </tr>
            </table>
            <hr>
        </form>
    </body>
</html>
