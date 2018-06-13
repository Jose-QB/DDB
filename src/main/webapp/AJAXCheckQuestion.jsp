<%-- 
    Document   : AJAXCheckQuestion
    Created on : 25/11/2017, 11:39:17 PM
    Author     : erick
--%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="objConn" class="mysql.MySqlConexion"/>
<%
    String usuario = request.getParameter("user");
    String consulta = "select * from usuario where nickname='" + usuario + "';";
    objConn.Consultar(consulta);
    if (objConn.rs.getRow() != 0) {
        String pregunta="NaN";
        String respuesta="NaN";
        try {            
            pregunta = objConn.rs.getString(4);            
            respuesta = objConn.rs.getString(5);            
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
