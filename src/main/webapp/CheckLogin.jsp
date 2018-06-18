<%-- 
    Document   : CheckLogin
    Created on : 20/11/2017, 10:41:23 PM
    Author     : erick
--%>


<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="javax.crypto.spec.SecretKeySpec"%>
<%@page import="javax.crypto.Cipher"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.Arrays"%>
<%@page import="Clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConn" class="Mongo.MySqlConexion"/>
<jsp:useBean id="objConnMongo" class="Mongo.MongodbConexion"/>
<%@page session="true" %>

<%
    try {
        String user = "", password = "";
        JSONObject jsonResult = null;
        if ((request.getParameter("usr") != null) && (request.getParameter("pssw") != null)) {
            user = request.getParameter("usr");
            password = request.getParameter("pssw");
            jsonResult = objConnMongo.buscaUsuario(user, password);
            if (jsonResult != null) {
                if (true) {
                    HttpSession iniciada = request.getSession();
                    iniciada.setMaxInactiveInterval(60 * 60 * 60);
                    Object data = jsonResult.get("_id"); //Aqui se sacan las anidaciones
                    JSONObject aux = new JSONObject(data.toString());
                    String id_usuario = aux.getString("$oid");
                    String nickname = jsonResult.getString("nickname");
                    String passwrd = jsonResult.getString("passwrd");
                    int id_pregunta = jsonResult.getInt("id_pregunta");
                    String respuesta = jsonResult.getString("respuesta");
                    int id_avatar = jsonResult.getInt("id_avatar");
                    JSONArray a= jsonResult.getJSONArray("nivel"); //Aqui se sacan los vectores
                    int nivel = a.length();
                    Usuario usr = new Usuario(id_usuario, nickname, passwrd, id_pregunta, respuesta, id_avatar, nivel);
                    iniciada.setAttribute("usuario", usr);
%><jsp:forward page="Inicio.jsp"/>
<%
} else {
%>
<jsp:forward page="Iniciar_Sesion.jsp">
    <jsp:param name="error" value="Usuario No Valido.<br>Vuelve a intentarlo"/>
</jsp:forward>
<%}
} else {
%>
<jsp:forward page="Iniciar_Sesion.jsp">
    <jsp:param name="error" value="Usuario No Valido.<br>Vuelve a intentarlo"/>
</jsp:forward>
<%
            }
        }
    } catch (Exception e) {
    }%>


