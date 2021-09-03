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
            if (result.error === "") { successCallback(result);}
            else{ errorCallback(); }
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

const loadDataToTemplate = (idTemplate, idContentData, data) => {
    var template = $("#" + idTemplate).html();
    Mustache.parse(template);

    var renderedHtml = Mustache.render(template, {data: data});

    $("#" + idContentData).html(renderedHtml);
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
