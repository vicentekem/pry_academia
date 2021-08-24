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
$data_result = $ex->getPendienteMuestraXls();
$rsA = $data_result["rows"];
//$rsB = $data_result["contactos"];
//exit( json_encode( $data_result ) );
/*$ex = new HospitalizadoValidator();
$data_result = $ex->getListaPacientes();
$rsA = $data_result["rows"];*/

//if (!$rsA) exit();

$file_path = (realpath(dirname(__FILE__))) . "/files/listado_pacientes_pendientes_muestra_fecha.xlsx";
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

            $objPHPExcel->setActiveSheetIndex(0)
                ->setCellValue('A' . $fila_excel, $rsA[$i - $inicio]['tipo_documento'])
                ->setCellValueExplicit('B' . $fila_excel, $rsA[$i - $inicio]['nrodoc'])
                ->setCellValue('C' . $fila_excel, $rsA[$i - $inicio]['nombre_completo'])
                ->setCellValue('D' . $fila_excel, $rsA[$i - $inicio]['id_ubigeo'])
                ->setCellValue('E' . $fila_excel, $rsA[$i - $inicio]['departamento'])
                ->setCellValue('F' . $fila_excel, $rsA[$i - $inicio]['provincia'])
                ->setCellValue('G' . $fila_excel, $rsA[$i - $inicio]['distrito'])
                ->setCellValue('H' . $fila_excel, $rsA[$i - $inicio]['descrip_dir'])
                ->setCellValue('I' . $fila_excel, $rsA[$i - $inicio]['telefono'])
                ->setCellValue('J' . $fila_excel, $rsA[$i - $inicio]['tipo_seguro'])
                ->setCellValue('K' . $fila_excel, $rsA[$i - $inicio]['fecha_nacimiento'])
                ->setCellValue('L' . $fila_excel, $rsA[$i - $inicio]['edad_anios'] ." años ". $rsA[$i - $inicio]['edad_meses'] .' meses y '. $rsA[$i - $inicio]['edad_dias'] . " dias" )
                ->setCellValue('M' . $fila_excel, $sexo)
                ->setCellValue('N' . $fila_excel, $rsA[$i - $inicio]['tipo_muestra'])
                ->setCellValue('O' . $fila_excel, $rsA[$i - $inicio]['fecha_toma_muestra'])
                ->setCellValue('P' . $fila_excel, $rsA[$i - $inicio]['fecha_resultado_muestra'])
                ->setCellValue('Q' . $fila_excel, $tiempo)
                ->setCellValue('R' . $fila_excel, $rsA[$i - $inicio]['fecha_ingreso'])
                ->setCellValue('S' . $fila_excel, $rsA[$i - $inicio]['hospital'])
                ->setCellValue('T' . $fila_excel, $rsA[$i - $inicio]['fecha_alta'])
                ->setCellValue('U' . $fila_excel, $rsA[$i - $inicio]['fecha_defuncion'])
                ->setCellValue('V' . $fila_excel, $rsA[$i - $inicio]['nrodoc_prof'])
                ->setCellValue('W' . $fila_excel, $rsA[$i - $inicio]['nombre_completo_prof'])
                ->setCellValue('X' . $fila_excel, $rsA[$i - $inicio]['nro_colegiatura'])
                ->setCellValue('Y' . $fila_excel, $rsA[$i - $inicio]['fecha_atendido'])
                ->setCellValue('Z' . $fila_excel, $rsA[$i - $inicio]['tipo_seguimiento'])
                ->setCellValue('AA' . $fila_excel, $rsA[$i - $inicio]['estado_evolucion_pac'])
                ->setCellValue('AB' . $fila_excel, $rsA[$i - $inicio]['observacion'])
				->setCellValue('AC' . $fila_excel, $rsA[$i - $inicio]['fecha_notificacion'])
				->setCellValue('AD' . $fila_excel, $rsA[$i - $inicio]['creado_por'])
				;

            $fila_excel ++;
        }

     }

    //exit(json_encode($data_result));
    //exit(json_encode($rsA));

    $objPHPExcel->setActiveSheetIndex(0);
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header('Content-Disposition: attachment;filename="ListadoPendientesMuestra.xlsx"');
    header('Cache-Control: max-age=0');
    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, $inputFileType);
    $objWriter->save('php://output');


}catch(Exception $e){
    exit('Error cargando el archivo ' . $e->getMessage());
}
