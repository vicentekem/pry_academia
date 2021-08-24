<?php
if(isset($_POST) && !empty($_POST)) {
    require_once __DIR__ . '/../../lib/phpqrcode/qrlib.php';
    $codesDir = "codes/";
    $codeFile = date('d-m-Y-h-i-s').'.png';
    QRcode::png($_POST['formData'], $codesDir.$codeFile, $_POST['ecc'], $_POST['size']);
    echo '<img class="img-thumbnail" src="../services/qr/'.$codesDir.$codeFile.'" />';
} else {
    header('location:./');
}
?>