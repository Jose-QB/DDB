<%-- 
    Document   : Principal
    Created on : 6/11/2017, 09:48:48 PM
    Author     : erick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gesture Talk</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="Estilos/stylePrincipal.css" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="JavaScripCodes/PrincipalFunciones.js" type="text/javascript"></script>
        
    </head>
    <body onresize="myFunction()" onchange="MinImage()">
        <audio  preload="auto"> 
            <source src="Sonidos/click.mp3" controls></source>
            <source src="Sonidos/click.ogg" controls></source>
            Your browser isn't invited for super fun audio time.
        </audio>               
        <div class="container-fluid">  
            <div class="row" id="contenido">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <div class="row"><img class="img-responsive" src="Imagenes/Principal/Logo.png"></div><br><br><br><br>
                    <div class="row">
                        <div class="col-sm-2"></div>
                        <div class="col-sm-10" id="efecto">
                            <div class="row Margen"><a href="Iniciar_Sesion.jsp" onmouseover="playclip();"><img id="ImgData" class="img-responsive" src="Imagenes/Principal/btnIniciarSesion.png"></a></div><br><br><br>
                            <div class="row Margen"><a href="Registro.jsp" onmouseover="playclip();"><img id="ImgData" class="img-responsive" src="Imagenes/Principal/btnRegistro.png"></a></div><br><br><br>
                            <div class="row Margen"><a href="demo1.jsp" onmouseover="playclip();"><img id="ImgData" class="img-responsive" src="Imagenes/Principal/btnPruebaDemo.png"></a></div>     
                        </div>
                    </div>                    
                </div>
                <div class="col-sm-4"></div>                
            </div>
        </div>
    </body>
</html>