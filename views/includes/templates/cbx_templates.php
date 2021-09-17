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
         <option value='{{id}}'> {{description}} </option>
    {{/data}}
</script>
