<%-- 
    Document   : puntaje
    Created on : 25/11/2017, 07:57:35 PM
    Author     : erick
--%>

<%@page import="Clases.Usuario"%>
<jsp:useBean id="objConn" class="mysql.MySqlConexion"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Usuario user;
    HttpSession sesionOk = request.getSession();
    user = (Usuario) sesionOk.getAttribute("usuario");
    int puntaje=0;
    String consulta = "select * from puntajeusuario where id_usuario=" + user.getId_usuario() + ";";
    objConn.Consultar(consulta);
    if (objConn.rs.getRow() != 0) {
        puntaje = objConn.rs.getInt(2);
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Puntaje</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="Estilos/stylePuntaje.css" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="JavaScripCodes/PrincipalFunciones.js"  type="text/javascript"></script>
    </head>
    <body>
        <div class="container-fluid">
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
                        <%                            switch (user.getId_avatar()) {
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
            <div class="row"><br><br></div>
            <div class="row">
                <div class="col-sm-1"></div>
                <div class="col-sm-5">
                    <img src="Imagenes/Puntuacion/trofeo.png" class="img-responsive" width="80%">
                </div>
                <div class="col-sm-6">
                    <div class="row tuPuntaje text-center"><br><span class="stylePuntaje">Tú puntaje</span><br><br></div>
                    <div class="row"><br><br></div>
                    <div class="row puntos text-center"><br><%out.println("<span class='stylePuntos'>" + puntaje + "</span>");%><br><br></div>
                    <div class="row"><br><br></div>
                    <div class="row text-center"><img src="Imagenes/Puntuacion/sigueEsforzandote.png" class="img-responsive"></div>
                </div>                
            </div>
        </div>
    </body>
</html>
