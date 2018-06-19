<%-- 
    Document   : nivel
    Created on : 22/11/2017, 11:45:41 PM
    Author     : Alan
--%>

<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Ejercicio"%>
<%@page import="java.awt.Image"%>
<%@page import="Clases.Nivel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConnMongo" class="Mongo.MongodbConexion"/>

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

            String pass = request.getParameter("pass");
            String nickname = (String) request.getParameter("nickname");
            JSONArray jsonResult = null;
            jsonResult = objConnMongo.getLevel(nivel);

            ArrayList<Ejercicio> ejercicio = new ArrayList<Ejercicio>();
            ArrayList<Ejercicio> pregunta = new ArrayList<Ejercicio>();
            //ejercicio.add(new Ejercicio(jsonResult.getString(2), jsonResult.getBytes(3)));
            JSONObject aux = null;
            int index = jsonResult.length();
            for (int i = 0; i < jsonResult.length(); i++) {
                aux = new JSONObject(jsonResult.get(i).toString());
                ejercicio.add(new Ejercicio(aux.getString("palabra"), aux.getInt("id_exp")));
            }
            String a = ejercicio.get(0).getPalabra();
            System.out.println(a);
            /*while (objConn.rs.next()) {
                ejercicio.add(new Ejercicio(objConn.rs.getString(2), objConn.rs.getBytes(3)));
            }*/
            Nivel ejercicios = new Nivel(ejercicio);//SQL
            Nivel examen = new Nivel(pregunta);
            ejercicios.respuestasFalsas();
            ejercicios.desordenar();
            examen.insertar(ejercicio.get((int) Math.random() * ejercicio.size()));
            sesionOk.setAttribute("ejercicios", ejercicios);
            sesionOk.setAttribute("examen", examen);
            response.sendRedirect("Ejercicio" + ((int) (Math.random() * 3) + 1) + ".jsp");
        %>
    </body>
</html>
