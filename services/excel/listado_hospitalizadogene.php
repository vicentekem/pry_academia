<?php

session_start();

if (!isset($_SESSION['usuario_cor'])) exit();

//require_once __DIR__ . '/../../config/Conexion.php';
//require_once __DIR__ . '/../../models/HorarioEquipo.php';
require_once __DIR__ . '/../../controllers/validator/HospitalizadoValidator.php';
require_once __DIR__ . '/../../lib/PHPExcel/Classes/PHPExcel.php';
require_once __DIR__ . '/../../lib/PHPExcel/Classes/PHPExcel/IOFactory.php';


//$ex = new HorarioEquipo();
//$data_result = $ex->getMedicosXls();
//$rsA = $data_result["rows"];

$ex = new HospitalizadoValidator();
$data_result = $ex->getListaPacientes();
$rsA = $data_result["rows"];
if (!$rsA) exit();

$file_path = (realpath(dirname(__FILE__))) . "/files/listado_hospitalizado.xlsx";
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
    $inicio = 4;
    $nro = 1;
    $alta = 0;
    $grave = 0;
    $fallecido = 0;
    $estable = 0;
    $reporta = 0;
    $pronostico = 0;
    $transfe = 0;
    for($i=$inicio; $i < (count($rsA) + $inicio);$i++){
        $objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A' . $i, $nro)
            ->setCellValue('B' . $i, $rsA[$i - $inicio]['hospital'])
            ->setCellValue('C' . $i, $rsA[$i - $inicio]['desc_seguro'])
            ->setCellValue('D' . $i, $rsA[$i - $inicio]['nombre_completo'])
			->setCellValueExplicit('E' . $i, $rsA[$i - $inicio]['nrodoc'], PHPExcel_Cell_DataType::TYPE_STRING)
            ->setCellValue('F' . $i, $rsA[$i - $inicio]['edad_pac'])
            ->setCellValue('G' . $i, $rsA[$i - $inicio]['abrev_sexo'])
            ->setCellValue('H' . $i, $rsA[$i - $inicio]['descrip_dir'])
            ->setCellValue('I' . $i, $rsA[$i - $inicio]['departamento'])
            ->setCellValue('J' . $i, $rsA[$i - $inicio]['provincia'])
            ->setCellValue('K' . $i, $rsA[$i - $inicio]['distrito'])
            ->setCellValue('L' . $i, $rsA[$i - $inicio]['tipo_prueba'])
            ->setCellValue('M' . $i, $rsA[$i - $inicio]['fecha_examen_covid'])
            ->setCellValue('N' . $i, $rsA[$i - $inicio]['fecha_resultado_examen'])
            ->setCellValue('O' . $i, $rsA[$i - $inicio]['resultado_examen'])
            ->setCellValue('P' . $i, $rsA[$i - $inicio]['fecha_ingreso_hosp'])
            ->setCellValue('Q' . $i, $rsA[$i - $inicio]['diagnostico_ingreso'])//diagnosticos
            ->setCellValue('R' . $i, $rsA[$i - $inicio]['fecha_ingreso_uci'])
            ->setCellValue('S' . $i, $rsA[$i - $inicio]['fecha_uso_ventilador'])
            ->setCellValue('T' . $i, $rsA[$i - $inicio]['fecha_alta'])
            ->setCellValue('U' . $i, $rsA[$i - $inicio]['fecha_fallecido'])
            ->setCellValue('V' . $i, $rsA[$i - $inicio]['fecha_seguimiento'])
            ->setCellValue('W' . $i, $rsA[$i - $inicio]['condicion_actual'])
            ->setCellValue('X' . $i, $rsA[$i - $inicio]['desc_seguimiento']);
            if ($rsA[$i - $inicio]['id_condicion_actual'] == "1"){
              $alta ++;
              $objPHPExcel->getActiveSheet()->setSharedStyle($style_success, "A" . $i . ":X" . $i);
            } else if ($rsA[$i - $inicio]['id_condicion_actual'] == "2"){
              $grave ++;
              $objPHPExcel->getActiveSheet()->setSharedStyle($style_danger, "A" . $i . ":X" . $i);
            } else if ($rsA[$i - $inicio]['id_condicion_actual'] == "3"){
              $fallecido ++;
              $objPHPExcel->getActiveSheet()->setSharedStyle($style_secondary, "A" . $i . ":X" . $i);
            } else if ($rsA[$i - $inicio]['id_condicion_actual'] == "4"){
              $estable ++;
              $objPHPExcel->getActiveSheet()->setSharedStyle($style_brown, "A" . $i . ":X" . $i);
            } else if ($rsA[$i - $inicio]['id_condicion_actual'] == "5"){
              $reporta ++;
              $objPHPExcel->getActiveSheet()->setSharedStyle($style_warning, "A" . $i . ":X" . $i);
            } else if ($rsA[$i - $inicio]['id_condicion_actual'] == "6"){
              $pronostico ++;
              $objPHPExcel->getActiveSheet()->setSharedStyle($style_danger, "A" . $i . ":X" . $i);
            } else if ($rsA[$i - $inicio]['id_condicion_actual'] == "7"){
              $transfe ++;
              $objPHPExcel->getActiveSheet()->setSharedStyle($style_none, "A" . $i . ":X" . $i);
            }
            $nro ++;
    }

    $objPHPExcel->setActiveSheetIndex(1)
        ->setCellValue('D5', $alta)
        ->setCellValue('D6', $grave)
        ->setCellValue('D7', $fallecido)
        ->setCellValue('D8', $estable)
        ->setCellValue('D9', $reporta)
        ->setCellValue('D10', $pronostico)
        ->setCellValue('D11', $transfe)
        ->setCellValue('D12', "=SUM(D5:D11)");

    $objPHPExcel->setActiveSheetIndex(0);
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header('Content-Disposition: attachment;filename="ListadoPersona.xlsx"');
    header('Cache-Control: max-age=0');
    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, $inputFileType);
    $objWriter->save('php://output');
}catch(Exception $e){
    exit('Error cargando el archivo ' . $e->getMessage());
}
