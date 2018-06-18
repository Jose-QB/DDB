<%-- 
    Document   : checkCambiosConfig
    Created on : 24/11/2017, 12:17:11 AM
    Author     : erick
--%>

<%@page import="java.util.Base64"%>
<%@page import="javax.crypto.spec.SecretKeySpec"%>
<%@page import="javax.crypto.Cipher"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="Clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConn" class="Mongo.MySqlConexion"/>
<jsp:useBean id="objConnMongo" class="Mongo.MongodbConexion"/>

<%
    Usuario user;
    HttpSession sesionOk = request.getSession();
    user = (Usuario) sesionOk.getAttribute("usuario");
    String nombre = (String) request.getParameter("nombre");
    String passwrd = (String) request.getParameter("pass");
    String id_avatar = (String) request.getParameter("avatar");
    String nickname = (String) request.getParameter("nickname");   

    user.setNickname(nombre);
    user.setPasswrd(passwrd);
    user.setId_avatar(Integer.parseInt(id_avatar));
    sesionOk.setAttribute("usuario", user);
    objConnMongo.cambioConfig(nickname,nombre,passwrd,Integer.parseInt(id_avatar));    
%>
<jsp:forward page="Inicio.jsp">
    <jsp:param name="cambio" value="Modificación Exitosa"/>
</jsp:forward>
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
