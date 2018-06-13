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
<jsp:useBean id="objConn" class="mysql.MySqlConexion"/>

<%
    Usuario user;
    HttpSession sesionOk = request.getSession();
    user = (Usuario) sesionOk.getAttribute("usuario");
    String nickname = (String) request.getParameter("nombre");
    String passwrd = (String) request.getParameter("pass");
    String id_avatar = (String) request.getParameter("avatar");
    String id_usuario = (String) request.getParameter("id");
    int band = Integer.parseInt((String) request.getParameter("band"));
    String secretKey = "SomosPapusPro"; //llave para encriptar datos
    String base64EncryptedString = "";
    if (band == 1) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] digestOfPassword = md.digest(secretKey.getBytes("utf-8"));
            byte[] keyBytes = Arrays.copyOf(digestOfPassword, 24);

            SecretKey key = new SecretKeySpec(keyBytes, "DESede");
            Cipher cipher = Cipher.getInstance("DESede");
            cipher.init(Cipher.ENCRYPT_MODE, key);

            byte[] plainTextBytes = passwrd.getBytes("utf-8");
            byte[] buf = cipher.doFinal(plainTextBytes);
            byte[] base64Bytes = Base64.getEncoder().encode(buf);
            base64EncryptedString = new String(base64Bytes);
            passwrd = base64EncryptedString;
        } catch (Exception ex) {
        }
    }

    user.setNickname(nickname);
    user.setPasswrd(passwrd);
    user.setId_avatar(Integer.parseInt(id_avatar));
    sesionOk.setAttribute("usuario", user);
    String modifica = "update usuario set nickname='" + nickname + "' , passwrd= '" + passwrd + "' , id_avatar=" + id_avatar + " where id_usuario=" + id_usuario + ";";
    objConn.Actualizar(modifica);
    objConn.closeRsStmt();
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
