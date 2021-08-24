<?php

function generateQRCode($data,$ecc,$size){
    $url = null;
    if(!empty($data) && !empty($ecc) && !empty($size)) {
        require_once __DIR__ . '/../../lib/phpqrcode/qrlib.php';
        $codesDir = __DIR__ . "/codes/";
        $codeFile = $data['name_img'] . '.png';
        QRcode::png($data['info'], $codesDir.$codeFile,$ecc , $size);
        $url = $codesDir.$codeFile;
        //echo '<img class="img-thumbnail" src="../services/qr/'.$codesDir.$codeFile.'" />';
    }
    return $url;
}

// size :8 , ecc H

?>