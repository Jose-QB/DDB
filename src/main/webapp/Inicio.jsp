<%-- 
    Document   : Inicio
    Created on : 20/11/2017, 02:17:44 PM
    Author     : erick
--%>
<%@page import="Clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario user;
    HttpSession sesionOk = request.getSession();
    user = (Usuario) sesionOk.getAttribute("usuario");
    sesionOk.setAttribute("respuesta", null);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menú principal</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="Estilos/styleInicio.css" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="JavaScripCodes/PrincipalFunciones.js"  type="text/javascript"></script>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="row">
                    <div class="col-sm-9" style="background-color: rgb(69, 88, 121);">
                        <div class="row">
                            <div class="col-sm-3"><img class="pad img-responsive" src="Imagenes/menu_Principal/logo.png"></div>
                            <div class="col-sm-2 "><br><a href="cerrarSesion.jsp"><img class="pad img-responsive" src="Imagenes/menu_Principal/salir.png" width="65%"></a></div>                            
                            <div class="col-sm-3 text-center "><br><br><br><a href="info.jsp"><span class="subrayado" id="letras">Sobre nosotros </span></a><img src="Imagenes/menu_Principal/punto.png"></div>
                            <div class="col-sm-3 text-center "><br><br><br><a href="puntaje.jsp"><span class="subrayado" id="letras">Tu puntaje </span></a><img src="Imagenes/menu_Principal/punto.png"></div>
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
                        </div>
                        <div class="col-sm-2"></div>
                    </div>
                </div>
                <div class="row"><br><br>
                    <div class="col-sm-1"></div>
                    <div class="col-sm-10">
                        <div class="row">
                            <!-- AQUI INICIA EL SLIDER -->
                            <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
          <a href="Inicio.jsp"><img src="Imagenes/menu_Principal/Tarjeta.png" alt="Principal" style="width:100%;"></a>
      </div>

      <div class="item">
          <a href="info.jsp"><img src="Imagenes/menu_Principal/Tarjeta2.png" alt="SobreNosotros" style="width:100%;"></a>
      </div>
    
      <div class="item">
        <a href="Busqueda.jsp"><img src="Imagenes/menu_Principal/Tarjeta3.png" alt="Buscar" style="width:100%;"></a>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Anterior</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Siguiente</span>
    </a>
  </div>      
                                <div class="row">
                                    <div class="col-sm-4"><a href="Busqueda.jsp"><img  src="Imagenes/menu_Principal/Diccionario.png" class="img-responsive"></a></div>
                                    <div class="col-sm-4"><a href="Escoger.jsp"><img  src="Imagenes/menu_Principal/Nivel.png" class="img-responsive"></a></div>
                                    <div class="col-sm-4"><a href="configuracion.jsp"><img src="Imagenes/menu_Principal/configuracion.png" class="img-responsive"></a></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-1"></div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

