<%-- 
    Document   : Inicio
    Created on : 20/11/2017, 02:17:44 PM
    Author     : erick
--%>
<%@page import="Clases.Nivel"%>
<%@page import="java.util.ArrayList"%>
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
        <%
            Nivel ejercicios = (Nivel) sesionOk.getAttribute("ejercicios");
            if (sesionOk.getAttribute("respuesta") != null) {
        %>
        <div class="modal fade" id="mostrarmodal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <%
                        if (sesionOk.getAttribute("respuesta").equals("correcta")) {
                    %>
                    <img class="pad img-responsive center" data-dismiss="modal" src="Imagenes/Ejercicios/correcto.png" width="80%">
                    <%
                    } else {
                    %>
                        <div class="row text-center center2">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8 text-center">
                                <img class="pad img-responsive" data-dismiss="modal" src="Imagenes/Ejercicios/incorrecto.png" >
                                <div class="row text-center"><span class="encabezado">Respuesta correcta</span></div>
                                <div class="row"><% out.println("<div class='row'><span class='res'>" + ejercicios.getNivel().get(0).getPalabra()+ "</span></div>");%></div> 
                            </div>                        
                            <div class="col-sm-2"></div>
                        </div>                                     
                    <%}%>

                </div>
            </div>
            <%
                }
            %>
        </div>

        <div class="modal fade" id="salir" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h3>¿Está seguro que desea salir?</h3>
                    </div>
                    <div class="modal-body">
                        <h4>Todo el avance se perdera de continuar</h4>
                    </div>
                    <div class="modal-footer">
                        <form method="POST" action="SalirNivel.jsp">
                            <button type="submit" class="btn btn-warning active">Aceptar</button>
                        </form>
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
                            <div class="col-sm-2 "><br><a onclick="salir()"><img class="pad img-responsive" width="65%" src="Imagenes/menu_Principal/regresar.png"></a></div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-3"><br><br><label id="puntaje"><%=ejercicios.getPuntaje()%></label></div>
                            <div class="col-sm-1"><br><img class="pad img-responsive" src="Imagenes/Ejercicios/estrella.png" id="estrella"></div>
                        </div>                
                    </div>
                    <div class="col-sm-3" style="background-color: rgb(147, 205, 207);">
                        <div class="col-sm-2"></div>
                        <div class="col-sm-8 text-center" >
                            <%
                                switch (user.getId_avatar()) {
                                    case 1:
                            %>
                            <div class="row"><img class="pad2" src="Imagenes/Avatares/Elejido/1c.png" width="108px" height="108px"></div>
                                <%
                                        break;
                                    case 2:
                                %>
                            <div class="row"><img class="pad2" src="Imagenes/Avatares/Elejido/2c.png" width="108px" height="108px"></div>
                                <%
                                        break;
                                    case 3:
                                %>
                            <div class="row"><img class="pad2" src="Imagenes/Avatares/Elejido/3c.png" width="108px" height="108px"></div>
                                <%
                                        break;
                                    case 4:
                                %>
                            <div class="row"><img class="pad2" src="Imagenes/Avatares/Elejido/4c.png" width="108px" height="108px"></div>
                                <%
                                        break;
                                    case 5:
                                %>
                            <div class="row"><img class="pad2" src="Imagenes/Avatares/Elejido/5c.png" width="108px" height="108px"></div>
                                <%
                                        break;
                                    case 6:
                                %>
                            <div class="row"><img class="pad2" src="Imagenes/Avatares/Elejido/6c.png" width="108px" height="108px"></div>
                                <%
                                        break;
                                    default:
                                %>
                            <div class="row"><img class="pad2" src="Imagenes/Avatares/Elejido/1c.png" width="108px" height="108px"></div>
                                <%
                                            break;
                                    }
                                    out.println("<div class='row'><span id='letras'>" + user.getNickname() + "</span></div>");
                                %>                                                             
                        </div>
                        <div class="col-sm-2"></div>
                    </div>
                </div>
                <div class="row">

                    <form method="POST" action="Preguntas.jsp" autocomplete="off">
                        <div class="row">
                            
                            <div class="row">
                                <div class="col-sm-4"></div>
                                <div class="col-sm-4">
                                    <label class="encabezado">Escriba el texto correspondiente a la imagen</label>
                                </div>
                                <div class="col-sm-4"></div>
                            </div>
                            
                            <div class="row">
                                <div class="col-sm-4"></div>
                                <div class="col-sm-4">
                                    <%
                                        String imagen = javax.xml.bind.DatatypeConverter.printBase64Binary(ejercicios.getNivel().get(0).getFoto());
                                    %>
                                    <img src="data:image/jpg;base64, <%=imagen%>" class=" pad img-responsive" id="imgEjercicio">
                                </div>
                                <div class="col-sm-4"></div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-sm-4"></div>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="entrada" name = "Respuesta" oninput="activarInput('entrada','Confirmar')" style="text-transform:uppercase;" onkeyup="javascript:this.value = this.value.toUpperCase();">
                                </div>
                                <div class="col-sm-4"></div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-sm-4"></div>
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

