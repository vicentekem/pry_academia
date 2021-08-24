<?php

require_once __DIR__ . '/../../lib/fpdf/fpdf.php';
require_once __DIR__ . "/../../controllers/validator/SeguimientoValidator.php";

if(!isset($_GET["id"])){
    exit("id");
}

$model = new SeguimientoValidator();

$result_assoc = $model->getPacientesContactoPDF();
$ficha_arr = $result_assoc["rows"];
$viajes_arr = $result_assoc["viajes"];
$contactos_arr = $result_assoc["contactos"];

//exit( json_encode( $result_assoc  ) );

if(count($ficha_arr) <= 0) exit("aaa");
else{
    $ficha_arr = $ficha_arr[0];
}

//exit( json_encode( $_SESSION ) );

//exit(json_encode($cita_row));

//Create a new PDF file
/*$pdf = new FPDF();
$pdf->AddPage('P', 'A4');*/
$w = 210;
$h = 297;
$ml = 2; // margin left
$mt = 2; // margin top
//Create a new PDF file
$pdf = new FPDF();
$pdf->AddPage('P', 'A4');

//************************************************
$title = "ANEXO 2";
$subtitle = "Ficha de identificación de contacto - COVID-19";
$Y_sisol_position = 10;
$Y_usp_position = 13;
$Y_titulo_position = 33;
//Fields Name position
$Y_Fields_numero = 26;
$Y_Fields_numerorpc = 30;
$Y_Fields_Name_position = 41;
//Table position, under Fields Name
$Y_Table_Position = 45;
$Y_Table_Positionnumero = 26;
$Y_Table_Positionnumerorpc = 30;
$Y_Table_Positionsegunda = 60;

//First create each Field Name
//Gray color filling each Field Name box
$pdf->SetFillColor(232, 232, 232);
$pdf->SetAutoPageBreak( false );
$ml = 10;
$mt = 10;
$mr = 10;
$totalx_margin = $ml + $mr;

$pdf->SetMargins($ml, $mt, $mr);

//Bold Font for Field Name
$pdf->SetFont('Arial', 'B', 8);
//$pdf->SetAutoPageBreak(true);
$pdf->SetY($Y_sisol_position);
$pdf->Image(__DIR__ . '/../../public/images/logo.jpg',10,10,90);
$pdf->Cell(70, 6, '', 0, 0, 'L', 0);


$pdf->SetFont('Arial', 'B', 9.5);
$pdf->SetY($Y_titulo_position - 5);
$pdf->Cell(210 - $totalx_margin, 5, utf8_decode($title), 0, 0, 'C', 0);
$pdf->Ln();
$pdf->Cell(210 - $totalx_margin, 5, utf8_decode($subtitle), 0, 0, 'C', 0);
$pdf->Ln();


$pdf->SetFont('Arial', 'B', 7.2);
$pdf->SetX(10);
$pdf->Image(__DIR__ . '/../../public/images/logo.jpg',12,39,180/2,8);
$pdf->Cell(190/2, 10, "", 'TRBL', 0, 'L', 0);
$pdf->SetX(105);
$pdf->Cell(190/2, 10, utf8_decode("FICHA DE INDENTIFICACIÓN DE CONTACTO COVID-19 "), 'TRBL', 0, 'C', 0);
$pdf->Ln();


$pdf->SetFont('Arial', 'B', 8);
$pdf->SetX(10);
$pdf->Cell(190, 6, utf8_decode("I.DATOS GENERALES DEL CASO CONFIRMADO"), 'TRBL', 0, 'L', 0);
$pdf->Ln();

$pdf->SetFont('Arial', '', 7);
$pdf->SetX(10);
if( $ficha_arr['fecha_notificacion']){
    $pdf->Cell(190, 6, utf8_decode("Fecha investigacion:  " . $ficha_arr['fecha_notificacion']), 'TR0L', 0, 'L', 0);
}else{
    $pdf->Cell(190, 6, utf8_decode("Fecha investigacion:  _____/_____/_____"), 'TR0L', 0, 'L', 0);
}

$pdf->Ln();

$pdf->SetX(10);
$pdf->Cell(35, 6, utf8_decode("Nombre del caso confirmado: "), 'L', 0, 'L', 0);
$pdf->Cell(95, 5, utf8_decode($ficha_arr["nombre_completo_pos"]), 'B', 0, 'L', 0);
$pdf->Cell(25, 6, utf8_decode("DNI/CE/PAsaporte: "), '', 0, 'L', 0);
$pdf->Cell(30, 5, utf8_decode($ficha_arr["nrodoc_pos"]), 'B', 0, 'L', 0);
$pdf->Cell(5, 5, '', 'R', 0, 'C', 0);
$pdf->Ln();
$pdf->Cell(190, 6, '', 'RL', 0, 'C', 0);
$pdf->Ln();


$pdf->SetFont('Arial', 'B', 8);
$pdf->SetX(10);
$pdf->Cell(190, 6, utf8_decode("II. DATOS DEL CONTACTO"), 'TRBL', 0, 'L', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(28, 6, utf8_decode("Nombres y Apellidos: "), '000L', 0, 'L', 0);
$pdf->Cell(132, 6, utf8_decode($ficha_arr["nombre_completo"]), 'B', 0, 'C', 0);
//$pdf->Cell(25, 6, utf8_decode("Nro de telefono "), '', 0, 'L', 0);
//$pdf->Cell(25, 6, utf8_decode($ficha_arr["telefono"]), 'R', 0, 'C', 0);
$pdf->Cell(30, 6, '', 'R', 0, 'C', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(25, 6, utf8_decode("Fecha de Nacimiento "), 'L', 0, 'L', 0);
$pdf->Cell(40, 6, utf8_decode($ficha_arr["fecha_nacimiento"]), '', 0, 'L', 0);
$pdf->Cell(25, 6, utf8_decode("Edad"), '', 0, 'L', 0);
$pdf->Cell(100, 6, utf8_decode($ficha_arr["edad_anios"] . ' años' . ', ' . $ficha_arr["edad_meses"] . ' meses y' . $ficha_arr["edad_dias"] . ' días ' ), 'R', 0, 'L', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(25, 6, utf8_decode("Sexo "), 'L', 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["id_sexo"] == '1' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(23 , 6, utf8_decode("Masculino"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["id_sexo"] == '2' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(63 , 6, utf8_decode("Femenino"), 0, 0, 'L', 0);

$pdf->Cell(25, 6, utf8_decode("DNI/CE/Pasaporte "), '', 0, 'L', 0);
$pdf->Cell(40, 6, utf8_decode($ficha_arr["nrodoc"]), 'R', 0, 'L', 0);

$pdf->Ln();

$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(25, 6, utf8_decode("Direccion Actual"), 'L', 0, 'L', 0);
$pdf->Cell(165, 6, utf8_decode($ficha_arr["descrip_dir"]), 'R', 0, 'L', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(40, 6, utf8_decode("Departamento provincia y distrito"), 'L', 0, 'L', 0);
$pdf->Cell(150, 6, utf8_decode($ficha_arr["ubigeo"]), 'R', 0, 'L', 0);
$pdf->Ln();


/*
1 FAMILIAR
2 CENTRO LABORAL
3 CENTRO DE ESTUDIOS
4 ESTABLECIMIENTO DE SALUD
5 EVENTOS SOCIALES
6 OTROS
*/

$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(30, 6, utf8_decode("Tipo de contacto "), 'L', 0, 'L', 0);

$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["id_tipo_contacto"] == '1' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 8);
$pdf->Cell(33 , 6, utf8_decode("Familiar"), 0, 0, 'L', 0);

$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["id_tipo_contacto"] == '2' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 8);
$pdf->Cell(33 , 6, utf8_decode("Centro laboral"), 0, 0, 'L', 0);

$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["id_tipo_contacto"] == '3' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 8);
$pdf->Cell(33 , 6, utf8_decode("Centro estudios"), 0, 0, 'L', 0);

$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["id_tipo_contacto"] == '4' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 8);
$pdf->Cell(33 , 6, utf8_decode("EESS"), 'R', 0, 'L', 0);
$pdf->Ln();


$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(30, 6, utf8_decode(""), 'L', 0, 'L', 0);

$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["id_tipo_contacto"] == '5' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 8);
$pdf->Cell(33 , 6, utf8_decode("Evento social"), 0, 0, 'L', 0);

$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode(''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 8);
$pdf->Cell(43 , 6, utf8_decode("Atención médica domiciliaria"), 0, 0, 'L', 0);

$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["id_tipo_contacto"] == '6' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 8);
$pdf->Cell(63, 6, utf8_decode("Otros"), 'R', 0, 'L', 0);
$pdf->Ln();




$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(30, 6, utf8_decode("Fecha de contacto "), 'L', 0, 'L', 0);
$pdf->Cell(160, 6, utf8_decode($ficha_arr["fecha_contacto"]), 'R', 0, 'L', 0);
$pdf->Ln();



$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(190, 6, utf8_decode("Condiciones de Comorbilidad"), 'LR', 0, 'L', 0);
$pdf->Ln();


$pdf->SetX(10);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["cc_embarazo"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(83 , 6, utf8_decode("Embarazo"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["cc_pos_parto"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(83 , 6, utf8_decode("Pos Parto"), 0, 0, 'L', 0);

$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["cc_enf_car"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(83 , 6, utf8_decode("Enfermedad cardiovascular"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["cc_inmunodeficiencia"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(83 , 6, utf8_decode("Inmunodeficiencia"), 0, 0, 'L', 0);

$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["cc_diabetes"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(83 , 6, utf8_decode("Diabetes"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["cc_enf_ren"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(83 , 6, utf8_decode("Enfermedad renal"), 0, 0, 'L', 0);

$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["cc_enf_hep"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(83 , 6, utf8_decode("Enfermedad Hepatica"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["cc_dan_hep"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(83 , 6, utf8_decode("Daño Hepatico"), 0, 0, 'L', 0);

$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["cc_enf_cro"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(83 , 6, utf8_decode("Enfermedad crónica neurológica o neuromuscular"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["cc_enf_pul"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(83 , 6, utf8_decode("Enfermedad pulmonar crónica"), 0, 0, 'L', 0);

$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();


$pdf->SetX(10);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["cc_otros"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(23 , 6, utf8_decode("Otros. especificar: "), 0, 0, 'L', 0);
$pdf->Cell(60 , 6, utf8_decode($ficha_arr["cc_desc"]), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["cc_cancer"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(83 , 6, utf8_decode("Cancer"), 0, 0, 'L', 0);
$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();

$pdf->Cell(190 , 3, utf8_decode(''), 'LR', 0, 'C', 0);
$pdf->Ln();

$pdf->SetFont('Arial', 'B', 8);
$pdf->SetX(10);
$pdf->Cell(190, 6, utf8_decode("III. EL CONTACTO ES UN CASO SOSPECHOSO "), 'TRBL', 0, 'L', 0);
$pdf->Ln();

$pdf->Cell(190 , 3, utf8_decode(''), 'LR', 0, 'C', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode(''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(23 , 6, utf8_decode("Si"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode(''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(143 , 6, utf8_decode("No"), 0, 0, 'L', 0);
$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();


$pdf->Cell(190 , 3, utf8_decode(''), 'LRB', 0, 'C', 0);
$pdf->Ln();

$pdf->SetFont('Arial', 'B', 8);
$pdf->SetX(10);
$pdf->Cell(190, 6, utf8_decode("IV. INVESTIGADOR"), 'TRBL', 0, 'L', 0);
$pdf->Ln();

$pdf->Cell(190 , 3, utf8_decode(''), 'LR', 0, 'C', 0);
$pdf->Ln();


$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(45, 6, utf8_decode("Persona que llena la ficha: "), 'L', 0, 'L', 0);
if(isset( $_SESSION['usuario_cor']['id_profesion'] )){
    if( $_SESSION['usuario_cor']['id_profesion'] == 1 ){
        $pdf->Cell(145, 6, utf8_decode($_SESSION['usuario_cor']['nombre_completo']), 'R', 0, 'L', 0);
    }else{
        $pdf->Cell(145, 6, utf8_decode("__________________________________"), 'R', 0, 'L', 0);
    }
}else{
    $pdf->Cell(145, 6, utf8_decode("__________________________________"), 'R', 0, 'L', 0);
}
$pdf->Ln();

$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(190, 6, utf8_decode("Firma y sello"), 'LR', 0, 'L', 0);
$pdf->Ln();

$pdf->Cell(190 , 3, utf8_decode(''), 'LRB', 0, 'C', 0);
$pdf->Ln();


/********************************************************************************************************************************************/
/***************************************************************SEGUNDA HOJA*****************************************************************/
/********************************************************************************************************************************************/

$pdf->Output();

?>
