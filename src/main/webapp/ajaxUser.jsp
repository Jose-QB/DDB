<%-- 
    Document   : ajaxSearchU
    Created on : 14/06/2018, 09:37:40 PM
    Author     : Alan
--%>
<%@page import="org.json.JSONObject"%>
<jsp:useBean id="objConnMongo" class="Mongo.MongodbConexion"/>
<%
    int c = Integer.parseInt(request.getParameter("c"));
    String nickname, Prepasswrd, respuesta;
    int id_pregunta, id_avatar;
    switch (c) {
        case 0:
            nickname = request.getParameter("nick");
            Prepasswrd = request.getParameter("pass");
            id_pregunta = Integer.parseInt(request.getParameter("quest"));
            respuesta = request.getParameter("answ");
            id_avatar = Integer.parseInt(request.getParameter("avat"));

            JSONObject jsonResult = null;
            jsonResult = objConnMongo.compruebaUsuario(nickname);
            if (jsonResult == null) {
                objConnMongo.altaUsuario(nickname, Prepasswrd, id_pregunta, respuesta, id_avatar);
            }
%>
<%="Alta realizada: " + nickname%>
<%
        break;
    case 1:
        nickname = request.getParameter("nick");
        objConnMongo.removeUser(nickname);
%>
<%="Baja realizada: " + nickname%>
<%
            break;
    }
%>