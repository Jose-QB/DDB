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
<jsp:useBean id="objConn" class="mysql.MySqlConexion"/>

<%    
    String nickname = (String) request.getParameter("user");
    String Prepasswrd =(String) request.getParameter("pass");
    String secretKey = "SomosPapusPro"; //llave para encriptar datos
    String base64EncryptedString = "";
    try {
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] digestOfPassword = md.digest(secretKey.getBytes("utf-8"));
        byte[] keyBytes = Arrays.copyOf(digestOfPassword, 24);

        SecretKey key = new SecretKeySpec(keyBytes, "DESede");
        Cipher cipher = Cipher.getInstance("DESede");
        cipher.init(Cipher.ENCRYPT_MODE, key);

        byte[] plainTextBytes = Prepasswrd.getBytes("utf-8");
        byte[] buf = cipher.doFinal(plainTextBytes);
        byte[] base64Bytes = Base64.getEncoder().encode(buf);
        base64EncryptedString = new String(base64Bytes);

    } catch (Exception ex) {
    }
    String modifica = "update usuario set passwrd= '" + base64EncryptedString + "' where nickname='" + nickname + "';";
    objConn.Actualizar(modifica);
    objConn.closeRsStmt();
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

