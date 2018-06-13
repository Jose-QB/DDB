<%-- 
    Document   : Busqueda
    Created on : 20/11/2017, 10:09:54 PM
    Author     : erick
--%>
<%@page import="Clases.Usuario"%>
<%
    Usuario user;
    HttpSession sesionOk = request.getSession();
    user = (Usuario) sesionOk.getAttribute("usuario");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Búsqueda</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="Estilos/styleBusqueda.css" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="JavaScripCodes/PrincipalFunciones.js"  type="text/javascript"></script>
    </head>
    <body>
        <script>
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
                            document.getElementById("palabra").innerHTML = "NO SE ENCONTRÓ LA PALABRA";
                            document.getElementById("descripcion").innerHTML = "";
                            document.getElementById("imagen").src = "";
                            //document.getElementById('info-consulta').style.display = 'none';
                        } else {
                            var datos = respuesta.split(",");
                            console.log(respuesta);
                            // letra + "," + javax.xml.bind.DatatypeConverter.printBase64Binary(img64)
                            document.getElementById("palabra").innerHTML = datos[0];
                            document.getElementById("imagen").src = "data:image/jpg;base64," + datos[1];
                            document.getElementById("descripcion").innerHTML = datos[2];
                            //document.getElementById('info-consulta').style.display = 'block';
                        }
                    }
                }
            }

            function realizaBusqueda() {
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
                //document.getElementById('descripcion').innerHTML= document.getElementById('letra').value;
                ajax.open("GET", "AJAXDiccionario.jsp?letra=" + document.getElementById('letra').value, true);
                ajax.send(null);
            }

            function enter() {
                $("#letra").on('keyup', function (e) {
                    if (e.keyCode == 13) {
                        realizaBusqueda();
                    }
                });
            }

        </script>
        <div class="container-fluid">
            <div class="row">
                <div class="row">
                    <div class="col-sm-9" style="background-color: rgb(69, 88, 121);">
                        <div class="row">
                            <div class="col-sm-3"><img class="pad img-responsive" src="Imagenes/menu_Principal/logo.png"></div>
                            <div class="col-sm-2 "><br><a href="Inicio.jsp"><img class="pad img-responsive" width="65%" src="Imagenes/menu_Principal/regresar.png"></a></div>
                            
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
                                <%--<div class="row"><span id="letras">Erick</span></div>--%>
                        </div>
                        <div class="col-sm-2"></div>
                    </div>
                </div>           
                <div class="row text-center"><span id="letras2">Diccionario</span></div>         
                <div class="row"><br><br></div>
                <div class="row">
                    <div class="col-sm-6"></div>
                    <div class="col-sm-6">
                        <div class="row"><span class="colorblue">Buscar Palabra</span></div>
                        <div class="row">
                            <input class="bordes" type="text" size="50" name="letra" id="letra" onkeypress="enter()" placeholder="Búsqueda">
                            <img src="Imagenes/busqueda/lupa.png" onclick="realizaBusqueda()" width="9%" >
                        </div>
                    </div>
                </div>
                <div class="row">                    
                    <div class="col-sm-1"></div>
                    <div class="col-sm-10">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="row"><img  class="img-responsive" src="" width="400px" height="400px" id="imagen"></div>                                                                    
                            </div>                            
                            <div class="col-sm-6 text-center">
                                <div class="row"><br><br></div>
                                <div class="row text-center"><span class="palabra" id="palabra"></span></div>
                                <div class="row"><br><br></div>
                                <div class="row"><span class="descText" id="descripcion"></span></div>                                
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-1"></div>
                </div>
            </div>
        </div>
    </body>
</html>
