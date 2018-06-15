function hideForms() {
    document.getElementById("formU").hidden = true;
}
function showForm(index) {
    hideForms();
    resetSpans();
    clearInputs();
    ajax("nickBCU");
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
            filter();
            break;
        case 2:
            document.getElementById("bDAlt").hidden = true;
            document.getElementById("bDBaj").hidden = true;

            document.getElementById("filtU").value = "0";
            filter();
            break;
        case 3:
            document.getElementById("form2").hidden = true;
            document.getElementById("bVDat").hidden = true;
            document.getElementById("bDAlt").hidden = true;
            document.getElementById("bDBaj").hidden = true;
            document.getElementById("bCDat").hidden = true;

            document.getElementById("filtU").value = "0";
            filter();
            break;
    }
}
function filter() {
    resetFilters(true);
    clearInputs();
    ajax("nickBCU");
    var value = document.getElementById("filtU").options[document.getElementById("filtU").selectedIndex].value;
    switch (value) {
        case "0":
            document.getElementById("fNick").hidden = false;
            break;
        case "1":
            document.getElementById("fPreg").hidden = false;
            break;
        case "2":
            document.getElementById("fAvat").hidden = false;
            break;
        case "3":
            ajax("*");
            break;
    }
}
function resetSpans() {
    document.getElementById("form1").hidden = false;
    document.getElementById("form2").hidden = false;
    document.getElementById("formU").hidden = false;
    resetFilters(false);
    resetButtons();
}
function resetFilters(bool) {
    document.getElementById("fNick").hidden = bool;
    document.getElementById("fPreg").hidden = bool;
    document.getElementById("fAvat").hidden = bool;
}
function resetButtons() {
    document.getElementById("bVDat").hidden = false;
    document.getElementById("bDAlt").hidden = false;
    document.getElementById("bDBaj").hidden = false;
    document.getElementById("bCDat").hidden = false;
}
function clearInputs() {
    document.getElementById("nickBCU").value = "";
    document.getElementById("nickAU").value = "";
    document.getElementById("passAU").value = "";
    document.getElementById("respAU").value = "";

    document.getElementById("pregBCU").value = "0";
    document.getElementById("avatBCU").value = "0";
    document.getElementById("pregAU").value = "0";
    document.getElementById("avatAU").value = "0";
}
function ajax(id) {
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
    xhttp.open("GET", "ajaxSearchU.jsp?u=" + str, true);
    xhttp.send();
}
window.onload = function () {
    hideForms();
}
