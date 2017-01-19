<!DOCTYPE html>

<?php
        // put your code here
?>
<html>
    <head>
        <meta charset='utf-8' />
        <title>IR Salud</title>
        
        
        <!--<link href="js/jquery-ui/jquery-ui.min.css" rel="stylesheet" type="text/css"/>--> 
<!--estilos-->
       
        <link href="js/jquery-ui-1.12.1.custom/jquery-ui.theme.min.css" rel="stylesheet" type="text/css"/>

        <link href="js/fullcalendar-3.1.0/fullcalendar.min.css" rel="stylesheet" type="text/css"/>
        <link href="js/fullcalendar-3.1.0/fullcalendar.print.min.css" rel="stylesheet" type="text/css"/>
        
        <link href="js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        
        
<!--        librerias-->
        <script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
        <script src="js/jquery-ui-1.12.1.custom/jquery-ui.min.js" type="text/javascript"></script>
        
        
        
        <script src="js/fullcalendar-3.1.0/lib/moment.min.js" type="text/javascript"></script>
        <script src="js/fullcalendar-3.1.0/fullcalendar.js" type="text/javascript"></script>
        <script src="js/fullcalendar-3.1.0/locale-all.js" type="text/javascript"></script>
        <script src="js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/irsalud.js" type="text/javascript"></script>
        
    </head>
    <body>
        
        <div class="container-fluid">
            
                <div class="row">
                    <div class="col-lg-12 header">
                        <div class="col-lg-3 logo"></div>
                        <div class="col-lg-9"></div>
                    </div>
                </div>
                <div class="row cuerpo">
                    <div class="col-lg-2 herramientas">
                        <div class="btn-group-vertical" role="group" aria-label="test">
                            <img id="pacientes" style="margin-top: 20px;" src="img/iconos/Patient_Male.png" alt="Pacientes" class="img-circle">
                            <img id="profesionales" src="img/iconos/Doctor_Male.png" alt="Profesionales" class="img-circle">
                            <img id="agenda" src="img/iconos/Agenda.png" alt="Agenda" class="img-circle">
                        </div>
                    </div>
                    <div id="contenido" class="col-lg-10">
                        <div id="panel_agenda" class=""></div>
                    </div>
                </div>
          
            
        </div>
        
    </body>
    
    
</html>
