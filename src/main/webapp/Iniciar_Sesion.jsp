<%-- 
    Document   : Registro
    Created on : 8/11/2017, 07:42:56 AM
    Author     : erick
--%>
<%
    int flag = 0;
    if (request.getParameter("error") != null) {
        flag = 1;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log in</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="Estilos/styleInicio_Sesion.css" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="JavaScripCodes/PrincipalFunciones.js"  type="text/javascript"></script>
    </head>
    <body onresize="myFunction()" onchange="MinImage()"> 
        <script>
            var respuesta = "";
            var user = "";
            var ajax;
            function displayUser() {
                document.getElementById('conf-user').style.display = 'block';
                document.getElementById('conf-question').style.display = 'none';
                document.getElementById('change-pass').style.display = 'none';
            }



            function funcionCallback() {
                //Comprobamos si la peticion se ha completado (estado 4)
                if (ajax.readyState == 4) {
                    //Comprobamos si la respuesta ha sido correcta (resultado HTTP 200)
                    if (ajax.status == 200) {
                        //Escribimos el resultado en la pagina HTML mediante DHTML                        
                        var result = ajax.responseText.trim();
                        console.log(respuesta);
                        if (result == "no") {
                            document.getElementById('errorUser').innerHTML = "Usuario no encontrado";
                        } else {
                            var datos = result.split(',');
                            respuesta = datos[1];
                            user = document.getElementById('usuario').value;
                            document.getElementById('conf-user').style.display = 'none';
                            document.getElementById('conf-question').style.display = 'block';
                            document.getElementById('errorUser').innerHTML = "";

                            if (datos[0] == '1') {
                                document.getElementById('question').innerHTML = "¿Cuál es el nombre de tu primer mascota?";
                            } else if (datos[0] == '2') {
                                document.getElementById('question').innerHTML = "¿En que ciudad naciste?";
                            } else if (datos[0] == '3') {
                                document.getElementById('question').innerHTML = "¿Cuál es el nombre de tu madre?";
                            } else {
                                document.getElementById('question').innerHTML = "¿Cuál es tu comida favorita?";
                            }
                        }
                    }
                }
            }

            function callUser() {                
                if (document.getElementById('usuario').value !== "") {
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
                    ajax.open("GET", "AJAXCheckQuestion.jsp?user=" + document.getElementById('usuario').value, true);
                    ajax.send(null);
                } else {
                    document.getElementById('errorUser').innerHTML = "Campo vacío";
                }
            }

            function hiddeChangePass() {
                if (document.getElementById('newPass').value !== "" || document.getElementById('confNewPass').value !== "") {
                    if (document.getElementById('newPass').value === document.getElementById('confNewPass').value) {
                        document.getElementById('change-pass').style.display = 'none';
                        document.getElementById('errorNewPass').innerHTML = "";
                        document.getElementById('answer').value = "";
                        location.href = "CambioPass.jsp?user=" + user + "&pass=" + document.getElementById('newPass').value;
                    } else {
                        document.getElementById('errorNewPass').innerHTML = "Las contraseñas no coinciden";
                    }
                } else {
                    document.getElementById('errorNewPass').innerHTML = "Hay campos vacios";
                }
            }

            function verifyAnswer() {
                if (document.getElementById('answer').value !== "") {
                    var str = document.getElementById('answer').value;
                    var res = str.toUpperCase();
                    if (res === respuesta) {
                        document.getElementById('conf-question').style.display = 'none';
                        document.getElementById('change-pass').style.display = 'block';
                        document.getElementById('errorAnswer').innerHTML = "";
                    } else {
                        document.getElementById('errorAnswer').innerHTML = "Respuesta incorrecta";
                    }
                } else {
                    document.getElementById('errorAnswer').innerHTML = "Campo vacío";
                }
            }
        </script>
        <audio  preload="auto"> 
            <source src="Sonidos/click.mp3" controls></source>
            <source src="Sonidos/click.ogg" controls></source>
            Your browser isn't invited for super fun audio time.
        </audio> 
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4"> <br><br><br><br>
                <div class="row" id="textIn">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-8 text-center"><br>
                        <div class="row"><img src="Imagenes/InicioSesion/LogoInicioSesion.png" class="img-responsive"></div><br>                        
                        <form action="CheckLogin.jsp" method="post">
                            <div class="row">
                                <%
                                    if (request.getParameter("agregado") != null) {
                                        out.println("<span class='agregado'>" + request.getParameter("agregado") + "</span>");
                                    }
                                    if (request.getParameter("cambioPass") != null) {
                                        out.println("<span class='agregado'>" + request.getParameter("cambioPass") + "</span>");
                                    }
                                %>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <label id="letras" for="usr">Usuario</label>
                                    <input type="text" class="form-control bordes" id="usr" name="usr">
                                </div>
                            </div><br>
                            <div class="row">
                                <div class="col-sm-12">
                                    <label id="letras" for="pssw">Contraseña</label>
                                    <input type="password" class="form-control bordes" id="pssw" name="pssw" size="20">
                                </div>
                            </div>                    
                            <div class="row">
                                <div class="col-sm-12">
                                    <a href="#" class="subrayado texto-margen" id="letras" onclick="displayUser()">¿Has olvidado tu contraseña?</a>
                                </div>
                                <div class="row" id="conf-user" style="display: none;">
                                    <div class="row text-center"><br><p class="errorMsg" id="errorUser"></p></div>
                                    <div class="row text-center"><br><p class="letrasForm">Escribe el usuario</p></div>                            
                                    <div class="row"><br>
                                        <input class="bor" id="usuario" type="text">
                                        <a href="#" onclick="callUser()"><img src="Imagenes/Configuracion/btnConfirmarCambio.png"></a>
                                    </div>
                                </div>
                                <div class="row" id="conf-question" style="display: none;">
                                    <div class="row text-center"><br><span class="errorMsg" id="errorAnswer"></span></div>
                                    <div class="row text-center"><br><span class="letrasForm" id="question"></span></div>                            
                                    <div class="row"><br>
                                        <input class="bor" id="answer" type="text">
                                        <a href="#" onclick="verifyAnswer()"><img src="Imagenes/Configuracion/btnConfirmarCambio.png"></a>
                                    </div>
                                </div>
                                <div class="row" id="change-pass" style="display: none;">
                                    <div class="row text-center"><br><p class="errorMsg" id="errorNewPass"></p></div>
                                    <div class="row">
                                        <div class="col-sm-12" >
                                            <div class="row text-center"><br><p class="letrasForm">Nueva Contraseña</p></div>
                                            <input class="bor" id="newPass" type="password">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="row text-center"><br><p class="letrasForm">Confirma Contraseña</p></div>
                                            <input class="bor" id="confNewPass" type="password">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4"></div>
                                        <div class="col-sm-4">
                                            <div class="row text-center"><a href="#" onclick="hiddeChangePass()"><br><img class="img-responsive" src="Imagenes/Configuracion/btnConfirmarCambio.png"></a></div>
                                        </div>
                                        <div class="col-sm-4"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row"><br></div>
                            <div class="row">
                                <%if (flag == 1) {%>
                                <div class="row text-center">                            
                                    <div class="col-sm-12"><img src="Imagenes/InicioSesion/opcIncorrecta.png" class="img-responsive"></div>                                    
                                </div><br>        
                                <%}%>
                                <div class="row" id="efecto">
                                    <div class="col-sm-12">
                                        <input type="image" src="Imagenes/InicioSesion/btnInicio.png" alt="Submit Form" />
                                        <%--<img src="Imagenes/InicioSesion/btnInicio.png" id="ImgData" class="img-responsive" onmouseover="playclip();">--%>
                                    </div>                                
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-sm-2"></div>
                    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                    <br><br><br><br><br><br><br><br><br><br><br>
                </div>                
            </div>                
            <div class="col-sm-4"></div>
        </div>
    </body>
</html>
