let crud_concurso = {
    
    dtable: null,
    id_table: "tbl_concurso",
    action : getParameterByName("action"),
    
    id_rol : $("#txt_session_id_rol").val(),
    id_persona : $("#txt_session_id_persona").val(),
    id_usuario : $("#txt_session_id_usuario").val(),    

    container_questions : $("#container_questions"),
    btn_save_concurso : $("#btn_save_concurso"),
    btn_add_question : $("#btn_add_question"),
    filter_container_jq : $("#filter_container"),
    
    id_question: 2,
    url_img_old : "",
    img_concurso : $("#img_concurso"),

    init : ()=>{

        let input_file = $("#fl_crud_img_concurso");        

        input_file.on("change",(event)=>{ crud_concurso.changeFileImg(event); });

        crud_concurso.filter_container_jq.on("click",  event => searchEventListener( event ) );
        crud_concurso.filter_container_jq.on("change", event => searchEventListener( event ) );
        crud_concurso.filter_container_jq.on("keyup", event => {
            if(event.keyCode == 13 || event.keyCode == 27){ searchEventListener(event);}
            if(event.keyCode == 27){ event.target.value = ""; }
        });

        crud_concurso.btn_save_concurso.on("click", (event)=> crud_concurso.saveData(event));
        crud_concurso.btn_add_question.on("click", (event)=> crud_concurso.addQuestion(event));
        

        crud_concurso.container_questions.on("click",(event)=>{
            let target = event.target;
            if(event.target.getAttribute("type") != 'radio')  event.preventDefault();
            
            if(target.classList.contains('add-option')){
                let id_question = target.id.match(/\d+/)[0];
                let container_options = document.getElementById('container_options_' + id_question);
                let id_option = container_options.children.length;
                let option_element = document.createElement("div");
                option_element.classList.add('mb-1');
                option_element.classList.add('div_option_' + id_option);
                option_element.innerHTML = `
                    <input type="radio" id="rd_p${id_question}_option_${id_option}"
                        name="option_question_${id_question}">
                    <span contenteditable data-idradio='rd_p${id_question}_option_${id_option}' class='option' >Nueva opcion</span>
                    <a href="#" style="font-size:1.05em" data-idoption='${id_option}' data-idquestion='${id_question}' 
                        class="text-danger remove-option ml-1">x</a>
                `;
                container_options.insertBefore(option_element,container_options.children[ container_options.children.length - 1 ]);                
            }

            if(target.classList.contains('remove-option')){
                let id_option = target.dataset.idoption;
                let id_question = target.dataset.idquestion;
                let container_options = document.getElementById('container_options_' + id_question);
                let option_element = document.querySelector("#container_options_" + id_question + " .div_option_" + id_option);
                container_options.removeChild(option_element);
            }

            if(target.classList.contains('btn-delete')){                
                let id_question = target.dataset.idquestion;
                let container_questions = document.getElementById('container_questions');
                let question_element = document.getElementById('container_q' + id_question);
                container_questions.removeChild(question_element);
                crud_concurso.renderNumberQuestion();
            }

        });

        if(crud_concurso.action=="" || crud_concurso.action =="list"){
            crud_concurso.initDataTable();
            crud_concurso.initActionsTadaTables();
        }else if(crud_concurso.action == "upd" || crud_concurso.action == "view"){
            let id = getParameterByName("id");
            crud_concurso.loadData(id);
        }
    },

    initDataTable: ()=>{        
        crud_concurso.dtable = $('#' + crud_concurso.id_table).DataTable({
            pageLength: 10,//cantidad de registros a mostrar por paginas
            searching : false,//si es true agrega un buscador a la concurso
            ordering:false,//si es true se habilita la opcion de ordenar por columna
            serverSide: true,//si es true hace la llamada al servidor por cada pagina
            responsive: true,
            processing: true,
            language: {
                url: "public/js/plugins/dataTables/dataTablesSpanich.json"
            },
            ajax: {
                type:"GET",
                url: "controllers/ConcursoController.php",
                data: function(dtp){
                    dtp.action = 'qry_concurso';
                    dtp.search   = $("#txt_search").val();
                    return dtp;
                },
                dataFilter: function ( json ) {
                    json = JSON.parse(json);
                    json.recordsTotal = json.cant_rows;
                    json.recordsFiltered = json.cant_rows;
                    json.data = json.rows;
                    return JSON.stringify(json);
                }
            },
            columnDefs:[
                {orderable: false, targets: 0, searchable: false,width:"8%"},
                {orderable: false, targets: 1, searchable: false, width:"40%"},
                {orderable: false, targets: 2, searchable: false, width:"10%"}
            ],
            columns: [
                {
                    render: function(data, type, row, meta){                    
                        var btn_edit = `<a class='fa fa-edit text-warning' title='Editar' href='?url=concursos&action=upd&id=${row.id}' style='font-size: 1.1em'></a>`;
                        var btn_view = `<a class='fa fa-eye text-sucess' title='Ver' href='?url=concursos&action=view&id=${row.id}' style='font-size: 1.1em'></a>`;
                        var btn_est  = row.estado == 1 ?
                            `<a class='fa fa-times text-danger est-row' title='Desactivar' id=est_${meta.row} href='#' style='font-size: 1.1em'></a>` : 
                            `<a class='fa fa-check text-info  est-row' title='Activar' id=est_${meta.row} href='#' style='font-size: 1.1em'></a>`;

                        let id_rol = crud_concurso.id_rol;
                        let id_persona = crud_concurso.id_persona;

                        let edit_permision = (id_rol == 1 || id_rol == 2 || id_persona == row.id_persona);
                        let show_permision = (id_rol != 1 && id_rol != 2);
                        let change_est_permision = (crud_concurso.id_rol == 1 || crud_concurso.id_rol == 2);

                        return `<div class='text-center'>
                            ${ edit_permision?btn_edit:""} ${ show_permision?btn_view:""} ${ change_est_permision?btn_est:""}</div>`;
                    }
                },
                { data: "description"},
                { data: "fecha"},
                { data: "hora_inicio"},
                { data: "hora_fin"},
                { 
                    render: function(data, type, row, meta){
                        return row.estado == 1 ? `<small class="label label-primary">Activado</small>` : 
                        `<small class="label label-danger">Desactivado</small>`;
                    }
                }
            ]
        });
    },

    initActionsTadaTables: ()=>{

        $("#" + crud_concurso.id_table + " tbody").on("click", ".upd-row", function(event){
            event.preventDefault();
            var id_row = $(this).attr("id").match(/\d+/)[0];
            var data = crud_concurso.dtable.row(id_row).data();
            crud_concurso.openModal(data);            
        });

        $("#" + crud_concurso.id_table + " tbody").on("click", ".est-row", function(event){
            event.preventDefault();
            var id_row = $(this).attr("id").match(/\d+/)[0];
            var data = crud_concurso.dtable.row(id_row).data();            
            crud_concurso.changeEst(data);
        });

    },

    changeFileImg : (event)=>{
        let target = event.target;            
        let default_src = "public/img/default.png";
        let src = target.files[0] ? URL.createObjectURL( target.files[0] ) : default_src;
        crud_concurso.url_img_old = crud_concurso.img_concurso.attr("src");
        crud_concurso.img_concurso.attr("src", src );
    },

    changeEst : (data)=>{
        
        swal({
            title: `Seguro que desea ${data.estado == 0 ? "activar" : "desactivar"} el registro seleccionado?`,            
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#1AB394",
            confirmButtonText: "Si",
            cancelButtonText: "Cancelar",
            closeOnConfirm: false
        }, function () {

            ajaxRequest('est_concurso',"post","ConcursoController.php",data,(result)=>{
                if(result.error === ""){
                    let txtmsg = data.estado == 0 ? "Activado" : "Desactivado";
                    //swal(txtmsg,, "success");
                    swal({
                        title: txtmsg,
                        text: `El registro seleccionado fue ${txtmsg.toLowerCase()} con exito!`,
                        type: "success",
                        showCancelButton: false,
                        confirmButtonColor: "#1AB394",
                        closeOnConfirm: true
                    });
                    crud_concurso.reloadTable();
                }else{
                    swal({
                        title: "Error",
                        text: result.error,
                        type: "error",
                        showCancelButton: false,
                        confirmButtonColor: "#1AB394",
                        closeOnConfirm: true
                    });
                }
            });

        });

    },

    loadData: ( id )=>{

        ajaxRequest("get_concurso","get","ConcursoController.php",{id:id},(result)=>{

            let d = result.row;            
            let preguntas = result.preguntas;
            let opciones = result.opciones;
            
            $("#txt_crud_action").val("upd_concurso");
            $("#txt_crud_id").val(d.id);

            $("#txt_crud_description").val(d.description).attr("disabled",crud_concurso.action == 'view');
            $("#txt_crud_resumen").val(d.resumen).attr("disabled",crud_concurso.action == 'view');
            $("#txt_crud_fecha").val(d.fecha).attr("disabled",crud_concurso.action == 'view');
            $("#txt_crud_hora_inicio").val(d.hora_inicio).attr("disabled",crud_concurso.action == 'view');
            $("#txt_crud_hora_fin").val(d.hora_fin).attr("disabled",crud_concurso.action == 'view');
            $("#txt_direccion").val(d.direccion).attr("disabled",crud_concurso.action == 'view')
            $("#txt_monto_inscripcion").val(d.monto_inscripcion).attr("disabled",crud_concurso.action == 'view')

            $("#img_concurso").attr("src",d.url_img);
            
            crud_concurso.renderQuestions( preguntas, opciones );

            //console.log( preguntas );
            //console.log( opciones );

        });
    },

    addQuestion : (event)=>{
        event.preventDefault();
        
        html_question = crud_concurso.getHtmlQuestion(crud_concurso.id_question);
        crud_concurso.id_question++;
        crud_concurso.container_questions[0].innerHTML += html_question;
        
        crud_concurso.renderNumberQuestion();
    },
    
    renderNumberQuestion : ()=>{
        [...document.querySelectorAll("#container_questions .question_numeric")].forEach( (element,index) =>{
            element.innerHTML = index + 1;
        });
    },

    getHtmlQuestion : ( id_question , question = {} , optionsHTML)=>{
        optionsHTML = optionsHTML || 
        `<div class="mb-1">
            <input type="radio" id="rd_p${id_question}_option_1" name="option_question_${id_question}">
            <span contenteditable class="option" data-idradio='rd_p${id_question}_option_1'>Nueva opcion</span>
            <a href="#" class="text-danger">x</a>
        </div>

        <div class="mt-1">
            <input type="radio" id="rd_add_opt_${id_question}">
            <a href="#" id="add_opt_${id_question}" class="add-option" >Agregar opcionaaa</a>
        </div>`;

        return `
            <div class="contenedor_pregunta" id="container_q${id_question}">
                <div class="centro">
                    <div class="head-preguntas">
                        <div class="title-pregunta">
                            <p>Pregunta <span class="question_numeric"></span></p>
                        </div>
                        <div class="btn-bar">
                            <button class="edit-btn btn-delete" data-idquestion="${id_question}">
                                <i class="fa fa-trash btn-delete" data-idquestion="${id_question}"></i> Eliminar 
                            </button>
                        </div>
                    </div>
                </div>

                <div class="centro">
                    <div class="cuestionario space">
                        <div class="text-edi otro question" contenteditable id="question_${id_question}">
                            ${ ( question.description ) ? question.description :"Nuena Pregunta"}
                        </div>
                    </div>
                </div>

                <div class="centro pb-2">
                    <div class="text-option space"> 
                        <div class="option-text" >
                            <div class="flex-option" id="container_options_${id_question}">
                                ${optionsHTML}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        `;
    },

    renderQuestions : ( questions,all_options = [] ) =>{

        crud_concurso.id_question = 1;

        crud_concurso.container_questions[0].innerHTML = "";

        questions.forEach( ( question )=>{
            let id_question = question.id;            
            let id_option = 0;

            let optionsHTML = all_options.filter( option=> option.id_pregunta == id_question ).map(( option )=>{
                id_option++;
                return `
                    <div class="mb-1">
                        <input type="radio" id="rd_p${crud_concurso.id_question}_option_${id_option}" ${ option.es_correcto == 1 ? "checked" : "" } name="option_question_${crud_concurso.id_question}">
                        <span contenteditable class="option" data-idradio='rd_p${crud_concurso.id_question}_option_${id_option}'>${option.description}</span>
                        <a href="#" class="text-danger">x</a>
                    </div>
                `;
            }).join(' ') + 
            `<div class="mt-1">
                <input type="radio" id="rd_add_opt_${crud_concurso.id_question}">
                <a href="#" id="add_opt_${crud_concurso.id_question}" class="add-option" >Agregar opcionaaa</a>
            </div>`;

            let questionsHTML = crud_concurso.getHtmlQuestion(crud_concurso.id_question,question,optionsHTML);
            crud_concurso.id_question++;
            crud_concurso.container_questions[0].innerHTML += questionsHTML;
        });

        crud_concurso.renderNumberQuestion();
        
    },

    saveData: (event)=>{
        event.preventDefault();
        
        let options = [];
        let questions = [];

        [...document.querySelectorAll("#container_questions .question")].forEach( (element)=>{

            options.push( [...document.querySelectorAll("#container_q" + element.id.match(/\d+/)[0] + " .option")].map( (element)=>{
                return element.innerHTML.trim() + ',,' + ( $("#" + element.dataset.idradio).is(":checked") ? 1 : 0 ) ;
            }).join('||') );

            questions.push( element.innerHTML.trim() );            
        });

        options = options.join( '¡!' );
        questions = questions.join('||');

        let action = $("#txt_crud_action").val();
        let id = $("#txt_crud_id").val();
        let description = $("#txt_crud_description").val();
        let resumen = $("#txt_crud_resumen").val();
        let fecha = $("#txt_crud_fecha").val();
        let hora_inicio = $("#txt_crud_hora_inicio").val();
        let hora_fin = $("#txt_crud_hora_fin").val();
        let direccion = $("#txt_direccion").val();
        let monto_inscripcion = $("#txt_monto_inscripcion").val();

        let url_img = $("#img_concurso").attr("src");
        let fl_img = document.getElementById("fl_crud_img_concurso");

        let fd = new FormData();

        let data = {
            id : id,
            descripcion : description,
            resumen : resumen,
            fecha : fecha,
            hora_inicio : hora_inicio,
            hora_fin : hora_fin,
            direccion : direccion,
            monto_inscripcion : monto_inscripcion            
        }

        fd.append("id",id);
        fd.append("description",description);
        fd.append("resumen",resumen);
        fd.append("fecha",fecha);
        fd.append("hora_inicio",hora_inicio);
        fd.append("hora_fin",hora_fin);
        fd.append("direccion",direccion);
        fd.append("monto_inscripcion",monto_inscripcion);
        
        fd.append("preguntas",questions);
        fd.append("opciones",options);

        fd.append("url_img",url_img);        
        fd.append("url_img_old",crud_concurso.url_img_old);
        fd.append("fl_img", fl_img.files.length > 0 ? fl_img.files[0] : "");        

        ajaxFDRequest(action,"post","ConcursoController.php",fd,(result)=>{
            if(result.error === ""){
                $("#" + crud_concurso.id_modal).modal("hide");
                showMessage(result.success,"success");
                crud_concurso.reloadTable();
                setTimeout(()=> location.href = "?url=concursos", 300 );
            }else{
                showMessage(result.error,"error");
            }
        });

    },    
    
    reloadTable : ()=>{
        if(crud_concurso.dtable) crud_concurso.dtable.draw();
    }

};


const initInputMask = () => {
    $("#txt_crud_fecha").inputmask("dd/mm/yyyy");    
    $("#txt_crud_hora_inicio").inputmask("hh:mm t");
    $("#txt_crud_hora_fin").inputmask("hh:mm t");
}

const searchEventListener = (event)=>{
    let target = event.target;    
    switch(event.type){
        case 'click' :  if( target.classList.contains("btn-filter")) crud_concurso.reloadTable(); ;break;
        case 'change': if( target.classList.contains("cbx-filter")) crud_concurso.reloadTable(); ;break;
        case 'search': if( target.classList.contains("txt-filter")) crud_concurso.reloadTable(); ;break;
        case 'keyup' : if( target.classList.contains("txt-filter")) crud_concurso.reloadTable(); ;break;
    }
}

document.addEventListener('DOMContentLoaded',()=>{
        
    crud_concurso.init();
    initInputMask();
});