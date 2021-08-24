<?php

if( !isset($_SESSION['usuario_cor']) ){
    session_start();
}

if (!isset($_SESSION['usuario_cor'])) exit();

require_once __DIR__ . '/../../controllers/validator/SeguimientoXlsValidator.php';
require_once __DIR__ . '/../../lib/PHPExcel/Classes/PHPExcel.php';
require_once __DIR__ . '/../../lib/PHPExcel/Classes/PHPExcel/IOFactory.php';

function getInfoSeg($rs,$i,$inicio,$id_paciente_actual,$n,$data){

    if( isset($rs[($i - $inicio) + $n  ] )){
        return $rs[($i - $inicio) + $n  ]['id_paciente'] == $id_paciente_actual ?
            $rs[($i - $inicio) + $n  ][$data]  : '';
    }else{
     return '';
    }
}


$ex = new SeguimientoXlsValidator();
$data_result = $ex->getPacienteXls();
$rsA = $data_result["rows"];

//exit( json_encode($data_result) );

$file_path = (realpath(dirname(__FILE__))) . "/files/listado_pacientes_seguimientos.xlsx";
$objPHPExcel = new PHPExcel();
try {
    $inputFileType = PHPExcel_IOFactory::identify($file_path);
    $objReader = PHPExcel_IOFactory::createReader($inputFileType);
    $objPHPExcel = $objReader->load($file_path);


    $style_danger = new PHPExcel_Style();
    $style_danger->applyFromArray(array(
            'fill' => array(
                'type' => PHPExcel_Style_Fill::FILL_SOLID,
                'color' => array('rgb' => 'FF0000')
            ),
            'borders' => array(
                'allborders' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN,
                    'color' => array(
                        'rgb' => '3a2a47'
                    )
                ),
                'top' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN,
                    'color' => array(
                        'rgb' => '3a2a47'
                    )
                )
            ),
        )
    );

    $style_success = new PHPExcel_Style();
    $style_success->applyFromArray(array(
            'fill' => array(
                'type' => PHPExcel_Style_Fill::FILL_SOLID,
                'color' => array('rgb' => '92D050')
            ),
            'borders' => array(
                'allborders' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN,
                    'color' => array(
                        'rgb' => '3a2a47'
                    )
                ),
                'top' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN,
                    'color' => array(
                        'rgb' => '3a2a47'
                    )
                )
            ),
        )
    );


    $style_warning = new PHPExcel_Style();
    $style_warning->applyFromArray(array(
            'fill' => array(
                'type' => PHPExcel_Style_Fill::FILL_SOLID,
                'color' => array('rgb' => 'ffff00')
            ),
            'borders' => array(
                'allborders' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN,
                    'color' => array(
                        'rgb' => '3a2a47'
                    )
                ),
                'top' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN,
                    'color' => array(
                        'rgb' => '3a2a47'
                    )
                )
            ),
        )
    );

    $style_secondary = new PHPExcel_Style();
    $style_secondary->applyFromArray(array(
            'fill' => array(
                'type' => PHPExcel_Style_Fill::FILL_SOLID,
                'color' => array('rgb' => 'bfbfbf')
            ),
            'borders' => array(
                'allborders' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN,
                    'color' => array(
                        'rgb' => '3a2a47'
                    )
                ),
                'top' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN,
                    'color' => array(
                        'rgb' => '3a2a47'
                    )
                )
            ),
        )
    );

    $style_brown = new PHPExcel_Style();
    $style_brown->applyFromArray(array(
            'fill' => array(
                'type' => PHPExcel_Style_Fill::FILL_SOLID,
                'color' => array('rgb' => 'E26B0A')
            ),
            'borders' => array(
                'allborders' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN,
                    'color' => array(
                        'rgb' => '3a2a47'
                    )
                ),
                'top' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN,
                    'color' => array(
                        'rgb' => '3a2a47'
                    )
                )
            ),
        )
    );

    $style_none = new PHPExcel_Style();
    $style_none->applyFromArray(array(
            'borders' => array(
                'allborders' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN,
                    'color' => array(
                        'rgb' => '3a2a47'
                    )
                ),
                'top' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN,
                    'color' => array(
                        'rgb' => '3a2a47'
                    )
                )
            ),
        )
    );
} catch (Exception $e) {
    exit('Error cargando el archivo ' . $e->getMessage());
}

try{

    $inicio = 3;
    $fila_excel = 3;

    //exit(json_encode($data_result));
    $id_paciente_actual = null;
    for($i=$inicio; $i < (count($rsA) + $inicio);$i++){

        if( $rsA[$i - $inicio]['id_paciente'] != $id_paciente_actual ){

            $id_paciente_actual = $rsA[$i - $inicio]['id_paciente'];

            if($rsA[$i - $inicio]['id_sexo'] == 1){ $sexo = 'MASCULINO'; }
            else if($rsA[$i - $inicio]['id_sexo'] == 2){ $sexo = 'FEMENINO'; }
            else {$sexo = '';}

            //exit(json_encode($rsA[$i - $inicio]['tipo_muestra']));
            $tiempo = "";
            if($rsA[$i - $inicio]['tiempo_anios']){ $tiempo.= $rsA[$i - $inicio]['tiempo_anios'] . " años "; }
            if($rsA[$i - $inicio]['tiempo_meses']){ $tiempo.= $rsA[$i - $inicio]['tiempo_meses'] . " meses "; }
            if($rsA[$i - $inicio]['tiempo_dias']){ $tiempo.= $rsA[$i - $inicio]['tiempo_dias'] . " dias "; }

            if( $rsA[$i - $inicio]['tipo_seguro'] !== 'OTROS' ){
                $rsA[$i - $inicio]['desc_seguro'] = '';
            }

            $con_facores_riesgo = 'NO';

            if( $rsA[$i - $inicio]['edad_anios'] > 60 || $rsA[$i - $inicio]['cc_embarazo'] == true ||
                $rsA[$i - $inicio]['cc_pos_parto'] == true || $rsA[$i - $inicio]['cc_enf_car'] == true ||
                $rsA[$i - $inicio]['cc_inmunodeficiencia'] == true || $rsA[$i - $inicio]['cc_diabetes'] == true ||
                $rsA[$i - $inicio]['cc_enf_ren'] == true|| $rsA[$i - $inicio]['cc_enf_hep'] == true ||
                $rsA[$i - $inicio]['cc_dan_hep'] == true || $rsA[$i - $inicio]['cc_enf_cro'] == true ||
                $rsA[$i - $inicio]['cc_enf_pul'] == true || $rsA[$i - $inicio]['cc_otros'] == true
            ){ $con_facores_riesgo = 'SI'; }

            $condiciones = [];
            $condiciones[0] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 0,'estado_evolucion_pac');
            $condiciones[1] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 1,'estado_evolucion_pac');
            $condiciones[2] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 2,'estado_evolucion_pac');
            $condiciones[3] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 3,'estado_evolucion_pac');
            $condiciones[4] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 4,'estado_evolucion_pac');
            $condiciones[5] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 5,'estado_evolucion_pac');
            $condiciones[6] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 6,'estado_evolucion_pac');
            $condiciones[7] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 7,'estado_evolucion_pac');
            $condiciones[8] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 8,'estado_evolucion_pac');
            $condiciones[9] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 9,'estado_evolucion_pac');
            $condiciones[10] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,10,'estado_evolucion_pac');
            $condiciones[11] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,11,'estado_evolucion_pac');
            $condiciones[12] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,12,'estado_evolucion_pac');
            $condiciones[13] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,13,'estado_evolucion_pac');
            $condiciones[14] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,14,'estado_evolucion_pac');
            $condiciones[15] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,15,'estado_evolucion_pac');
            $condiciones[16] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,16,'estado_evolucion_pac');
            $condiciones[17] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,17,'estado_evolucion_pac');
            $condiciones[18] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,18,'estado_evolucion_pac');
            $condiciones[19] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,19,'estado_evolucion_pac');


            $observaciones = [];
            $observaciones[0] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 0,'observacion');
            $observaciones[1] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 1,'observacion');
            $observaciones[2] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 2,'observacion');
            $observaciones[3] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 3,'observacion');
            $observaciones[4] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 4,'observacion');
            $observaciones[5] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 5,'observacion');
            $observaciones[6] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 6,'observacion');
            $observaciones[7] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 7,'observacion');
            $observaciones[8] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 8,'observacion');
            $observaciones[9] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 9,'observacion');
            $observaciones[10] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,10,'observacion');
            $observaciones[11] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,11,'observacion');
            $observaciones[12] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,12,'observacion');
            $observaciones[13] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,13,'observacion');
            $observaciones[14] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,14,'observacion');
            $observaciones[15] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,15,'observacion');
            $observaciones[16] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,16,'observacion');
            $observaciones[17] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,17,'observacion');
            $observaciones[18] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,18,'observacion');
            $observaciones[19] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,19,'observacion');


            $fechaSeguimiento = [];
            $fechaSeguimiento[0] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 0,'fecha_atendido');
            $fechaSeguimiento[1] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 1,'fecha_atendido');
            $fechaSeguimiento[2] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 2,'fecha_atendido');
            $fechaSeguimiento[3] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 3,'fecha_atendido');
            $fechaSeguimiento[4] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 4,'fecha_atendido');
            $fechaSeguimiento[5] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 5,'fecha_atendido');
            $fechaSeguimiento[6] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 6,'fecha_atendido');
            $fechaSeguimiento[7] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 7,'fecha_atendido');
            $fechaSeguimiento[8] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 8,'fecha_atendido');
            $fechaSeguimiento[9] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 9,'fecha_atendido');
            $fechaSeguimiento[10] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,10,'fecha_atendido');
            $fechaSeguimiento[11] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,11,'fecha_atendido');
            $fechaSeguimiento[12] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,12,'fecha_atendido');
            $fechaSeguimiento[13] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,13,'fecha_atendido');
            $fechaSeguimiento[14] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,14,'fecha_atendido');
            $fechaSeguimiento[15] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,15,'fecha_atendido');
            $fechaSeguimiento[16] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,16,'fecha_atendido');
            $fechaSeguimiento[17] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,17,'fecha_atendido');
            $fechaSeguimiento[18] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,18,'fecha_atendido');
            $fechaSeguimiento[19] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,19,'fecha_atendido');


            $tipoSeguimiento = [];
            $tipoSeguimiento[0] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 0,'tipo_seguimiento');
            $tipoSeguimiento[1] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 1,'tipo_seguimiento');
            $tipoSeguimiento[2] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 2,'tipo_seguimiento');
            $tipoSeguimiento[3] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 3,'tipo_seguimiento');
            $tipoSeguimiento[4] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 4,'tipo_seguimiento');
            $tipoSeguimiento[5] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 5,'tipo_seguimiento');
            $tipoSeguimiento[6] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 6,'tipo_seguimiento');
            $tipoSeguimiento[7] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 7,'tipo_seguimiento');
            $tipoSeguimiento[8] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 8,'tipo_seguimiento');
            $tipoSeguimiento[9] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual, 9,'tipo_seguimiento');
            $tipoSeguimiento[10] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,10,'tipo_seguimiento');
            $tipoSeguimiento[11] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,11,'tipo_seguimiento');
            $tipoSeguimiento[12] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,12,'tipo_seguimiento');
            $tipoSeguimiento[13] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,13,'tipo_seguimiento');
            $tipoSeguimiento[14] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,14,'tipo_seguimiento');
            $tipoSeguimiento[15] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,15,'tipo_seguimiento');
            $tipoSeguimiento[16] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,16,'tipo_seguimiento');
            $tipoSeguimiento[17] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,17,'tipo_seguimiento');
            $tipoSeguimiento[18] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,18,'tipo_seguimiento');
            $tipoSeguimiento[19] = getInfoSeg($rsA,$i,$inicio,$id_paciente_actual,19,'tipo_seguimiento');



            $objPHPExcel->setActiveSheetIndex(0)
                ->setCellValue('A' . $fila_excel, $rsA[$i - $inicio]['tipo_documento'])
                ->setCellValueExplicit('B' . $fila_excel, $rsA[$i - $inicio]['nrodoc'],PHPExcel_Cell_DataType::TYPE_STRING)
                ->setCellValue('C' . $fila_excel, $rsA[$i - $inicio]['nombre_completo'])
                ->setCellValue('D' . $fila_excel, $rsA[$i - $inicio]['id_ubigeo'])
                ->setCellValue('E' . $fila_excel, $rsA[$i - $inicio]['departamento'])
                ->setCellValue('F' . $fila_excel, $rsA[$i - $inicio]['provincia'])
                ->setCellValue('G' . $fila_excel, $rsA[$i - $inicio]['distrito'])
                ->setCellValue('H' . $fila_excel, $rsA[$i - $inicio]['descrip_dir'])
                ->setCellValue('I' . $fila_excel, $rsA[$i - $inicio]['descrip_ref'])
                ->setCellValue('J' . $fila_excel, $rsA[$i - $inicio]['telefono'])
                ->setCellValue('K' . $fila_excel, $rsA[$i - $inicio]['tipo_seguro'])
                ->setCellValue('L' . $fila_excel, $rsA[$i - $inicio]['desc_seguro'])
                ->setCellValue('M' . $fila_excel, $rsA[$i - $inicio]['fecha_nacimiento'])
                ->setCellValue('N' . $fila_excel, $rsA[$i - $inicio]['edad_anios'])
                ->setCellValue('O' . $fila_excel, $sexo)
                ->setCellValue('P' . $fila_excel, $rsA[$i - $inicio]['tipo_muestra'])
                ->setCellValue('Q' . $fila_excel, $rsA[$i - $inicio]['fecha_toma_muestra'])
                ->setCellValue('R' . $fila_excel, $rsA[$i - $inicio]['fecha_resultado_muestra'])
                ->setCellValue('S' . $fila_excel, $tiempo)
                ->setCellValue('T' . $fila_excel, $rsA[$i - $inicio]['fecha_ingreso'])
                ->setCellValue('U' . $fila_excel, $rsA[$i - $inicio]['hospital'])
                ->setCellValue('V' . $fila_excel, $rsA[$i - $inicio]['fecha_alta'])
                ->setCellValue('W' . $fila_excel, $rsA[$i - $inicio]['fecha_defuncion'])

                ->setCellValue('X' .  $fila_excel, $rsA[$i - $inicio]['temperatura'])
                ->setCellValue('Y' .  $fila_excel, $rsA[$i - $inicio]['cc_embarazo'] == true ? 'SI' : 'NO')
                ->setCellValue('Z' .  $fila_excel, $rsA[$i - $inicio]['cc_pos_parto'] == true ? 'SI' : 'NO')
                ->setCellValue('AA' .  $fila_excel, $rsA[$i - $inicio]['cc_enf_car'] == true ? 'SI' : 'NO')
                ->setCellValue('AB' . $fila_excel, $rsA[$i - $inicio]['cc_inmunodeficiencia'] == true ? 'SI' : 'NO')
                ->setCellValue('AC' . $fila_excel, $rsA[$i - $inicio]['cc_diabetes'] == true ? 'SI' : 'NO')
                ->setCellValue('AD' . $fila_excel, $rsA[$i - $inicio]['cc_enf_ren'] == true ? 'SI' : 'NO')
                ->setCellValue('AE' . $fila_excel, $rsA[$i - $inicio]['cc_enf_hep'] == true ? 'SI' : 'NO')
                ->setCellValue('AF' . $fila_excel, $rsA[$i - $inicio]['cc_dan_hep'] == true ? 'SI' : 'NO')
                ->setCellValue('AG' . $fila_excel, $rsA[$i - $inicio]['cc_enf_cro'] == true ? 'SI' : 'NO')
                ->setCellValue('AH' . $fila_excel, $rsA[$i - $inicio]['cc_enf_pul'] == true ? 'SI' : 'NO')
                ->setCellValue('AI' . $fila_excel, $rsA[$i - $inicio]['cc_otros'] == true ? $rsA[$i - $inicio]['cc_desc'] : '')

                ->setCellValue('AJ' . $fila_excel, $rsA[$i - $inicio]['ocupacion_paciente'])
                ->setCellValue('AK' . $fila_excel, $rsA[$i - $inicio]['evolucion_paciente'])
                ->setCellValue('AL' . $fila_excel, $rsA[$i - $inicio]['motivo_diferido'])

                ->setCellValue('AM' . $fila_excel, $rsA[$i - $inicio]['fecha_creacion'])
                ->setCellValue('AN' . $fila_excel, $con_facores_riesgo)

                ->setCellValue('AO' . $fila_excel, $fechaSeguimiento[0])
                ->setCellValue('AP' . $fila_excel, $tipoSeguimiento[0])
                ->setCellValue('AQ' . $fila_excel, $condiciones[0])
                ->setCellValue('AR' . $fila_excel, $observaciones[0])

                ->setCellValue('AS' . $fila_excel, $fechaSeguimiento[1])
                ->setCellValue('AT' . $fila_excel, $tipoSeguimiento[1])
                ->setCellValue('AU' . $fila_excel, $condiciones[1])
                ->setCellValue('AV' . $fila_excel, $observaciones[1])

                ->setCellValue('AW' . $fila_excel, $fechaSeguimiento[2])
                ->setCellValue('AX' . $fila_excel, $tipoSeguimiento[2])
                ->setCellValue('AY' . $fila_excel, $condiciones[2])
                ->setCellValue('AZ' . $fila_excel, $observaciones[2])

                ->setCellValue('BA' . $fila_excel, $fechaSeguimiento[3])
                ->setCellValue('BB' . $fila_excel, $tipoSeguimiento[3])
                ->setCellValue('BC' . $fila_excel, $condiciones[3])
                ->setCellValue('BD' . $fila_excel, $observaciones[3])

                ->setCellValue('BE' . $fila_excel, $fechaSeguimiento[4])
                ->setCellValue('BF' . $fila_excel, $tipoSeguimiento[4])
                ->setCellValue('BG' . $fila_excel, $condiciones[4])
                ->setCellValue('BH' . $fila_excel, $observaciones[4])

                ->setCellValue('BI' . $fila_excel, $fechaSeguimiento[5])
                ->setCellValue('BJ' . $fila_excel, $tipoSeguimiento[5])
                ->setCellValue('BK' . $fila_excel, $condiciones[5])
                ->setCellValue('BL' . $fila_excel, $observaciones[5])

                ->setCellValue('BM' . $fila_excel, $fechaSeguimiento[6])
                ->setCellValue('BN' . $fila_excel, $tipoSeguimiento[6])
                ->setCellValue('BO' . $fila_excel, $condiciones[6])
                ->setCellValue('BP' . $fila_excel, $observaciones[6])

                ->setCellValue('BQ' . $fila_excel, $fechaSeguimiento[7])
                ->setCellValue('BR' . $fila_excel, $tipoSeguimiento[7])
                ->setCellValue('BS' . $fila_excel, $condiciones[7])
                ->setCellValue('BT' . $fila_excel, $observaciones[7])

                ->setCellValue('BU' . $fila_excel, $fechaSeguimiento[8])
                ->setCellValue('BV' . $fila_excel, $tipoSeguimiento[8])
                ->setCellValue('BW' . $fila_excel, $condiciones[8])
                ->setCellValue('BX' . $fila_excel, $observaciones[8])

                ->setCellValue('BY' . $fila_excel, $fechaSeguimiento[9])
                ->setCellValue('BZ' . $fila_excel, $tipoSeguimiento[9])
                ->setCellValue('BZ' . $fila_excel, $condiciones[9])
                ->setCellValue('CA' . $fila_excel, $observaciones[9])

                ->setCellValue('CB' . $fila_excel, $fechaSeguimiento[10])
                ->setCellValue('CC' . $fila_excel, $tipoSeguimiento[10])
                ->setCellValue('CD' . $fila_excel, $condiciones[10])
                ->setCellValue('CE' . $fila_excel, $observaciones[10])

                ->setCellValue('CF' . $fila_excel, $fechaSeguimiento[11])
                ->setCellValue('CG' . $fila_excel, $tipoSeguimiento[11])
                ->setCellValue('CH' . $fila_excel, $condiciones[11])
                ->setCellValue('CI' . $fila_excel, $observaciones[11])

                ->setCellValue('CJ' . $fila_excel, $fechaSeguimiento[12])
                ->setCellValue('CK' . $fila_excel, $tipoSeguimiento[12])
                ->setCellValue('CL' . $fila_excel, $condiciones[12])
                ->setCellValue('CM' . $fila_excel, $observaciones[12])

                ->setCellValue('CN' . $fila_excel, $fechaSeguimiento[13])
                ->setCellValue('CO' . $fila_excel, $tipoSeguimiento[13])
                ->setCellValue('CP' . $fila_excel, $condiciones[13])
                ->setCellValue('CQ' . $fila_excel, $observaciones[13])

                ->setCellValue('CR' . $fila_excel, $fechaSeguimiento[14])
                ->setCellValue('CS' . $fila_excel, $tipoSeguimiento[14])
                ->setCellValue('CT' . $fila_excel, $condiciones[14])
                ->setCellValue('CU' . $fila_excel, $observaciones[14])

                ->setCellValue('CV' . $fila_excel, $fechaSeguimiento[15])
                ->setCellValue('CW' . $fila_excel, $tipoSeguimiento[15])
                ->setCellValue('CX' . $fila_excel, $condiciones[15])
                ->setCellValue('CY' . $fila_excel, $observaciones[15])

                ->setCellValue('CZ' . $fila_excel, $fechaSeguimiento[16])
                ->setCellValue('DA' . $fila_excel, $tipoSeguimiento[16])
                ->setCellValue('DB' . $fila_excel, $condiciones[16])
                ->setCellValue('DC' . $fila_excel, $observaciones[16])

                ->setCellValue('DD' . $fila_excel, $fechaSeguimiento[17])
                ->setCellValue('DE' . $fila_excel, $tipoSeguimiento[17])
                ->setCellValue('DF' . $fila_excel, $condiciones[17])
                ->setCellValue('DG' . $fila_excel, $observaciones[17])

                ->setCellValue('DH' . $fila_excel, $fechaSeguimiento[18])
                ->setCellValue('DI' . $fila_excel, $tipoSeguimiento[18])
                ->setCellValue('DJ' . $fila_excel, $condiciones[18])
                ->setCellValue('DK' . $fila_excel, $observaciones[18])

                ->setCellValue('DL' . $fila_excel, $fechaSeguimiento[19])
                ->setCellValue('DM' . $fila_excel, $tipoSeguimiento[19])
                ->setCellValue('DN' . $fila_excel, $condiciones[19])
                ->setCellValue('DO' . $fila_excel, $observaciones[19]);

            $fila_excel ++;
        }


    }

    //exit(json_encode($data_result));
    //exit(json_encode($rsA));

    $objPHPExcel->setActiveSheetIndex(0);
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header('Content-Disposition: attachment;filename="ListadoPacientes.xlsx"');
    header('Cache-Control: max-age=0');
    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, $inputFileType);
    $objWriter->save('php://output');
    //exit(json_encode($rsA));

}catch(Exception $e){
    exit('Error cargando el archivo ' . $e->getMessage());
}
