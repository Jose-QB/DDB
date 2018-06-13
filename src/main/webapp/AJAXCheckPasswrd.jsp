<%-- 
    Document   : AJAXCompruebaPass
    Created on : 25/11/2017, 06:53:33 PM
    Author     : erick
--%>

<%@page import="javax.crypto.Cipher"%>
<%@page import="javax.crypto.spec.SecretKeySpec"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="objConn" class="mysql.MySqlConexion"/>
<%
    String secretKey = "SomosPapusPro"; //llave para desenciptar datos
    String base64EncryptedString = "";
    String pass = request.getParameter("pass");
    String id_usuario = (String) request.getParameter("id");
    String consulta = "select * from usuario where id_usuario=" + id_usuario + ";";
    objConn.Consultar(consulta);
    if (objConn.rs.getRow() != 0) {
        String textoEncriptado = "NaN";
        try {
            textoEncriptado = objConn.rs.getString(3);
        } catch (Exception e) {
        }
        objConn.closeRsStmt();        
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
        } catch (Exception ex) {
        }
        if(pass.equals(base64EncryptedString)){
            %><%="si"%>
        <%}else{
            %><%="no"%>
        <%}
    }%>

