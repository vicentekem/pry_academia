
<!doctype html>
<html lang="es" class="fullscreen-bg">
<head>
    <title>Login - Quipu</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link href="public/css/bootstrap.min.css" rel="stylesheet">
    <link href="public/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="public/themify.icons/css/themify-icons.css">
    <link href="public/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="public/css/login/main.css">
    <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
    <link rel="stylesheet" href="public/css/login/demo.css">
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <!-- ICONS -->
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
</head>
<body>
<!-- WRAPPER -->
<div id="wrapper">
    <div class="vertical-align-wrap">
        <div class="vertical-align-middle">
            <div class="auth-box">
                <div class="left">
                    <div class="content">

                        <div class="header">
                            <div class="logo text-center">
                                <img src="assets/img/logo-isat.png" alt="Klorofil Logo">
                            </div>
                        </div>

                        <form class="form-auth-small" id="form_login" method="post" action="controllers/UsuarioController.php">
                            <input type="hidden" name="action" value="login">
                            <div class="form-group">
                                <label for="txt_usuario" class="control-label sr-only">Email</label>
                                <input type="email" class="form-control" id="txt_usuario" value="" placeholder="Email"
                                    name="usuario" autocomplete="off">
                            </div>

                            <div class="form-group">
                                <label for="txt_pass" class="control-label sr-only">Password</label>
                                <input type="password" class="form-control" id="txt_pass" name="clave" value="" placeholder="Password">
                            </div>

                            <div class="form-group clearfix">
                                <label class="fancy-checkbox element-left custom-bgcolor-blue">
                                    <input type="checkbox">
                                    <span class="text-muted">Remember me</span>
                                </label>
                                <span class="helper-text element-right">Don't have an account? <a href="page-register.html">Register</a></span>
                            </div>

                            <button type="submit" onclick="validate(event)" class="btn btn-primary btn-lg btn-block">Ingresar</button>

                            <div class="bottom"></div>

                        </form>
                    </div>
                </div>
                <div class="right">
                    <div class="overlay"></div>
                    <div class="content text">
                       <!-- <h1 class="heading">Klorofil Pro - Bootstrap dashboard template</h1>
                        <p>by The Develovers</p>-->
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<!-- END WRAPPER -->
</body>

<script src="public/js/jquery-3.1.1.min.js"></script>
<script src="public/js/plugins/toastr/toastr.min.js"></script>
<script src="public/js/my_functions.js"></script>

<script>

    function validate(e) {

        e.preventDefault();

        var usuario = document.querySelector("#txt_usuario").value.trim();
        var pass = document.querySelector("#txt_pass").value.trim();

        var errorMessage = "";

        if (usuario === "") errorMessage = "Ingrese su usuario";
        else if (pass === "") errorMessage = "Ingrese su contraseña";

        if (errorMessage !== "") return showMessage(errorMessage, "error");

        $.ajax({
            url: "controllers/UsuarioController.php",
            dataType: "json",
            type: "post",
            data: {
                action : 'login_ajax',
                usuario: usuario,
                clave: pass
            },
            success: function (result) {

                if (result.error === "") {
                    return document.querySelector("#form_login").submit();
                }

                showMessage(result.error, "error");
            }
        });
    }

</script>
</html>














