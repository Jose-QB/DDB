<%-- 
    Document   : Escoger
    Created on : 21/11/2017, 07:29:31 PM
    Author     : Jose
--%>
<%@page import="java.util.Collection"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Usuario"%>
<jsp:useBean id="objConn" class="Mongo.MySqlConexion"/>
<%
    Usuario user;
    HttpSession sesionOk = request.getSession();
    user = (Usuario) sesionOk.getAttribute("usuario");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Escoge Unidad</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="Estilos/styleInicio.css" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="JavaScripCodes/PrincipalFunciones.js"  type="text/javascript"></script>
    </head>
    <body>
        <script>
            var unidad;
                function un1(){
                    location.href = "Nivel.jsp?unidad="+1;
                }
                function un2(){
                    location.href = "Nivel.jsp?unidad="+2;
                }
                function un3(){
                    location.href = "Nivel.jsp?unidad="+3;
                }
                function un4(){
                    location.href = "Nivel.jsp?unidad="+4;
                }
                function un5(){
                    location.href = "Nivel.jsp?unidad="+5;
                }
                function un6(){
                    location.href = "Nivel.jsp?unidad="+6;
                }
                
            

        </script>
        <div class="container-fluid">
            <div class="row">
                
                <div class="row">
                    <div class="col-sm-9" style="background-color: rgb(69, 88, 121);">
                        <div class="row">
                            <div class="col-sm-3"><img class="pad img-responsive" src="Imagenes/menu_Principal/logo.png"></div>
                            <div class="col-sm-2 "><br><a href="Inicio.jsp"><img class="pad img-responsive" src="Imagenes/menu_Principal/regresar.png" width="65%"></a></div>
                            </div>                
                    </div>
                    <div class="col-sm-3" style="background-color: rgb(147, 205, 207);">
                        <div class="col-sm-2"></div>
                        <div class="col-sm-8 text-center" >
                            <%
                                switch (user.getId_avatar()) {
                                    case 1:
                            %><div class="row"><img class="pad2" src="Imagenes/Avatares/Elejido/1c.png" width="108px" height="108px"></div><%
                                    break;
                                case 2:
                                %><div class="row"><img class="pad2" src="Imagenes/Avatares/Elejido/2c.png" width="108px" height="108px"></div><%
                                        break;
                                    case 3:
                                %><div class="row"><img class="pad2" src="Imagenes/Avatares/Elejido/3c.png" width="108px" height="108px"></div><%
                                        break;
                                    case 4:
                                %><div class="row"><img class="pad2" src="Imagenes/Avatares/Elejido/4c.png" width="108px" height="108px"></div><%
                                        break;
                                    case 5:
                                %><div class="row"><img class="pad2" src="Imagenes/Avatares/Elejido/5c.png" width="108px" height="108px"></div><%
                                        break;
                                    case 6:
                                %><div class="row"><img class="pad2" src="Imagenes/Avatares/Elejido/6c.png" width="108px" height="108px"></div><%
                                        break;
                                    default:
                                %><div class="row"><img class="pad2" src="Imagenes/Avatares/Elejido/1c.png" width="108px" height="108px"></div><%
                                            break;
                                    }
                                    out.println("<div class='row'><span id='letras'>" + user.getNickname() + "</span></div>");
                                %>                             
                                <%--<div class="row"><span id="letras">Erick</span></div>--%>
                        </div>
                        <div class="col-sm-2"></div>
                    </div>
                </div>     
                
                
                <div class="row"><br><br> <%--Parte donde maquetar--%>
                  <div class="row">
                      <%
                         /*Hacemos la consulta para sacar el nivel en el que esta el usuario actua
                           y de acuerdo a esto bloqueamos o desbloqueamos la unidad a la que 
                           puede ingresar
                                    */
                        /*String consulta = "select id_nivel from realizo where id_usuario='" + user.getId_usuario() + "';";
                        objConn.Consultar(consulta);*/
                        ArrayList<Integer> nivel = new ArrayList();
                        ArrayList<Integer> u2 = new ArrayList(); // Coleccion de niveles de unidad 
                        ArrayList<Integer> u3 = new ArrayList(); // Coleccion de niveles de unidad 
                        ArrayList<Integer> u4 = new ArrayList(); // Coleccion de niveles de unidad 
                        ArrayList<Integer> u5 = new ArrayList(); // Coleccion de niveles de unidad 
                        ArrayList<Integer> u6 = new ArrayList(); // Coleccion de niveles de unidad 
                        u2.add(1);
                        u2.add(2);
                        u2.add(3);
                        u3.add(4);
                        u3.add(5);
                        u4.add(6);
                        u4.add(7);
                        u4.add(8);
                        u5.add(9);
                        u5.add(10);
                        u6.add(11);
                        u6.add(12);
                        u6.add(13);
                       // ResultSetMetaData metaData = objConn.rs.getMetaData();
                        //int x = metaData.getColumnCount();
                        for (int i = 0; i < user.getNivel().size(); i++) {
                                nivel.add(Integer.parseInt(user.getNivel().get(i)));
                            }
                        /*while(objConn.rs.next()){
                                nivel.add(objConn.rs.getInt(1));
                        }*/

                      %>
                      <div class="col-sm-2"></div>
                      <div class="col-sm-2"><a href="#" > <img  onclick="un1();" src="Imagenes/niveles/abecedario.png" class="img-responsive" width="244" height="228" ></a></div>
                      <div class="col-sm-1"></div>
                      <%
                        if(nivel.containsAll(u2)){
                      %><div class="col-sm-2"><a href="#n"><img onclick="un2();"  src="Imagenes/niveles/numeros.png" class="img-responsive" width="244" height="228"></a></div>
                      <%}else{
                       %><div class="col-sm-2"><img  src="Imagenes/niveles/numeros1.png" class="img-responsive" width="244" height="228"></div>     
                        <% }
                      %>
                      <div class="col-sm-1"></div>
                      <%
                        if(nivel.containsAll(u3)){
                      %><div class="col-sm-2"><a href="#c"><img onclick="un3();" src="Imagenes/niveles/conversacion.png" class="img-responsive" width="244" height="228"></a></div>
                      <%}else{
                       %><div class="col-sm-2"><img   src="Imagenes/niveles/conversacion1.png" class="img-responsive" width="244" height="228"></div>     
                        <% }
                      %>
                      <div class="col-sm-2"></div>
                      
                  </div>
                  <br><br>
                  <div class="row">
                      <div class="col-sm-2"></div>
                      <%
                        if(nivel.containsAll(u4)){
                      %><div class="col-sm-2"><a href="#a"><img onclick="un4();"  src="Imagenes/niveles/comida.png" class="img-responsive" width="244" height="228" ></a></div>
                      <%}else{
                       %><div class="col-sm-2"><img  src="Imagenes/niveles/comida1.png" class="img-responsive" width="244" height="228"></div>     
                        <% }
                      %>
                      <div class="col-sm-1"></div>
                      <%
                        if(nivel.containsAll(u5)){
                      %><div class="col-sm-2"><a href="#n"><img onclick="un5();" src="Imagenes/niveles/calendario.png" class="img-responsive" width="244" height="228"></a></div>
                      <%}else{
                       %><div class="col-sm-2"><img  src="Imagenes/niveles/calendario1.png" class="img-responsive" width="244" height="228"></div>     
                        <% }
                      %>
                      <div class="col-sm-1"></div>
                      <%
                        if(nivel.containsAll(u6)){
                      %><div class="col-sm-2"><a href="#c"><img onclick="un6();" src="Imagenes/niveles/emergencias.png" class="img-responsive" width="244" height="228"></a></div>
                      <%}else{
                       %><div class="col-sm-2"><img  src="Imagenes/niveles/emergencias1.png" class="img-responsive" width="244" height="228"></div>     
                        <% }
                      %>
                      <div class="col-sm-2"></div>
                  </div>  
            </div>
        </div>
        </div>


        <%--<div class="row">
            <div class="col-sm-4 img-responsive"><a href="#"><img src="Imagenes/menu_Principal/Diccionario.png" width="100%"></a></div>
            <div class="col-sm-4 img-responsive"><a href="#"><img src="Imagenes/menu_Principal/Nivel.png" width="100%"></a></div>
            <div class="col-sm-4 img-responsive"><a href="#"><img src="Imagenes/menu_Principal/practica.png" width="100%"></a></div> 
        </div>--%>
    </body>
</html>
