/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function activar(btx, value) {
    if (document.getElementById(btx).disabled == true) {
        document.getElementById(btx).disabled = false;
    }
    valor(value);
}
function activarInput(input, btx) {
    if (document.getElementById(input).value != "") {
        if (document.getElementById(btx).disabled == true) {
            document.getElementById(btx).disabled = false;
        }
    } else {
        document.getElementById(btx).disabled = true;
    }
}
function activarExamen() {
    var cont = 0;
    for (i = 0; i < document.examen.c1.length; i++)
        if (document.examen.c1[i].checked) {
            cont = cont + 1;
        }
    for (i = 0; i < document.examen.c2.length; i++)
        if (document.examen.c2[i].checked) {
            cont = cont + 1;
        }
    for (i = 0; i < document.examen.c3.length; i++)
        if (document.examen.c3[i].checked) {
            cont = cont + 1;
        }
    if (cont > 2) {
        if (document.getElementById("Confirmar").disabled == true) {
            document.getElementById("Confirmar").disabled = false;
        }
    } else {
        document.getElementById("Confirmar").disabled = true;
    }
}
function valor(value) {
    document.getElementById('resp').value = value;
}
function salir() {
    $("#salir").modal("show");
}
function extras() {

    $("#respuestas").modal("show");
    var salida = "", correcto = "", incorrecto = "";
    correcto = "<img class='pad img-responsive' data-dismiss='modal' src='Imagenes/Ejercicios/correcto.png'>";
    incorrecto = "<img class='pad img-responsive' data-dismiss='modal' src='Imagenes/Ejercicios/incorrecto.png'>";
    var re1, re2, re3;
    for (i = 0; i < document.examen.c1.length; i++) {
        if (document.examen.c1[i].checked) {
            r1 = document.examen.c1[i].value
        }
        if (document.examen.c2[i].checked) {
            r2 = document.examen.c2[i].value
        }
        if (document.examen.c3[i].checked) {
            r3 = document.examen.c3[i].value
        }
    }
    var re1, re2, re3, mas = 0;
    re1 = document.examen.resp1.value;
    re2 = document.examen.resp2.value;
    re3 = document.examen.resp3.value;

    salida = "<div class='col-sm-4'>";
    if (re1 == r1) {
        salida = salida + correcto;
        mas = mas + 1;
    } else
        salida = salida + incorrecto;
    salida = salida + "</div><div class='col-sm-4'>";
    if (re2 == r2) {
        salida = salida + correcto;
        mas = mas + 1;
    } else
        salida = salida + incorrecto;
    salida = salida + "</div><div class='col-sm-4'>";
    if (re3 == r3) {
        salida = salida + correcto;
        mas = mas + 1;
    } else
        salida = salida + incorrecto;
    salida = salida + "</div>";
    document.getElementById("extra").innerHTML = salida;
    puntaje = document.getElementById("punto").value;
    if (mas != 0) {
        document.getElementById("mas").innerHTML = "<h1>+" + mas + "</h1>";
        puntaje = parseInt(puntaje) + parseInt(mas);
        document.getElementById("puntaje").innerHTML = puntaje;
    } else
        document.getElementById("mas").innerHTML = "<h1>¡SIGUE ESFORZANDOTE!</h1>";
    $("#respuestas").modal("show");
    for (var i = 0; i < document.examen.c1.length; i++) {
        document.examen.c1[i].disabled = true;
        document.examen.c2[i].disabled = true;
        document.examen.c3[i].disabled = true;
    }
    document.finalizo.final.value = puntaje;
}
$(document).ready(function ()
{
    $("#mostrarmodal").modal("show");
}
);