<%-- 
    Document   : CloseSession
    Created on : 21/11/2017, 10:47:37 PM
    Author     : erick
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
        

<%
HttpSession sesionOk = request.getSession();
sesionOk.invalidate();
%>
<jsp:forward page="Principal.jsp"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
