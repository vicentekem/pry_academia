<script id="tmpl_card_curso" type="x-tmpl-mustache">
    {{#data}}
        <div class="curso__card">

            <!-- curso--imagen -->
            <div class="caja-imagen">
                <div class="curso__imagen">
                    <a href="?url=ciclo&id={{id}}"><img src={{url_img_curso}} class="imagen--estilos"></a>
                </div>

                <!-- contenido curso -->
                <div class=" curso__contenido ">
                    <div class="caja__contenido-curso">
                        <a href="?url=ciclo&id={{id}}">
                            <h3 class="curso__title">
                                <span>{{description}}</span>
                            </h3>
                        </a>
                        <p class="curso__text">
                            {{resumen}}
                        </p>
                    </div>
                    <div class="curso__view">
                        <a href="?url=ciclos.php" class="curso__btn">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 svg__icon" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 13h6m-3-3v6m5 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                            </svg>
                            <span>Cruso</span>
                        </a>
                    </div>
                </div>
            </div>
            <!-- curso profesor -->
            <div class="curso__profesor">
                <div class="curso__profesor--medida">
                    <div class="img__profesor">
                        <div class="img__radios">
                            <img src={{url_img_profesor}} class="foto" alt="">
                        </div>
                    </div>
                    <p>{{nombre_profesor}}</p>
                </div>

                <!-- Precio curso -->
                <div class="curso__precio">
                    <a href="#">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
                        </svg>
                        <span> s/.{{monto_matricula}}</span>
                    </a>

                </div>

            </div>
        </div>
    {{/data}}
</script>