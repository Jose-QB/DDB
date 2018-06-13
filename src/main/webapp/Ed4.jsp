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
        <link href="Estilos/styleEjercicios.css" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="JavaScripCodes/PrincipalFunciones.js"  type="text/javascript"></script>
        <script src="JavaScripCodes/FuncionesEjercicios.js" type="text/javascript"></script>
    </head>
    <body>
        
        <div class="modal fade" id="respuestas" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="modal hide fade in" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h3>¡FELICIDADES!</h3>
                        <h5>¡DEMO COMPLETADO!</h5>
                    </div>
                    <div class="modal-body row" id="extra">

                    </div>
                    <div class="modal-footer">
                        <div class="row">
                            <div class="col-sm-6" id="mas"></div>
                            <div class="col-sm-6">
                                <form method="POST" action="Principal.jsp">
                                    <button type="submit" class="btn btn-warning active">Continuar</button>
                                </form>
                            </div>
                        </div>    
                    </div>
                </div>
            </div>
        </div>

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
                        <div class="col-sm-2"></div>
                    </div>
                </div>
                <div class="row">

                    <form method="POST" onsubmit="" name="examen">

                        <div class="row">
                            <br>
                            <div class="row">
                                <div class="col-sm-4"></div>
                                <div class="col-sm-4">
                                    <label class="encabezado">BONUS</label>
                                </div>
                                <div class="col-sm-4"></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-2">
                                    <img src="Imagenes/Demo/a.jpg" class="pad img-responsive imgRespuesta">
                                </div>
                                <div class="col-sm-1"></div>
                                <div class="col-sm-2">
                                    <img src="Imagenes/Demo/b.jpg" class="pad img-responsive imgRespuesta">
                                </div>
                                <div class="col-sm-1"></div>
                                <div class="col-sm-2">
                                    <img src="Imagenes/Demo/c.jpg" class="pad img-responsive imgRespuesta">
                                </div>
                                <div class="col-sm-2"></div>
                            </div>
                            <div>
                                <br>
                            </div>
                            <div class="row">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-2">                                    
                                    <div class="row">
                                        <label class="radio-inline">
                                            <input type="radio" name="c1" value="a" onclick="activarExamen()">
                                            <label class="encabezado1 label label-warning respuesta">A</label>
                                        </label>
                                    </div>
                                    <div class="row"><br></div>
                                    <div class="row">
                                        <label class="radio-inline">
                                            <input type="radio" name="c1" value="b" onclick="activarExamen()">
                                            <label class="encabezado1 label label-warning respuesta" >B</label>
                                        </label>
                                    </div>
                                    <div class="row"><br></div>
                                    <div class="row">
                                        <label class="radio-inline">
                                            <input type="radio" name="c1" value="c" onclick="activarExamen()">
                                            <label class="encabezado1 label label-warning respuesta" >C</label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-sm-1"></div>
                                <div class="col-sm-2">                                    
                                    <div class="row">
                                        <label class="radio-inline">
                                            <input type="radio" name="c2" value="a" onclick="activarExamen()">
                                            <label class="encabezado1 label label-warning respuesta">A</label>
                                        </label>
                                    </div>
                                    <div class="row"><br></div>
                                    <div class="row">
                                        <label class="radio-inline">
                                            <input type="radio" name="c2" value="b" onclick="activarExamen()">
                                            <label class="encabezado1 label label-warning respuesta" >B</label>
                                        </label>
                                    </div>
                                    <div class="row"><br></div>
                                    <div class="row">
                                        <label class="radio-inline">
                                            <input type="radio" name="c2" value="c" onclick="activarExamen()">
                                            <label class="encabezado1 label label-warning respuesta" >C</label>
                                        </label>
                                    </div>

                                </div>
                                <div class="col-sm-1"></div>
                                <div class="col-sm-2">
                                    <div class="row"><br></div>
                                    <div class="row">
                                        <label class="radio-inline">
                                            <input type="radio" name="c3" value="a" onclick="activarExamen()">
                                            <label class="encabezado1 label label-warning respuesta">A</label>
                                        </label>
                                    </div>
                                    <div class="row"><br></div>
                                    <div class="row">
                                        <label class="radio-inline">
                                            <input type="radio" name="c3" value="b" onclick="activarExamen()">
                                            <label class="encabezado1 label label-warning respuesta" >B</label>
                                        </label>
                                    </div>
                                    <div class="row"><br></div>
                                    <div class="row">
                                        <label class="radio-inline">
                                            <input type="radio" name="c3" value="c" onclick="activarExamen()">
                                            <label class="encabezado1 label label-warning respuesta" >C</label>
                                        </label>
                                    </div>

                                </div>
                                <div class="col-sm-2"></div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-sm-4"></div>
                                <div class="col-sm-4">
                                    <button type="button" class="btn btn-warning respuesta" disabled id="Confirmar" onclick="extras()">Confirmar</button></div>
                                <div class="col-sm-4">
                                    <div class="row">
                                        <input type="text" id = "resp1" name="re1" value="a">
                                    </div>
                                    <div class="row">
                                        <input type="text" id = "resp2" name="re2" value="b">
                                    </div>
                                    <div class="row">
                                        <input type="text" id = "resp3" name="re3" value="c">
                                    </div>
                                </div>
                            </div>

                        </div>
                    </form>

                </div>
            </div>
        </div>
    </body>
</html>

