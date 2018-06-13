<%-- 
    Document   : AJAXDiccionario
    Created on : 21/11/2017, 11:26:29 PM
    Author     : erick
--%>


<%@page import="java.util.ArrayList"%>
<jsp:useBean id="objConn" class="mysql.MySqlConexion"/>
<%
    String palabra = request.getParameter("letra").toUpperCase();
    String consulta = "select * from expresion where palabra='" + palabra + "';";
    objConn.Consultar(consulta);
    if (objConn.rs.getRow() != 0) {
        String letra="NaN";
        byte[] img64 = null;
        String descripcion="NaN";
        try {            
            letra = objConn.rs.getString(2);
            img64 = objConn.rs.getBytes(4);
            descripcion = objConn.rs.getString(5);
        } catch (Exception e) {
        }
        objConn.closeRsStmt();
        %>
        <%= letra + "," + javax.xml.bind.DatatypeConverter.printBase64Binary(img64) +","+ descripcion%>
    <%}else{
        objConn.closeRsStmt();%>
        <%="no"%>
    <%}%>
