<%-- 
    Document   : CheckLogin
    Created on : 20/11/2017, 10:41:23 PM
    Author     : erick
--%>


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
    String secretKey = "SomosPapusPro"; //llave para desenciptar datos
    String base64EncryptedString = "";

    try {
        String user = "", password = "";
        if ((request.getParameter("usr") != null) && (request.getParameter("pssw") != null)) {
            user = request.getParameter("usr");
            password = request.getParameter("pssw");
            String consulta = "select * from usuario where nickname='" + user + "';";
            objConn.Consultar(consulta);
            objConnMongo.prueba(); 
            if (objConn.rs.getRow() != 0) {
                String u = objConn.rs.getString(2);
                String textoEncriptado = objConn.rs.getString(3);
                String p="";
                try {
                    byte[] message = Base64.getDecoder().decode(textoEncriptado.getBytes("utf-8"));
                    MessageDigest md = MessageDigest.getInstance("MD5");
                    byte[] digestOfPassword = md.digest(secretKey.getBytes("utf-8"));
                    byte[] keyBytes = Arrays.copyOf(digestOfPassword, 24);
                    SecretKey key = new SecretKeySpec(keyBytes, "DESede");

                    Cipher decipher = Cipher.getInstance("DESede");
                    decipher.init(Cipher.DECRYPT_MODE, key);

                    byte[] plainText = decipher.doFinal(message);

                    base64EncryptedString = new String(plainText, "UTF-8");
                    p=base64EncryptedString;
                } catch (Exception ex) {
                }
                if (password.equals(p) && user.equals(u)) {
                    HttpSession iniciada = request.getSession();
                    iniciada.setMaxInactiveInterval(60 * 60 * 60);
                    //id_usuario,nickname,passwrd,id_pregunta,respuesta,id_avatar
                    int id_usuario = objConn.rs.getInt(1);
                    String nickname = objConn.rs.getString(2);
                    String passwrd = objConn.rs.getString(3);
                    int id_pregunta = objConn.rs.getInt(4);
                    String respuesta = objConn.rs.getString(5);
                    int id_avatar = objConn.rs.getInt(6);
                    Usuario usr = new Usuario(id_usuario, nickname, passwrd, id_pregunta, respuesta, id_avatar);
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

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>        
    </body>
</html>


