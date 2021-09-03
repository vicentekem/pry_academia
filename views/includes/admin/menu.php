<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav metismenu" id="side-menu">
            
            <li class="nav-header">
                <div class="dropdown profile-element">
                    <img alt="image" class="rounded-circle" src="public/img/profile_small.jpg"/>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <span class="block m-t-xs font-bold">
                            <?php echo $_SESSION['usuario_academia']['nombre_completo']; ?>
                        </span>
                        <span class="text-muted text-xs block">Art Director <b class="caret"></b></span>
                    </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li><a class="dropdown-item" href="profile.html">Perfil</a></li>
                        <li><a class="dropdown-item" href="contacts.html">Cambiar Contraseña</a></li>                        
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