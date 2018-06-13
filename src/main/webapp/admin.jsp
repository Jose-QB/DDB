<%-- 
    Document   : admin
    Created on : 13/06/2018, 03:46:47 PM
    Author     : Alan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="Estilos/stylePrincipal.css" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="JavaScripCodes/PrincipalFunciones.js" type="text/javascript"></script>
        <script src="JavaScripCodes/Admin.js" type="text/javascript"></script>
    </head>
    <body>
        <div class = "container-fluid">
            <div class="row  text-center">
                <div class="col-sm-3">
                    <div class="row">
                        <div class="btn-group">
                            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                Usuarios<span class="caret"></span></button>
                            <ul class="dropdown-menu" role="menu">
                                <li><a onclick="showForm(0)" href="#">Altas</a></li>
                                <li><a onclick="showForm(1)"  href="#">Bajas</a></li>
                                <li><a onclick="showForm(2)"  href="#">Cambios</a></li>
                                <li><a onclick="showForm(3)"  href="#">Consultas</a></li>
                            </ul>
                        </div>
                        <div class="btn-group">
                            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                Expresiones <span class="caret"></span></button>
                            <ul class="dropdown-menu" role="menu">
                                <li><a onclick="showForm(4)"  href="#">Altas</a></li>
                                <li><a onclick="showForm(5)"  href="#">Bajas</a></li>
                                <li><a onclick="showForm(6)"  href="#">Cambios</a></li>
                                <li><a onclick="showForm(7)"  href="#">Consultas</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6"><h1>Bienvenido Admin</h1></div>
                <div class="col-sm-3"><button class ="form-control btn-danger" type = "button"> Salir </button></div>
            </div>
            <div class = "row">
                <div class="col-sm-3">

                </div>
                <div class="col-sm-6">
                    <form id = "altaU" hidden="hidden">
                        <h4>Nick-Name</h4>
                        <input class= "form-control" id = "nickAU">
                        <h4>Password</h4>
                        <input class= "form-control" id = "passAU">
                        <h4>Pregunta de seguridad</h4>
                        <select class= "form-control" id = "pregAU">
                            <option value = 0> Primer mascota</option>
                            <option value = 1> Cuidad de nacimiento</option>
                            <option value = 2> Nombre de la madre</option>
                            <option value = 3> Comida favorita</option>
                        </select>
                        <h4>Respuesta</h4>
                        <input class= "form-control" id = "respAU">
                        <h4>Avatar</h4>
                        <select class= "form-control" id = "avatAU">
                            <option value = 0>Avatar 1</option>
                            <option value = 1>Avatar 2</option>
                            <option value = 2>Avatar 3</option>
                            <option value = 3>Avatar 4</option>
                            <option value = 4>Avatar 5</option>
                            <option value = 5>Avatar 6</option>
                        </select>
                        <br>
                        <button class = "btn-success form-control" type="button">Dar de alta</button>
                    </form>
                    <form id = "bajaU" hidden="hidden">
                        <h4>Filtrar por:</h4>
                        <select class="form-control" id = "filtBU" onchange="filter('filtBU')">
                            <option value = 0>Nick-Name</option>
                            <option value = 1>Pregunta de seguridad</option>
                            <option value = 2>Avatar</option>
                            <option value = 3>No filtrar</option>
                        </select>
                        <h4>Nick-Name</h4>
                        <input class= "form-control" id = "nickBU">
                        <h4>Pregunta de seguridad</h4>
                        <select class= "form-control" id = "pregBU">
                            <option value = 4> Seleccione pregunta</option>
                            <option value = 0> Primer mascota</option>
                            <option value = 1> Cuidad de nacimiento</option>
                            <option value = 2> Nombre de la madre</option>
                            <option value = 3> Comida favorita</option>
                        </select>
                        <h4>Avatar</h4>
                        <select class= "form-control" id = "avatBU">
                            <option value = 6>Seleccione el avatar</option>
                            <option value = 0>Avatar 1</option>
                            <option value = 1>Avatar 2</option>
                            <option value = 2>Avatar 3</option>
                            <option value = 3>Avatar 4</option>
                            <option value = 4>Avatar 5</option>
                            <option value = 5>Avatar 6</option>
                        </select>
                        <h4>Resultados</h4>
                        <select class= "form-control" id = "resuBU"></select>
                        <br>
                        <button class = "btn-danger form-control" type="button" id = "consU">Dar de baja</button>
                    </form>
                    <form id = "cambU" hidden="hidden">
                        <h4>Filtrar por:</h4>
                        <select class="form-control" id = "filtCU">
                            <option value = 0>Nick-Name</option>
                            <option value = 1>Pregunta de seguridad</option>
                            <option value = 2>Avatar</option>
                            <option value = 3>No filtrar</option>
                        </select>
                        <h4>Nick-Name</h4>
                        <input class= "form-control" id = "nickCUB">
                        <h4>Pregunta de seguridad</h4>
                        <select class= "form-control" id = "pregCUB">
                            <option value = 0> Primer mascota</option>
                            <option value = 1> Cuidad de nacimiento</option>
                            <option value = 2> Nombre de la madre</option>
                            <option value = 3> Comida favorita</option>
                        </select>
                        <h4>Avatar</h4>
                        <select class= "form-control" id = "avatCUB">
                            <option value = 0>Avatar 1</option>
                            <option value = 1>Avatar 2</option>
                            <option value = 2>Avatar 3</option>
                            <option value = 3>Avatar 4</option>
                            <option value = 4>Avatar 5</option>
                            <option value = 5>Avatar 6</option>
                        </select>
                        <h4>Resultados</h4>
                        <select class= "form-control" id = "resuCUB"></select>
                        <br>
                        <button class = "btn-info form-control" type="button">Ver datos</button>
                        <br>
                        <h4>Nick-Name</h4>
                        <input class= "form-control" id = "nickCU">
                        <h4>Password</h4>
                        <input class= "form-control" id = "passCU">
                        <h4>Pregunta de seguridad</h4>
                        <select class= "form-control" id = "pregCU">
                            <option value = 0> Primer mascota</option>
                            <option value = 1> Cuidad de nacimiento</option>
                            <option value = 2> Nombre de la madre</option>
                            <option value = 3> Comida favorita</option>
                        </select>
                        <h4>Respuesta</h4>
                        <input class= "form-control" id = "respCU">
                        <h4>Avatar</h4>
                        <select class= "form-control" id = "avatCU">
                            <option value = 0>Avatar 1</option>
                            <option value = 1>Avatar 2</option>
                            <option value = 2>Avatar 3</option>
                            <option value = 3>Avatar 4</option>
                            <option value = 4>Avatar 5</option>
                            <option value = 5>Avatar 6</option>
                        </select>
                        <br>
                        <button class = "btn-success form-control" type="button">Cambiar datos</button>
                    </form>

                    <form id = "altaE" hidden="hidden"></form>
                    <form id = "bajaE" hidden="hidden"></form>
                    <form id = "cambE" hidden="hidden"></form>

                </div>
                <div class="col-sm-3">

                </div>
            </div>
        </div>
    </body>
</html>
