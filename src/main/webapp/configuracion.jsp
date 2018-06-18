<%-- 
    Document   : configuracion
    Created on : 22/11/2017, 04:19:44 PM
    Author     : erick
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Configución</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="Estilos/styleConfiguracion.css" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="JavaScripCodes/PrincipalFunciones.js"  type="text/javascript"></script>
    </head>
    <body>
        <script>
            var bandAvatar = false;
            var bandNombre = false;
            var bandContra = false;
            var id_avatar = "<%=user.getId_avatar()%>";
            function avatar1() {
                document.getElementById('cambio').src = 'Imagenes/Avatares/Elejido/1c.png';
                id_avatar = 1;
            }
            function avatar2() {
                document.getElementById('cambio').src = 'Imagenes/Avatares/Elejido/2c.png';
                id_avatar = 2;
            }
            function avatar3() {
                document.getElementById('cambio').src = 'Imagenes/Avatares/Elejido/3c.png';
                id_avatar = 3;
            }
            function avatar4() {
                document.getElementById('cambio').src = 'Imagenes/Avatares/Elejido/4c.png';
                id_avatar = 4;
            }
            function avatar5() {
                document.getElementById('cambio').src = 'Imagenes/Avatares/Elejido/5c.png';
                id_avatar = 5;
            }
            function avatar6() {
                document.getElementById('cambio').src = 'Imagenes/Avatares/Elejido/6c.png';
                id_avatar = 6;
            }
            function openChangeName() {
                document.getElementById('cambio-nombre').style.display = 'block';
            }
            function hiddeChangeName() {
                if (document.getElementById('nombre').value === "") {
                    document.getElementById('errorNombre').innerHTML = "No se aceptan campos vacios";
                } else {
                    document.getElementById('errorNombre').innerHTML = "";
                    document.getElementById('cambio-nombre').style.display = 'none';
                    bandNombre = true;
                }

            }
            function displayConCont() {
                document.getElementById('conf-pass').style.display = 'block';
            }

            var ajax;
            function funcionCallback() {
                //Comprobamos si la peticion se ha completado (estado 4)
                if (ajax.readyState == 4) {
                    //Comprobamos si la respuesta ha sido correcta (resultado HTTP 200)
                    if (ajax.status == 200) {
                        //Escribimos el resultado en la pagina HTML mediante DHTML                        
                        var respuesta = ajax.responseText.trim();
                        console.log(respuesta);
                        if (respuesta == "no") {
                            document.getElementById('errorPass').innerHTML = "Las contraseñas no coinciden";
                        } else {
                            document.getElementById('conf-pass').style.display = 'none';
                            document.getElementById('change-pass').style.display = 'block';
                            document.getElementById('errorPass').innerHTML = "";
                        }
                    }
                }
            }
            function compruebaPass() {
                if (document.getElementById('oldPass').value !== "") {
                    //Creamos el control XMLHttpRequest segun el navegador en el que estemos
                    //document.getElementById('descripcion').innerHTML= "Dio click";
                    if (window.XMLHttpRequest)
                        ajax = new XMLHttpRequest(); //No internet explorer
                    else
                        ajax = new ActiveXObject("Microsoft.XMLHTTP");//Internet Explorer

                    //Almacenamos en el control a la funcion que invocara cuando la peticion
                    //cambie de estado
                    ajax.onreadystatechange = funcionCallback;

                    //Enviamos la peticion 
                    var nickname = "<%=user.getNickname()%>";
                    ajax.open("GET", "AJAXCheckPasswrd.jsp?pass=" + document.getElementById('oldPass').value + "&nickname=" + nickname, true);
                    ajax.send(null);
                } else {
                    document.getElementById('errorPass').innerHTML = "El espacio está vacío";
                }
            }
            
            function hiddeChangePass() {
                if (document.getElementById('newPass').value !== "" || document.getElementById('confNewPass').value !== "") {
                    if (document.getElementById('newPass').value === document.getElementById('confNewPass').value) {
                        document.getElementById('change-pass').style.display = 'none';
                        document.getElementById('errorNewPass').innerHTML = "";
                        document.getElementById('oldPass').value = "";
                        bandContra = true;
                    } else {
                        document.getElementById('errorNewPass').innerHTML = "Las contraseñas no coinciden";
                    }
                } else {
                    document.getElementById('errorNewPass').innerHTML = "Hay campos vacios";
                }
            }
            function displayAvatars() {
                document.getElementById('select-avatar').style.display = 'block';
            }
            function hiddeChangeAvatar() {
                document.getElementById('select-avatar').style.display = 'none';
                bandAvatar = true;
            }

            function sendUpdate() {
                var nickname = "<%=user.getNickname()%>";
                var nombre = "<%=user.getNickname()%>";
                var pass = "<%=user.getPasswrd()%>";
                var avatar = "<%=user.getId_avatar()%>";
                band = 0;
                if (bandNombre)
                    nombre = document.getElementById("nombre").value;
                if (bandContra) {
                    pass = document.getElementById("newPass").value;
                    band = 1;
                }
                if (bandAvatar)
                    avatar = id_avatar;
                location.href = "checkCambiosConfig.jsp?nombre=" + nombre + "&pass=" + pass + "&avatar=" + avatar + "&nickname=" + nickname + "&band=" + band;
            }
        </script>
        <div class="container-fluid">
            <div class="row">
                <div class="row">
                    <div class="col-sm-9" style="background-color: rgb(69, 88, 121);">
                        <div class="row">
                            <div class="col-sm-3"><img class="pad img-responsive" src="Imagenes/menu_Principal/logo.png"></div>
                            <div class="col-sm-2 "><br><a href="Inicio.jsp"><img class="pad img-responsive" src="Imagenes/menu_Principal/regresar.png" width="65%"></a></div>
                            <div class="col-sm-7"></div>
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

                <div class="row">
                    <div class="col-sm-4"></div>
                    <div class="col-sm-4">
                        <div class="row"><br><br></div>
                        <div class="row text-center"><a href="#" onclick="displayAvatars()"><img class="img-responsive" src="Imagenes/Configuracion/btnCambioAvatar.png"></a></div>
                        <div class="row" id="select-avatar" style="display: none;">
                            <div class="col-sm-1"></div>
                            <div class="col-sm-10" style="align-items: center;"><br>                            
                                <div class="row">                                    
                                    <div class="col-sm-12 text-center"><label><img class="img-responsive" id="cambio" src="Imagenes/Avatares/Elejido/1c.png" width="100px;" height="100px" ></label></div>                                                                    
                                </div>
                                <div class="row" style="text-align: center;"><span class="letrasForm">Elige tu avatar</span></div>
                                <div class="row" id="imgBorder">
                                    <div class="col-sm-4"><img class="img-responsive" onclick="avatar1();" id="marco1" src="Imagenes/Avatares/Elije/1.jpg" width="100px;" height="100px"></div>
                                    <div class="col-sm-4"><img class="img-responsive" onclick="avatar2();" id="marco2" src="Imagenes/Avatares/Elije/2.jpg" width="100px;" height="100px"></div>
                                    <div class="col-sm-4"><img class="img-responsive" onclick="avatar3();" id="marco3" src="Imagenes/Avatares/Elije/3.jpg" width="100px;" height="100px"></div>
                                </div>
                                <div class="row" id="imgBorder">
                                    <div class="col-sm-4"><img class="img-responsive" onclick="avatar4();" id="marco4" src="Imagenes/Avatares/Elije/4.jpg" width="100px;" height="100px"></div>
                                    <div class="col-sm-4"><img class="img-responsive" onclick="avatar5();" id="marco5" src="Imagenes/Avatares/Elije/5.jpg" width="100px;" height="100px"></div>
                                    <div class="col-sm-4"><img class="img-responsive" onclick="avatar6();" id="marco6" src="Imagenes/Avatares/Elije/6.jpg" width="100px;" height="100px"></div>
                                </div>
                            </div>
                            <div class="row text-center">
                                <div class="col-sm-4"></div>
                                <div class="col-sm-4">
                                    <div class="row text-center"><a href="#" onclick="hiddeChangeAvatar()"><br><img class="img-responsive" src="Imagenes/Configuracion/btnConfirmarCambio.png"></a></div>
                                </div>
                                <div class="col-sm-4"></div>
                            </div>
                        </div>
                        <div class="row"><br><br><br></div>
                        <div class="row text-center"><a href="#" onclick="openChangeName()"><img class="img-responsive" src="Imagenes/Configuracion/btnCambioNombre.png"></a></div>
                        <div class="row" id="cambio-nombre" style="display: none;">
                            <div class="row text-center"><br><p class="errorMsg" id="errorNombre"></p></div>
                            <div class="row text-center"><br><input class="bor" id="nombre" type="text" value="<%=user.getNickname()%>"></div>
                            <div class="col-sm-4"></div>
                            <div class="col-sm-4">
                                <div class="row text-center"><a href="#" onclick="hiddeChangeName()"><br><img class="img-responsive" src="Imagenes/Configuracion/btnConfirmarCambio.png"></a></div>
                            </div>
                            <div class="col-sm-4"></div>
                        </div>
                        <div class="row"><br><br><br></div>
                        <div class="row text-center"><a href="#" onclick="displayConCont()"><img class="img-responsive" src="Imagenes/Configuracion/bntCambioConstrasena.png"></a></div>
                        <div class="row" id="conf-pass" style="display: none;">
                            <div class="row text-center"><br><p class="errorMsg" id="errorPass"></p></div>
                            <div class="row text-center"><br><p class="letrasForm">Confirmar Contraseña</p></div>                            
                            <div class="row"><br>
                                <input class="bor" id="oldPass" type="password">
                                <a href="#" onclick="compruebaPass()"><img src="Imagenes/Configuracion/btnConfirmarCambio.png"></a>
                            </div>
                        </div>
                        <div class="row" id="change-pass" style="display: none;">
                            <div class="row text-center"><br><p class="errorMsg" id="errorNewPass"></p></div>
                            <div class="col-sm-6" >
                                <div class="row text-center"><br><p class="letrasForm">Nueva Contraseña</p></div>
                                <input class="bor" id="newPass" type="password">
                            </div>
                            <div class="col-sm-6">
                                <div class="row text-center"><br><p class="letrasForm">Confirma Contraseña</p></div>
                                <input class="bor" id="confNewPass" type="password">
                            </div>
                            <div class="row">
                                <div class="col-sm-4"></div>
                                <div class="col-sm-4">
                                    <div class="row text-center"><a href="#" onclick="hiddeChangePass()"><br><img class="img-responsive" src="Imagenes/Configuracion/btnConfirmarCambio.png"></a></div>
                                </div>
                                <div class="col-sm-4"></div>
                            </div>
                        </div>

                        <div class="row"><br><br><br></div>
                        <div class="row text-center"><a href="#" onclick="sendUpdate()"><img class="img-responsive" src="Imagenes/Configuracion/btnConfirmar.png"></a></div>
                    </div>
                    <div class="col-sm-4"></div>
                </div>
            </div>
        </div>
    </body>
</html>
