let view_concurso = {
    
    dtable: null,
    id_table: "tbl_concursos",
    id_adj_modal: "modal_adj_pago",
    id_view_modal: "modal_view_pago",
    id_chk_modal: "modal_chk_pago",
    table : $("#tbl_concursos"),
    id_rol : parseInt($("#txt_session_id_rol").val() || 100),
    id_concurso : getParameterByName("id"),
    container_questions : $("#container_questions"),
    i_nro_question : 1,
    init : ()=>{

        let btn_new_pago = $("#btn_new_pago");        
        let filter_container_jq = $("#filter_container");
        let btn_save_pago = $("#btn_save_respuestas");
        let btn_save_chk_pago = $("#btn_save_chk_pago");

        filter_container_jq.on("click",  event => searchEventListener( event ) );
        filter_container_jq.on("change", event => searchEventListener( event ) );        
        filter_container_jq.on("keyup", event => {
            if(event.keyCode == 13 || event.keyCode == 27){ searchEventListener(event);}
            if(event.keyCode == 27){ event.target.value = ""; }
        });

        btn_new_pago.on("click",  ()=> view_concurso.openModal());
        btn_save_pago.on("click", (event)=> view_concurso.saveData(event));
        btn_save_chk_pago.on("click", (event)=> view_concurso.saveChkData(event));
        
        if(view_concurso.id_concurso==""){
            view_concurso.renderData();
        }else{
            view_concurso.renderDataQuestions();
        }

    },

    renderData: ()=>{        
        ajaxRequest("qry_concurso_inscripcion","get","ConcursoController.php",{ search:$("#txt_filter").val() },(result)=>{

            let html_render = result.rows.map( item => {                
                return `
                    <tr>
                        <td class="project-status">
                            <span class="label label-primary">${item.estado}</span>
                        </td>

                        <td class="project-title">
                            <a href="project_detail.html">${item.description}</a>
                            <br>
                            <small> ${item.fecha} Desde ${item.hora_inicio} hasta ${item.hora_fin}</small>
                        </td>

                        <td class="project-completion">
                                <small>Su puntaje es: ${item.puntaje}</small>
                                <div class="progress progress-mini">
                                    <div style="width: ${item.puntaje}%;" class="progress-bar"></div>
                                </div>
                        </td>

                        <td class="project-actions">
                            ${item.id_estado == 1 ? '<a href="?url=participar_concurso&id=21" class="btn btn-white btn-sm">Empezar</a>' : ''}
                        </td>
                    </tr>
                `;
                //${item.id_estado == 2 ? '<a href="?url=participar_concurso&id=21" class="btn btn-white btn-sm"> Ver Respuestas </a>' : ''}
            } ).join();            
            view_concurso.table.html( html_render );
        });
    },

    renderDataQuestions: ()=>{

        ajaxRequest("get_concurso","get","ConcursoController.php",{ id: view_concurso.id_concurso },(result)=>{            
            let d = result.row;
            let preguntas = result.preguntas;
            let opciones = result.opciones;
            if( d == null ) location.href = "?url=participar_concurso" ;
            $("#title_concurso").html( d.description );
            view_concurso.renderQuestions( preguntas, opciones );            
        });
    },

    renderQuestions : ( questions,all_options = [] ) =>{

        view_concurso.i_nro_question = 1;

        view_concurso.container_questions[0].innerHTML = "";

        questions.forEach( ( question )=>{
            let id_question = question.id;
            let id_option = 0;
            
            let optionsHTML = all_options.filter( option=> option.id_pregunta == id_question ).map(( option )=>{
                id_option++;
                return `
                    <div class="mb-1">
                        <input type="radio" id="rd_option_${option.id}" name="option_question_${option.id_pregunta}">
                        <label for="rd_option_${option.id}" class="option" >${option.description}</label>
                    </div>
                `;

            }).join(' ');
            
            let questionsHTML = view_concurso.getHtmlQuestion(id_question,question,optionsHTML);
            view_concurso.i_nro_question++;
            view_concurso.container_questions[0].innerHTML += questionsHTML;
        });

        view_concurso.renderNumberQuestion();
        
    },

    getHtmlQuestion : ( id_question , question = {} , optionsHTML)=>{
                
        return `
            <div class="contenedor_pregunta" id="container_q${id_question}">
                <div class="centro">
                    <div class="head-preguntas">
                        <div class="title-pregunta">
                            <p>Pregunta <span class="question_numeric"></span></p>
                        </div>
                    </div>
                </div>

                <div class="centro">
                    <div class="cuestionario space">
                        <div class="text-edit otro question" id="question_${id_question}">
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

    renderNumberQuestion : ()=>{
        [...document.querySelectorAll("#container_questions .question_numeric")].forEach( (element,index) =>{
            element.innerHTML = index + 1;
        });
    },

    saveData: (event)=>{

        let id_concurso = view_concurso.id_concurso;
        let respuestas = [];

        [...document.querySelectorAll("#container_questions .question")].forEach( (element)=>{

            //console.log( element );
            let id_question = element.id.match(/\d+/)[0];
            let option_select = $("#container_q" + id_question + " input:checked" );
            let id_option_selected = option_select.length > 0 ? option_select[0].id.match(/\d+/)[0] : 0 ;
            
            respuestas.push( id_question + ',' + id_option_selected );

        });
        respuestas = respuestas.join( '|' );

        ajaxRequest("save_respuestas","post","ConcursoController.php",{ id:id_concurso,respuestas:respuestas },(result)=>{
            if(result.error === ""){
                showMessage(result.success,"error");
                location.href = "?url=participar_concurso";
            }else{
                showMessage(result.error,"error");
            }
        });

    },

};

const searchEventListener = (event)=>{    
    let target = event.target;    
    switch(event.type){
        case 'click' :  if( target.classList.contains("btn-filter")) view_concurso.renderData(); ;break;
        case 'change': if( target.classList.contains("cbx-filter")) view_concurso.renderData(); ;break;
        case 'search': if( target.classList.contains("txt-filter")) view_concurso.renderData(); ;break;
        case 'keyup' : if( target.classList.contains("txt-filter")) view_concurso.renderData(); ;break;
    }
}

document.addEventListener('DOMContentLoaded',()=>{
    view_concurso.init();    
});
