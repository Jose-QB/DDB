<%-- 
    Document   : ajaxSearchU
    Created on : 14/06/2018, 09:37:40 PM
    Author     : Alan
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONObject"%>
<jsp:useBean id="objConnMongo" class="Mongo.MongodbConexion"/>
<% String op = request.getParameter("u");
    String c = request.getParameter("c");
    ArrayList<JSONObject> jsonResult = null;
    switch (c) {
        case "nickBCU":
            jsonResult = objConnMongo.findSimilar("nickname", op);
            break;
        case "pregBCU":
            jsonResult = objConnMongo.findSimilar("id_pregunta", op);
            break;
        case "avatBCU":
            jsonResult = objConnMongo.findSimilar("id_avatar", op);
            break;
        default:
            jsonResult = objConnMongo.findSimilar("", "");
            break;
    }
    //codigo que busque en mongoDB
    for (int i = 0; i < jsonResult.size(); i++) {%>
<%="<option value = '" + jsonResult.get(i).getString("nickname") + "'>" + jsonResult.get(i).getString("nickname") + "</option>"%>
<%  }%>