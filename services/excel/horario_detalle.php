<?php

function getDia($nombredia) {
    $date = str_replace('/', '-', $nombredia);
    $dias = array('Domingo','Lunes','Martes','Miercoles','Jueves','Viernes','Sabado');
    $fecha = $dias[date('N', strtotime($date))];
    return $fecha;
}

session_start();

if (!isset($_SESSION['usuario_cor'])) exit();

require_once __DIR__ . '/../../controllers/validator/HorarioMedicoValidator.php';
require_once __DIR__ . '/../../lib/PHPExcel/Classes/PHPExcel.php';
require_once __DIR__ . '/../../lib/PHPExcel/Classes/PHPExcel/IOFactory.php';

$ex = new HorarioMedicoValidator();

$data_result = $ex->getHorarioMedico();

$rsA = $data_result["rows"];
$rsCabecera = $data_result["row"];

if (!$rsA) exit();

$file_path = (realpath(dirname(__FILE__))) . "/files/horario_detalle.xlsx";

$objPHPExcel = new PHPExcel();

try {

    $inputFileType = PHPExcel_IOFactory::identify($file_path);
    $objReader = PHPExcel_IOFactory::createReader($inputFileType);
    $objPHPExcel = $objReader->load($file_path);

} catch (Exception $e) {
    exit('Error cargando el archivo ' . $e->getMessage());
}

$inicio = 8;



$objPHPExcel->setActiveSheetIndex(0)
    ->setCellValue('C3', $rsCabecera['local'])
    ->setCellValue('C4', $rsCabecera['nombres'].' '.$rsCabecera['apellido_paterno'].' '.$rsCabecera['apellido_materno'] )
    ->setCellValue('C5', $rsCabecera['consultorio']);

for($i=$inicio; $i < (count($rsA) + $inicio);$i++){
    $objPHPExcel->setActiveSheetIndex(0)
        ->setCellValue('B' . $i, $rsA[$i - $inicio]['fecha'])
        ->setCellValue('C' . $i, getDia( $rsA[$i - $inicio]['fecha'] ))
        ->setCellValue('D' . $i, $rsA[$i - $inicio]['hora_inicio'] . ' - ' . $rsA[$i - $inicio]['hora_fin'])
        ->setCellValue('E' . $i, $rsA[$i - $inicio]['frecuencia']);
}

$objPHPExcel->setActiveSheetIndex(0);


header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment;filename="HorarioMedico.xlsx"');
header('Cache-Control: max-age=0');

$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, $inputFileType);

$objWriter->save('php://output');
















