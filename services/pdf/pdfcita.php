<?php

require_once __DIR__ . '/../../lib/fpdf/fpdf.php';
require_once __DIR__ . "/../../controllers/validator/CitaValidator.php";

if(!isset($_GET["id"])){
    exit();
}

$model = new CitaValidator();

$cita_arr = $model->getCitaPdf()["rows"];
if(count($cita_arr) <= 0) exit();
$cita_row = $cita_arr[0];

//exit(json_encode($cita_row));

//Create a new PDF file
/*$pdf = new FPDF();
$pdf->AddPage('P', 'A4');*/
$w = 76;
$h = 297;
$ml = 2; // margin left
$mt = 2; // margin top

$pdf = new FPDF('P','mm', array($w,$h));
$pdf->AddPage();
$pdf->SetAutoPageBreak( false );

$pdf->SetFont('Arial','B',7.5);    //Letra Arial, negrita (Bold), tam. 20

$pdf->setY($mt);
$pdf->setX($ml);
$pdf->MultiCell($w - $ml, 4, utf8_decode($cita_row["empresa"] . " - " . $cita_row["local"]) ,0, 'C');
//$pdf->Cell($w - $ml, 5, utf8_decode( $cita_row["local"]) ,0, 0, 'C', 0);
$pdf->Cell($w - $ml, 1, '', 0, 0, 'L', 0);
$pdf->Ln();

$pdf->SetFont('Arial','',5);    //Letra Arial, negrita (Bold), tam. 20
$pdf->setX(1);
$pdf->Cell($w - $ml,2,'----------------------------------------------------------------------------------------------------------------',0, 0, 'C', 0);
$pdf->Ln();$pdf->Ln();

$pdf->SetFont('Arial', '', 6);

$paciente = $cita_row["nombres_pac"] . " " . $cita_row["apellido_paterno_pac"] . " " . $cita_row["apellido_materno_pac"];
$medico = $cita_row["nombres_med"] . " " . $cita_row["apellido_paterno_med"] . " " . $cita_row["apellido_materno_med"];

$widthvalue = ($ml + (( $w - (2*$ml) )/4))*3 - ($ml*3);
$xpos = $ml + (( $w - (2*$ml) )/4);

$pdf->setX($ml);
$pdf->Cell($w - $ml, 6, utf8_decode("PACIENTE: " ), 0, 0, 'L', 0);
$pdf->setX($xpos);
$pdf->Cell($widthvalue, 6, utf8_decode( $paciente ), 0, 0, 'L', 0);
$pdf->Ln();

$pdf->setX($ml);
$pdf->Cell($w - $ml, 6, utf8_decode("PROFESIONAL:"), 0, 0, 'L', 0);
$pdf->setX($xpos);
$pdf->Cell($widthvalue, 6, utf8_decode($medico ), 0, 0, 'L', 0);
$pdf->Ln();


$pdf->SetFont('Arial', '', 6);
$pdf->setX($ml);
$pdf->Cell($w - $ml, 6, utf8_decode("FECHA: "), 0, 0, 'L', 0);
$pdf->setX($xpos);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell($widthvalue, 6, utf8_decode($cita_row["fecha"]), 0, 0, 'L', 0);
$pdf->Ln();


$pdf->SetFont('Arial', '', 6);
$pdf->setX($ml);
$pdf->Cell($w - $ml, 6, utf8_decode("HORA: "), 0, 0, 'L', 0);
$pdf->setX($xpos);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell($widthvalue, 6, utf8_decode($cita_row["hora"]), 0, 0, 'L', 0);
$pdf->Ln();


$pdf->SetFont('Arial', '', 6);
$pdf->setX($ml);
$pdf->Cell($w - $ml, 6, utf8_decode("ESPECIALIDAD:"), 0, 0, 'L', 0);
$pdf->setX($xpos);
$pdf->Cell($widthvalue, 6, utf8_decode($cita_row["especialidad"]), 0, 0, 'L', 0);
$pdf->Ln();

$pdf->setX($ml);
$pdf->Cell($w - $ml, 6, utf8_decode("CONSULTORIO: " ), 0, 0, 'L', 0);
$pdf->setX($xpos);
$pdf->Cell($widthvalue, 6, utf8_decode($cita_row["consultorio"]), 0, 0, 'L', 0);
$pdf->Ln();

$pdf->setX($ml);
//$pdf->Cell($w - $ml, 6, utf8_decode("Observaciones: " . $cita_row["observaciones"]), 0, 0, 'L', 0);
//$pdf->MultiCell($w - $ml, 6, utf8_decode("Observacion:      " . $observacion));

$cita_row["observaciones"] = $cita_row["observaciones"] ."\n". "Estimado paciente, agradeceremos estar una hora antes de su cita para se cangeada en admision para su atención, " .
    "si antes de mediahora de su atencion no a realizado el cambio se porcedera a la anulacion de la cita sin derecho a reclamo, " .
    "por lo cual se indica cumplir con lo solicitado";

$pdf->Cell($w - $ml, 6, utf8_decode("OBSERVACIÓN: "));
$pdf->setX($xpos);
$pdf->MultiCell($widthvalue, 6, utf8_decode($cita_row["observaciones"]));
$pdf->Ln();


$pdf->output();

?>


















