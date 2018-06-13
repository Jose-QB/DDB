function hideForms() {
    document.getElementById("altaU").hidden = true;
    document.getElementById("bajaU").hidden = true;
    document.getElementById("cambU").hidden = true;

    document.getElementById("altaE").hidden = true;
    document.getElementById("bajaE").hidden = true;
    document.getElementById("cambE").hidden = true;
}
function filter(filter) {
    var index = document.getElementById(filter).options[document.getElementById(filter).selectedIndex].value;
    var nick, preg, avat;
    nick = "";
    preg = "";
    avat = "";
    switch (filter) {
        case "filtBU":
            nick = "nickBU";
            preg = "pregBU";
            avat = "avatBU";
            break;
        case "filtCU":
            nick = "nickCU";
            preg = "pregCU";
            avat = "avatCU";
            break;
        case "filtCoU":
            nick = "nickCoU";
            preg = "pregCoU";
            avat = "avatCoU";
            break;
    }
    switch (index) {
        case "0":
            document.getElementById(nick).style.visibility = 'visible';
            document.getElementById(preg).style.visibility = 'hidden';
            document.getElementById(avat).style.visibility = 'hidden';
            break;
        case "1":
            document.getElementById(nick).style.visibility = 'hidden';
            document.getElementById(preg).style.visibility = 'visible';
            document.getElementById(avat).style.visibility = 'hidden';
            break;
        case "2":
            document.getElementById(nick).style.visibility = 'hidden';
            document.getElementById(preg).style.visibility = 'hidden';
            document.getElementById(avat).style.visibility = 'visible';
            break;
        case "3":
            document.getElementById(nick).style.visibility = 'hidden';
            document.getElementById(preg).style.visibility = 'hidden';
            document.getElementById(avat).style.visibility = 'hidden';
            break;
    }

}
function showForm(index) {
    hideForms();
    switch (index) {
        case 0:
            document.getElementById("altaU").hidden = false;
            break;
        case 1:
            document.getElementById("bajaU").hidden = false;
            document.getElementById("consU").style.visibility = 'visible';
            break;
        case 2:
            document.getElementById("cambU").hidden = false;
            break;
        case 3:
            document.getElementById("bajaU").hidden = false;
            document.getElementById("consU").style.visibility = 'hidden';
            break;
        case 4:

            break;
        case 5:

            break;
        case 6:

            break;
        case 7:

            break;
    }
}