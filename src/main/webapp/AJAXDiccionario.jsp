<%-- 
    Document   : AJAXDiccionario
    Created on : 21/11/2017, 11:26:29 PM
    Author     : erick
--%>


<%@page import="java.io.IOException"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="objConn" class="Mongo.MySqlConexion"/>
<jsp:useBean id="objConnMongo" class="Mongo.MongodbConexion"/>
<%
    String palabra = request.getParameter("letra").toUpperCase();
    JSONObject jsonResult = null;
    jsonResult = objConnMongo.buscaPalabra(palabra);
    if (jsonResult != null) {
        String letra="";
        String descripcion="";
        int img64 = 0;
        try {
            letra = jsonResult.getString("palabra");
            descripcion = jsonResult.getString("descripcion");
            img64 = jsonResult.getInt("_id");
        } catch (Exception e) {
            System.err.println("Fallo imag");
        }

%>
<%= letra + "," + img64 + "," + descripcion%>
<%} else {
    objConn.closeRsStmt();%>
<%="no"%>
<%}%>
