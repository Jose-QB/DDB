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
        String letra = jsonResult.getString("palabra");
        String descripcion = jsonResult.getString("descripcion");
        int idImg = jsonResult.getInt("_id");
        byte[] img64 = null; //Falta la imagen                
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        File f = new File("./Imagenes/Avatares/Elejido/6c.png");
        BufferedImage img = null;
        try {
            File file = new File("Imagenes/Avatares/Elejido/1c.png");
            switch (idImg) {
                case 1:
                    img = ImageIO.read(file);
                    break;
            }
            ImageIO.write(img, "png", bos);
            img64 = bos.toByteArray();
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }

%>
<%= letra + "," + javax.xml.bind.DatatypeConverter.printBase64Binary(img64) + "," + descripcion%>
<%} else {
    objConn.closeRsStmt();%>
<%="no"%>
<%}%>
