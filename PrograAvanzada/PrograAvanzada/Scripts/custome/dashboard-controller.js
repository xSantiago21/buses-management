/*window.onload = function () {
    var widtWindow = window.innerWidth;
    var body = document.getElementById("body");
    var dash = document.getElementById("dashboard");
    if (widtWindow > 720) {
        dash.classList.add("dashboard-closed");
        body.style.paddingLeft = "55px";
    } else {
        dash.classList.add("dashboard-hide");
    }
}
*/


function toggleDashboard() {

    var widtWindow = window.innerWidth;

    var dash = document.getElementById("dashboard");
    var widthDash = dash.offsetWidth;

    var dash_hide_tog = document.getElementById("dashboard-hide-toggler");
    var body = document.getElementById("body");
    var dTop = document.getElementById("dashboard-top");
    //var dBot = document.getElementById("dashboard-bottom");
    var aOpt = document.getElementsByClassName("dashboard-a-opt");
    var iconsOpt = document.getElementsByClassName("dashboard-icon-opt");
    var namesOpt = document.getElementsByClassName("dashboard-name-opt");

    if (widthDash < 70) {//Expando el Dash

        if (widtWindow > 720) {//Cuando no estoy en movil
            body.style.paddingLeft = "220px";
        }

        dash_hide_tog.style.display = "none"
        dash.classList.remove("dashboard-closed");
        dash.classList.remove("dashboard-hide");
        dash.classList.add("dashboard-open");
        dTop.classList.remove("dashboard-top-closed");
        dTop.classList.add("dashboard-top-open");
        //dBot.style.display = "block";

        for (var i = 0; i < namesOpt.length; i++) {
            namesOpt[i].classList.remove("dashboard-name-opt-closed");
            namesOpt[i].classList.add("dashboard-name-opt-open");
        }
        for (var i = 0; i < iconsOpt.length; i++) {
            iconsOpt[i].classList.remove("dashboard-icon-opt-closed");
            iconsOpt[i].classList.add("dashboard-icon-opt-open");
        }
        for (var i = 0; i < aOpt.length; i++) {
            aOpt[i].classList.remove("dashboard-a-opt-closed");
            aOpt[i].classList.add("dashboard-a-opt-open");
        }


    } else { //Comprimo el Dash

        body.style.paddingLeft = "55px";
        dash_hide_tog.style.display = "flex"
        dash.classList.remove("dashboard-open");
        dash.classList.add("dashboard-closed");
        dTop.classList.remove("dashboard-top-open");
        dTop.classList.add("dashboard-top-closed");
        //dBot.style.display = "none";
        for (var i = 0; i < namesOpt.length; i++) {
            namesOpt[i].classList.remove("dashboard-name-opt-open");
            namesOpt[i].classList.add("dashboard-name-opt-closed");
        }
        for (var i = 0; i < iconsOpt.length; i++) {
            iconsOpt[i].classList.remove("dashboard-icon-opt-open");
            iconsOpt[i].classList.add("dashboard-icon-opt-closed");
        }
        for (var i = 0; i < aOpt.length; i++) {
            aOpt[i].classList.remove("dashboard-a-opt-open");
            aOpt[i].classList.add("dashboard-a-opt-closed");
        }

    }

}

function hideDashboard() {
    var body = document.getElementById("body");
    var dash = document.getElementById("dashboard");
    body.style.paddingLeft = "0px";
    dash.classList.remove("dashboard-closed");
    dash.classList.add("dashboard-hide");
}