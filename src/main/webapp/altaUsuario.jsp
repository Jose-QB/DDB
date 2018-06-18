<%-- 
    Document   : altaUsuario
    Created on : 21/11/2017, 08:58:07 AM
    Author     : erick
--%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.Base64"%>
<%@page import="javax.crypto.spec.SecretKeySpec"%>
<%@page import="javax.crypto.Cipher"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.security.MessageDigest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConn" class="Mongo.MySqlConexion"/>
<jsp:useBean id="objConnMongo" class="Mongo.MongodbConexion"/>

<%
    String nickname = (String) request.getParameter("usr");
    String Prepasswrd = (String) request.getParameter("pass");
    int id_pregunta = Integer.parseInt((String) request.getParameter("pregunta"));
    String respuesta = (String) request.getParameter("respuesta");
    int id_avatar = Integer.parseInt((String) request.getParameter("avatar"));
    JSONObject jsonResult = null;
    jsonResult = objConnMongo.compruebaUsuario(nickname);    
    if (jsonResult != null) {
%> <jsp:forward page="Registro.jsp">
    <jsp:param name="error" value="Usuario ya existe"/>
</jsp:forward>    
<% } else {
    objConnMongo.altaUsuario(nickname, Prepasswrd, id_pregunta, respuesta, id_avatar);    
%>
<jsp:forward page="Iniciar_Sesion.jsp">
    <jsp:param name="agregado" value="Usuario agregado"/>
</jsp:forward>
<% }%> 


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
