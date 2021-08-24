<?php

require_once __DIR__ . '/../../controllers/validator/SeguimientoValidator.php';

function getInfoSeg($rs, $i, $inicio, $id_paciente_actual, $n, $data)
{

    if (isset($rs[($i - $inicio) + $n])) {
        return $rs[($i - $inicio) + $n]['id_paciente'] == $id_paciente_actual ?
            $rs[($i - $inicio) + $n][$data] : '';
    } else {
        return '';
    }
}


$ex = new SeguimientoValidator();
$data_result = $ex->getSeguimientosSMental();
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
//exit(json_encode($data_result));

for ($i = 0; $i < count($rsA); $i++) {
    $rsn['nro_doc'] = "'" . $rsA[$i]['nrodoc'];
    $rsn['paciente'] = mb_convert_encoding( $rsA[$i]['nombre_completo'],'utf-16','utf-8');
    $rsn['usuario'] = $rsA[$i]['nombre_usuario'];
    $rsn['fecha'] = $rsA[$i]['fecha_atendido'];
    $rsn['observacion'] = $rsA[$i]['observacion'];
    $rs[] = $rsn;
}

//exit(var_dump($rs));

download_send_headers("ListadoSeguimientos.xls");
$show_coloumn = true;


if (!empty($rs)) {
    echo implode("\t", array_keys(reset($rs))) . "\n";;
    foreach ($rs as $record) {
        echo str_replace("\n","",implode("\t", array_values($record))) . "\n";
    }
}

?>


