let view_ciclo = {
    cursos: [],
    departamento: [],

    init: () => {
        let cbx_cursos = $("#cbx_ciclo");
        let cbx_turnos = $("#cbx_turno");        

        cbx_cursos.on("change", (event) => {      
            let idCurso = event.target.value;
            if (idCurso != "") {
                ajaxRequest("cbx_turnos_x_curso","get","CursoProgramadoController.php",{ id_curso_programado: idCurso },(result) => {          
                    loadDataToTemplate("tmpl_cbx_main", "cbx_turno", result["rows"]);
                });
            }else{
                loadDataToTemplate("tmpl_cbx_main", "cbx_turno", []);
            }
        });

        cbx_turnos.on("change", (event) => {      
            let idTurno = event.target.value;
            let idCurso = $("#cbx_turno").val();
            let monto = "";
            if (idCurso != "" && idTurno) {
                let index = view_ciclo.cursos.findIndex( curso => curso.id == idCurso);
                monto = view_ciclo.cursos[index].monto_matricula;
            }
            $("#precio").val(monto);
        });
        //  ===================================================================
        let cbx_depa = $("#cbx_departamento");
        let cbx_prov = $("#cbx_provincia");

        cbx_depa.on("change", (event) => {
        let idDepa = event.target.value;
        if(idDepa != ""){
            ajaxRequest("cbx_provincias","get","UbigeoController.php",{ id_departamento: idDepa },(result) => {          
            loadDataToTemplate("tmpl_cbx_main", "cbx_provincia", result["rows"]);
            });
        }else{
            loadDataToTemplate("tmpl_cbx_main", "cbx_provincia", []);
        }      
        distrito();
        });

        function distrito (){
            cbx_prov.on("change", (event) => {
            let idProv = event.target.value;
            if(idProv != ""){
                ajaxRequest("cbx_distritos","get","UbigeoController.php",{ id_provincia: idProv },(result) => {
                    loadDataToTemplate("tmpl_cbx_main", "cbx_distrito", result["rows"]);
                });
            }else{
                loadDataToTemplate("tmpl_cbx_main", "cbx_distrito", []);
            }

            })
        }

        //  ===================================================================
        let btn_send_data = $("#btn_send_data");
        btn_send_data.on("click",()=>  view_ciclo.sendData() );

        view_ciclo.showDatos();
    },

    showDatos: () => {

        loadDataToTemplate("tmpl_cbx_main", "cbx_turno", []);
        loadDataToTemplate("tmpl_cbx_main", "cbx_provincia", []);
        loadDataToTemplate("tmpl_cbx_main", "cbx_distrito", []);

        ajaxRequest("cbx_curso_programado","get","CursoProgramadoController.php",{},(result) => {        
            loadDataToTemplate("tmpl_cbx_main", "cbx_ciclo", result["rows"]);
            view_ciclo.cursos = result.rows;
        });

        ajaxRequest("cbx_departamentos","get","UbigeoController.php",{},(result) => {
            loadDataToTemplate("tmpl_cbx_main", "cbx_departamento", result["rows"]);
        });

    },

    validateData : (data)=>{
        let msg = "";
        if(data.id_curso_programado == ""){msg = "Seleccione ciclo";}
        else if(data.id_turno == ""){msg = "Seleccione turno";}
        else if(data.dni == ""){msg = "El DNI es requerido";}
        else if(isValidDNI(data.dni)==false){msg="DNI no valido";}
        else if(data.nombre == ""){msg = "El nombre es requerido";}
        else if(data.ape_pat == ""){msg = "El apellido paterno es requerido";}
        else if(data.ape_mat == ""){msg = "El apellido materno es requerido";}
        else if(data.id_departamento == ""){msg = "Seleccione Departamento";}
        else if(data.id_provincia == ""){msg = "Seleccione Provincia"; }
        else if(data.id_distrito == ""){msg = "Seleccione Distrito";}
        else if(data.correo == ""){msg = "Ingrese correo";}
        else if(isValidEmail(data.correo)==false && data.correo!=""){msg="Correo ingresado no es valido";}
        else if(data.correo != data.confirmar_correo){msg="Los correos ingresados no coinciden";}
        return msg;
    },

    sendData(){
        let action = $("#txt_action").val();
        let id = $("#txt_id").val();
        let id_persona = $("#txt_id_persona").val();

        let dni = $("#txt_dni").val();
        let nombre = $("#txt_nombre").val();
        let ape_pat = $("#txt_ape_pat").val();
        let ape_mat = $("#txt_ape_mat").val();
        let id_departamento = $("#cbx_departamento").val();
        let id_provincia = $("#cbx_provincia").val();
        let id_distrito = $("#cbx_distrito").val();        
        let correo = $("#txt_correo").val();
        let confirmar_correo = $("#txt_confirmar_correo").val();
        let celular = $("#txt_celular").val();

        let id_curso_programado = $("#cbx_ciclo").val();
        let id_turno = $("#cbx_turno").val();

        let data = {
            id : id,
            id_persona: id_persona,
            dni : dni,
            nombre : nombre,
            ape_pat : ape_pat,
            ape_mat : ape_mat,
            id_departamento:id_departamento,
            id_provincia:id_provincia,
            id_distrito : id_distrito,
            correo : correo,
            confirmar_correo : confirmar_correo,
            celular : celular,
            id_curso_programado : id_curso_programado,
            id_turno : id_turno
        }

        let err_msg = view_ciclo.validateData(data);        
        if(err_msg != "") return showMessage( err_msg , "error");

        ajaxRequest("ins_matricula","post","MatriculaController.php",data,(result)=>{
            if(result.error === ""){
                location.href = "?url=correo";
            } else {
                showMessage(result.error,"error");
            }
        });
    }
};


document.addEventListener("DOMContentLoaded", () => {
    view_ciclo.init();  
});
