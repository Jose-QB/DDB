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

                    <form id = "user">
                        <span id = "formU">
                            <span id = "form1">
                                Filtrar por:
                                <select class="form-control" onchange="filter(0)" id = "filtU">
                                    <option value = 0>Nick-Name</option>
                                    <option value = 1>Pregunta de seguridad</option>
                                    <option value = 2>Avatar</option>
                                    <option value = 3>No filtrar</option>
                                </select>
                                <span id = "fNick">
                                    Nick-Name
                                    <input class= "form-control" id = "nickBCU" onkeyup="ajaxU('nickBCU')" type = "text">
                                </span>
                                <span id = "fPreg">
                                    Pregunta de seguridad
                                    <select class= "form-control" id = "pregBCU" onchange="ajaxU('pregBCU')">
                                        <option value = 0> Primer mascota</option>
                                        <option value = 1> Cuidad de nacimiento</option>
                                        <option value = 2> Nombre de la madre</option>
                                        <option value = 3> Comida favorita</option>
                                    </select>
                                </span>
                                <span id = "fAvat">
                                    Avatar
                                    <select class= "form-control" id = "avatBCU" onchange="ajaxU('avatBCU')">
                                        <option value = 0>Avatar 1</option>
                                        <option value = 1>Avatar 2</option>
                                        <option value = 2>Avatar 3</option>
                                        <option value = 3>Avatar 4</option>
                                        <option value = 4>Avatar 5</option>
                                        <option value = 5>Avatar 6</option>
                                    </select>
                                </span>
                                Resultados
                                <select class= "form-control" id = "resuU"></select>
                                <br>
                            </span>
                            <span id = "bVDat">
                                <br>
                            </span>
                            <span id = "form2">
                                Nick-Name
                                <input class= "form-control" id = "nickAU" type = "text">
                                Password
                                <input class= "form-control" id = "passAU">
                                Pregunta de seguridad
                                <select class= "form-control" id = "pregAU">
                                    <option value = 0> Primer mascota</option>
                                    <option value = 1> Cuidad de nacimiento</option>
                                    <option value = 2> Nombre de la madre</option>
                                    <option value = 3> Comida favorita</option>
                                </select>
                                Respuesta
                                <input class= "form-control" id = "respAU" type = "text">
                                Avatar
                                <select class= "form-control" id = "avatAU">
                                    <option value = 0>Avatar 1</option>
                                    <option value = 1>Avatar 2</option>
                                    <option value = 2>Avatar 3</option>
                                    <option value = 3>Avatar 4</option>
                                    <option value = 4>Avatar 5</option>
                                    <option value = 5>Avatar 6</option>
                                </select>
                                <br>
                            </span>
                            <span id = "bDAlt">
                                <button class = "btn-success form-control" type="button">Dar de alta</button>
                            </span>
                            <span id = "bDBaj">
                                <button class = "btn-danger form-control" type="button">Dar de baja</button>
                            </span>
                            <span id = "bCDat">
                                <button class = "btn-info form-control" type="button">Cambiar datos</button>
                            </span>
                        </span>
                    </form>
                    <form id = "expretion">
                        <span id = "formE">
                            <span id = "form3">
                                Filtrar por
                                <select class = "form-control" onchange="filter(1)" id = "filtE">
                                    <option value = 0>Palabra</option>
                                    <option value = 1>Tipo</option>
                                    <option value = 2>Descrición</option>
                                    <option value = 3>No filtrar</option>
                                </select>
                                <span id = "fWord">
                                    Palabra
                                    <input class = "form-control" type ="text" onkeyup="ajaxE('wordBCE')" id = "wordBCE">
                                </span>
                                <span id = "fType">
                                    Tipo
                                    <select class = "form-control" onchange="ajaxE('typeBCE')" id = "typeBCE">
                                        <option value = 0>si</option>
                                    </select>
                                </span>
                                <span id = "fDesc">
                                    Descripción
                                    <textarea class = "form-control" onkeyup="ajaxE('descBCE')" id = "descBCE"></textarea>
                                </span>
                                Resultados
                                <select class = "form-control" id = "resuE"></select>
                                <br>
                            </span>
                            <span id = "cExp">
                                <br>
                            </span>
                            <span id = "form4">
                                ID_Expresión
                                <input class= "form-control" type = "text" disabled = "disabled" id = "idAE">
                                Palabra
                                <input class= "form-control" type = "text" id = "wordAE">
                                Tipo
                                <select class = "form-control" id = "typeAE">
                                    <option value = 0>si</option>
                                </select>
                                Descripcion
                                <textarea class = "form-control" id = "descAE"></textarea>
                                <br>
                            </span>
                            <span id = "bEAlt">
                                <button class = "btn-success form-control" type="button">Dar de alta</button>
                            </span>
                            <span id = "bEBaj">
                                <button class = "btn-danger form-control" type="button">Dar de baja</button>
                            </span>
                            <span id = "bCExp">
                                <button class = "btn-info form-control" type="button">Cambiar datos</button>
                            </span>
                        </span>

                    </form>
                </div>
                <div class="col-sm-3">

                </div>
            </div>
        </div>
    </body>
</html>
