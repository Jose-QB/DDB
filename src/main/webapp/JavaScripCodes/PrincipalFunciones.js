/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var w = window.innerWidth;
var h = window.innerHeight;
//document.body.style.backgroundImage = "url('../Imagenes/Principal/Fondo.png')";
document.getElementById('bodyImage').style.backgroundSize = w + "px " + h + "px";
//document.getElementById("demo").innerHTML = "Width: " + w + "<br>Height: " + h;
function resizeScreenImage() {
    var wi = window.outerWidth;
    var he = window.outerHeight;
    document.getElementById('bodyImage').style.backgroundSize = wi + "px " + he + "px";
    //document.getElementById("demo").innerHTML = "Width: " + wi + "<br>Height: " + he;
}

function MinImage() {
    var w = window.innerWidth;
    var h = window.innerHeight;
    document.getElementById('bodyImage').style.backgroundSize = w + "px " + h + "px";
    //document.getElementById("demo").innerHTML = "Width: " + w + "<br>Height: " + h;
}

document.body.style.backgroundImage = "url('Imagenes/Principal/Fondo.png')";
function myFunction() {
    var w = window.innerWidth;
    var h = window.innerHeight;
    document.getElementById("demo").innerHTML = "Width: " + w + "<br>Height: " + h;
}
function playclip() {
    if (navigator.appName == "Microsoft Internet Explorer" && (navigator.appVersion.indexOf("MSIE 7") != -1) || (navigator.appVersion.indexOf("MSIE 8") != -1)) {
        if (document.all)
        {
            document.all.sound.src = "Sonidos/click.mp3";
        }
    } else {
        {
            var audio = document.getElementsByTagName("audio")[0];
            audio.play();
        }
    }
}
