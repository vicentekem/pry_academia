<script id="tmpl_cbx_tabla" type="x-tmpl-mustache">
    <option value = "">-SELECCIONE-</option>
    <option value='0'>TABLAS</option>
    {{#data}}
         <option value='{{id}}'> {{description}} </option>
    {{/data}}
</script>

<script id="tmpl_cbx_main" type="x-tmpl-mustache">
    <option value = "">-SELECCIONE-</option>
    {{#data}}
         <option value='{{id}}' {{#selected}} selected {{/selected}} > {{description}} </option>
    {{/data}}
</script>

<!-- ==================== Controller ==================== -->
<!-- ------------------ -->
<!-- Menu controller -->
<!-- ------------------ -->
<script id="tmpl_cbx_controller" type="x-tmpl-mustache">
    <option value = "">-SELECCIONE-</option>
    <!-- <option value='0'>TABLAS</option> -->
    {{#data}}
         <option value='{{id}}' {{#selected}} selected {{/selected}} > {{name_menu}} </option>
    {{/data}}
</script>

<script id="tmpl_cbx_controller_subOptions" type="x-tmpl-mustache">
    {{#data}}
        <option value='{{id}}' {{#selected}} selected {{/selected}}> {{name_menu}} </option>
    {{/data}}
</script>

<!-- ------------------ -->
<!-- Usuario Controller -->
<!-- ------------------ -->
<script id="tmpl_cbx_usuario_controller" type="x-tmpl-mustache">
    <option value = "">-SELECCIONE-</option>
    {{#data}}
         <option value='{{id}}' {{#selected}} selected {{/selected}} > {{text}} </option>
    {{/data}}
</script>