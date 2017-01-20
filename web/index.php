<!DOCTYPE html>

<?php
        // put your code here
?>
<html>
    <head>
        <meta charset='utf-8' />
        <title>IR Salud</title>
        
        
        
<!--estilos-->
       
        
        <link href="js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="js/fullcalendar-3.1.0/fullcalendar.min.css" rel="stylesheet" type="text/css"/>
        <link href="js/fullcalendar-3.1.0/fullcalendar.print.css" rel="stylesheet" type="text/css"/>
        <link href="js/jquery-ui-1.12.1.custom/jquery-ui.theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="js/jquery-ui-1.12.1.custom/jquery-ui.structure.min.css" rel="stylesheet" type="text/css"/>
        <link href="js/dateTimePicker/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <link href="css/fonts.css" rel="stylesheet" type="text/css"/>
        
<!--        librerias-->
        <script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
        <script src="js/jquery-ui-1.12.1.custom/jquery-ui.min.js" type="text/javascript"></script>
        <script src="js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery.mask.min.js" type="text/javascript"></script>
        
        <script src="js/fullcalendar-3.1.0/lib/moment.min.js" type="text/javascript"></script>
        <script src="js/fullcalendar-3.1.0/fullcalendar.js" type="text/javascript"></script>
        <script src="js/fullcalendar-3.1.0/locale/es.js" type="text/javascript"></script>
        <script src="js/dateTimePicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
        <script src="js/irsalud_agenda.js" type="text/javascript"></script>
        
    </head>
    <body>
        
        <div class="container-fluid">
            
                <div class="row">
                    <div class="col-lg-12 col-xs-12 header">
                        <div class="col-lg-3 col-xs-3 logo"></div>
                        <div class="col-lg-6 col-xs-5"></div>
                        <div class="col-lg-3 col-xs-4 text-right text-nowrap"><h5>Usuario:<span id="nombre_usuario">Un Usuario</span></h5></div>
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
        
       
        <!-- Modal -->
        <div class="modal fade" id="EditarEvento" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <div class="col-lg-2 col-xs-2">
                        <h4 class="modal-title" id="myModalLabel">Titulo:</h4>
                    </div>
                    <div class="col-lg-8 col-xs-8">
                            <input id="titulo" type="text" class="form-control">
                    </div>
              </div>
              <div class="modal-body">
                  <div class="row">
                    <div class="col-lg-12">
                      <form>
                        <div class="col-lg-5 col-xs-5">
                            <div class="form-group">
                              <label for="Nombre" class="control-label">Nombre:</label>
                              <input type="text" class="form-control Nombre" id="nombre">
                            </div>
                        </div>
                        <div class="col-lg-5 col-xs-5">
                            <div class="form-group">
                              <label for="apellido" class="control-label">Apellido:</label>
                              <input type="text" class="form-control apellido" id="apellido">
                            </div>
                        </div>
                        <div class="col-lg-2 col-xs-2">
                            <div class="form-group">
                                <label for="edadPaciente" class="control-label">Edad:</label>
                                <input type="text" class="form-control edadPaciente" id="edadPaciente" maxlength="3">
                            </div>
                        </div>
                        <div class="col-lg-6 col-xs-6">  
                                <div class="form-group">
                                  <label for="telefono-fijo" class="control-label">Telefono Fijo:</label>
                                  <input type="text" class="form-control telefono-fijo" id="telefono-fijo" maxlength="11"> 
                                </div> 
                        </div> 
                        <div class="col-lg-6 col-xs-6">
                                <div class="form-group">
                                  <label for="telefono-celular" class="control-label">Telefono Celular:</label>
                                  <input type="text" class="form-control telefono-celular" id="telefono-celular" maxlength="13"> 
                                </div>
                        </div>
                        <div class="col-lg-12 col-xs-12">
                           <div class="form-group">
                                <label for="direccion" class="control-label">Dirección:</label>
                                <input type="text" class="form-control direccion" id="direccion">
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-3">
                           <div class="form-group">
                                <label for="fechaDesde" class="control-label">Fecha desde:</label>
                                <input type="text" class="form-control fechaDesde" id="fechaDesde">
                            </div>
                        </div><div class="col-lg-3 col-xs-3">
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
                        
                        <div class="col-lg-12 col-xs-12">
                            <div class="form-group">
                              <label for="descripcion" class="control-label">Descripción:</label>
                              <textarea class="form-control descripcion" id="descripcion" rows="5"></textarea>
                            </div>
                        </div>
                        <div class="col-lg-12 col-xs-12">
                            <div class="form-group">
                              <label for="notas" class="control-label">Observaciones:</label>
                              <textarea class="form-control notas" id="notas" rows="2"></textarea>
                            </div>
                        </div>
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
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                <button id="guardaEvento" type="button" class="btn btn-primary">Guardar Evento</button>
              </div>
            </div>
          </div>
        </div>
        
    </body>
    
    
</html>
