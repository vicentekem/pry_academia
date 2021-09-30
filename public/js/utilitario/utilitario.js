const ajaxRequest = (action,type,controller,parameters,successCallback,errorCallback) => {
    if(!parameters) parameters = {};
    parameters.action = action;
    $.ajax({
        url: "controllers/" + controller,
        dataType: "json",
        type: type,
        data: parameters,
        processData: true,
        success: function (result) {
            if(successCallback && typeof successCallback === 'function' ) successCallback(result);            
        },
        timeout: 12000, // sets timeout to 12 seconds
        error: function (request, status, err) {
            if(errorCallback && typeof errorCallback === 'function' ) errorCallback();

            if (status == "timeout") {
                showMessage("Su petición demoro mas de lo permitido", "error");
            } else {
                // another error occured
                showMessage("ocurrio un error en su petición.", "error");
            }
        }
    });
}

const ajaxFDRequest = (action,type,controller,fd,successCallback,errorCallback) => {
    if(!fd) fd = new FormData();
    fd.append("action",action);    
    $.ajax({
        url: "controllers/" + controller,
        dataType: "json",
        type: type,
        data: fd,
        cache: false,
        contentType: false,
        processData: false,
        success: function (result) {
            if(successCallback && typeof successCallback === 'function' ) successCallback(result);            
        },
        timeout: 12000, // sets timeout to 12 seconds
        error: function (request, status, err) {
            if(errorCallback && typeof errorCallback === 'function' ) errorCallback();

            if (status == "timeout") {
                showMessage("Su petición demoro mas de lo permitido", "error");
            } else {
                // another error occured
                showMessage("ocurrio un error en su petición.", "error");
            }
        }
    });
}

const loadDataToTemplate = (id_template, id_content_data, data, is_select2, is_multiselect) => {
    var template = $("#" + id_template).html();
    Mustache.parse(template);
    var rendered_html = Mustache.render(template, {data: data});
    
    if( is_select2 ) {
        $("#" + id_content_data).html(rendered_html).select2({ theme: 'bootstrap4', width:'100%'});
    }else{
        $("#" + id_content_data).html(rendered_html);
    }
}


const showMessage =(message, type) => {

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



const ajaxSelect2 = (id_select,action,controller,formatRow,formatRowSelection)=>{
    
    formatRow = typeof formatRow === "function" ? formatRow :
        row => {
            if (row.loading) return row.description;
            return $(`<div>${row.description}<div>`);
        };

    formatRowSelection = typeof formatRowSelection === "function" ? formatRowSelection : row => row.description;

    $('#' + id_select).select2({
        theme: 'bootstrap4',
        width:'100%',
        placeholder: 'Nada Seleccionado',
        language: {
            inputTooShort: function () {
                return 'por favor ingrese 2 o más caracteres.'
            }
        },
        ajax: {            
            url: 'controllers/' + controller,
            dataType: 'json',
            data: function (params) {
                return {
                    action: action,
                    q: params.term, // search term
                    //page: params.page
                };
            },
            processResults: function (data, params) {                
                // parse the results into the format expected by Select2
                // since we are using custom formatting functions we do not need to
                // alter the remote JSON data, except to indicate that infinite
                // scrolling can be used
                //params.page = params.page || 1;
                return {
                    results: data.rows,
                    /*pagination: {
                        more: (params.page * 30) < data.total_count
                    }*/
                };
            },
        },
        escapeMarkup: function (markup) {
            return markup
        },
        minimumInputLength: 2,
        templateResult: formatRow,
        templateSelection: formatRowSelection
    });

}

const isValidDNI = (dni) => {
    return /^([0-9]{8})$/.test(dni);
}

const isValidNumber = (n) => {
    return /^([0-9]+)$/.test(n);
}


const isValidEmail = (mail) => {
    return /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/.test(mail);
}

const getParameterByName = (name) => {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}