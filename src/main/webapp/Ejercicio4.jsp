<%-- 
    Document   : Inicio
    Created on : 20/11/2017, 02:17:44 PM
    Author     : erick
--%>
<%@page import="java.util.Collections"%>
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
            Nivel ejercicios = (Nivel) sesionOk.getAttribute("examen");
            if (sesionOk.getAttribute("respuesta") != null) {
        %>
        <div class="modal fade" id="mostrarmodal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <%
                        if (sesionOk.getAttribute("respuesta").equals("correcta")) {
                    %>
                    <img class="pad img-responsive" data-dismiss="modal" src="Imagenes/Ejercicios/correcto.png" >
                    <%
                    } else {
                    %>
                    <img class="pad img-responsive" data-dismiss="modal" src="Imagenes/Ejercicios/incorrecto.png" >
                    <%
                        }
                    %>

                </div>
            </div>
            <%
                }
            %>
        </div>

        <div class="modal fade" id="respuestas" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="modal hide fade in" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h3>¡FELICIDADES!</h3>
                        <h5>¡NIVEL COMPLETADO!</h5>
                    </div>
                    <div class="modal-body row" id="extra">

                    </div>
                    <div class="modal-footer">
                        <div class="row">
                            <div class="col-sm-6" id="mas"></div>
                            <div class="col-sm-6">
                                <form method="POST" action="NivelCompleto.jsp" name="finalizo">
                                    <button type="submit" class="btn btn-warning active">Continuar</button>
                                    <input id="final" name="calif">
                                </form>
                            </div>
                        </div>    
                    </div>
                </div>
            </div>
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
                            <div class="col-sm-3"><br><br><label id="puntaje"><%=ejercicios.getPuntaje()%><input id="punto" value="<%=ejercicios.getPuntaje()%>"></label></div>
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

                    <%
                        ArrayList<String> valor = new ArrayList<String>();
                        ArrayList<String> real = new ArrayList<String>();
                        ArrayList<byte[]> resp = new ArrayList<byte[]>();

                        valor.add(ejercicios.getNivel().get(0).getPalabra());
                        valor.add(ejercicios.getNivel().get(0).getRf1());
                        valor.add(ejercicios.getNivel().get(0).getRf2());
                        real.add(ejercicios.getNivel().get(0).getPalabra());
                        real.add(ejercicios.getNivel().get(0).getRf1());
                        real.add(ejercicios.getNivel().get(0).getRf2());
                        resp.add(ejercicios.getNivel().get(0).getFoto());
                        resp.add(ejercicios.getNivel().get(0).getFf1());
                        resp.add(ejercicios.getNivel().get(0).getFf2());

                        Collections.shuffle(valor);

                    %>  

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
                                    <img src="data:image/jpg;base64, <%=javax.xml.bind.DatatypeConverter.printBase64Binary(resp.get(0))%>" class="pad img-responsive imgRespuesta">
                                </div>
                                <div class="col-sm-1"></div>
                                <div class="col-sm-2">
                                    <img src="data:image/jpg;base64, <%=javax.xml.bind.DatatypeConverter.printBase64Binary(resp.get(1))%>" class="pad img-responsive imgRespuesta">
                                </div>
                                <div class="col-sm-1"></div>
                                <div class="col-sm-2">
                                    <img src="data:image/jpg;base64, <%=javax.xml.bind.DatatypeConverter.printBase64Binary(resp.get(2))%>" class="pad img-responsive imgRespuesta">
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
                                            <input type="radio" name="c1" value="<%=valor.get(0)%>" onclick="activarExamen()">
                                            <label class="encabezado1 label label-warning respuesta"><%=valor.get(0)%></label>
                                        </label>
                                    </div>
                                    <div class="row">
                                        <div class="row"><br></div>
                                        <label class="radio-inline">
                                            <input type="radio" name="c1" value="<%=valor.get(1)%>" onclick="activarExamen()">
                                            <label class="encabezado1 label label-warning respuesta" ><%=valor.get(1)%></label>
                                        </label>
                                    </div>
                                        <div class="row"><br></div>
                                    <div class="row">
                                        <label class="radio-inline">
                                            <input type="radio" name="c1" value="<%=valor.get(2)%>" onclick="activarExamen()">
                                            <label class="encabezado1 label label-warning respuesta" ><%=valor.get(2)%></label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-sm-1"></div>
                                <div class="col-sm-2">

                                    <div class="row">
                                        <label class="radio-inline">
                                            <input type="radio" name="c2" value="<%=valor.get(0)%>" onclick="activarExamen()">
                                            <label class="encabezado1 label label-warning respuesta"><%=valor.get(0)%></label>
                                        </label>
                                    </div>
                                        <div class="row"><br></div>
                                    <div class="row">
                                        <label class="radio-inline">
                                            <input type="radio" name="c2" value="<%=valor.get(1)%>" onclick="activarExamen()">
                                            <label class="encabezado1 label label-warning respuesta" ><%=valor.get(1)%></label>
                                        </label>
                                    </div>
                                        <div class="row"><br></div>
                                    <div class="row">
                                        <label class="radio-inline">
                                            <input type="radio" name="c2" value="<%=valor.get(2)%>" onclick="activarExamen()">
                                            <label class="encabezado1 label label-warning respuesta" ><%=valor.get(2)%></label>
                                        </label>
                                    </div>

                                </div>
                                <div class="col-sm-1"></div>
                                <div class="col-sm-2">

                                    <div class="row">
                                        <label class="radio-inline">
                                            <input type="radio" name="c3" value="<%=valor.get(0)%>" onclick="activarExamen()">
                                            <label class="encabezado1 label label-warning respuesta"><%=valor.get(0)%></label>
                                            <br>
                                        </label>
                                    </div>
                                            <div class="row"><br></div>
                                    <div class="row">
                                        <label class="radio-inline">
                                            <input type="radio" name="c3" value="<%=valor.get(1)%>" onclick="activarExamen()">
                                            <label class="encabezado1 label label-warning respuesta" ><%=valor.get(1)%></label>
                                            <br>
                                        </label>
                                    </div>
                                    <div class="row"><br></div>
                                    <div class="row">
                                        <label class="radio-inline">
                                            <input type="radio" name="c3" value="<%=valor.get(2)%>" onclick="activarExamen()">
                                            <label class="encabezado1 label label-warning respuesta" ><%=valor.get(2)%></label>
                                            <br>
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
                                        <input type="text" id = "resp1" name="re1" value="<%=real.get(0)%>">
                                    </div>
                                    <div class="row">
                                        <input type="text" id = "resp2" name="re2" value="<%=real.get(1)%>">
                                    </div>
                                    <div class="row">
                                        <input type="text" id = "resp3" name="re3" value="<%=real.get(2)%>">
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

