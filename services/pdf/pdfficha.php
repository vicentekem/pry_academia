<?php

require_once __DIR__ . '/../../lib/fpdf/fpdf.php';
require_once __DIR__ . "/../../controllers/validator/SeguimientoValidator.php";

if(!isset($_GET["id"])){
    exit("");
}

$model = new SeguimientoValidator();

$result_assoc = $model->getPacientePDF();
$ficha_arr = $result_assoc["rows"];
$viajes_arr = $result_assoc["viajes"];
$contactos_arr = $result_assoc["contactos"];
//exit( json_encode($result_assoc) );
if(count($ficha_arr) <= 0) exit("ab");
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
$title = "ANEXO 1";
$subtitle = "Ficha para la investigación epidemiológica del COVID-19";
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
$pdf->Cell(190/2, 10, utf8_decode("FICHA DE INVESTIGACIÓN CLÍNICO EPIDEMIOLÓGICA COVID-19 "), 'TRBL', 0, 'C', 0);
$pdf->Ln();


$pdf->SetFont('Arial', 'B', 8);
$pdf->SetX(10);
$pdf->Cell(190, 6, utf8_decode("I.DATOS GENERALES DE LA NOTIFICACION"), 'TRBL', 0, 'L', 0);
$pdf->Ln();

$pdf->SetFont('Arial', '', 7);
$pdf->SetX(10);
if( $ficha_arr['fecha_notificacion']){
    $pdf->Cell(190, 6, utf8_decode("Fecha Notificacion:  " . $ficha_arr['fecha_notificacion']), 'TR0L', 0, 'L', 0);
}else{
    $pdf->Cell(190, 6, utf8_decode("Fecha Notificacion:  _____/_____/_____"), 'TR0L', 0, 'L', 0);
}

$pdf->Ln();

$pdf->SetX(10);
$pdf->Cell(190, 6, utf8_decode("GERESA/DIRESA/DIRIS: DIRIS LIMA CENTRO "), '0R0L', 0, 'L', 0);
$pdf->Ln();

$pdf->SetX(10);
if( $ficha_arr['eess']){
    $pdf->Cell(75, 6, utf8_decode("EESS: " . strtoupper($ficha_arr['eess']) ), '000L', 0, 'L', 0);
}else{
    $pdf->Cell(75, 6, utf8_decode("EESS: __________________________________________"), '000L', 0, 'L', 0);
}

$pdf->Cell(15, 6, utf8_decode("Inst. Adm: "), '0000', 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode("x"), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 8);
$pdf->Cell(23 , 6, utf8_decode("MINSA"), 0, 0, 'L', 0);

$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode(""), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 8);
$pdf->Cell(23 , 6, utf8_decode("ESSALUD"), 0, 0, 'L', 0);

$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode(""), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 8);
$pdf->Cell(33 , 6, utf8_decode("PRIVADO"), '0R00', 0, 'L', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->Cell(35, 6, utf8_decode("Clasificacion del caso: "), '000L', 0, 'L', 0);

$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode(($ficha_arr["id_resultado_muestra"] == 1) ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 8);
$pdf->Cell(23 , 6, utf8_decode("Confirmado"), 0, 0, 'L', 0);

$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode(($ficha_arr["id_resultado_muestra"] == 3 || $ficha_arr["id_resultado_muestra"] == 4) ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 8);
$pdf->Cell(23 , 6, utf8_decode("Probable"), 0, 0, 'L', 0);

$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode(($ficha_arr["id_resultado_muestra"] == null || $ficha_arr["id_resultado_muestra"] == '') ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 8);
$pdf->Cell(88 , 6, utf8_decode("Sospechoso"), '0R00', 0, 'L', 0);
$pdf->Ln();


$pdf->SetFont('Arial', 'B', 8);
$pdf->SetX(10);
$pdf->Cell(190, 6, utf8_decode("II.DATOS DEL PACIENTE"), 'TRBL', 0, 'L', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(25, 6, utf8_decode("Nombres y Apellidos: "), '000L', 0, 'L', 0);
$pdf->Cell(115, 6, utf8_decode($ficha_arr["nombre_completo"]), '0000', 0, 'C', 0);
$pdf->Cell(25, 6, utf8_decode("Nro de telefono "), '', 0, 'L', 0);
$pdf->Cell(25, 6, utf8_decode($ficha_arr["telefono"]), 'R', 0, 'C', 0);
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

$pdf->SetFont('Arial', 'B', 8);
$pdf->SetX(10);
$pdf->Cell(190, 6, utf8_decode("III.CUADRO CLINICO"), 'TRBL', 0, 'L', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(30, 6, utf8_decode("Fecha inicio de sintomas:  "), 'L', 0, 'L', 0);
$pdf->Cell(160, 6, utf8_decode($ficha_arr["fecha_inicio_sintomas"]), 'R', 0, 'L', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(25, 6, utf8_decode("Hospitalizado "), 'L', 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["hospitalizado"] == true ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(23 , 6, utf8_decode("Si"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["hospitalizado"] == false ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(23 , 6, utf8_decode("No"), 0, 0, 'L', 0);
$pdf->Cell(7 , 5, utf8_decode(''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(98 , 6, utf8_decode("Desconocido"), 'R', 0, 'L', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(25, 6, utf8_decode("Fecha de Hospitalización "), 'L', 0, 'L', 0);
$pdf->Cell(70, 6, utf8_decode($ficha_arr["fecha_ingreo"]), '', 0, 'L', 0);
$pdf->Cell(25, 6, utf8_decode("Nombre Hospital"), '', 0, 'L', 0);
$pdf->Cell(70, 6, utf8_decode($ficha_arr["hospital"]), 'R', 0, 'L', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(25, 6, utf8_decode("Aislamiento "), 'L', 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["aislamiento"] == true ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(23 , 6, utf8_decode("Si"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["aislamiento"] == false ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(23 , 6, utf8_decode("No"), 0, 0, 'L', 0);

$pdf->Cell(25, 6, utf8_decode("Fecha de aislamiento "), '', 0, 'L', 0);
$pdf->Cell(80, 6, utf8_decode($ficha_arr["fecha_aislamiento"]), 'R', 0, 'L', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(60, 6, utf8_decode("El paciente estuvo en ventilacion mecanica"), 'L', 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["id_condicion"] == '1'  && $ficha_arr["id_condicion"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(23 , 6, utf8_decode("Si"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["id_condicion"] != '1' && $ficha_arr["id_condicion"]  ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(23 , 6, utf8_decode("No"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode(''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(63 , 6, utf8_decode("Desconocido"), 'R', 0, 'L', 0);
$pdf->Ln();


$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(50, 6, utf8_decode("Evoluciób del paciente"), 'L', 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["id_evolucion_pac"] == '3' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(28 , 6, utf8_decode("Recuperado"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["id_evolucion_pac"] == '4' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(28 , 6, utf8_decode("No recuperado"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["id_evolucion_pac"] == '5' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(28 , 6, utf8_decode("Felleció"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["id_evolucion_pac"] == '14' || $ficha_arr["id_evolucion_pac"] == '13' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(28 , 6, utf8_decode("Desconocido"), 'R', 0, 'L', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(40, 6, utf8_decode("Fecha de Defuncion, si aplica: "), 'L', 0, 'L', 0);
$pdf->Cell(150, 6, utf8_decode("___________________________"), 'R', 0, 'L', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(190, 6, utf8_decode("Sintomas"), 'LR', 0, 'L', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["tos"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(38 , 6, utf8_decode("Tos"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["malestar_gen"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(38 , 6, utf8_decode("Malestar General"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["dol_mus"] || $ficha_arr["dol_pec"] || $ficha_arr["dol_adb"] || $ficha_arr["dol_art"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(83 , 6, utf8_decode("Dolor      Marque todos los que aplica"), '0', 0, 'L', 0);
$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);

$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["dolor_garganta"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(38 , 6, utf8_decode("Dolor de gargante"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["diarrea"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(38 , 6, utf8_decode("Diarrea"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode('(  ' . ($ficha_arr["dol_mus"] ? 'x' : '')  . '  )'), '', 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(38 , 6, utf8_decode("Muscular"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode('(  ' . ($ficha_arr["dol_pec"] ? 'x' : '')  . '  )'), '', 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(38 , 6, utf8_decode("Pecho"), 0, 0, 'L', 0);


$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);

$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["con_nasal"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(38 , 6, utf8_decode("Congestion nasal"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["vomitos"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(38 , 6, utf8_decode("Náuseas/vómitos"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode('(  ' . ($ficha_arr["dol_adb"] ? 'x' : '')  . '  )'), '', 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(38 , 6, utf8_decode("Abdominal"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode('(  ' . ($ficha_arr["dol_art"] ? 'x' : '')  . '  )'), '', 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(38 , 6, utf8_decode("Articulaciones"), 0, 0, 'L', 0);

$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["dif_res"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(38 , 6, utf8_decode("Dificultad respiratoria"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["cefalea"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(38 + 90 , 6, utf8_decode("Cefalea"), 0, 0, 'L', 0);

$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["fiebre"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(38 , 6, utf8_decode("Fiebre"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["irritabilidad"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(38 + 90 , 6, utf8_decode("Irritabilidad/confusion"), 0, 0, 'L', 0);

$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["otros"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(23 , 6, utf8_decode("Otros. epecificar: "), 0, 0, 'L', 0);
$pdf->Cell(150 , 6, utf8_decode($ficha_arr["sintoma_desc"]), 0, 0, 'L', 0);
$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();


$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(190, 6, utf8_decode("Signos"), 'LR', 0, 'L', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->Cell(20, 6, utf8_decode("Temperatura"), '', 0, 'L', 0);
$pdf->Cell(160, 6, utf8_decode($ficha_arr["temperatura"]), '', 0, 'L', 0);
$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["sin_ex_tar"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(53 , 6, utf8_decode("Excusado"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["sin_com"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(53 , 6, utf8_decode("Coma"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["sin_hall_an_pul"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(53, 6, utf8_decode("Hallazgo anomarles en Rx Pulmonar"), 0, 0, 'L', 0);

$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["sin_iny_con"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(53 , 6, utf8_decode("Inyeccion Conjuntival"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["sin_dis_taq"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(53 + 60 , 6, utf8_decode("Disnea/taquipnea"), 0, 0, 'L', 0);

$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["sin_conv"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(53 , 6, utf8_decode("Convulcion"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["sin_aus_pul_an"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(53 + 60 , 6, utf8_decode("Ausculación pulmonar, anormal"), 0, 0, 'L', 0);

$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();

//exit( json_encode( $ficha_arr ) );

$pdf->SetX(10);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["sin_otros"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(23 , 6, utf8_decode("Otros. epecificar: "), 0, 0, 'L', 0);
$pdf->Cell(150 , 6, utf8_decode($ficha_arr["sin_desc"]), 0, 0, 'L', 0);
$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();

$pdf->Cell(190 , 5, utf8_decode(''), 'LRB', 0, 'C', 0);
$pdf->Ln();

/********************************************************************************************************************************************/
/***************************************************************SEGUNDA HOJA*****************************************************************/
/********************************************************************************************************************************************/


$pdf->AddPage('P', 'A4');

$pdf->SetY($Y_sisol_position);
$pdf->Image(__DIR__ . '/../../public/images/logo.jpg',10,10,90);
$pdf->Cell(70, 6, '', 0, 0, 'L', 0);


$pdf->SetFont('Arial', 'B', 8);
$pdf->SetY($Y_titulo_position - 10);
//$pdf->Cell(210 - $totalx_margin, 5, utf8_decode(""), 0, 0, 'C', 0);
$pdf->Ln();
$pdf->Cell(210 - $totalx_margin, 5, utf8_decode("\"Decenio de la igualdad de Oportunidad para Mujeres y Hombres\""), 0, 0, 'C', 0);
$pdf->Ln();
$pdf->Cell(210 - $totalx_margin, 5, utf8_decode("\"Año de la Universializacion de la Salud\""), 0, 0, 'C', 0);
$pdf->Ln();


$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(190, 6, utf8_decode("Condiciones de Comorbilidad"), 'TLR', 0, 'L', 0);
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

$pdf->Cell(190 , 5, utf8_decode(''), 'LR', 0, 'C', 0);
$pdf->Ln();

$pdf->SetFont('Arial', 'B', 8);
$pdf->SetX(10);
$pdf->Cell(190, 6,
    utf8_decode("IV.Información de viaje y exposicion en los 14 días anteriores a la fecha de inicio de sintomas (antes de informar si es asintomático)"),
    'TRBL', 0, 'L', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(190, 6, utf8_decode("Ocupacion"), 'TLR', 0, 'L', 0);
$pdf->Ln();


$pdf->SetX(10);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["id_ocupacion"] == '1' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(83 , 6, utf8_decode("Estudiante"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["id_ocupacion"] == '2' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(83 , 6, utf8_decode("Trabajador de salud"), 0, 0, 'L', 0);
$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["id_ocupacion"] == '3' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(83 , 6, utf8_decode("Trabaja con animales"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["id_ocupacion"] == '5' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(23 , 6, utf8_decode("Otros. espesificar: "), 0, 0, 'L', 0);
$pdf->Cell(60 , 6, utf8_decode($ficha_arr["ocupacion"] ), 0, 0, 'L', 0);
$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["id_ocupacion"] == '4' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(83 + 90 , 6, utf8_decode("Trabajador de salud en laboratorio"), 0, 0, 'L', 0);
$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(95, 6, utf8_decode("¿Ha viajado el paciente 14 días antes de la fecha de inicio de sintomas?"), '000L', 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["pre_viaje"] == '1' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(13 , 6, utf8_decode("Si"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["pre_viaje"] == '2' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(13 , 6, utf8_decode("No"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["pre_viaje"] == '3' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(48 , 6, utf8_decode("Desconocido"), 'R', 0, 'L', 0);
//$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();


$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(190, 6, utf8_decode( "  Si la respuesta es si, especifique los lugares a los que el paciente viajó"), 'LR', 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Ln();

/*$pdf->Cell(190 , 5, utf8_decode(''), 'LR', 0, 'C', 0);
$pdf->Ln();*/

$pdf->SetX(10);
$pdf->Cell(10 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(80, 6, utf8_decode("País"), '', 0, 'L', 0);
$pdf->Cell(10, 6, utf8_decode(""), '', 0, 'L', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(80, 6, utf8_decode("Ciudad"), '', 0, 'L', 0);
$pdf->Cell(10 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();

for($i = 0;$i<3;$i++){

    $pdf->SetX(10);
    $pdf->Cell(10 , 5, utf8_decode(''), 'L', 0, 'C', 0);
    $pdf->SetFont('Arial', '', 7);
    $pdf->Cell(80, 6, utf8_decode( ($i + 1) ." ". ( isset( $viajes_arr[$i] ) ? $viajes_arr[$i]["pais"] : '' ) ), 'B', 0, 'L', 0);
    $pdf->Cell(10, 6, utf8_decode(""), '', 0, 'L', 0);
    $pdf->SetFont('Arial', '', 7);
    $pdf->Cell(80, 6, utf8_decode(isset( $viajes_arr[$i] ) ? $viajes_arr[$i]["ciudad"] : '') , 'B', 0, 'L', 0);
    $pdf->Cell(10 , 5, utf8_decode(''), 'R', 0, 'C', 0);
    $pdf->Ln();
}



$pdf->Cell(190 , 5, utf8_decode(''), 'LR', 0, 'C', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(190, 6, utf8_decode( "¿Ha visitado algun establecimiento de salud en los 14 dias antes del inicio de sintomas?"), 'LR', 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Ln();

$pdf->SetX(10);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["pre_visita"] == '1' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(13 , 6, utf8_decode("Si"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["pre_visita"] == '2' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(13 , 6, utf8_decode("No"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["pre_visita"] == '3' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(18 , 6, utf8_decode("Desconocido"), '', 0, 'L', 0);
$pdf->Cell(45 , 6, utf8_decode("Si la respuesta es si, nombre del EESS"), '', 0, 'L', 0);
$pdf->Cell(70 , 6, utf8_decode($ficha_arr["desc_eess"]), '', 0, 'L', 0);
$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(190, 6,
    utf8_decode( "¿Ha tenido el paciente contacto cercano con una persona con infeccion respiratoria aguda en los 14 días previos al inicio de sintomas?"),
    'LR', 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Ln();

$pdf->SetX(10);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["tc_es"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(53 , 6, utf8_decode("Entorno de salud"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["tc_ef"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(53 , 6, utf8_decode("Entorno Familiar"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["tc_lt"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(53, 6, utf8_decode("Lugar de trabajo"), 0, 0, 'L', 0);
$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["tc_desconocido"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(53 , 6, utf8_decode("Desconocido"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["tc_otros"] ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(53 + 60 , 6, utf8_decode("Otros. especifique: " . $ficha_arr["tc_desc"] ), 0, 0, 'L', 0);
$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(190, 6, utf8_decode( "¿Ha tenido contacto con un caso confirmado o probable en los 14 dias antes del inicio de sintomas?"), 'LR', 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Ln();

$pdf->SetX(10);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["contac_casoconf"] == '1' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(13 , 6, utf8_decode("Si"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["contac_casoconf"] == '2' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(13 , 6, utf8_decode("No"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["contac_casoconf"] == '3' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(18 + 115 , 6, utf8_decode("Desconocido"), '', 0, 'L', 0);
$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();


$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->Cell(185, 6, utf8_decode( "Si la respuesta es si, liste los datos de los casos confirmados o probables"), 'R', 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Ln();

for($i = 0;$i<3;$i++){

    $pdf->SetX(10);
    $pdf->Cell(5 , 6, utf8_decode(''), 'L', 0, 'C', 0);
    $pdf->SetFont('Arial', '', 7);
    $pdf->Cell(15, 5, utf8_decode("caso " . ($i + 1) . ": "), '', 0, 'L', 0);
    $pdf->Cell(165, 5, utf8_decode(isset($contactos_arr[$i]) ? $contactos_arr[$i]["nombre_completo"] : '') , 'B', 0, 'L', 0);
    $pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
    $pdf->Ln();
}


$pdf->SetX(10);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode(''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(53 , 6, utf8_decode("Entorno de salud"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode(''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(53 , 6, utf8_decode("Entorno Familiar"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode(''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(53, 6, utf8_decode("Lugar de trabajo"), 0, 0, 'L', 0);
$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode(''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(53 , 6, utf8_decode("Desconocido"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode(''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(53 + 60 , 6, utf8_decode("Otros. especifique: "), 0, 0, 'L', 0);
$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(190, 6, utf8_decode( "¿Ha visitado algún mercado donde se encuentre animales vivos en los 14 dias antes del inicio de sintomas?"), 'LR', 0, 'L', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["pre_visita_animales"] == '1' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(13 , 6, utf8_decode("Si"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["pre_visita_animales"] == '2' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(13 , 6, utf8_decode("No"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode($ficha_arr["pre_visita_animales"] == '3' ? 'x' : ''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(18 + 115 , 6, utf8_decode("Desconocido"), '', 0, 'L', 0);
$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(5 , 5, utf8_decode(''), 'L', 0, 'C', 0);
$pdf->Cell(90, 5, utf8_decode('Si la respuesta es si, registre el pais/departamento/localidad de exposicion'), '', 0, 'L', 0);
$pdf->Cell(90, 5, utf8_decode($ficha_arr["desc_mercado"]), '', 0, 'L', 0);
$pdf->Cell(5 , 5, utf8_decode(''), 'R', 0, 'C', 0);
$pdf->Ln();

$pdf->Cell(190 , 5, utf8_decode(''), 'LR', 0, 'C', 0);
$pdf->Ln();

$pdf->SetFont('Arial', 'B', 8);
$pdf->SetX(10);
$pdf->Cell(190, 6, utf8_decode("V.LABORATORIO(Para ser llenado por laboratorio)"), 'TRBL', 0, 'L', 0);
$pdf->Ln();


$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(33, 6, utf8_decode("Fecha de toma de muestra: "), 'L', 0, 'L', 0);
$pdf->Cell(157, 6, utf8_decode($ficha_arr["fecha_muestra"]), 'R', 0, 'L', 0);
$pdf->Ln();

$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(33, 6, utf8_decode("Tipo de Muestra"), 'L', 0, 'L', 0);
$pdf->Cell(157, 6, utf8_decode("__________________________________"), 'R', 0, 'L', 0);
$pdf->Ln();


$pdf->SetX(10);
$pdf->Cell(40, 6, utf8_decode("¿Se realizo secuenciamiento?"), 'L', 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode(''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(13 , 6, utf8_decode("Si"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode(''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(13 , 6, utf8_decode("No"), 0, 0, 'L', 0);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(7 , 5, utf8_decode(''), 1, 0, 'C', 0);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(13 + 90 , 6, utf8_decode("Desconocido"), 'R', 0, 'L', 0);
$pdf->Ln();


$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(45, 6, utf8_decode("Fecha de resultado de laboratorio: "), 'L', 0, 'L', 0);
$pdf->Cell(145, 6, utf8_decode($ficha_arr["fecha_resultado_muestra"]), 'R', 0, 'L', 0);
$pdf->Ln();


$pdf->Cell(190 , 5, utf8_decode(''), 'LR', 0, 'C', 0);
$pdf->Ln();

$pdf->SetFont('Arial', 'B', 8);
$pdf->SetX(10);
$pdf->Cell(190, 6, utf8_decode("VI.INVESTIGADOR"), 'TRBL', 0, 'L', 0);
$pdf->Ln();

//exit( json_encode( $_SESSION['usuario_cor'] ) );

$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(45, 6, utf8_decode("Persona que llena la ficha: "), 'L', 0, 'L', 0);

if(isset($ficha_arr['id_usuario_registrador']) ){
    if( $ficha_arr['id_usuario_registrador'] != 1 ){
        $pdf->Cell(145, 6, utf8_decode( $ficha_arr['nombre_completo_registrador'] ), 'R', 0, 'L', 0);
    }else{
        $pdf->Cell(145, 6, utf8_decode("__________________________________"), 'R', 0, 'L', 0);
    }
}else{
    $pdf->Cell(145, 6, utf8_decode("__________________________________"), 'R', 0, 'L', 0);
}
/*
if(isset( $_SESSION['usuario_cor']['id_profesion'] )){
    if( $_SESSION['usuario_cor']['id_profesion'] == 1 ){
        $pdf->Cell(145, 6, utf8_decode($_SESSION['usuario_cor']['nombre_completo']), 'R', 0, 'L', 0);
    }else{
        $pdf->Cell(145, 6, utf8_decode("__________________________________"), 'R', 0, 'L', 0);
    }
}else{
    $pdf->Cell(145, 6, utf8_decode("__________________________________"), 'R', 0, 'L', 0);
}*/

//$pdf->Cell(145, 6, utf8_decode($_SESSION['usuario_cor']['nombre_completo']), 'R', 0, 'L', 0);

$pdf->Ln();

$pdf->SetX(10);
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(190, 6, utf8_decode("Firma y sello"), 'LR', 0, 'L', 0);
$pdf->Ln();

$pdf->Cell(190 , 2, utf8_decode(''), 'BLR', 0, 'C', 0);
$pdf->Ln();


$pdf->Output();

?>
