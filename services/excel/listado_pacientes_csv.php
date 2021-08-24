<?php

require_once __DIR__ . '/../../controllers/validator/SeguimientoXlsValidator.php';

function getInfoSeg($rs, $i, $inicio, $id_paciente_actual, $n, $data)
{

    if (isset($rs[($i - $inicio) + $n])) {
        return $rs[($i - $inicio) + $n]['id_paciente'] == $id_paciente_actual ?
            $rs[($i - $inicio) + $n][$data] : '';
    } else {
        return '';
    }
}


$ex = new SeguimientoXlsValidator();
$data_result = $ex->getPacienteXls();
$rsA = $data_result["rows"];

function download_send_headers($filename)
{
    // disable caching
    $now = gmdate("D, d M Y H:i:s");

    header("Expires: Tue, 03 Jul 2001 06:00:00 GMT");
    header("Cache-Control: max-age=0, no-cache, must-revalidate, proxy-revalidate");
    header("Last-Modified: {$now} GMT");

    // force download
    header("Content-Type: application/force-download");
    header("Content-Type: application/octet-stream");
    header("Content-Type: application/download");

    // disposition / encoding on response body
    header("Content-Type: application/vnd.ms-excel");
    header("Content-Disposition: attachment;filename={$filename}");
}

$rs = [];

$inicio = 3;
$fila_excel = 3;

//exit(json_encode($data_result));
$id_paciente_actual = null; //(count($rsA) + $inicio)
for ($i = $inicio; $i < (count($rsA) + $inicio); $i++) {

    if ($rsA[$i - $inicio]['id_paciente'] != $id_paciente_actual) {

        $id_paciente_actual = $rsA[$i - $inicio]['id_paciente'];

        if ($rsA[$i - $inicio]['id_sexo'] == 1) {
            $sexo = 'MASCULINO';
        } else if ($rsA[$i - $inicio]['id_sexo'] == 2) {
            $sexo = 'FEMENINO';
        } else {
            $sexo = '';
        }

        //exit(json_encode($rsA[$i - $inicio]['tipo_muestra']));
        $tiempo = "";
        if ($rsA[$i - $inicio]['tiempo_anios']) {
            $tiempo .= $rsA[$i - $inicio]['tiempo_anios'] . " años ";
        }
        if ($rsA[$i - $inicio]['tiempo_meses']) {
            $tiempo .= $rsA[$i - $inicio]['tiempo_meses'] . " meses ";
        }
        if ($rsA[$i - $inicio]['tiempo_dias']) {
            $tiempo .= $rsA[$i - $inicio]['tiempo_dias'] . " dias ";
        }

        if ($rsA[$i - $inicio]['tipo_seguro'] !== 'OTROS') {
            $rsA[$i - $inicio]['desc_seguro'] = '';
        }

        $con_facores_riesgo = 'NO';

        if ($rsA[$i - $inicio]['edad_anios'] > 60 || $rsA[$i - $inicio]['cc_embarazo'] == true ||
            $rsA[$i - $inicio]['cc_pos_parto'] == true || $rsA[$i - $inicio]['cc_enf_car'] == true ||
            $rsA[$i - $inicio]['cc_inmunodeficiencia'] == true || $rsA[$i - $inicio]['cc_diabetes'] == true ||
            $rsA[$i - $inicio]['cc_enf_ren'] == true || $rsA[$i - $inicio]['cc_enf_hep'] == true ||
            $rsA[$i - $inicio]['cc_dan_hep'] == true || $rsA[$i - $inicio]['cc_enf_cro'] == true ||
            $rsA[$i - $inicio]['cc_enf_pul'] == true || $rsA[$i - $inicio]['cc_otros'] == true
        ) {
            $con_facores_riesgo = 'SI';
        }



        $rsn['tipo_doc'] = $rsA[$i - $inicio]['tipo_documento'];
        $rsn['nro_doc'] = "'" . $rsA[$i - $inicio]['nrodoc'];
        $rsn['nombres_pac'] = mb_convert_encoding( $rsA[$i - $inicio]['nombre_completo'],'utf-16','utf-8');
        $rsn['idUbigeoActual'] = $rsA[$i - $inicio]['id_ubigeo'];
        $rsn['DepartamentoPacienteActual'] = $rsA[$i - $inicio]['departamento'];
        $rsn['ProvinciaPacienteActual'] = $rsA[$i - $inicio]['provincia'];
        $rsn['DistritoPacienteActual'] = $rsA[$i - $inicio]['distrito'];
        $rsn['direccionActual'] = mb_convert_encoding($rsA[$i - $inicio]['descrip_dir'],'utf-16','utf-8');
        $rsn['Referencia Domiciliaria'] = mb_convert_encoding($rsA[$i - $inicio]['descrip_ref'],'utf-16','utf-8');
        $rsn['Celuar'] = $rsA[$i - $inicio]['telefono'];
        $rsn['tipoSeguroSalud'] = $rsA[$i - $inicio]['tipo_seguro'];
        $rsn['descripcion_otros_seguros'] = $rsA[$i - $inicio]['desc_seguro'];
        $rsn['fechaNacimiento'] = $rsA[$i - $inicio]['fecha_nacimiento'];
        $rsn['edad'] = $rsA[$i - $inicio]['edad_anios'];
        $rsn['SexoPaciente'] = $sexo;
        $rsn['TipoMuestra'] = $rsA[$i - $inicio]['tipo_muestra'];
        $rsn['fecha_toma_muestra'] = $rsA[$i - $inicio]['fecha_toma_muestra'];
        $rsn['fecha_resultado_muestra'] = $rsA[$i - $inicio]['fecha_resultado_muestra'];
        $rsn['tiempo transcurrido desde toma muestra'] = $tiempo;
        $rsn['fecha_hospitalizacion'] = $rsA[$i - $inicio]['fecha_ingreso'];
        $rsn['Hospital'] = $rsA[$i - $inicio]['hospital'];
        $rsn['fecha_alta'] = $rsA[$i - $inicio]['fecha_alta'];
        $rsn['fecha_defuncion'] = $rsA[$i - $inicio]['fecha_defuncion'];
        $rsn['temperatura'] = $rsA[$i - $inicio]['temperatura'];
        $rsn['com - embarazo'] = $rsA[$i - $inicio]['cc_embarazo'] == true ? 'SI' : 'NO';
        $rsn['com - pos parto'] = $rsA[$i - $inicio]['cc_pos_parto'] == true ? 'SI' : 'NO';
        $rsn['com - enfermedad cardiovascular'] = $rsA[$i - $inicio]['cc_enf_car'] == true ? 'SI' : 'NO';
        $rsn['com - inmunodeficiencia'] = $rsA[$i - $inicio]['cc_inmunodeficiencia'] == true ? 'SI' : 'NO';
        $rsn['com - diabetes'] = $rsA[$i - $inicio]['cc_diabetes'] == true ? 'SI' : 'NO';
        $rsn['com - enfermedad renal'] = $rsA[$i - $inicio]['cc_enf_ren'] == true ? 'SI' : 'NO';
        $rsn['com - enfermedad hepatica'] = $rsA[$i - $inicio]['cc_enf_hep'] == true ? 'SI' : 'NO';
        $rsn['com - daño hepatico'] = $rsA[$i - $inicio]['cc_dan_hep'] == true ? 'SI' : 'NO';
        $rsn['com - enfermedad cronica neurologica o neuromuscular'] = $rsA[$i - $inicio]['cc_enf_cro'] == true ? 'SI' : 'NO';
        $rsn['enfermedad pulmonar cronica'] = $rsA[$i - $inicio]['cc_enf_pul'] == true ? 'SI' : 'NO';
        $rsn['com - otros'] = $rsA[$i - $inicio]['cc_otros'] == true ? $rsA[$i - $inicio]['cc_desc'] : '';
        $rsn['ocupacion'] = $rsA[$i - $inicio]['ocupacion_paciente'];
        $rsn['fecha_ultimo_seguimiento'] = $rsA[$i - $inicio]['fecha_ult_seg'];
        $rsn['tipo_caso_actual'] = $rsA[$i - $inicio]['tipo_caso'];
        $rsn['condicion_actual'] = $rsA[$i - $inicio]['evolucion_paciente'];
        $rsn['motivo_diferido'] = $rsA[$i - $inicio]['motivo_diferido'];
        $rsn['observacion_ultimo_seguimiento'] = $rsA[$i - $inicio]['obs_ult_seg'];
        $rsn['fecha_regitro'] = $rsA[$i - $inicio]['fecha_creacion'];
        $rsn['con factores de riesgo'] = $con_facores_riesgo;

        for($k=0;$k<20;$k++){
            $rsn['S' . ($k + 1) . '- FECHA'] = getInfoSeg($rsA, $i, $inicio, $id_paciente_actual,  $k, 'fecha_atendido');
            $rsn['S' . ($k + 1) . '- TIPO DE SGTO'] = getInfoSeg($rsA, $i, $inicio, $id_paciente_actual,  $k, 'tipo_seguimiento');
            $rsn['S' . ($k + 1) . '- CONDICION'] = getInfoSeg($rsA, $i, $inicio, $id_paciente_actual,  $k, 'estado_evolucion_pac');
            $rsn['S' . ($k + 1) . '- TIPO CASO'] = getInfoSeg($rsA, $i, $inicio, $id_paciente_actual,  $k, 'tipo_caso_seg');
            $rsn['S' . ($k + 1) . '- OBSERVACIONES'] = mb_convert_encoding(getInfoSeg($rsA, $i, $inicio, $id_paciente_actual,  $k, 'observacion'),'utf-16','utf-8');
        }

        $rs[] = $rsn;

        $fila_excel++;
    }

}


download_send_headers("ListadoPacientes.xls");
$show_coloumn = true;


if (!empty($rs)) {
    echo implode("\t", array_keys(reset($rs))) . "\n";;
    foreach ($rs as $record) {
        echo str_replace("\n","",implode("\t", array_values($record))) . "\n";
    }
}

?>


