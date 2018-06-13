<%-- 
    Document   : nivel
    Created on : 22/11/2017, 11:45:41 PM
    Author     : Alan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Ejercicio"%>
<%@page import="java.awt.Image"%>
<%@page import="Clases.Nivel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConn" class="mysql.MySqlConexion"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String consulta = "select * from demo;";
            objConn.Consultar(consulta);
            ArrayList<String> ejercicio = new ArrayList<String>();
            ejercicio.add(objConn.rs.getString(2));
            while(objConn.rs.next()) {
                ejercicio.add(objConn.rs.getString(2));
            }
            response.sendRedirect("Ed1.jsp?p1=" + ejercicio.get(0) + "&p2=" +ejercicio.get(1) + "&p3=" + ejercicio.get(2));
        %>
    </body>
</html>
