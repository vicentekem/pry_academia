<?php

require_once __DIR__ . '/../../lib/fpdf/fpdf.php';
require_once __DIR__ . '/../qr/qr_resultado_muestra.php';
require_once __DIR__ . "/../../controllers/validator/SeguimientoValidator.php";



class PDF_MC_Table extends FPDF
{
    var $widths;
    var $aligns;
    var $styles; // added by MJR
    var $vertical_padding = 0; // added by MJR

    function SetWidths($w)
    {
        //Set the array of column widths
        $this->widths=$w;
    }

    function SetAligns($a)
    {
        //Set the array of column alignments
        $this->aligns=$a;
    }

    function SetStyles($styles_array) { // added by MJR
        $this->styles = $styles_array;
    }

    function SetVerticalPadding($vertical_padding) { // added by MJR
        $this->vertical_padding = $vertical_padding;
    }

    function GetVerticalPadding() { // added by MJR
        return $this->vertical_padding;
    }

    function SetHorizontalPadding($cMargin) { // added by MJR
        $this->cMargin = $cMargin;
    }

    function GetHorizontalPadding() { // added by MJR
        return $this->cMargin;
    }

    function Row($data) // Identical to "Table with MultiCells"
    {                   // (Olivier, 2002-11-17) but reformatted
        //Calculate the height of the row
        $nb = 0;
        for ($i = 0; $i < count($data); $i++)
            $nb = max($nb, $this->NbLines($this->widths[$i], $data[$i]));
        $h = 5 * $nb;
        //Issue a page break first if needed
        $this->CheckPageBreak($h);
        //Draw the cells of the row
        for ($i = 0; $i < count($data); $i++) {
            $w = $this->widths[$i];
            $a = isset($this->aligns[$i]) ? $this->aligns[$i] : 'L';
            //Save the current position
            $x = $this->GetX();
            $y = $this->GetY();
            //Draw the border
            $this->Rect($x, $y, $w, $h);
            //Print the text
            $this->MultiCell($w, 5, $data[$i], 0, $a);
            //Put the position to the right of the cell
            $this->SetXY($x + $w, $y);
        }
        //Go to the next line
        $this->Ln($h);
    }

// added by MJR
    function RowX($data, $want_rect = true)
    {
        $nb = 0;
        for ($i = 0; $i < count($data); $i++) {
            if (isset($this->styles[$i]))
                $this->SetFont('', $this->styles[$i]);
            $nb = max($nb, $this->NbLines($this->widths[$i], $data[$i]));
        }
        $h = $this->FontSize * $nb + 2 * $this->vertical_padding;
        $this->CheckPageBreak($h);
        $x = $this->GetX();
        $y = $this->GetY();
        for ($i = 0; $i < count($data); $i++) {
            $w = $this->widths[$i];
            $a = isset($this->aligns[$i]) ? $this->aligns[$i] : 'L';
            if (isset($this->styles[$i]))
                $this->SetFont('', $this->styles[$i]);
            if ($want_rect)
                $this->Rect($x, $y, $w, $h);
            $this->SetXY($x, $y + $this->vertical_padding);
            $this->MultiCell($w, $this->FontSize, $data[$i], 0, $a);
            $x += $w;
        }
        $this->SetY($y + $h);
    }

// For TCPDF, comment out this function so the one in TCPDF will be used
    function CheckPageBreak($h)
    {
        //If the height h would cause an overflow, add a new page immediately
        if($this->GetY()+$h>$this->PageBreakTrigger)
            $this->AddPage($this->CurOrientation);
    }

    function NbLines($w,$txt)
    {
        //Computes the number of lines a MultiCell of width w will take
        $cw=&$this->CurrentFont['cw'];
        if($w==0)
            $w=$this->w-$this->rMargin-$this->x;
        $wmax=($w-2*$this->cMargin)*1000/$this->FontSize;
        $s=str_replace("\r",'',$txt);
        $nb=strlen($s);
        if($nb>0 and $s[$nb-1]=="\n")
            $nb--;
        $sep=-1;
        $i=0;
        $j=0;
        $l=0;
        $nl=1;
        while($i<$nb)
        {
            $c=$s[$i];
            if($c=="\n")
            {
                $i++;
                $sep=-1;
                $j=$i;
                $l=0;
                $nl++;
                continue;
            }
            if($c==' ')
                $sep=$i;
            //$l+=$cw[ord($c)]; // for TCPDF
            $l+=$cw[$c]; // for FPDF
            if($l>$wmax)
            {
                if($sep==-1)
                {
                    if($i==$j)
                        $i++;
                }
                else
                    $i=$sep+1;
                $sep=-1;
                $j=$i;
                $l=0;
                $nl++;
            }
            else
                $i++;
        }
        return $nl;
    }
}

if(!isset($_GET["id"])){
    exit("");
}

$model = new SeguimientoValidator();
if(isset($_GET['f'])){
    switch ($_GET['f']){
        case 1: $result_assoc = $model->getResultadoPDF();break;
        case 2: $result_assoc = $model->getResultadoNegativoPDF();break;
        default : exit();
    }
}else{
    exit();
}

$result_assoc = $model->getResultadoNegativoPDF();
$ficha_arr = $result_assoc["rows"];

//exit( json_encode($result_assoc) );

if(count($ficha_arr) <= 0) exit();
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
$pdf = new PDF_MC_Table();
$pdf->AddPage('P', 'A4');

//************************************************
$title = "RESULTADO DE PRUEBA RAPIDA";
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
$pdf->SetX(101);
$pdf->Cell(110, 12, utf8_decode('Año de la Universalización de la Salud'), 0, 0, 'C', 0);


$pdf->SetFont('Arial', 'B', 9.8);
$pdf->SetY($Y_titulo_position - 5);
$pdf->Cell(210 - $totalx_margin, 5, utf8_decode($title), 0, 0, 'C', 0);
$pdf->Ln();$pdf->Ln();
$pdf->Ln();

$size_cab = 9;
$size_res = 8;
$size_tres = 7.5;

$pdf->SetFont('Arial','B',$size_cab);
$pdf->SetVerticalPadding(5);
$pdf->SetWidths(array(190/4,190/4,190/4,190/4));
$pdf->SetAligns(array('C','C','C','C'));

$pdf->RowX(array(
    utf8_decode("FECHA DE RESULTADO"),
    utf8_decode("ANÁLISIS"),
    utf8_decode("MÉTODO"),
    utf8_decode("RESULTADO")
));

$nro_doc = $ficha_arr['id_tipodoc'] != '7' ? $ficha_arr['nrodoc'] : 'sin documento';

$metodo = "";

if($ficha_arr['id_tipo_muestra'] == '1'){
    $metodo = "INMUNOCROMATOGRAFIA DE DISTRIBUCIÓN LATERAL";
}else if($ficha_arr['id_tipo_muestra'] == '2'){
    $metodo = "PCR EN TIEMPO REAL";
}


$resultado = "";
$txt_resultado = "";
$dat_qr = [
    "name_img" => $ficha_arr["id_paciente"] . '-1',
    "info" =>
        'www.dirislimacentro.gob.pe' .
        chr(13).chr(10) . 'Entrega de resultados de Prueba Rapida - 2020' .
        chr(13).chr(10) . '--------------------------------------- ' .
        chr(13).chr(10) . 'NRO DOCUMENTO: ' . $nro_doc .
        chr(13).chr(10) . 'NOMBRES Y APELLIDOS: ' . $ficha_arr['paciente'] .
        chr(13).chr(10) . 'FECHA DE RESULTADO: ' . $ficha_arr['fecha_resultado'] .
        chr(13).chr(10) . 'RESULTADO: ' . $ficha_arr['resultado_muestra'] .
        chr(13).chr(10) . '--------------------------------------- ' .
        chr(13).chr(10) . 'Resuldatos de la PR en el siguiente link: ' .
        chr(13).chr(10) . 'https://www.ins.gob.pe/resultado_coronavirus/' .
        chr(13).chr(10) . 'Nota: De no encontrarse los resultados en la Base de datos, ' .
        'los resultados consignados en este documento son falsos'
];
$id_resultado = $ficha_arr['id_resultado'];
$id_condicion = $ficha_arr['id_evolucion_pac'];
$wqr = 43;
$resto = 7;
if( ( $id_resultado == '1' || $id_resultado == '5' ) ){

    $id_tipo_resultado = $ficha_arr['id_tipo_resultado'];

    if($id_resultado == '5'){
        $resultado = "IgM( ".($id_tipo_resultado==1?'x':' ')." )".
            "\nIgM + IgG ( ".($id_tipo_resultado==2?'x':' ')." )".
            "\nIgG ( ".($id_tipo_resultado==3?'x':' ')." )";
    }else{
        $resultado = "POSITIVO ( X )";
    }

    if($id_resultado == '5'){
        $txt_resultado = strtoupper(
            'POSITIVO IgM('. ($ficha_arr['id_tipo_resultado'] == 1 ? 'X':' ') .') '.
            'IgM+IgC('.($ficha_arr['id_tipo_resultado'] == 2 ? 'X':' ').') '.
            ': Continuará su cuarentena en lugar de aislamiento temporal( ) en domicilio( ), hasta completar los 14 días.'.
            "\nPOSITIVO IgG(".($ficha_arr['id_tipo_resultado'] == 3 ? 'X':' ').")".
            ": Continuará cuarentena en domicilio hasta complementar los 07 días"
        );
    }else{
        $wqr = 43;
        $resto = 7;
        $txt_resultado = strtoupper(
            "POSITIVO: Continuará su cuarentena en lugar de aislamiento temporal( ) en domicilio( ), hasta completar los 14 días.\n "
        );
    }

}else if($id_resultado == '2' || $id_resultado == '6' || $id_resultado == '7'){
    $wqr = 43;
    $resto = 7;
    $resultado = "NEGATIVO (x)";
    $txt_resultado = "NEGATIVO: CUARENTENA EN DOMICILIO HASTA 2 SEMANAS \n ";
}



$pdf->SetFont('Arial','B',$size_res);
$pdf->SetVerticalPadding(3);

$pdf->RowX(array(
    utf8_decode($ficha_arr["fecha_resultado"]),
    utf8_decode($ficha_arr["tipo_muestra"]),
    utf8_decode($metodo),
    utf8_decode($resultado)
));

$pdf->Cell(10, 8, "", 0, 0, 'C', 0);
$pdf->Ln();

$url = generateQRCode($dat_qr,'H',8);

$pdf->SetFont('Arial','',$size_tres);
$pdf->SetX(10);
$pdf->Image($url,200-$wqr,$pdf->GetY() - $resto,$wqr);
$pdf->MultiCell(190 - $wqr, 6,
    utf8_decode("RESULTADO:\n" . $txt_resultado . "\n "),
    'TRBL', 'L', 0);

$pdf->Cell(10, 8, "", 0, 0, 'C', 0);
$pdf->Ln();

$pdf->SetFont('Arial','',$size_tres);
$pdf->SetX(10);
$pdf->MultiCell(190, 6,
    utf8_decode("Yo, " . $ficha_arr["paciente"] . " con DNI nro: " . $nro_doc .
        "  me comprometo a permanecer en cuarentena deacuerdo al resultado obtenido.Dirección: " . $ficha_arr['descrip_dir'] .
        ",Distrito de:" . $ficha_arr["distrito"] . " Núm.Telef. ". $ficha_arr["telefono"] .", para mi seguimiento respectivo."),
    'TRBL', 'L', 0);

$pdf->Cell(190, 3, "", 0, 0, 'C', 0);
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->SetX(10);
$pdf->Cell(190, 6, "Este Documento no tiene valor legal o judicial", 0, 0, 'C', 0);

/********************************************************************************************/
/********************************************************************************************/
/********************************************************************************************/
/********************************************************************************************/

$pdf->SetY(148);

$Y_sisol_position = $Y_sisol_position + 148;
$Y_titulo_position = $Y_titulo_position + 148;

//Bold Font for Field Name
$pdf->SetFont('Arial', 'B', 8);
//$pdf->SetAutoPageBreak(true);
$pdf->SetY($Y_sisol_position);
$pdf->Image(__DIR__ . '/../../public/images/logo.jpg',10,158,90);
$pdf->SetX(101);
$pdf->Cell(110, 12, utf8_decode('Año de la Universalización de la Salud'), 0, 0, 'C', 0);


$pdf->SetFont('Arial', 'B', 9.8);
$pdf->SetY($Y_titulo_position - 5);
$pdf->Cell(210 - $totalx_margin, 5, utf8_decode($title), 0, 0, 'C', 0);
$pdf->SetX(135);
$pdf->Cell(65, 5, utf8_decode("CARGO"), 0, 0, 'C', 0);
$pdf->Ln();
$pdf->Ln();



$pdf->SetFont('Arial','B',$size_cab);
$pdf->SetVerticalPadding(5);
$pdf->SetWidths(array(190/4,190/4,190/4,190/4));
$pdf->SetAligns(array('C','C','C','C'));

$pdf->RowX(array(
    utf8_decode("FECHA DE RESULTADO"),
    utf8_decode("ANÁLISIS"),
    utf8_decode("MÉTODO"),
    utf8_decode("RESULTADO")
));

$pdf->SetFont('Arial','B',$size_res);
$pdf->SetVerticalPadding(3);

$pdf->RowX(array(
    utf8_decode($ficha_arr["fecha_resultado"]),
    utf8_decode($ficha_arr["tipo_muestra"]),
    utf8_decode($metodo),
    utf8_decode($resultado)
));

$pdf->Cell(10, 8, "", 0, 0, 'C', 0);
$pdf->Ln();

$pdf->SetFont('Arial','',$size_tres);
$pdf->SetX(10);
$pdf->Image($url,200-$wqr,$pdf->GetY() - $resto,$wqr);
$pdf->MultiCell(190 - $wqr, 6,
    utf8_decode("RESULTADO:\n" . $txt_resultado . "\n "),
    'TRBL', 'L', 0);

$pdf->Cell(10, 8, "", 0, 0, 'C', 0);
$pdf->Ln();

$pdf->SetFont('Arial','',$size_tres);
$pdf->SetX(10);
$pdf->MultiCell(190, 6,
    utf8_decode("Yo, " . $ficha_arr["paciente"] . " con DNI nro: " . $nro_doc .
        "  me comprometo a permanecer en cuarentena deacuerdo al resultado obtenido.Dirección: " . $ficha_arr['descrip_dir'] .
        ",Distrito de:" . $ficha_arr["distrito"] . " Núm.Telef. ". $ficha_arr["telefono"] .", para mi seguimiento respectivo."),
    'TRBL', 'L', 0);

$pdf->Cell(190, 3, "", 0, 0, 'C', 0);
$pdf->Ln();

$pdf->SetFont('Arial','B',8);
$pdf->SetX(10);
$pdf->Cell(190, 6, "Este Documento no tiene valor legal o judicial", 0, 0, 'C', 0);

unlink($url);

$pdf->Output();

?>
