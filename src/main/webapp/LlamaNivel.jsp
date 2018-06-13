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
            HttpSession sesionOk = request.getSession();
            int nivel = Integer.parseInt(request.getParameter("nivel"));
            sesionOk.setAttribute("nivel", nivel);
            String consulta = "select * from nivel_ejercicios where id_nivel = "+nivel+";";
            objConn.Consultar(consulta);
            ArrayList<Ejercicio> ejercicio = new ArrayList<Ejercicio>();
            ArrayList<Ejercicio> pregunta = new ArrayList<Ejercicio>();
            ejercicio.add(new Ejercicio(objConn.rs.getString(2),objConn.rs.getBytes(3)));
            while(objConn.rs.next()) {
                ejercicio.add(new Ejercicio(objConn.rs.getString(2),objConn.rs.getBytes(3)));
            }
            Nivel ejercicios = new Nivel(ejercicio);//SQL
            Nivel examen = new Nivel(pregunta);
            ejercicios.respuestasFalsas();
            ejercicios.desordenar();
            examen.insertar(ejercicio.get((int)Math.random()*ejercicio.size()));
            sesionOk.setAttribute("ejercicios", ejercicios);
            sesionOk.setAttribute("examen", examen);
            response.sendRedirect("Ejercicio"+((int)(Math.random()*3)+1)+".jsp");
        %>
    </body>
</html>
