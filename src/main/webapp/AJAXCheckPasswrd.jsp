<%-- 
    Document   : AJAXCompruebaPass
    Created on : 25/11/2017, 06:53:33 PM
    Author     : erick
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="javax.crypto.Cipher"%>
<%@page import="javax.crypto.spec.SecretKeySpec"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="objConn" class="Mongo.MySqlConexion"/>
<jsp:useBean id="objConnMongo" class="Mongo.MongodbConexion"/>
<%    
    String pass = request.getParameter("pass");
    String nickname = (String) request.getParameter("nickname");
    JSONObject jsonResult = null;
    jsonResult = objConnMongo.compruebaUsuario(nickname);
    if (jsonResult != null) {
        String prePass = "NaN";
        prePass= jsonResult.getString("passwrd");
        if(pass.equals(prePass)){
            %><%="si"%>
        <%}else{
            %><%="no"%>
        <%}
    }%>

