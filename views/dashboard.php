<?php

global $siteName;
global $currentPage;

if (!isset($_SESSION["usuario_academia"])) {
    header('location:?url=login');
}
?>

<!DOCTYPE html>
<html>
<head>
    
    <?php include __DIR__ . '/includes/admin/head.php';?>
    
</head>
<body>
    <div id="wrapper">

        <?php include __DIR__ . '/includes/admin/menu.php'?>

        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <?php include __DIR__ . '/includes/admin/header.php'?>
            </div>
            <div class="row  border-bottom white-bg dashboard-header">
                <h1>Bienvenido</h1>
            </div>

        </div>
    </div>

    <?php include __DIR__ . "/includes/admin/scripts.php" ?>

</body>
</html>
