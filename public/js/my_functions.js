function showMessage(message, type) {

    toastr.options = {
        "closeButton": false,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-bottom-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };

    toastr[type](message);

}

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

function validarRangoFecha(f1, f2) {

    var arrFecha1 = f1.split("/");
    var fecha1 = new Date();
    var d1 = arrFecha1[0];
    var m1 = parseInt(arrFecha1[1]) + 1;
    var y1 = arrFecha1[2];

    fecha1.setDate(d1);
    fecha1.setMonth(m1);
    fecha1.setFullYear(y1);

    var arrFecha2 = f2.split("/");
    var fecha2 = new Date();
    var d2 = arrFecha2[0];
    var m2 = parseInt(arrFecha2[1]) + 1;
    var y2 = arrFecha2[2];

    fecha2.setDate(d2);
    fecha2.setMonth(m2);
    fecha2.setFullYear(y2);

    return fecha1.getTime() < fecha2.getTime();

}

function loadLocalFile() {

    $(".custom-file-input").change(function (e) {

        var fileSelected = e.target.files[0];
        if (fileSelected) {
            //validacion del tipo de archivo(solo PDF) y el tamaÃ±o del archivo (4MB maximo)
            var sizeFile = (fileSelected.size / (1024 * 1024));
            var typeFile = fileSelected.type;

            if (sizeFile > 4 || (typeFile !== "application/vnd.ms-excel" &&  typeFile !== "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") ) {
                e.target.value = "";
                showMessage("El archivo seleccionado no es vÃ¡lido", "error");
            } else {
                e.target.parentElement.querySelector(".custom-file-label").innerText = fileSelected.name;
            }
        } else {
            e.target.parentElement.querySelector(".custom-file-label").innerText = "";
        }
    });
}

//funciones generales:


function getTimeFromString(dateString) {

    var arrFecha = dateString.split("/");
    var fecha = new Date();
    var d = arrFecha[0];
    var m = parseInt(arrFecha[1]) + 1;
    var y = arrFecha[2];

    fecha.setDate(d);
    fecha.setMonth(m);
    fecha.setFullYear(y);

    return fecha.getTime();
}

function getCurrentTime() {

    return (new Date()).getTime();
}

function isValidEmail(mail) {
    return /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/.test(mail);
}

function isValidDNI(dni) {
    return /^([0-9]{8})$/.test(dni);
}

function isValidNumber(n) {
    return /^([0-9]+)$/.test(n);
}

function isValidNumberAndFixedLength(n, l) {

    return (n.toString().length === l) ? /^([0-9]+)$/.test(n.toString()) : false;

}

function calcularEdad(fecha) {
    // Si la fecha es correcta, calculamos la edad

    var values = fecha.split("/");
    var dia = values[0];
    var mes = values[1];
    var anio = values[2];

    // cogemos los valores actuales
    var fecha_hoy = new Date();
    var ahora_anio = fecha_hoy.getYear();
    var ahora_mes = fecha_hoy.getMonth() + 1;
    var ahora_dia = fecha_hoy.getDate();

    // realizamos el calculo
    var edad = (ahora_anio + 1900) - anio;
    if (ahora_mes < mes) {
        edad--;
    }
    if ((mes == ahora_mes) && (ahora_dia < dia)) {
        edad--;
    }
    if (edad > 1900) {
        edad -= 1900;
    }

    // calculamos los meses
    var meses = 0;

    if (ahora_mes > mes && dia > ahora_dia)
        meses = ahora_mes - mes - 1;
    else if (ahora_mes > mes)
        meses = ahora_mes - mes
    if (ahora_mes < mes && dia < ahora_dia)
        meses = 12 - (mes - ahora_mes);
    else if (ahora_mes < mes)
        meses = 12 - (mes - ahora_mes + 1);
    if (ahora_mes == mes && dia > ahora_dia)
        meses = 11;

    // calculamos los dias
    var dias = 0;
    if (ahora_dia > dia)
        dias = ahora_dia - dia;
    if (ahora_dia < dia) {
        ultimoDiaMes = new Date(ahora_anio, ahora_mes - 1, 0);
        dias = ultimoDiaMes.getDate() - (dia - ahora_dia);
    }

    return edad + " aÃ±os, " + meses + " meses y " + dias + " dÃ­as";
}

function calcularTiempo(fecha,fechaLim) {

    var values = fecha.split("/");
    var dia = values[0];
    var mes = values[1];
    var anio = values[2];

    var fecha_hoy = fechaLim.split("/");
    var ahora_anio = fecha_hoy[2];
    var ahora_mes = fecha_hoy[1];
    var ahora_dia = fecha_hoy[0];

    //var edad = (ahora_anio + 1900) - anio;
    var edad = ahora_anio - anio;
    if (ahora_mes < mes) {
        edad--;
    }
    if ((mes == ahora_mes) && (ahora_dia < dia)) {
        edad--;
    }
    if (edad > 1900) {
        edad -= 1900;
    }

    var meses = 0;

    if (ahora_mes > mes && dia > ahora_dia)
        meses = ahora_mes - mes - 1;
    else if (ahora_mes > mes)
        meses = ahora_mes - mes
    if (ahora_mes < mes && dia < ahora_dia)
        meses = 12 - (mes - ahora_mes);
    else if (ahora_mes < mes)
        meses = 12 - (mes - ahora_mes + 1);
    if (ahora_mes == mes && dia > ahora_dia)
        meses = 11;

    var dias = 0;
    if (ahora_dia > dia)
        dias = ahora_dia - dia;
    if (ahora_dia < dia) {
        ultimoDiaMes = new Date(ahora_anio, ahora_mes - 1, 0);
        dias = ultimoDiaMes.getDate() - (dia - ahora_dia);
    }

    return edad + " aÃ±os, " + meses + " meses y " + dias + " dÃ­as";
}

function changeDateFormat(dateString) {

    var fecha_arr = dateString.split('-');
    var anio = fecha_arr[0];
    var mes = fecha_arr[1];
    var dia = fecha_arr[2];

    return dia + '/' + mes + '/' + anio;

}

function toggleElements( idcontainer , idExcludedElements ) {

    if(typeof idcontainer !== 'string') return;
    if(!Array.isArray(idExcludedElements)) idExcludedElements = [] ;

    $(
        "#" + idcontainer + " input," +
        "#" + idcontainer + " select" +
        "#" + idcontainer + " textarea"
    ).each(function(i,el){

        if( !idExcludedElements.includes( el.id ) ) el.disabled = !el.disabled;

    });

    /*idExcludedElements.forEach(function(id){
        $("#" + id).prop("disabled",false);
    });*/
}

function isValidTime( timeStr ){

    var time_arr = timeStr.split(":");

    var result = time_arr.length === 2;

    if(result){
        time_arr.forEach(function(el){
            if( isNaN(el) || el.toString().length !== 2 ) result = false;
        })
    }

    return result
}