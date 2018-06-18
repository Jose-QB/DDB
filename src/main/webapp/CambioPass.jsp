<%-- 
    Document   : CambioContraseña
    Created on : 26/11/2017, 12:23:20 AM
    Author     : erick
--%>
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
    String nickname = (String) request.getParameter("user");
    String Prepasswrd =(String) request.getParameter("pass");
    objConnMongo.cambioPass(nickname, Prepasswrd);
%>
<jsp:forward page="Iniciar_Sesion.jsp">
    <jsp:param name="cambioPass" value="Cambio Exitoso"/>
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

