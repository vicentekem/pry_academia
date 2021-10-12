let view_inscripcion = {
    btn_send_data : $("#btn_register"),
    id_concurso : getParameterByName("id"),
    init: () => {
        view_inscripcion.btn_send_data.on("click",(event)=>{
            event.preventDefault();
            view_inscripcion.sendData();

        });
        
        view_inscripcion.loadData();
    },
    loadData: ()=>{        
        if( view_inscripcion.id_concurso ){
            ajaxRequest("get_desc_concurso","get","ConcursoController.php",{id:view_inscripcion.id_concurso},(result)=>{
                $("#txt_concurso").val( result["row"] ? result["row"]["description"] : "");
            });    
        }
    },

    validateData : (data)=>{
        let msg = "";
        if(data.id == ""){msg = "Id es requerido";}
        else if(data.id_turno == ""){msg = "Seleccione turno";}
        else if(data.dni == ""){msg = "El DNI es requerido";}
        else if(isValidDNI(data.dni)==false){msg="DNI no valido";}
        else if(data.nombre == ""){msg = "El nombre es requerido";}
        else if(data.ape_pat == ""){msg = "El apellido paterno es requerido";}
        else if(data.ape_mat == ""){msg = "El apellido materno es requerido";}        
        else if(data.correo == ""){msg = "Ingrese correo";}        
        return msg;
    },

    sendData(){

        let action = "ins_inscripcion";
        let id_concurso = view_inscripcion.id_concurso;

        let dni = $("#txt_dni").val();
        let nombre = $("#txt_nombre").val();
        let ape_pat = $("#txt_ape_pat").val();
        let ape_mat = $("#txt_ape_mat").val();
        let celular = $("#txt_celular").val();
        let correo = $("#txt_correo").val();
                
        let data = {
            id_concurso : id_concurso,
            dni : dni,
            nombre : nombre,
            ape_pat : ape_pat,
            ape_mat : ape_mat,
            correo : correo,
            celular : celular
        }

        let err_msg = view_inscripcion.validateData(data);
        if(err_msg != "") return showMessage( err_msg , "error");

        ajaxRequest(action,"post","InscripcionController.php",data,(result)=>{
            if(result.error === ""){
                location.href = "?url=correo";
            } else {
                showMessage(result.error,"error");
            }
        });
    }
};




document.addEventListener('DOMContentLoaded',()=>{
    view_inscripcion.init();
});

