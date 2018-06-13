<%-- 
    Document   : Inicio
    Created on : 20/11/2017, 02:17:44 PM
    Author     : erick
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menú principal</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="Estilos/styleInicio.css" rel="stylesheet" type="text/css">
        <link href="Estilos/styleEjercicios.css" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="JavaScripCodes/PrincipalFunciones.js"  type="text/javascript"></script>
        <script src="JavaScripCodes/FuncionesEjercicios.js" type="text/javascript"></script>
    </head>
    <body>
        
        <div class="container-fluid">
            <div class="row">
                <div class="row">
                    <div class="col-sm-9" style="background-color: rgb(69, 88, 121);">
                        <div class="row">
                            <div class="col-sm-3"><img class="pad img-responsive" src="Imagenes/menu_Principal/logo.png"></div>
                            <div class="col-sm-3"></div>
                            <div class="col-sm-3"><br><br><label id="puntaje">10</label></div>
                            <div class="col-sm-1"><br><img class="pad img-responsive" src="Imagenes/Ejercicios/estrella.png" id="estrella"></div>
                        </div>                
                    </div>
                    <div class="col-sm-3" style="background-color: rgb(147, 205, 207);">
                        <div class="col-sm-2"></div>
                        <div class="col-sm-8 text-center" >
                            <div class="row"><img class="pad2" src="Imagenes/Avatares/Elejido/1c.png" width="108px" height="108px"></div>                                                             
                            <%out.println("<div class='row'><span id='letras'>Invitado</span></div>");%>
                        </div>
                        <div class="col-sm-2"></div>
                    </div>
                </div>
                <div class="row">
<%
    String p1 = (String)request.getParameter("p1");
    String p2 = (String)request.getParameter("p2");
    String p3 = (String)request.getParameter("p3");
    String jsp = "Ed2.jps?=" + p1 + "&p2=" + p2 + "&p3=" + p3 ;
%>                    
                    <form method="POST" action="Ed3.jsp?p1=A&p2=B&p3=C">

                        <div class="row">
                            <br>
                            <div class="row">
                                <div class="col-sm-4"></div>
                                <div class="col-sm-4">
                                    <label class="encabezado">Elija la imagen correspondiente al texto</label>
                                </div>
                                <div class="col-sm-4"></div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-sm-4"></div>
                                <div class="col-sm-4">
                                    <label class="encabezado" >B</label>
                                </div>
                                <div class="col-sm-4"></div>
                            </div>
                            <br><br>
                            <div class="row">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-2">
                                    <button type="button" class="btn btn-default active respuesta" onclick="activar('Confirmar', value)" value="B">
                                        <img src="Imagenes/Demo/b.jpg" class="pad img-responsive imgRespuesta">
                                    </button>
                                </div>
                                <div class="col-sm-1"></div>
                                <div class="col-sm-2">
                                    <button type="button" class="btn btn-default active respuesta" onclick="activar('Confirmar', value)" value="A">
                                        <img src="Imagenes/Demo/a.jpg" class="pad img-responsive imgRespuesta">
                                    </button>
                                </div>
                                <div class="col-sm-1"></div>
                                <div class="col-sm-2">
                                    <button type="button" class="btn btn-default active respuesta" onclick="activar('Confirmar', value)" value="C">
                                        <img src="Imagenes/Demo/c.jpg" class="pad img-responsive imgRespuesta">
                                    </button>
                                </div>
                                <div class="col-sm-2"></div>
                            </div>
                            <br><br>
                            <div class="row">
                                <div class="col-sm-4">
                                    <input type="text" id = "resp" name = "Respuesta">
                                </div>
                                <div class="col-sm-4">
                                    <button type="submit" class="btn btn-warning respuesta" disabled id="Confirmar">Confirmar</button></div>
                                <div class="col-sm-4"></div>
                            </div>

                        </div>
                    </form>

                </div>
            </div>
        </div>
    </body>
</html>

