<%-- 
    Document   : SalirNivel
    Created on : 25/11/2017, 01:05:54 PM
    Author     : Alan
--%>

<%@page import="Clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario user;
    HttpSession sesionOk = request.getSession();
    user = (Usuario) sesionOk.getAttribute("usuario");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%
        sesionOk.setAttribute("ejercicios", null);
        sesionOk.setAttribute("respuesta", null);
        sesionOk.setAttribute("examen", null);
        response.sendRedirect("Inicio.jsp");
    %>
    </body>
</html>
