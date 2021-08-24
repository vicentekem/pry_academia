<?php

if( !isset($_SESSION['usuario_cor']) ){
    session_start();
}

if (!isset($_SESSION['usuario_cor'])) exit();

//require_once __DIR__ . '/../../config/Conexion.php';
//require_once __DIR__ . '/../../models/HorarioEquipo.php';
//require_once __DIR__ . '/../../controllers/validator/SeguimientoValidator.php';
require_once __DIR__ . '/../../controllers/validator/SeguimientoXlsValidator.php';
//require_once __DIR__ . '/../../controllers/validator/HospitalizadoValidator.php';
require_once __DIR__ . '/../../lib/PHPExcel/Classes/PHPExcel.php';
require_once __DIR__ . '/../../lib/PHPExcel/Classes/PHPExcel/IOFactory.php';

//$ex = new HorarioEquipo();
//$data_result = $ex->getMedicosXls();
//$rsA = $data_result["rows"];

$ex = new SeguimientoXlsValidator();
$data_result = $ex->getPacienteFichaXls();
$rsA = $data_result["rows"];
//$rsB = $data_result["contactos"];

/*$ex = new HospitalizadoValidator();
$data_result = $ex->getListaPacientes();
$rsA = $data_result["rows"];*/

//if (!$rsA) exit();

$file_path = (realpath(dirname(__FILE__))) . "/files/listado_pacientes.xlsx";
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

    $inicio = 2;
    $fila_excel = 2;

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
            if($rsA[$i - $inicio]['edad_anios'] > 60) $con_facores_riesgo = 'SI';
            if($rsA[$i - $inicio]['cc_embarazo'] == true) $con_facores_riesgo = 'SI';
            else if($rsA[$i - $inicio]['cc_pos_parto'] == true)$con_facores_riesgo = 'SI';
            else if($rsA[$i - $inicio]['cc_enf_car'] == true)$con_facores_riesgo = 'SI';
            else if($rsA[$i - $inicio]['cc_inmunodeficiencia'] == true)$con_facores_riesgo = 'SI';
            else if($rsA[$i - $inicio]['cc_diabetes'] == true)$con_facores_riesgo = 'SI';
            else if($rsA[$i - $inicio]['cc_enf_ren'] == true)$con_facores_riesgo = 'SI';
            else if($rsA[$i - $inicio]['cc_enf_hep'] == true)$con_facores_riesgo = 'SI';
            else if($rsA[$i - $inicio]['cc_dan_hep'] == true)$con_facores_riesgo = 'SI';
            else if($rsA[$i - $inicio]['cc_enf_cro'] == true)$con_facores_riesgo = 'SI';
            else if($rsA[$i - $inicio]['cc_enf_pul'] == true)$con_facores_riesgo = 'SI';
            else if($rsA[$i - $inicio]['cc_otros'] == true)$con_facores_riesgo = 'SI';


            $objPHPExcel->setActiveSheetIndex(0)
                ->setCellValue('A' . $fila_excel, $rsA[$i - $inicio]['tipo_documento'])
                ->setCellValueExplicit('B' . $fila_excel, $rsA[$i - $inicio]['nrodoc'],PHPExcel_Cell_DataType::TYPE_STRING)
                ->setCellValue('C' . $fila_excel, $rsA[$i - $inicio]['nombre_completo'])
                ->setCellValue('D' . $fila_excel, $rsA[$i - $inicio]['id_ubigeo'])
                ->setCellValue('E' . $fila_excel, $rsA[$i - $inicio]['departamento'])
                ->setCellValue('F' . $fila_excel, $rsA[$i - $inicio]['provincia'])
                ->setCellValue('G' . $fila_excel, $rsA[$i - $inicio]['distrito'])
                ->setCellValue('H' . $fila_excel, $rsA[$i - $inicio]['descrip_dir'])
                ->setCellValue('I' . $fila_excel, $rsA[$i - $inicio]['telefono'])
                ->setCellValue('J' . $fila_excel, $rsA[$i - $inicio]['tipo_seguro'])
                ->setCellValue('K' . $fila_excel, $rsA[$i - $inicio]['desc_seguro'])
                ->setCellValue('L' . $fila_excel, $rsA[$i - $inicio]['fecha_nacimiento'])
                //->setCellValue('M' . $fila_excel, $rsA[$i - $inicio]['edad_anios'] ." años ". $rsA[$i - $inicio]['edad_meses'] .' meses y '. $rsA[$i - $inicio]['edad_dias'] . " dias" )
                ->setCellValue('M' . $fila_excel, $rsA[$i - $inicio]['edad_anios'])
                ->setCellValue('N' . $fila_excel, $sexo)
                ->setCellValue('O' . $fila_excel, $rsA[$i - $inicio]['tipo_muestra'])
                ->setCellValue('P' . $fila_excel, $rsA[$i - $inicio]['fecha_toma_muestra'])
                ->setCellValue('Q' . $fila_excel, $rsA[$i - $inicio]['fecha_resultado_muestra'])
                ->setCellValue('R' . $fila_excel, $tiempo)
                ->setCellValue('S' . $fila_excel, $rsA[$i - $inicio]['fecha_ingreso'])
                ->setCellValue('T' . $fila_excel, $rsA[$i - $inicio]['hospital'])
                ->setCellValue('U' . $fila_excel, $rsA[$i - $inicio]['fecha_alta'])
                ->setCellValue('V' . $fila_excel, $rsA[$i - $inicio]['fecha_defuncion'])


                ->setCellValue('W' .  $fila_excel, $rsA[$i - $inicio]['temperatura'])
                ->setCellValue('X' .  $fila_excel, $rsA[$i - $inicio]['cc_embarazo'] == true ? 'SI' : 'NO')
                ->setCellValue('Y' .  $fila_excel, $rsA[$i - $inicio]['cc_pos_parto'] == true ? 'SI' : 'NO')
                ->setCellValue('Z' .  $fila_excel, $rsA[$i - $inicio]['cc_enf_car'] == true ? 'SI' : 'NO')
                ->setCellValue('AA' . $fila_excel, $rsA[$i - $inicio]['cc_inmunodeficiencia'] == true ? 'SI' : 'NO')
                ->setCellValue('AB' . $fila_excel, $rsA[$i - $inicio]['cc_diabetes'] == true ? 'SI' : 'NO')
                ->setCellValue('AC' . $fila_excel, $rsA[$i - $inicio]['cc_enf_ren'] == true ? 'SI' : 'NO')
                ->setCellValue('AD' . $fila_excel, $rsA[$i - $inicio]['cc_enf_hep'] == true ? 'SI' : 'NO')
                ->setCellValue('AE' . $fila_excel, $rsA[$i - $inicio]['cc_dan_hep'] == true ? 'SI' : 'NO')
                ->setCellValue('AF' . $fila_excel, $rsA[$i - $inicio]['cc_enf_cro'] == true ? 'SI' : 'NO')
                ->setCellValue('AG' . $fila_excel, $rsA[$i - $inicio]['cc_enf_pul'] == true ? 'SI' : 'NO')
                ->setCellValue('AH' . $fila_excel, $rsA[$i - $inicio]['cc_otros'] == true ? $rsA[$i - $inicio]['cc_desc'] : '')

                ->setCellValue('AI' . $fila_excel, $rsA[$i - $inicio]['ocupacion_paciente'])
                ->setCellValue('AJ' . $fila_excel, $rsA[$i - $inicio]['evolucion_paciente'])

                ->setCellValue('AK' . $fila_excel, $rsA[$i - $inicio]['fecha_creacion'])
                ->setCellValue('AL' . $fila_excel, $rsA[$i - $inicio]['fecha_atendido'])
                ->setCellValue('AM' . $fila_excel, $rsA[$i - $inicio]['tipo_seguimiento'])
                ->setCellValue('AN' . $fila_excel, $con_facores_riesgo)
                ->setCellValue('AO' . $fila_excel, $rsA[$i - $inicio]['observacion']);

            $fila_excel ++;
        }


    }

    /*$inicio = 2;
    $fila_excel = 2;


    //exit(json_encode($data_result));
    $id_paciente_actual = null;
    for($i=$inicio; $i < (count($rsB) + $inicio);$i++){

        if( $rsB[$i - $inicio]['id_paciente'] != $id_paciente_actual ){

            $id_paciente_actual = $rsB[$i - $inicio]['id_paciente'];

            if($rsB[$i - $inicio]['id_sexo'] == 1){ $sexo = 'MASCULINO'; }
            else if($rsB[$i - $inicio]['id_sexo'] == 2){ $sexo = 'FEMENINO'; }
            else {$sexo = '';}

            //exit(json_encode($rsB[$i - $inicio]['tipo_muestra']));

            $objPHPExcel->setActiveSheetIndex(1)
                ->setCellValue('A' . $fila_excel, $rsB[$i - $inicio]['tipo_documento_positivo'])
                ->setCellValue('B' . $fila_excel, $rsB[$i - $inicio]['nrodoc_positivo'])
                ->setCellValue('C' . $fila_excel, $rsB[$i - $inicio]['nombre_completo_positivo'])
                ->setCellValue('D' . $fila_excel, $rsB[$i - $inicio]['fecha_contacto'])
                ->setCellValue('E' . $fila_excel, $rsB[$i - $inicio]['tipo_contacto'])

                ->setCellValue('F' . $fila_excel, $rsB[$i - $inicio]['tipo_documento'])
                ->setCellValue('G' . $fila_excel, $rsB[$i - $inicio]['nrodoc'])
                ->setCellValue('H' . $fila_excel, $rsB[$i - $inicio]['nombre_completo'])
                ->setCellValue('I' . $fila_excel, $rsB[$i - $inicio]['id_ubigeo'])
                ->setCellValue('J' . $fila_excel, $rsB[$i - $inicio]['departamento'])
                ->setCellValue('K' . $fila_excel, $rsB[$i - $inicio]['provincia'])
                ->setCellValue('L' . $fila_excel, $rsB[$i - $inicio]['distrito'])
                ->setCellValue('M' . $fila_excel, $rsB[$i - $inicio]['descrip_dir'])
                ->setCellValue('N' . $fila_excel, $rsB[$i - $inicio]['telefono'])
                ->setCellValue('O' . $fila_excel, $rsB[$i - $inicio]['tipo_seguro'])
                ->setCellValue('P' . $fila_excel, $rsB[$i - $inicio]['fecha_nacimiento'])
                ->setCellValue('Q' . $fila_excel, $rsB[$i - $inicio]['edad_anios'] ." años ". $rsB[$i - $inicio]['edad_meses'] .' meses y '. $rsB[$i - $inicio]['edad_dias'] . " dias" )
                ->setCellValue('R' . $fila_excel, $sexo)
                ->setCellValue('S' . $fila_excel, $rsB[$i - $inicio]['tipo_muestra'])
                ->setCellValue('T' . $fila_excel, $rsB[$i - $inicio]['fecha_toma_muestra'])
                ->setCellValue('U' . $fila_excel, $rsB[$i - $inicio]['fecha_resultado_muestra'])
                ->setCellValue('V' . $fila_excel, $rsB[$i - $inicio]['fecha_ingreso'])
                ->setCellValue('W' . $fila_excel, $rsB[$i - $inicio]['hospital'])
                ->setCellValue('X' . $fila_excel, $rsB[$i - $inicio]['fecha_alta'])
                ->setCellValue('Y' . $fila_excel, $rsB[$i - $inicio]['fecha_defuncion'])

                ->setCellValue('Z'  . $fila_excel, $rsA[$i - $inicio]['fiebre'] == true ? 'SI' : 'NO')
                ->setCellValue('AA'  . $fila_excel, $rsA[$i - $inicio]['con_nasal'] == true ? 'SI' : 'NO')
                ->setCellValue('AB'  . $fila_excel, $rsA[$i - $inicio]['malestar_gen'] == true ? 'SI' : 'NO')
                ->setCellValue('AC'  . $fila_excel, $rsA[$i - $inicio]['dif_res'] == true ? 'SI' : 'NO')
                ->setCellValue('AD'  . $fila_excel, $rsA[$i - $inicio]['tos'] == true ? 'SI' : 'NO')
                ->setCellValue('AE'  . $fila_excel, $rsA[$i - $inicio]['diarrea'] == true ? 'SI' : 'NO')
                ->setCellValue('AF' . $fila_excel, $rsA[$i - $inicio]['dolor_garganta'] == true ? 'SI' : 'NO')
                ->setCellValue('AG' . $fila_excel, $rsA[$i - $inicio]['vomitos'] == true ? 'SI' : 'NO')
                ->setCellValue('AH' . $fila_excel, $rsA[$i - $inicio]['irritabilidad'] == true ? 'SI' : 'NO')
                ->setCellValue('AI' . $fila_excel, $rsA[$i - $inicio]['dol_mus'] == true ? 'SI' : 'NO')
                ->setCellValue('AJ' . $fila_excel, $rsA[$i - $inicio]['dol_pec'] == true ? 'SI' : 'NO')
                ->setCellValue('AK' . $fila_excel, $rsA[$i - $inicio]['dol_adb'] == true ? 'SI' : 'NO')
                ->setCellValue('AL' . $fila_excel, $rsA[$i - $inicio]['dol_art'] == true ? 'SI' : 'NO')
                ->setCellValue('AM' . $fila_excel, $rsA[$i - $inicio]['cefalea'] == true ? 'SI' : 'NO')
                ->setCellValue('AN' . $fila_excel,
                    $rsA[$i - $inicio]['otros'] == true ? $rsA[$i - $inicio]['sintoma_desc'] == true : '')


                ->setCellValue('AO' . $fila_excel, $rsA[$i - $inicio]['temperatura'])
                ->setCellValue('AP' . $fila_excel, $rsA[$i - $inicio]['cc_embarazo'] == true ? 'SI' : 'NO')
                ->setCellValue('AQ' . $fila_excel, $rsA[$i - $inicio]['cc_pos_parto'] == true ? 'SI' : 'NO')
                ->setCellValue('AR' . $fila_excel, $rsA[$i - $inicio]['cc_enf_car'] == true ? 'SI' : 'NO')
                ->setCellValue('AS' . $fila_excel, $rsA[$i - $inicio]['cc_inmunodeficiencia'] == true ? 'SI' : 'NO')
                ->setCellValue('AT' . $fila_excel, $rsA[$i - $inicio]['cc_diabetes'] == true ? 'SI' : 'NO')
                ->setCellValue('AU' . $fila_excel, $rsA[$i - $inicio]['cc_enf_ren'] == true ? 'SI' : 'NO')
                ->setCellValue('AV' . $fila_excel, $rsA[$i - $inicio]['cc_enf_hep'] == true ? 'SI' : 'NO')
                ->setCellValue('AW' . $fila_excel, $rsA[$i - $inicio]['cc_dan_hep'] == true ? 'SI' : 'NO')
                ->setCellValue('AX' . $fila_excel, $rsA[$i - $inicio]['cc_enf_cro'] == true ? 'SI' : 'NO')
                ->setCellValue('AY' . $fila_excel, $rsA[$i - $inicio]['cc_enf_pul'] == true ? 'SI' : 'NO')
                ->setCellValue('AZ' . $fila_excel, $rsA[$i - $inicio]['cc_otros'] == true ? $rsA[$i - $inicio]['cc_desc'] : '')

                ->setCellValue('BA' . $fila_excel, $rsA[$i - $inicio]['ocupacion_paciente'])
                ->setCellValue('BB' . $fila_excel, $rsB[$i - $inicio]['evolucion_paciente'])
                ->setCellValue('BC' . $fila_excel, $rsB[$i - $inicio]['fecha_atendido']);

            if(isset($rsB[($i - $inicio) + 0  ]) ){
                $objPHPExcel->setActiveSheetIndex(1)
                    ->setCellValue('BD' .  $fila_excel, $rsB[($i - $inicio) + 0  ]['id_paciente'] == $id_paciente_actual ? $rsB[($i - $inicio) + 0  ]['estado_evolucion_pac']  : '');
            }

            if(isset($rsB[($i - $inicio) + 1  ])){
                $objPHPExcel->setActiveSheetIndex(1)
                    ->setCellValue('BE' .  $fila_excel, $rsB[($i - $inicio) + 1  ]['id_paciente'] == $id_paciente_actual ? $rsB[($i - $inicio) + 1  ]['estado_evolucion_pac']  : '');
            }

            if(isset($rsB[($i - $inicio) + 2  ])){
                $objPHPExcel->setActiveSheetIndex(1)
                    ->setCellValue('BF' .  $fila_excel, $rsB[($i - $inicio) + 2  ]['id_paciente'] == $id_paciente_actual ? $rsB[($i - $inicio) + 2  ]['estado_evolucion_pac']  : '');
            }

            if(isset($rsB[($i - $inicio) + 3 ])){
                $objPHPExcel->setActiveSheetIndex(1)
                    ->setCellValue('BG' .  $fila_excel, $rsB[($i - $inicio) + 3  ]['id_paciente'] == $id_paciente_actual ? $rsB[($i - $inicio) + 3  ]['estado_evolucion_pac']  : '');
            }

            if(isset($rsB[($i - $inicio) + 4 ])){
                $objPHPExcel->setActiveSheetIndex(1)
                    ->setCellValue('BH' . $fila_excel, $rsB[($i - $inicio) + 4  ]['id_paciente'] == $id_paciente_actual ? $rsB[($i - $inicio) + 4  ]['estado_evolucion_pac']  : '');
            }

            if(isset($rsB[($i - $inicio) + 5 ])){
                $objPHPExcel->setActiveSheetIndex(1)
                    ->setCellValue('BI' . $fila_excel, $rsB[($i - $inicio) + 5  ]['id_paciente'] == $id_paciente_actual ? $rsB[($i - $inicio) + 5  ]['estado_evolucion_pac']  : '');
            }

            if(isset($rsB[($i - $inicio) + 6 ])){
                $objPHPExcel->setActiveSheetIndex(1)
                    ->setCellValue('BJ' . $fila_excel, $rsB[($i - $inicio) + 6  ]['id_paciente'] == $id_paciente_actual ? $rsB[($i - $inicio) + 6  ]['estado_evolucion_pac']  : '');
            }

            if(isset($rsB[($i - $inicio) + 7 ])){
                $objPHPExcel->setActiveSheetIndex(1)
                    ->setCellValue('BK' . $fila_excel, $rsB[($i - $inicio) + 7  ]['id_paciente'] == $id_paciente_actual ? $rsB[($i - $inicio) + 7  ]['estado_evolucion_pac']  : '');
            }

            if(isset($rsB[($i - $inicio) + 8 ])){
                $objPHPExcel->setActiveSheetIndex(1)
                    ->setCellValue('BL' . $fila_excel, $rsB[($i - $inicio) + 8  ]['id_paciente'] == $id_paciente_actual ? $rsB[($i - $inicio) + 8  ]['estado_evolucion_pac']  : '');
            }

            if(isset($rsB[($i - $inicio) + 9 ])){
                $objPHPExcel->setActiveSheetIndex(1)
                    ->setCellValue('BM' . $fila_excel, $rsB[($i - $inicio) + 9  ]['id_paciente'] == $id_paciente_actual ? $rsB[($i - $inicio) + 9  ]['estado_evolucion_pac']  : '');
            }

            if(isset($rsB[($i - $inicio) + 10 ])){
                $objPHPExcel->setActiveSheetIndex(1)
                    ->setCellValue('BN' . $fila_excel, $rsB[($i - $inicio) + 10 ]['id_paciente'] == $id_paciente_actual ? $rsB[($i - $inicio) + 10 ]['estado_evolucion_pac']  : '');
            }

            if(isset($rsB[($i - $inicio) + 11 ])){
                $objPHPExcel->setActiveSheetIndex(1)
                    ->setCellValue('BO' . $fila_excel, $rsB[($i - $inicio) + 11 ]['id_paciente'] == $id_paciente_actual ? $rsB[($i - $inicio) + 11 ]['estado_evolucion_pac']  : '');
            }

            if(isset($rsB[($i - $inicio) + 12 ])){
                $objPHPExcel->setActiveSheetIndex(1)
                    ->setCellValue('BP' . $fila_excel, $rsB[($i - $inicio) + 12 ]['id_paciente'] == $id_paciente_actual ? $rsB[($i - $inicio) + 12 ]['estado_evolucion_pac']  : '');
            }

            if(isset($rsB[($i - $inicio) + 13 ])){
                $objPHPExcel->setActiveSheetIndex(1)
                    ->setCellValue('BQ' . $fila_excel, $rsB[($i - $inicio) + 13 ]['id_paciente'] == $id_paciente_actual ? $rsB[($i - $inicio) + 13 ]['estado_evolucion_pac']  : '');
            }

            $fila_excel ++;
        }

    }*/

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
