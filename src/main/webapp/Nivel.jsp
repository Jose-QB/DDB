<%-- 
    Document   : Nivel
    Created on : 25/11/2017, 11:08:54 PM
    Author     : Jose
--%>

<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Usuario"%>
<jsp:useBean id="objConn" class="mysql.MySqlConexion"/>
<%
    Usuario user;
    HttpSession sesionOk = request.getSession();
    user = (Usuario) sesionOk.getAttribute("usuario");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int unidad = Integer.parseInt(request.getParameter("unidad"));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Escoge Nivel</title>
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
                function e1(){
                    location.href = "LlamaNivel.jsp?nivel="+1;
                }
                function e2(){
                    location.href = "LlamaNivel.jsp?nivel="+2;
                }
                function e3(){
                    location.href = "LlamaNivel.jsp?nivel="+3;
                }
                function e4(){
                    location.href = "LlamaNivel.jsp?nivel="+4;
                }
                function e5(){
                    location.href = "LlamaNivel.jsp?nivel="+5;
                }
                function e6(){
                    location.href = "LlamaNivel.jsp?nivel="+6;
                }
                function e7(){
                    location.href = "LlamaNivel.jsp?nivel="+7;
                }
                function e8(){
                    location.href = "LlamaNivel.jsp?nivel="+8;
                }
                function e9(){
                    location.href = "LlamaNivel.jsp?nivel="+9;
                }
                function e10(){
                    location.href = "LlamaNivel.jsp?nivel="+10;
                }
                function e11(){
                    location.href = "LlamaNivel.jsp?nivel="+11;
                }
                function e12(){
                    location.href = "LlamaNivel.jsp?nivel="+12;
                }
                function e13(){
                    location.href = "LlamaNivel.jsp?nivel="+13;
                }
                function e14(){
                    location.href = "LlamaNivel.jsp?nivel="+14;
                }
                
   
        </script>
        <div class="container-fluid">
            <div class="row">
                
                <div class="row">
                    <div class="col-sm-9" style="background-color: rgb(69, 88, 121);">
                        <div class="row">
                            <div class="col-sm-3"><img class="pad img-responsive" src="Imagenes/menu_Principal/logo.png"></div>
                            <div class="col-sm-2 "><br><a href="Escoger.jsp"><img class="pad img-responsive" src="Imagenes/menu_Principal/regresar.png" width="65%"></a></div>
                             </div>                
                    </div>
                    <div class="col-sm-3" style="background-color: rgb(147, 205, 207);">
                        <div class="col-sm-2"></div>
                        <div class="col-sm-8 text-center" >
                            <%
                                switch (user.getId_avatar()) {
                                    case 1:
                            %><div class="row"><a><img class="pad2" src="Imagenes/Avatares/Elejido/1c.png" width="108px" height="108px"></a></div><%
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
                         /*La consulta siguiente es para obtener el numero de niveles que hay en la unidad escogida
                           Dependiendo de la unidad elegida se mostraran las imagenes especificadas
                           y el padding que tendrá cada una*/
//obtener usuario y el numero de niveles terminados---------------------------------------------------------------------------------                                    
                        String consulta = "select count(id_nivel) from nivel where id_unidad='" + unidad + "';";
                        objConn.Consultar(consulta);
                        int x = objConn.rs.getInt(1);;
                       // ArrayList<Integer> nivel = new ArrayList();
                       
                       
                      //  ResultSetMetaData metaData = objConn.rs.getMetaData();
                       
                     /*   while(objConn.rs.next()){
                    //            nivel.add(objConn.rs.getInt(1));
                        }*/
                        if (x == 3){
                      %>
                      <div class="col-sm-2"></div>
                      <%   if(unidad == 1){
                      %>
                      <div class="col-sm-2"><a href="#a" > <img onclick="e1();"  src="Imagenes/niv/abc1.png" class="img-responsive" width="244" height="228" ></a></div>
                        <div class="col-sm-1"></div>
                      <div class="col-sm-2"><a href="#a" > <img onclick="e2();" src="Imagenes/niv/abc2.png" class="img-responsive" width="244" height="228" ></a></div>  
                        <div class="col-sm-1"></div>
                       <div class="col-sm-2"><a href="#a" > <img onclick="e3();" src="Imagenes/niv/abc3.png" class="img-responsive" width="244" height="228" ></a></div>  
                        <%   }else if(unidad == 3){
                      %>
                      <div class="col-sm-2"><a href="#a" > <img onclick="e6();" src="Imagenes/niv/salud.png" class="img-responsive" width="244" height="228" ></a></div>
                      <div class="col-sm-1"></div>
                      <div class="col-sm-2"><a href="#a" > <img onclick="e7();" src="Imagenes/niv/adj.png" class="img-responsive" width="244" height="228" ></a></div>  
                        <div class="col-sm-1"></div>
                       <div class="col-sm-2"><a href="#a" > <img onclick="e8();" src="Imagenes/niv/pron.png" class="img-responsive" width="244" height="228" ></a></div>
                      <%   }else if(unidad == 5){
                      %>
                      <div class="col-sm-2"><a href="#a" > <img onclick="e11();" src="Imagenes/niv/di1.png" class="img-responsive" width="244" height="228" ></a></div>
                      <div class="col-sm-1"></div>
                      <div class="col-sm-2"><a href="#a" > <img onclick="e12();" src="Imagenes/niv/d2.png" class="img-responsive" width="244" height="228" ></a></div>  
                        <div class="col-sm-1"></div>
                       <div class="col-sm-2"><a href="#a" > <img onclick="e13();" src="Imagenes/niv/tiem.png" class="img-responsive" width="244" height="228" ></a></div>
                      <%   }
                      %>
                      <div class="col-sm-2"></div>
                      <%
                        } else if(x == 2){
                      %>
                      <div class="col-sm-3"></div>
                      <%   if(unidad == 2){
                      %>
                      <div class="col-sm-2"><a href="#a" > <img onclick="e4();" src="Imagenes/niv/num1.png" class="img-responsive" width="244" height="228" ></a></div>
                        <div class="col-sm-2"></div>
                      <div class="col-sm-2"><a href="#a" > <img onclick="e5();" src="Imagenes/niv/num2.png" class="img-responsive" width="244" height="228" ></a></div>     
                        <% }else if(unidad == 4){
                      %>
                      <div class="col-sm-2"><a href="#a" > <img onclick="e9();" src="Imagenes/niv/beb.png" class="img-responsive" width="244" height="228" ></a></div>
                        <div class="col-sm-2"></div>
                      <div class="col-sm-2"><a href="#a" > <img onclick="e10();" src="Imagenes/niv/com.png" class="img-responsive" width="244" height="228" ></a></div>  
                      <%   }
                      %>
                       <div class="col-sm-3"></div>
                      <%}else if (x == 1){
                      %>
                       <div class="col-sm-5"></div>
                       <div class="col-sm-2"><a href="#a" > <img onclick="e14();" src="Imagenes/niv/acc.png" class="img-responsive" width="244" height="228" ></a></div>
                        <div class="col-sm-5"></div>
                      <%}
                      %>
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