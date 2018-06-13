<%-- 
    Document   : ejercicios
    Created on : 22/11/2017, 08:36:40 PM
    Author     : Alan
--%>

<%@page import="Clases.Ejercicio"%>
<%@page import="Clases.Nivel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession sesionOk = request.getSession();
            Nivel ejercicios = (Nivel) sesionOk.getAttribute("ejercicios"), examen;
            String resp = request.getParameter("Respuesta");
            System.out.println(resp + " " + ejercicios.getNivel().get(0).getPalabra());
            if (resp.equals(ejercicios.getNivel().get(0).getPalabra())) {
                //mensaje correcto
                ejercicios.remover();
                System.out.println("Correcto");
                sesionOk.setAttribute("respuesta", "correcta");
            } else {
                ejercicios.bajarPuntaje();
                /*ejercicios.getNivel().get(0).setIntento(ejercicios.getNivel().get(0).getIntento() + 1);
                if (ejercicios.getNivel().get(0).getIntento() == 2) {
                    Ejercicio aux = ejercicios.getNivel().remove(0);
                    aux.setIntento(0);
                    ejercicios.getNivel().add(aux);
                }*/
                sesionOk.setAttribute("respuesta", "incorrecta");
            }
            if (ejercicios.getNivel().size() == 0) {
                //mensaje felicitación y sale a unidades
                examen = (Nivel)sesionOk.getAttribute("examen");
                examen.setPuntaje(ejercicios.getPuntaje());
                sesionOk.setAttribute("examen", examen);
                sesionOk.setAttribute("ejercicios", null);
                response.sendRedirect("Ejercicio4.jsp");
            }else{
                sesionOk.setAttribute("ejercicios", ejercicios);
                //llamar nueva pregunta // eleccion aleatoria del tipo
                response.sendRedirect("Ejercicio" + ((int) (Math.random() * 3) + 1) + ".jsp");
            }
        %>
    </body>
</html>
