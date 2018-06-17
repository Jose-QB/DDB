<%-- 
    Document   : ajaxSearchE
    Created on : 14/06/2018, 09:37:40 PM
    Author     : Alan
--%>
<% String op = request.getParameter("e");
    //codigo que busque en mongoDB
    for (int i = 0; i < 4; i++) {%>
<%="<option value = '" + op + "'>" + op + "</option>"%>
<%  }%>