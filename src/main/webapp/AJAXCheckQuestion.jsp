<%-- 
    Document   : AJAXCheckQuestion
    Created on : 25/11/2017, 11:39:17 PM
    Author     : erick
--%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="objConn" class="Mongo.MySqlConexion"/>
<jsp:useBean id="objConnMongo" class="Mongo.MongodbConexion"/>
<%
    String usuario = request.getParameter("user");    
    JSONObject jsonResult = null;
    jsonResult = objConnMongo.compruebaUsuario(usuario);
    if (jsonResult != null) {
        String pregunta="NaN";
        String respuesta="NaN";
        try {            
            pregunta = String.valueOf(jsonResult.getInt("id_pregunta"));            
            respuesta = jsonResult.getString("respuesta");            
        } catch (Exception e) {
        }
        objConn.closeRsStmt();
        %>
<%= pregunta +","+ respuesta%>
<%}else{
objConn.closeRsStmt();
%>
<%="no"%>
<%}%>
