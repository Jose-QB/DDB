<%-- 
    Document   : NivelCompleto
    Created on : 27/11/2017, 03:15:47 AM
    Author     : Alan
--%>

<%@page import="Clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConn" class="Mongo.MySqlConexion"/>
<jsp:useBean id="objConnMongo" class="Mongo.MongodbConexion"/>
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
            int nivel = (Integer) sesionOk.getAttribute("nivel");
            String consulta = "select * from realizo where id_usuario = " + user.getId_usuario() + " and id_nivel = " + nivel + ";";
            objConn.Consultar(consulta);
            int us, ni, punt;
            String p;
            p = request.getParameter("calif");
            int index=-1;
            for (int i = 0; i < user.getNivel().size(); i++) {
                if(nivel == Integer.parseInt(user.getNivel().get(i)))index=i;
            }

            if (index != -1) {
                objConnMongo.updatePuntaje(user.getNickname(), user.getPuntaje()+ Integer.parseInt(p));
            } else {
                objConnMongo.updatePuntaje(user.getNickname(), Integer.parseInt(p));
                objConnMongo.updateNivel(user.getNickname(), user.getNivel(),nivel);
                /*String modifica = "INSERT INTO realizo (id_nivel, id_usuario, puntaje) VALUES (" + nivel + ", " + user.getId_usuario() + ", " + p + ");";
                objConn.Actualizar(modifica);*/
            }
            sesionOk.setAttribute("ejercicios", null);
            sesionOk.setAttribute("respuesta", null);
            sesionOk.setAttribute("examen", null);
            response.sendRedirect("Escoger.jsp");
        %>
    </body>
</html>
