<input type="hidden" id="txt_session_id_usuario" value ="<?php echo $_SESSION["usuario_academia"]["id"]?>">
<input type="hidden" id="txt_session_id_rol" value ="<?php echo $_SESSION["usuario_academia"]["id_rol"]?>">
<input type="hidden" id="txt_session_id_persona" value ="<?php echo $_SESSION["usuario_academia"]["id_persona"]?>">

<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav metismenu" id="side-menu">
            
            <li class="nav-header">

                <div class="dropdown profile-element text-center">

                    <img alt="image" class="rounded-circle img-fluid" width="40" src="public/img/profile_small.jpg">

                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <span class="block m-t-xs font-bold"> <?php echo $_SESSION['usuario_academia']['nombre_completo']; ?> </span>
                        <!--<span class="text-muted text-xs block">Art Director <b class="caret"></b> </span>-->
                    </a>
                    <ul class="dropdown-menu animated fadeInDown m-t-xs">
                        <li><a class="dropdown-item" href="?url=profile">Perfil</a></li>
                        <li><a id="btn_open_modal" class="dropdown-item" >Cambiar Contraseña</a></li>                        
                        <li class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="?url=logout">Salir</a></li>
                    </ul>
                    
                </div>
               

                <div class="logo-element">
                    IN+
                </div>
            </li>
            
            <?php
                require_once __DIR__ . "/../../../models/menu.php";                
                $menuModel = new Menu();
                $menus = $menuModel->getMenusForUser($_SESSION['usuario_academia']['id']);                    
                foreach( $menus["rows"] as $menu ){
            ?>

            <li class="<?php echo strtoupper($menu_sup) == $menu["name_menu"] ? "active" : ""; ?>">
                <a href="index.html">
                    <i class="fa <?php echo $menu["class_icon"] ?>" style="font-size:1.5em" ></i>
                    <span class="nav-label"><?php echo $menu["name_menu"] ?></span>
                    <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-second-level">
                    <?php 
                        $submenus = $menuModel->getSubMenusForMenuAndUser($_SESSION['usuario_academia']['id'],$menu['id_menu']);
                        foreach( $submenus["rows"] as $submenu ){                            
                    ?>
                        <li class="<?php echo strtoupper($currentPage) == $submenu["name_menu"] ? "active" : ""; ?>">
                            <a href="?url=<?php echo $submenu["alias"] ?>">
                                <?php echo $submenu["name_menu"] ?>
                            </a>
                        </li>
                    <?php  } ?>
                </ul>
            </li>

            <?php } ?>

        </ul>
    </div>
</nav>

<?php __DIR__. include __DIR__."/../modal.php"; ?>

<script src="public/js/scripts/modal.js"></script>