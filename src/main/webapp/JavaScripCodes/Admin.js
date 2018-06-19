function hideForms() {
    document.getElementById("formU").hidden = true;
    document.getElementById("formE").hidden = true;

}
function showForm(index) {
    hideForms();
    resetSpans(index);
    clearInputs();
    ajaxU("nickBCU");
    switch (index) {
        case 0:
            document.getElementById("form1").hidden = true;
            document.getElementById("bVDat").hidden = true;
            document.getElementById("bDBaj").hidden = true;
            document.getElementById("bCDat").hidden = true;
            break;
        case 1:
            document.getElementById("form2").hidden = true;
            document.getElementById("bVDat").hidden = true;
            document.getElementById("bDAlt").hidden = true;
            document.getElementById("bCDat").hidden = true;

            document.getElementById("filtU").value = "0";
            filter(0);
            break;
        case 2:
            document.getElementById("bDAlt").hidden = true;
            document.getElementById("bDBaj").hidden = true;

            document.getElementById("filtU").value = "0";
            filter(0);
            break;
        case 3:
            document.getElementById("form2").hidden = true;
            document.getElementById("bVDat").hidden = true;
            document.getElementById("bDAlt").hidden = true;
            document.getElementById("bDBaj").hidden = true;
            document.getElementById("bCDat").hidden = true;

            document.getElementById("filtU").value = "0";
            filter(0);
            break;
        case 4:
            document.getElementById("form3").hidden = true;
            document.getElementById("cExp").hidden = true;
            document.getElementById("bEBaj").hidden = true;
            document.getElementById("bCExp").hidden = true;
            break;
        case 5:
            document.getElementById("form4").hidden = true;
            document.getElementById("cExp").hidden = true;
            document.getElementById("bEAlt").hidden = true;
            document.getElementById("bCExp").hidden = true;

            document.getElementById("filtE").value = "0";
            filter(1);
            break;
        case 6:
            document.getElementById("bEAlt").hidden = true;
            document.getElementById("bEBaj").hidden = true;

            document.getElementById("filtE").value = "0";
            filter(1);
            break;
        case 7:
            document.getElementById("form4").hidden = true;
            document.getElementById("cExp").hidden = true;
            document.getElementById("bEAlt").hidden = true;
            document.getElementById("bEBaj").hidden = true;
            document.getElementById("bCExp").hidden = true;

            document.getElementById("filtE").value = "0";
            filter(1);
            break;
    }
}
function filter(c) {
    resetFilters(true);
    clearInputs();
    if (c == 0) {
        ajaxU("nickBCU");
        var value = document.getElementById("filtU").options[document.getElementById("filtU").selectedIndex].value;
        switch (value) {
            case "0":
                document.getElementById("fNick").hidden = false;
                ajaxU("nickBCU");
                break;
            case "1":
                document.getElementById("fPreg").hidden = false;
                ajaxU("pregBCU");
                break;
            case "2":
                document.getElementById("fAvat").hidden = false;
                ajaxU("avatBCU");
                break;
            case "3":
                ajaxU("*");
                break;
        }
    } else {
        ajaxE("wordBCE");
        var value = document.getElementById("filtE").options[document.getElementById("filtE").selectedIndex].value;
        switch (value) {
            case "0":
                document.getElementById("fWord").hidden = false;
                ajaxE("wordBCE");
                break;
            case "1":
                document.getElementById("fType").hidden = false;
                ajaxE("typeBCE");
                break;
            case "2":
                document.getElementById("fDesc").hidden = false;
                ajaxE("descBCE");
                break;
            case "3":
                ajaxE("*");
                break;
        }
    }
}
function resetSpans(index) {
    if (index < 4) {
        document.getElementById("form1").hidden = false;
        document.getElementById("form2").hidden = false;
        document.getElementById("formU").hidden = false;
    } else {
        document.getElementById("form3").hidden = false;
        document.getElementById("form4").hidden = false;
        document.getElementById("formE").hidden = false;
    }
    resetFilters(false);
    resetButtons();
}
function resetFilters(bool) {
    document.getElementById("fNick").hidden = bool;
    document.getElementById("fPreg").hidden = bool;
    document.getElementById("fAvat").hidden = bool;

    document.getElementById("fWord").hidden = bool;
    document.getElementById("fType").hidden = bool;
    document.getElementById("fDesc").hidden = bool;
}
function resetButtons() {
    document.getElementById("bVDat").hidden = false;
    document.getElementById("bDAlt").hidden = false;
    document.getElementById("bDBaj").hidden = false;
    document.getElementById("bCDat").hidden = false;

    document.getElementById("cExp").hidden = false;
    document.getElementById("bEAlt").hidden = false;
    document.getElementById("bEBaj").hidden = false;
    document.getElementById("bCExp").hidden = false;
}
function clearInputs() {
    document.getElementById("nickBCU").value = "";
    document.getElementById("nickAU").value = "";
    document.getElementById("passAU").value = "";
    document.getElementById("respAU").value = "";

    document.getElementById("pregBCU").value = "1";
    document.getElementById("avatBCU").value = "1";
    document.getElementById("pregAU").value = "1";
    document.getElementById("avatAU").value = "1";

    document.getElementById("wordBCE").value = "";
    document.getElementById("descBCE").value = "";
    document.getElementById("idAE").value = "";
    document.getElementById("wordAE").value = "";
    document.getElementById("descAE").value = "";

    document.getElementById("typeBCE").value = "0";
    document.getElementById("typeAE").value = "0";
}
function ajaxU(id) {
    var xhttp;
    var str;
    if (id != "*") {
        str = document.getElementById(id).value;
    } else {
        str = id;
    }
    if (str == "") {
        document.getElementById("resuU").innerHTML = "";
        return;
    }
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {

            document.getElementById("resuU").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "ajaxSearchU.jsp?u=" + str + "&c=" + id, true);
    xhttp.send();
}
function ajaxE(id) {
    var xhttp;
    var str;
    if (id != "*") {
        str = document.getElementById(id).value;
    } else {
        str = id;
    }
    if (str == "") {
        document.getElementById("resuE").innerHTML = "";
        return;
    }
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("resuE").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "ajaxSearchE.jsp?e=" + str, true);
    xhttp.send();
}
window.onload = function () {
    hideForms();
}

function ajaxUser(c) {
    var xhttp;
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            //document.getElementById("resuE").innerHTML = this.responseText;
            alert(this.responseText);
        }
    };
    switch (c) {
        case 0:
            var nick = document.getElementById("nickAU").value;
            var pass = document.getElementById("passAU").value;
            var quest = document.getElementById("pregAU").options[document.getElementById("pregAU").selectedIndex].value;
            var answ = document.getElementById("respAU").value;
            var avat = document.getElementById("avatAU").options[document.getElementById("avatAU").selectedIndex].value;
            xhttp.open("GET", "ajaxUser.jsp?c=" + c + "&nick=" + nick + "&pass" + pass + "&quest=" + quest + "&answ=" + answ + "&avat=" + avat, true);
            break;
        case 1:
            var nick = document.getElementById("resuU").options[document.getElementById("resuU").selectedIndex].value;
            xhttp.open("GET", "ajaxUser.jsp?c=" + c + "&nick=" + nick, true);
            document.getElementById("resuU").value = "";
            break;
    }
    xhttp.send();
}
window.onload = function () {
    hideForms();
}
