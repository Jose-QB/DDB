<%-- 
    Document   : Registro
    Created on : 12/11/2017, 06:56:19 PM
    Author     : erick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="Estilos/styleRegistro.css" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="JavaScripCodes/PrincipalFunciones.js"  type="text/javascript"></script>
        <%--<script src="JavaScripCodes/FuncionesRegistro.js"  type="text/javascript"></script>--%>
    </head>
    <body onresize="myFunction()" onchange="MinImage()">
        <script>
            var id_avatar = 1;
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

            function submit() {
                document.getElementsByName("error").innerHTML = "Entro";
                //document.getElementById("demo").innerHTML= "Dí click";
                if (document.getElementById('usr').value != "" && document.getElementById('pass').value != "" && document.getElementById('coPass') != "" && document.getElementById('respuesta') != "") {
                    var usr = document.getElementById('usr').value;
                    var pass = document.getElementById('pass').value;
                    var confpass = document.getElementById('coPass').value;
                    var e = document.getElementById("pregunta");
                    var pregunta = e.options[e.selectedIndex].value;
                    var respuesta = document.getElementById('respuesta').value;
                    if (pass == confpass) {
                        location.href = "altaUsuario.jsp?usr=" + usr + "&pass=" + pass + "&pregunta=" + pregunta + "&respuesta=" + respuesta + "&avatar=" + id_avatar;
                    } else {
                        document.getElementsByName("error").innerHTML = "Las contraseñas no coinciden ";
                    }
                }else{
                    document.getElementById("error").innerHTML="Hay camposo vacíos";
                }
            }
        </script>
        <audio  preload="auto"> 
            <source src="Sonidos/click.mp3" controls></source>
            <source src="Sonidos/click.ogg" controls></source>
            Your browser isn't invited for super fun audio time.
        </audio> 
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8"><br><br>
                <div class="row" id="textIn">
                    <%--<form action="CheckLogin.jsp" method="post">--%>
                    <div class="col-sm-6"><br><br>
                        <div class="col-sm-1"></div>
                        <div class="col-sm-10">                            
                            <div class="row" style="text-align: center;"><span class="letras">Usuario</span></div>
                            <div class="row"><input type="text" class="bordes" id="usr"></div><br><br>
                            <div class="row" style="text-align: center;"><span class="letras">Contraseña</span></div>
                            <div class="row"><input type="password" class="bordes" id="pass"></div><br><br><br>
                            <div class="row" style="text-align: center;"><span class="letras">Confirmar contraseña</span></div>
                            <div class="row"><input type="password" class="bordes" id="coPass"></div><br><br><br>
                            <div class="row" style="text-align: center;"><span class="letras">Pregunta de seguridad</span></div>
                            <div class="row">
                                <select name="Preguntas" class="bor" id="pregunta" name="pregunta"> <!--Supplement an id here instead of using 'name'-->
                                    <option value="1">¿Cuál es el nombre de tu primer mascota?</option> 
                                    <option value="2">¿En que ciudad naciste?</option>
                                    <option value="3">¿Cuál es el nombre de tu madre?</option>
                                    <option value="4" selected>¿Cuál es tu comida favorita?</option>
                                </select>
                            </div><br><br><br>
                            <div class="row" style="text-align: center;"><span class="letras">Respuesta</span></div>
                            <div class="row"><input type="text" class="bordes" id="respuesta"></div><br><br>
                        </div>
                        <div class="col-sm-1"></div>
                    </div>
                    <div class="col-sm-6">
                        <div class="col-sm-1"></div>
                        <div class="col-sm-10" style="align-items: center;"><br>                            
                            <div class="row">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-10"><label><img class="img-responsive" id="cambio" src="Imagenes/Avatares/Elejido/1c.png" width="200px;" height="200px" ></label></div>                                
                            </div>
                            <div class="row" style="text-align: center;"><span class="letras">Elige tu avatar</span></div>
                            <div class="row" id="imgBorder">
                                <div class="col-sm-4"><img class="img-responsive" onclick="avatar1();" id="marco1" src="Imagenes/Avatares/Elije/1.jpg" width="100px;" height="100px"></div>
                                <div class="col-sm-4"><img class="img-responsive" onclick="avatar2();" id="marco2" src="Imagenes/Avatares/Elije/2.jpg" width="100px;" height="100px"></div>
                                <div class="col-sm-4"><img class="img-responsive" onclick="avatar3();" id="marco3" src="Imagenes/Avatares/Elije/3.jpg" width="100px;" height="100px"></div>
                            </div>
                            <div class="row" id="imgBorder">
                                <div class="col-sm-4"><img class="img-responsive" onclick="avatar4();" id="marco4" src="Imagenes/Avatares/Elije/4.jpg" width="100px;" height="100px"></div>
                                <div class="col-sm-4"><img class="img-responsive" onclick="avatar5();" id="marco5" src="Imagenes/Avatares/Elije/5.jpg" width="100px;" height="100px"></div>
                                <div class="col-sm-4"><img class="img-responsive" onclick="avatar6();" id="marco6" src="Imagenes/Avatares/Elije/6.jpg" width="100px;" height="100px"></div>
                            </div><br><br>                                
                            <div class="row" style="text-align: center;">
                                <span name="demo" class="msgError" id="error"></span>
                                <%if (request.getParameter("error") != null) {
                                        out.println("<span class='text-center msgError' id='errorUser'>" + request.getParameter("error") + "</span>");
                                }%>
                            </div>
                                
                            <div class="row"  id="efecto"><a onmouseover="playclip();" onclick="submit()">
                                    <img class="img-responsive" width="100%" id="ImgData" src="Imagenes/Registro/btnRegistrarse.png" onclick="submit()"></a>
                                    <%--<input type="image" src="Imagenes/Registro/btnRegistrarse.png" alt="Submit Form" />--%>

                            </div>
                        </div>
                        <div class="col-sm-1"></div>
                    </div>
                    <%--</form>--%>
                </div>
            </div>            
            <div class="col-sm-2"></div>
        </div>
    </div>
    <div class="col-sm-2"></div>
</div>            

</body>
</html>
