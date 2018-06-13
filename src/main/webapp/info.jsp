<%-- 
    Document   : info
    Created on : 25/11/2017, 08:47:37 PM
    Author     : Jose
--%>

<%@page import="Clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario user;
    HttpSession sesionOk = request.getSession();
    user = (Usuario) sesionOk.getAttribute("usuario");
%>

<!DOCTYPE html>
<html>
    <head>
        <style>
            p{
                font-family: Arial; font-size: 15pt;text-align: justify
            }
            .pie{
                font-family: Arial; font-size: 10pt;text-align: justify
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sobre nosotros</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="Estilos/styleBusqueda.css" rel="stylesheet" type="text/css">
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
                        </div>
                        <div class="col-sm-2"></div>
                    </div>
                </div>
                <br>
                <div class="row text-center"><span id="letras2">¿Quiénes somos?</span></div>   
                <div class="row">
                    <br>
                </div>    
                <div class="col-sm-2"></div>
                <div class="col-sm-8"><span style="text-align: justify; font-family: Arial; font-size: 17pt;">
                        El equipo de Gesture Talk MX se enorgullese en presentar esta  
                        aplicación la cual esta hecha con amor, noches de desvelo y el deseo
                        de devolver algo a la comunidad con nuestro trabajo y ayuda de 
                        profesores y amigos.
                        Gestures Talk MX es una aplicación estilo juego en la cual podrás
                        aprender lenguaje a señas a tu ritmo de una manera divertida e intuitiva.
                    </span><br>
                    <p><strong>Misión:</strong> Contribuir a mitigar el desinterés social e indiferencia latente en las sociedades
                        para favorecer la inclusión de las minorías que sufren de una deficiencia auditiva y 
                        los problemas que esto representa. </p>

                    <p><strong>Visión:</strong> Generar un ambiente benévolo dentro de la sociedad a la que pertenecemos 
                        y erradicar las barreras de comunicación existentes y con ello la discriminación existente. </p>

                    <p><strong>¿Costo?:</strong>Este es un proyecto meramente altruista el cual busca un beneficio
                        social para contribuir a un bien común por lo cual es TOTALMENTE gratuito. </p>
                    <p class="">

                    </p>
                    <p><strong>Desarrolladores:</strong>                    
                        <p>- Erick Sanches Ruiz Esparza</p>
                        <p>- José Carlos Loera Salazar</p>
                        <p>- José Quintero Benítez</p>
                    </p>
                </div>
                <div class="col-sm-2"></div>
                <div class="row">
                    <br>
                </div>   
                <div class="col-sm-1"></div>
                <div class="col-sm-11">
                    <p class="pie">
                        <i>Este es un proyecto de estudiantes universitarios pertenecientes al
                            centro de ciencias básicas de la Universidad Autónoma de Aguascalietntes</i>
                    </p>
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