<?php

require_once __DIR__ . '/../../lib/fpdf/fpdf.php';
require_once __DIR__ . '/../qr/qr_receta.php';
require_once __DIR__ . "/../../controllers/validator/TratamientoValidator.php";

if(!isset($_GET["id"])){
    exit();
}

$model = new TratamientoValidator();

$cita_arr = $model->getRecetaPDF()["rows"];
$cie_arr = $model->getRecetaPDF()["diagnosticos"];
$med_arr = $model->getRecetaPDF()["receta"];

if(count($med_arr) <= 0) exit();
$cita_row = $cita_arr[0];

//exit(json_encode($cita_row));

//Create a new PDF file
/*$pdf = new FPDF();
$pdf->AddPage('P', 'A4');*/
$w = 210;
$h = 297;
$ml = 2; // margin left
$mt = 2; // margin top

$pdf = new FPDF();
$pdf->AddPage('P', 'A4');
$pdf->SetMargins(3,3,3);
$pdf->SetAutoPageBreak( false );

$pdf->SetFont('Arial','B',7.5);    //Letra Arial, negrita (Bold), tam. 20

//$pdf->setY($mt);
//$pdf->setX($ml);
//$pdf->MultiCell($w - $ml, 4, utf8_decode($cita_row["empresa"] . " - " . $cita_row["local"]) ,0, 'C');
//$pdf->Cell($w - $ml, 5, utf8_decode( $cita_row["local"]) ,0, 0, 'C', 0);
//$pdf->Cell($w - $ml, 1, '', 0, 0, 'L', 0);
$pdf->Ln();

$pdf->SetFont('Arial','B',8);    //Letra Arial, negrita (Bold), tam. 20
//$pdf->setX(1);
$pdf->Image(__DIR__ . '/../../public/images/logo.jpg',6,10,50);



$dat_qr = [
    "name_img" => $cita_row["id_paciente"] . '-1',
    "info" =>	'www.dirislimacentro.gob.pe' .chr(13).chr(10).
    			'Datos de Receta Médica Estandarizada'.chr(13).chr(10).
    			'------------------------------------'.chr(13).chr(10).
    			'NRO DOCUMENTO: '.$cita_row["nrodoc"].chr(13).chr(10).
    			'NOMBRES Y APELLIDOS: '.$cita_row["paciente"].chr(13).chr(10).
    			'FECHA DE ATENCION: '.$cita_row["fecha_atendido"].chr(13).chr(10).
    			'MÉDICO: '.$cita_row["medico"]	
];

$url = generateQRCode($dat_qr,'H',8);
$pdf->Image($url,80,5,23);


$pdf->Cell(20,6,'',0, 1, 'C', 0);
$pdf->Ln();
$pdf->Ln();

$_y=$pdf->GetY();

$pdf->Cell(105,2,'RECETA UNICA MEDICA ESTANDARIZADA',0, 0, 'C', 0);
$pdf->Ln();$pdf->Ln();
$pdf->Ln();

$pdf->SetFont('Arial', '', 8);

$paciente = $cita_row["paciente"];
$medico = $cita_row["medico"];

//$widthvalue = ($ml + (( $w - (2*$ml) )/4))*3 - ($ml*3);
//$xpos = $ml + (( $w - (2*$ml) )/4);

//$pdf->setX($ml);
///$pdf->Cell(30, 6, utf8_decode("FECHA ATENCION: " ), 0, 0, 'L', 0);
//$pdf->setX($xpos);
//$pdf->Cell(30, 6, utf8_decode( $cita_row["fecha_atendido"] ), 0, 0, 'L', 0);
//$pdf->Ln();

$pdf->Cell(30, 6, utf8_decode("Nombres y apellidos: " ), 0, 0, 'L', 0);
//$pdf->setX($xpos);
$pdf->Cell(70, 6, utf8_decode( $paciente ), 0, 0, 'L', 0);
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->Cell(33, 6, utf8_decode("USUARIO" ), 0, 0, 'C', 0);
$pdf->Cell(33, 6, utf8_decode("ATENCIÓN" ), 0, 0, 'C', 0);
$pdf->Cell(33, 6, utf8_decode("ESPECIALIDAD MÉDICA" ), 0, 0, 'C', 0);
$pdf->Ln();
$pdf->SetFont('Arial','',8);

$pdf->Cell(28, 5, utf8_decode("Demanda" ), 0, 0, 'L', 0);
$pdf->Cell(5, 5, 'X', 'LTBR', 0, 'C', 0);

$pdf->Cell(28, 5, utf8_decode("  Consulta Externa" ), 0, 0, 'L', 0);
$pdf->Cell(5, 5, 'X', 'LTBR', 0, 'C', 0);

$pdf->Cell(28, 5, utf8_decode("  Medicina" ), 0, 0, 'L', 0);
$pdf->Cell(5, 5, 'X', 'LTBR', 0, 'C', 0);
//$pdf->Ln();

$pdf->Cell(5, 7, '', '', 1, 'C', 0);


$pdf->Cell(28, 5, utf8_decode("SIS" ), 0, 0, 'L', 0);
$pdf->Cell(5, 5, '', 'LTBR', 0, 'C', 0);

$pdf->Cell(28, 5, utf8_decode("  Emergencia" ), 0, 0, 'L', 0);
$pdf->Cell(5, 5, '', 'LTBR', 0, 'C', 0);

$pdf->Cell(28, 5, utf8_decode("  Cirugía" ), 0, 0, 'L', 0);
$pdf->Cell(5, 5, '', 'LTBR', 0, 'C', 0);
$pdf->Cell(5, 7, '', '', 1, 'C', 0);

$pdf->Cell(28, 5, utf8_decode("Intervención" ), 0, 0, 'L', 0);
$pdf->Cell(5, 5, '', 'LTBR', 0, 'C', 0);

$pdf->Cell(28, 5, utf8_decode("  Hospitalización" ), 0, 0, 'L', 0);
$pdf->Cell(5, 5, '', 'LTBR', 0, 'C', 0);

$pdf->Cell(28, 5, utf8_decode("  Ginecología" ), 0, 0, 'L', 0);
$pdf->Cell(5, 5, '', 'LTBR', 0, 'C', 0);
$pdf->Cell(5, 7, '', '', 1, 'C', 0);

$pdf->Cell(6, 5, utf8_decode("Otros " ), 0, 0, 'L', 0);
$pdf->Cell(27, 5, '', 'B', 0, 'L', 0);

$pdf->Cell(28, 5, utf8_decode("  Odontología" ), 0, 0, 'L', 0);
$pdf->Cell(5, 5, '', 'LTBR', 0, 'C', 0);

$pdf->Cell(28, 5, utf8_decode("  Pediatria" ), 0, 0, 'L', 0);
$pdf->Cell(5, 5, '', 'LTBR', 0, 'C', 0);
$pdf->Cell(5, 7, '', '', 1, 'C', 0);


$pdf->Cell(33, 5, utf8_decode(" " ), 0, 0, 'L', 0);

$pdf->Cell(6, 5, utf8_decode("Otros " ), 0, 0, 'L', 0);
$pdf->Cell(27, 5, '', 'B', 0, 'L', 0);

$pdf->Cell(6, 5, utf8_decode("Otros " ), 0, 0, 'L', 0);
$pdf->Cell(27, 5, '', 'B', 1, 'L', 0);


$pdf->SetFont('Arial','B',8);
$pdf->Cell(80, 6, utf8_decode("Diagnóstico" ), 0, 0, 'L', 0);
$pdf->Cell(19, 6, utf8_decode("CIE 10" ), 0, 1, 'L', 0);
//$pdf->Cell(1, 3, '', '', 1, 'L', 0);
$pdf->SetFont('Arial','',8);

for ($i=0;$i<count($cie_arr);$i++){
	$pdf->Cell(80, 6, utf8_decode($cie_arr[$i]['nombre'] ), '', 0, 'L', 0);	
	$pdf->Cell(19, 6, $cie_arr[$i]['cie10'], '', 1, 'L', 0);
	$pdf->Cell(30, 6, '(Definitivo/Presuntivo): '.$cie_arr[$i]['id_tipo'], '', 0, 'L', 0);
	$pdf->Ln();
}





//$pdf->setX($ml);


//$pdf->Ln(); 99

$pdf->SetFont('Arial','B',7);
$pdf->Cell(35, 5, "Medicamento o Insumo", '', 0, 'C', 0);
$pdf->Cell(22, 5, "Present.", '', 0, 'C', 0);
$pdf->Cell(18, 5, "Concentracion", '', 0, 'C', 0);
$pdf->Cell(14, 5, "Forma", '', 0, 'C', 0);
$pdf->Cell(10, 5, "Cant.", '', 1, 'R', 0);

$pdf->Cell(35, 5, "(Obligatorio DCI)", '', 0, 'C', 0);
$pdf->Cell(22, 5, "", '', 0, 'C', 0);
$pdf->Cell(18, 5, "", '', 0, 'C', 0);
$pdf->Cell(14, 5, "Farmaceutica", '', 0, 'C', 0);
$pdf->Cell(10, 5, "", '', 1, 'C', 0);

$pdf->SetFont('Arial','',7);



for ($i=0;$i<count($med_arr);$i++){
	$pdf->Cell(35, 6, utf8_decode($med_arr[$i]['medicamento']), '', 0, 'L', 0);
	$pdf->Cell(22, 6, $med_arr[$i]['presentacion'], '', 0, 'L', 0);
	$pdf->Cell(18, 6, $med_arr[$i]['concentracion'], '', 0, 'L', 0);
	$pdf->Cell(14, 6, $med_arr[$i]['forma'], '', 0, 'L', 0);	
	$pdf->Cell(10, 6, $med_arr[$i]['cantidad'], '', 0, 'R', 0);
	$pdf->Ln();
}

$pdf->Ln();
$pdf->Ln();

$pdf->Cell(30, 5, "", 'B', 0, 'C', 0);
$pdf->Cell(4, 5, "", '', 0, 'C', 0);
$pdf->Cell(30, 5, $cita_row["fecha_atendido"], 'B', 0, 'C', 0);
$pdf->Cell(4, 5, "", '', 0, 'C', 0);
$pdf->Cell(30, 5, "", 'B', 1, 'C', 0);

$pdf->Cell(30, 5, "Sello Firma/Col", '', 0, 'C', 0);
$pdf->Cell(4, 5, "", '', 0, 'C', 0);
$pdf->Cell(30, 5, "Fecha Atencion", '', 0, 'C', 0);
$pdf->Cell(4, 5, "", '', 0, 'C', 0);
$pdf->Cell(30, 5, "Valido hasta", '', 1, 'C', 0);

$pdf->Ln();

$pdf->Cell(80, 6, utf8_decode( $medico ), 0, 0, 'L', 0);


$pdf->SetY($_y-25);
$pdf->SetX(105);
$pdf->Cell(1, 290, '', 'L', 0, 'C', 0);

$pdf->Image(__DIR__ . '/../../public/images/logo.jpg',108,10,50);

$pdf->SetY($_y);
$pdf->SetX(107);





$url = generateQRCode($dat_qr,'H',8);
$pdf->Image($url,180,5,23);


$pdf->SetFont('Arial','B',8);
$pdf->Cell(100,5,'RECETA UNICA MEDICA ESTANDARIZADA',0, 1, 'C', 0);
$pdf->SetX(107);
$pdf->Cell(100,5,'INDICACIONES',0, 1, 'C', 0);
$pdf->SetFont('Arial','',8);

$pdf->SetX(107);
$pdf->Cell(30, 6, utf8_decode("Nombres y apellidos: " ), 0, 0, 'L', 0);
$pdf->Cell(70, 6, utf8_decode( $paciente ), 0, 0, 'L', 0);
$pdf->Ln();


$pdf->SetFont('Arial','B',6);

$pdf->SetX(107);
$pdf->Cell(35, 5, "Medicamento o Insumo", '', 0, 'C', 0);
$pdf->Cell(20, 5, "Dosis", '', 0, 'C', 0);
$pdf->Cell(14, 5, "Via", '', 0, 'C', 0);
$pdf->Cell(20, 5, "Frec", '', 0, 'C', 0);
$pdf->Cell(10, 5, "Durac.", '', 1, 'L', 0);


$pdf->SetFont('Arial','',6);



for ($i=0;$i<count($med_arr);$i++){
	$pdf->SetX(107);

	$pdf->Cell(35, 6, utf8_decode($med_arr[$i]['medicamento'].' '.$med_arr[$i]['presentacion'].' '.$med_arr[$i]['concentracion']), '', 0, 'L', 0);
	$pdf->Cell(20, 6, $med_arr[$i]['dosis'], '', 0, 'L', 0);
	$pdf->Cell(14, 6, $med_arr[$i]['via'], '', 0, 'L', 0);
	$pdf->Cell(20, 6, $med_arr[$i]['intervalo'], '', 0, 'L', 0);	
	$pdf->Cell(10, 6, $med_arr[$i]['duracion'], '', 0, 'L', 0);
	$pdf->Ln();
}

$pdf->Ln();
$pdf->Ln();

$pdf->SetX(107);
$pdf->SetFont('Arial','',7);

$pdf->Cell(30, 5, "", 'B', 0, 'C', 0);
$pdf->Cell(4, 5, "", '', 0, 'C', 0);
$pdf->Cell(30, 5, $cita_row["fecha_atendido"], 'B', 0, 'C', 0);
$pdf->Cell(4, 5, "", '', 0, 'C', 0);
$pdf->Cell(30, 5, "", 'B', 1, 'C', 0);

$pdf->SetX(107);

$pdf->Cell(30, 5, "Sello Firma/Col", '', 0, 'C', 0);
$pdf->Cell(4, 5, "", '', 0, 'C', 0);
$pdf->Cell(30, 5, "Fecha Atencion", '', 0, 'C', 0);
$pdf->Cell(4, 5, "", '', 0, 'C', 0);
$pdf->Cell(30, 5, "Valido hasta", '', 1, 'C', 0);


$pdf->output();

?>


















