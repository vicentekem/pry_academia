 <!-- header -->

 <header class="nav-container" id="header">
   <div class="container ">

     <nav class="nav d-flex">
       <a href="#" class="logo">
         <img src="public/web/assets/img/logo.svg" alt="logo">
       </a>
       <!-- toggle bar -->
       <div class="burger">
         <span></span>
         <span></span>
         <span></span>
       </div>
       <div class="navigation-bar">
         <ul>
           <?php
            require_once __DIR__ . "/../../../models/menu.php";
            $menuModel = new Menu();
            $menus = $menuModel->getPublicMenu();
            // exit(json_encode($menus));
            foreach ($menus["rows"] as $menu) {
            ?>

             <li><a class="link" href="?url=<?php echo $menu["alias"]; ?>"><?php echo $menu["name_menu"]; ?></a></li>
             <!-- <li><a class="link" href="?url=sobre__nosotros.php">Sobre Nosotros</a></li>
              <li><a class="link" href="?url=ciclos.php">Ciclos</a></li>
              <li><a class="link" href="?url=matricula_virtual">Matricula Virtual</a></li> -->
           <?php } ?>
           <li><a class="link" href="#contactos">Contacto</a></li>
           <li><a href="?url=login" class="btn">Login</a></li>
         </ul>
       </div>
     </nav>
   </div>
 </header>
 <div class="scroll">
 </div>
 <!-- Home -->

 

