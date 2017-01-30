<!DOCTYPE html>
<?php
       
        require("../php/login/common.php");
        include "../php/config.php";

        require_authentication();
?>
<html>
    <head>
        <meta charset='utf-8' />
        <title>IR Salud</title>
  
        <link rel="icon" href="img/iconos/favicon.ico" sizes="16x16">
        <link rel="icon" href="img/iconos/favicon.ico" sizes="32x32">  
<!--estilos-->

        <link href="js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="js/fullcalendar-3.1.0/fullcalendar.min.css" rel="stylesheet" type="text/css"/>
        <link href="js/fullcalendar-3.1.0/fullcalendar.print.css" rel="stylesheet" type="text/css"/>
        <link href="js/jquery-ui-1.12.1.custom/jquery-ui.theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="js/jquery-ui-1.12.1.custom/jquery-ui.structure.min.css" rel="stylesheet" type="text/css"/>
        <link href="js/dateTimePicker/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
        <link href="js/jquery-simplecolorpicker/jquery.simplecolorpicker.css" rel="stylesheet" type="text/css"/>
        <link href="js/jquery-simplecolorpicker/jquery.simplecolorpicker-glyphicons.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <link href="css/fonts.css" rel="stylesheet" type="text/css"/>
        <link href="js/pnotify.custom.min.css" rel="stylesheet" type="text/css"/>
        
<!--        librerías-->
        <script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
        <script src="js/jquery-ui-1.12.1.custom/jquery-ui.min.js" type="text/javascript"></script>
        <script src="js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery.mask.min.js" type="text/javascript"></script>
        
        <script src="js/fullcalendar-3.1.0/lib/moment.min.js" type="text/javascript"></script>
        <script src="js/fullcalendar-3.1.0/fullcalendar.js" type="text/javascript"></script>
        <script src="js/fullcalendar-3.1.0/locale/es.js" type="text/javascript"></script>
        <script src="js/dateTimePicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
        <script src="js/jquery-simplecolorpicker/jquery.simplecolorpicker.js" type="text/javascript"></script>
        <script src="js/pnotify.custom.min.js" type="text/javascript"></script>
        <script src="js/utileria.js" type="text/javascript"></script>
        <script src="js/irsalud_agenda.js" type="text/javascript"></script>
        
    </head>
    <body>
        <input type="hidden" id="id_usuario" name="id_usuario" value="<?php echo $_SESSION['id_usuario']?>" readonly="readonly" />
        <div class="container-fluid">
            
                <div class="row">
                    <div class="col-lg-12 col-xs-12 header">
                        <div class="col-lg-3 col-xs-3 pull-left logo"></div>
                        <div class="col-lg-6 col-xs-2"></div>
                        <div class="col-lg-3 col-xs-7 text-right text-nowrap ">
                            <div class="pull-right">
                                <span class="text-right pull-left nombre-usuario">
                                    <!--<h5>Usuario:<span id="nombre-usuario" >"<?php echo $_SESSION['username']?>"</span></h5>-->
                                    <img id="perfil" src="" alt="Perfil" class="img-circle perfil" title="<?php echo $_SESSION['username']?>">
                                </span>
                                <button id="salir" type="button" class="btn btn-default pull-right">Salir</button>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="row cuerpo">
                    <div class="col-lg-1 col-xs-3 pull-left herramientas ">
                        <div class="btn-group-vertical" role="group" aria-label="test">
                            <img id="pacientes" style="margin-top:20px;" src="img/iconos/Patient_Male.png" alt="Pacientes" class="img-circle">
                            <img id="profesionales" src="img/iconos/Doctor_Male.png" alt="Profesionales" class="img-circle">
                            <img id="agenda" src="img/iconos/Agenda.png" alt="Agenda" class="img-circle">
                        </div>
                    </div>
                    
                    <div id="contenido" class="col-lg-11 col-xs-10 pull-left">
                        <div id="calendar"></div>
                    </div>
                </div>
          
            
        </div>
        
       
        <!-- Modal confirma eliminacion-->
        
<!--        modal evento-->
        <div class="modal fade" id="EditarEvento" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <div class="col-lg-2 col-xs-2">
                        <h4 class="modal-title" id="myModalLabel">Título:</h4>
                    </div>
                    <div class="col-lg-8 col-xs-8 pull-left form-titulo">
                            <input id="titulo" type="text" class="form-control" placeholder="Ingrese un título.">
                    </div>
              </div>
              <div class="modal-body">
                  <div class="row">
                    <div class="col-lg-12">
                      <form>
                        <div class="col-lg-4 col-xs-4">
                            <div class="form-group">
                              <label for="Nombre" class="control-label">Nombre:</label>
                              <input type="text" class="form-control Nombre" id="nombre" placeholder="Ingrese nombre">
                            </div>
                        </div>
                        <div class="col-lg-4 col-xs-4">
                            <div class="form-group">
                              <label for="apellido" class="control-label">Apellido:</label>
                              <input type="text" class="form-control apellido" id="apellido"  placeholder="Ingrese apellido">
                            </div>
                        </div>
                        <div class="col-lg-2 col-xs-2">
                            <div class="form-group">
                                <label for="edadPaciente" class="control-label">Edad:</label>
                                <input type="text" class="form-control edadPaciente" id="edadPaciente" maxlength="3">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-2 col-xs-2">
                                 <label class="control-label" for="colorpicker-bootstrap3-form">Color:</label>
                                 </br>
                                 <select name="colorpicker-bootstrap3-form" id="colorpicker-bootstrap3-form" class="form-control">
                                    <option value="#378006">Verde Obscuro</option>
                                    <option value="#5484ed">Azul Obscuro</option>
                                    <option value="#a4bdfc">Azul</option>
                                    <option value="#46d6db">Turquesa</option>
                                    <option value="#7ae7bf">Verde Claro</option>
                                    <option value="#51b749">Verde</option>
                                    <option value="#fbd75b">Amarillo</option>
                                    <option value="#8B008B">Magenta</option>
                                    <option value="#53868B">Azul Cadete</option>
                                    <option value="#ffb878">Naranja</option>
                                    <option value="#ff887c">Rojo</option>
                                    <option value="#dc2127">Rojo Obscuro</option>
                                    <option value="#dbadff">Púrpura</option>
                                    <option value="#D2691E">Chocolate</option>
                                    <option value="#8B3E2F">Coral</option>
                                    <option value="#6495ED">Azul aciano</option>
                                    <option value="#00CDCD">Cian</option>
                                    <option value="#A2CD5A">Verde oliva</option>
                                    <option value="#528B8B">Gris pizarra</option>
                                    
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-4 col-xs-4">  
                                <div class="form-group">
                                  <label for="telefono-fijo" class="control-label">Teléfono Fijo:</label>
                                  <input type="text" class="form-control telefono-fijo" id="telefono-fijo" maxlength="11"  placeholder="Ingrese teléfono fijo"> 
                                </div> 
                        </div> 
                        <div class="col-lg-4 col-xs-4">
                                <div class="form-group">
                                  <label for="telefono-celular" class="control-label">Teléfono Celular:</label>
                                  <input type="text" class="form-control telefono-celular" id="telefono-celular" maxlength="13"  placeholder="Ingrese teléfono celular"> 
                                </div>
                        </div>
                        <div class="col-lg-4 col-xs-4">
                           <div class="form-group">
                                <label for="direccion" class="control-label">Dirección:</label>
                                <input type="text" class="form-control direccion" id="direccion"  placeholder="Ingrese dirección">
                            </div>
                        </div>
                        
                         
                        <div class="col-lg-12 col-xs-12 checkbox-inline">
                            <label class="col-lg-2 col-xs-2 text-nowrap"><input id="diaCompleto" class="col-lg-2 col-xs-2 pull-left" type="checkbox" name="diaCompleto" value="false" /> Todo el día</label> 
                        </div>
                          <!--fechas y horas-->
                        <div class="col-lg-12 col-xs-12 ">
                                <div class="col-lg-3 col-xs-3">
                                   <div class="form-group">
                                        <label for="fechaDesde" class="control-label">Fecha desde:</label>
                                        <input type="text" class="form-control fechaDesde" id="fechaDesde">
                                    </div>
                                </div>
                                <div id="duracionEvento">
                                    <div class="col-lg-3 col-xs-3">
                                       <div class="form-group">
                                            <label for="horaDesde" class="control-label">Hora desde:</label>
                                            <input type="text" class="form-control horaDesde" id="horaDesde">
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-xs-3">
                                       <div class="form-group">
                                            <label for="fechaHasta" class="control-label">Fecha Hasta:</label>
                                            <input type="text" class="form-control fechaHasta" id="fechaHasta">
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-xs-3">
                                       <div class="form-group">
                                            <label for="horaHasta" class="control-label">Hora Hasta:</label>
                                            <input type="text" class="form-control horaHasta" id="horaHasta">
                                        </div>
                                    </div>
                                </div>
                        </div>
                        <!--fechas y horas-->
                        <div class="clear">
                        <div class="col-lg-6 col-xs-6">
                            <div class="form-group">
                              <label for="descripcion" class="control-label">Descripción:</label>
                              <textarea class="form-control descripcion" id="descripcion" rows="4"  placeholder="Ingrese descripción de patología"></textarea>
                            </div>
                        </div>
                        <div class="col-lg-6 col-xs-6">
                            <div class="form-group">
                              <label for="notas" class="control-label">Observaciones:</label>
                              <textarea class="form-control notas" id="notas" rows="4"  placeholder="Ingrese observaciones particulares"></textarea>
                            </div>
                        </div>
                          <input id="id_evento" type="hidden" name="id" value="" />
                      </form>
                    </div>
                </div>
              </div>
              <div class="modal-footer">
                <button id="editaEvento" type="button" class="btn btn-default" aria-label="Editar" title="Editar Evento">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                </button>
                <button id="eliminaEvento" type="button" class="btn btn-default" aria-label="Eliminar" title="Eliminar Evento">
                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                </button>
                <button id="cierraEvento" type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                <button id="guardaEvento" type="button" class="btn btn-primary">Guardar Evento</button>
              </div>
            </div>
          </div>
        </div>
        
    </body>
    
    
</html>
