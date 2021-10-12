<div class="ibox-title">
    <h5 id="title_concurso"> Concurso Nro 1 </h5>
    <div class="ibox-tools">
        <!-- <a href="" class="btn btn-primary btn-xs">Create new project</a>-->
    </div>
</div>

<div class="ibox-content">

    <div class="contenido-card" id="container_questions" >
        <div class="contenedor_pregunta" id="container_q1">
            <div class="centro">
                <div class="head-preguntas">
                    <div class="title-pregunta">
                        <p>Pregunta <span class="question_numeric">1<span></p>
                    </div>
                    <div class="btn-bar">                        
                    </div>
                </div>
            </div>

            <div class="centro">
                
                <div class="cuestionario space">
                    <div class="text-edi otro question" contenteditable id="question_1">
                        Primera Pregunta
                    </div>                    
                </div>
            </div>

            <div class="centro pb-2">
                <div class="text-option space"> 
                    <div class="option-text" >
                        <div class="flex-option" id="container_options_1">

                            <div class="mb-1 div_option_1">
                                <input type="radio" id="rd_p1_option_1" name="option_question_1">
                                <span contenteditable class="option" data-idradio='rd_p1_option_1'>Nueva opcion</span>
                                <a href="#" style="font-size:1.05em" data-idoption='1' data-idquestion='1' 
                                    class="text-danger remove-option ml-1">x</a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="form-group col-12 px-1 mt-3 mb-0">
        <button id="btn_save_respuestas" class="btn btn-primary" type="button">Guardar</button>
    </div>

</div>