<%-- 
    Document   : altaUsuario
    Created on : 21/11/2017, 08:58:07 AM
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
    String nickname = (String) request.getParameter("usr");
    String Prepasswrd = (String) request.getParameter("pass");
    int id_pregunta = Integer.parseInt((String) request.getParameter("pregunta"));
    String respuesta = (String) request.getParameter("respuesta");
    int id_avatar = Integer.parseInt((String) request.getParameter("avatar"));
    String consulta = "select * from usuario where nickname='" + nickname + "';";
    objConn.Consultar(consulta);
    if (objConn.rs.getRow() != 0) {
%> <jsp:forward page="Registro.jsp">
    <jsp:param name="error" value="Usuario ya existe"/>
</jsp:forward>    
<% } else {
    //obtener el id que sigue
    consulta = "select * from usuario;";
    objConn.Consultar(consulta);
    int id_usuario = 0;
    if (objConn.rs != null) {
        try {
            objConn.rs.last();
            id_usuario = objConn.rs.getRow();//total de registros
            objConn.rs.first();
        } catch (Exception e) {
        }
    }
    id_usuario++;//aumentamos en un el id    

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
    String insertar = "insert into usuario(id_usuario,nickname,passwrd,id_pregunta,respuesta,id_avatar) "
            + "values (" + id_usuario + ",'" + nickname + "','" + base64EncryptedString + "'," + id_pregunta + ",'" + respuesta.toUpperCase() + "'," + id_avatar + ");";

    objConn.Actualizar(insertar);
    insertar = "insert into realizo(id_nivel,id_usuario,puntaje) "
            + "values (" + 0 + "," + id_usuario + "," + 0 + ");";

    objConn.Actualizar(insertar);
    objConn.closeRsStmt();
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
