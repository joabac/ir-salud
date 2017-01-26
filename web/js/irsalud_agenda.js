/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* global moment */

var IrSalud;
var estadoEventos = {
                editado:"editado",
                nuevo:"nuevo",
                eliminar:"eliminar"
            };
            



$(document).ready(function() {
    
    //congelo variables y constantes
    estadoEventos = Object.freeze(estadoEventos);
    const id_usuario = $('#id_usuario').val();
    
    
    IrSalud = new irSalud();
    IrSalud.init();
//declaro eventos principales de botonera
    $('#agenda').on('click',function()
    {
            $('#calendar').show();
            IrSalud.calendario();
    });
    
    $('#salir').on('click',function()
    {
        IrSalud.salir();
    });		
});


function irSalud()
{

  this.init = function()
  {

    this.__eventoEnEdicion;
    this.__eventoOriginal;
    this.__eventoEditado = false;
    this.__color = '#5484ed';
    
    if(typeof IrSalud === 'undefined')
    {
         IrSalud = this;
    }
    
 //eventos de edicion de agenda
    $('#editaEvento').on('click',function()
    {
            console.log('edita');
            $('#editaEvento').attr('disabled',true);
            editaEvento();
            
    });
    
    $('#guardaEvento').on('click',function()
    {
        console.log('guarda');
        
        evento = __eventoEnEdicion;
        if(evento.length === 1)
        {
            evento = evento[0];
        }
        else
        {
            if(evento.length > 1){}
            //todo manejar evebntos de repeticion
        }
        
        var desde = $('#fechaDesde').datetimepicker({
                    format: 'L'
        }).data("DateTimePicker").date();
       
        var nuevoStart; // = moment(formateaFecha(desde)+'T'+$('#horaDesde').val()+':00');
        
        if(evento.allDay === false)
        {
            nuevoStart = moment(formateaFecha(desde)+'T'+$('#horaDesde').val()+':00');
            var hasta = $('#fechaHasta').datetimepicker({
                    format: 'L'
            }).data("DateTimePicker").date(); 
            
            var nuevoHasta = moment(formateaFecha(hasta)+'T'+$('#horaHasta').val()+':00');
        }
        else
        {
            nuevoStart = moment(formateaFecha(desde)+'T'+'00:00:00');
        }

            evento.title =  $('#titulo').val();
            evento.start= nuevoStart;
            if(evento.allDay === false)
            {  
                evento.end= nuevoHasta;
                evento.allDay = false;
            }
            else
            {
                evento.allDay = true;
            }
            evento.nombre=$('#nombre').val();
            evento.apellido=$('#apellido').val();
            evento.edad=$('#edadPaciente').val();
            evento.telefonoFijo=$('#telefono-fijo').val();
            evento.telefonoCelular=$('#telefono-celular').val();
            evento.direccion=$('#direccion').val();
            evento.descripcion=$('#descripcion').val();
            evento.nota=$('#notas').val();
            evento.color= $('select[name="colorpicker-bootstrap3-form"]').val();
           
            var parametros = {'parametro':'guardaEvento','id_usuario':parseInt(id_usuario.value),'info_evento': eventoToJSON(evento),'id_evento':evento.id_evento_DB};
            $.ajax({
                    method: "POST",
                    url: "utiles.php",//__busquedaCalle,
                    data: parametros,
                    dataType: "json",
                    beforeSend: function(jajax) {

                                    },
                    error: function(res) 
                    {
                        mensajeError("Error",res.responseText);
                        readOnlyEvento(true);
                        $('#EditarEvento').modal('hide');
                        $('#editaEvento').attr('disabled',false);
                        __eventoEnEdicion.estado = '';
                        //tTODO: restaurar original sin cerrar
                    },
                    success: function(res) {
                        if(res.success === true)
                        {
                            mensajeExito("Exito","El evento se guardo correctamente. ");
                            __eventoEnEdicion.estado = '';
                            $('#calendar').fullCalendar('updateEvent', evento);
                            
                            readOnlyEvento(true);
                            $('#editaEvento').attr('disabled',false);
                            $('#EditarEvento').modal('hide');
                        }
                        else
                        {
                            __eventoEnEdicion.estado = '';
                            mensajeError("Error",res.message);
                            readOnlyEvento(true);
                            $('#editaEvento').attr('disabled',false);
                            $('#EditarEvento').modal('hide');
                        }

                    }
            });
            
            //TODO si salio ok actualizo sino dejo igual
            
    });
    
    $('#eliminaEvento').on('click',function()
    {
        var evento = __eventoEnEdicion;
    
        if(evento.length === 1)
        {
            evento = evento[0];
            if(evento.id !== undefined)
            {
                var parametros = {'parametro':'eliminaEvento','id_evento':evento.id_evento_DB};
                $.ajax({
                        method: "POST",
                        url: "utiles.php",//__busquedaCalle,
                        data: parametros,
                        dataType: "json",
                        beforeSend: function(jajax) {

                                        },
                        error: function(res) 
                        {
                            mensajeError("Error",res.responseText);
                            readOnlyEvento(true);
                            $('#EditarEvento').modal('hide');
                            $('#editaEvento').attr('disabled',false);
                            __eventoEnEdicion.estado = '';
                            //tTODO: restaurar original sin cerrar
                        },
                        success: function(res) {
                            if(res.success === true)
                            {
                                mensajeExito("Exito","El evento se eliminó correctamente. ");
                                __eventoEnEdicion.estado = '';
                                $('#calendar').fullCalendar( 'removeEvents' , evento.id );

                                readOnlyEvento(true);
                                $('#editaEvento').attr('disabled',false);
                                $('#EditarEvento').modal('hide');
                            }
                            else
                            {
                                __eventoEnEdicion.estado = '';
                                mensajeError("Error",res.message);
                                readOnlyEvento(true);
                                $('#editaEvento').attr('disabled',false);
                                $('#EditarEvento').modal('hide');
                            }

                        }
                });
                
            }
        }
        else
        {
            if(evento.length > 1){}
                mensajeInformativo("Informacion","a implementar")
        }
        $('#EditarEvento').modal('hide');
        
             
    });
    
    $('#diaCompleto').on('change',function()
    {
        if($('#diaCompleto').is(":checked") === true)
        {    
            $('#duracionEvento').hide();
            $('label[for=fechaDesde]').html("Fecha del evento:");
        }
        else
        {
            $('#duracionEvento').show();
            $('label[for=fechaDesde]').html("Fecha desde:");
            
            $('#fechaDesde').datetimepicker({
                        format: 'L'
            }).data("DateTimePicker");

            $('#fechaHasta').datetimepicker({
                            format: 'L'
            }).data("DateTimePicker");

            $('#horaDesde').datetimepicker({
                            format: 'HH:mm'
            }).data("DateTimePicker");

            $('#horaHasta').datetimepicker({
                            format: 'HH:mm'
            }).data("DateTimePicker");
            }
    });
 
   
//    $('#EditarEvento').on('hidden.bs.modal', function (e) {
//        console.log(e);
//    });

    $('[data-toggle="tooltip"]').tooltip();

};

var formateaFecha = function(fecha)
{
        var desde_mes = fecha.month()+1;
       
        var fechaRetorno = fecha.year()+'-'+(desde_mes<10?'0'+desde_mes:desde_mes)+'-'+(fecha.date()<10?'0'+fecha.date():fecha.date());
        return fechaRetorno;
};

var editaEvento = function()
{
    
    readOnlyEvento(false);
    if(__eventoEnEdicion.length === 1) //evento simple
    {
        __eventoEnEdicion[0].estado = estadoEventos.editado;
    }
    else //eventos con repeticion
    {
        if(evento.length > 1){
                mensajeInformativo("TODO","a implementar");
            return;
        }
        //todo manejar evebntos de repeticion
    }
    
    $('select[name="colorpicker-bootstrap3-form"]').simplecolorpicker('readOnly',false);
    __eventoEditado = true;
    
};

var clearFormEventos = function()
{
    $('#id_evento').val('');
    $('#titulo').val('Evento');
    $('#start').val('');
    $('#end').val('');
    $('#nombre').val('');
    $('#apellido').val('');
    $('#edadPaciente').val('');
    $('#telefono-fijo').val('');
    $('#telefono-celular').val('');
    $('#direccion').val('');
    $('#descripcion').val('');
    $('#notas').val('');
};

/***
 * 
 * @param {type} estado true setea reat only false: setea editable
 * @returns {undefined}
 */
var readOnlyEvento = function(estado)
{
    $('#titulo').attr('readonly',estado);
    $('#start').attr('readonly',estado);
    $('#end').attr('readonly',estado);
    $('#nombre').attr('readonly',estado);
    $('#apellido').attr('readonly',estado);
    $('#edadPaciente').attr('readonly',estado);
    $('#telefono-fijo').attr('readonly',estado);
    $('#telefono-celular').attr('readonly',estado);
    $('#direccion').attr('readonly',estado);
    $('#descripcion').attr('readonly',estado);
    $('#notas').attr('readonly',estado);
    $('#fechaDesde').attr('readonly',estado);
    $('#fechaHasta').attr('readonly',estado);
    $('#horaDesde').attr('readonly',estado);
    $('#horaHasta').attr('readonly',estado);
    $('#guardaEvento').attr('disabled',estado);
    $('#diaCompleto').attr('disabled',estado);
    
};

var showEditEvent = function(idEvento)
{
    
    /*
     * {
        title: 'visitar Jose',
        start: '2017-01-07',
        end: '2017-01-10',
        nombre:'Jose',
        apellido:'Perez',
        edad:'84',
        color: '#ccccccc'
        telefonoFijo:'03424537807',
        telefonoCelular:'0342155009810',
        direccion:'blas parera 425',
        descripcion:'paciente con ACV aputacion MII',
        nota:'es un departamento timbre 3'
        }

     */
    
    evento = $('#calendar').fullCalendar( 'clientEvents' , idEvento );
    __eventoEnEdicion = evento;
    
    if(evento.length === 1)
    {
        evento = evento[0];
    }
    else
    {
        if(evento.length > 1){
                mensajeInformativo("TODO","a implementar");
            return;
        }
    }
    
    clearFormEventos();
    //bloqueo los campos
    readOnlyEvento(true);
    
    //carga de valores leidos
    $('#id_evento').val(evento.id);
    
    $('#titulo').val(evento.title);
    $('#start').val(evento.start);
    $('#end').val(evento.end);
    $('#nombre').val(evento.nombre);
    $('#apellido').val(evento.apellido);
    $('#edadPaciente').val(evento.edad);
    $('#telefono-fijo').val(evento.telefonoFijo);
    $('#telefono-celular').val(evento.telefonoCelular);
    $('#direccion').val(evento.direccion);
    $('#descripcion').val(evento.descripcion);
    $('#notas').val(evento.nota);
    
    //color
    $('select[name="colorpicker-bootstrap3-form"]').simplecolorpicker({picker: true, theme: 'glyphicons'});

    if(evento.color !== undefined)
    {
        $('select[name="colorpicker-bootstrap3-form"]').simplecolorpicker('selectColor', evento.color);
    }
    else
    {
        $('select[name="colorpicker-bootstrap3-form"]').simplecolorpicker('selectColor', IrSalud.__color);
    }
    
    $('select[name="colorpicker-bootstrap3-form"]').simplecolorpicker('readOnly',true);
    //duracion y rango
    if(evento.allDay === true)
    {
        $('#diaCompleto').prop( "checked", true );
        $('#duracionEvento').hide();
        $('label[for=fechaDesde]').html("Fecha del evento:");
        
        $('#fechaDesde').datetimepicker({
                        format: 'L'
        }).data("DateTimePicker").date(evento.start);
    }
    else
    {
        $('#diaCompleto').prop( "checked", false );
        $('label[for=fechaDesde]').html("Fecha desde:");
        $('#duracionEvento').show();
       
        $('#fechaDesde').datetimepicker({
                        format: 'L'
        }).data("DateTimePicker").date(evento.start);

        $('#fechaHasta').datetimepicker({
                        format: 'L'
        }).data("DateTimePicker").date(evento.end);

        $('#horaDesde').datetimepicker({
                        format: 'HH:mm'
        }).data("DateTimePicker").date(evento.start);

        $('#horaHasta').datetimepicker({
                        format: 'HH:mm'
        }).data("DateTimePicker").date(evento.end);
    }
    
    $('#EditarEvento').modal({
                keyboard: false,
                backdrop:true
              }
            );
    
    //mascaras para prevenir errores
    $('#horaDesde').mask('00:00');
    $('#horaHasta').mask('00:00');
    
    $('.edadPaciente').mask('000');
    $('.telefono-fijo').mask('0#');
    $('.telefono-celular').mask('0#');
    $('.nombre').mask('SSSSSSSSSSSSSSSSSSSS');
    $('.apellido').mask('SSSSSSSSSSSSSSSSSSSS');
   
};

this.salir = function()
{
    var parametros = {'parametro':'logout'};
                    $.ajax({
                            type: "POST",
                //            url: "../scripts/utiles.php",
                            url: "utiles.php",
                            dataType: "json",
                            success: function(msg) {
                                
                                    window.location = 'login.php';
                                
                            },
                            error: function(msg) {
                               
                                $('#login_error').html('Error inesperado: '+msg.mensaje);
                            },
                            data: parametros
                        });
};

var eventoToJSON = function(evento)
{
        /*
         *                              id_evento_DB:2,
                                        id:100,
                                        color: '#7ae7bf',
					title: 'visitar Jose',
					start: '2017-01-07T11:00:00',
					end: '2017-01-10T08:00:00',
                                        nombre:'Jose',
                                        apellido:'Perez',
                                        edad:'84',
                                        telefonoFijo:'03424537807',
                                        telefonoCelular:'0342155009810',
                                        direccion:'blas parera 425',
                                        descripcion:'paciente con ACV aputacion MII',
                                        nota:'es un departamento timbre 3',
                                        estado:''
         */
        
        var evento_retorno = {
            "id_evento_DB":evento.id_evento_DB,
            "id":evento.id,
            "color": evento.color,
            "title": evento.title,
            "start": moment(evento.start).format('YYYY-MM-DDTHH:mm:ss'),
            "end": moment(evento.end).format('YYYY-MM-DDTHH:mm:ss'),
            "nombre":evento.nombre,
            "apellido":evento.apellido,
            "edad":evento.edad,
            "telefonoFijo":evento.telefonoFijo,
            "telefonoCelular":evento.telefonoCelular,
            "direccion":evento.direccion,
            "descripcion":evento.descripcion,
            "nota":evento.nota,
            "estado":evento.estado
        };
        
        return JSON.stringify(evento_retorno);
};

this.calendario = function(){   
    //inicializo agenda
    var fecha_inicial = moment.call().format('YYYY-MM-DD'); 
    
    $('#calendar').fullCalendar({
			theme: true,
                        eventColor: this.__color,
                        height: $('#contenido').height()-30,
			header: {
				left: 'prev,next today, agregaEvento',
				center: 'title',
				right: 'month,agendaWeek,agendaDay,listMonth'
			},
                        events: {
                            url: 'utiles.php',
                            type: 'POST',
                            data: {
                                'parametro': 'loadEventos'
                                
                            },
                            error: function() {
                                mensajeError("Error", "No se pudo cargar los eventos.");
                            }
                            
                        },
                        customButtons: {
                            agregaEvento: {
                                text: 'Nuevo Evento',
                                //themeIcon:'plusthick',
                                click: function() {
                                    alert('clicked the custom button!');
                                }
                            }
                        },
                        navLinks: true, // can click day/week names to navigate views
			selectable: false,
			selectHelper: true,
			select: function(start, end) {
				var title = prompt('Event Title:');
				var eventData;
                                
                            if (title) {
					eventData = {
						title: title,
						start: start,
						end: end
					};
					$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
				}
				$('#calendar').fullCalendar('unselect');
			},
                        eventClick: function(calEvent, jsEvent, view) {

//                            alert('Event: ' + calEvent.title);
//                            alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
//                            alert('View: ' + view.name);
                            if(calEvent.id !== undefined)
                            {
                                showEditEvent(calEvent.id);
                            }
                            // change the border color just for fun
                            $(this).css('border-color', 'red');

                        },
                        eventMouseover: function(event, jsEvent, view)
                        {
                            $(this).css('border-color', "#000000");
                        },
                        eventMouseout: function(event, jsEvent, view)
                        {
                            $(this).css('border-color', "");
                        },
			defaultDate: fecha_inicial,
                        nextDayThreshold:'00:00:00',
			editable: true,
                        locale:'es',
			eventLimit: true // allow "more" link when too many events
//			events: [
//				{
//                                        id_evento_DB:1,
//                                        id:01,
//					title: 'All Day Event',
//					start: '2017-01-01'
//				},
//				{
//                                        id_evento_DB:5,
//                                        id:100,
//                                        color: '#7ae7bf',
//					title: 'visitar Jose',
//					start: '2017-01-07T11:00:00',
//					end: '2017-01-10T08:00:00',
//                                        nombre:'Jose',
//                                        apellido:'Perez',
//                                        edad:'84',
//                                        telefonoFijo:'03424537807',
//                                        telefonoCelular:'0342155009810',
//                                        direccion:'blas parera 425',
//                                        descripcion:'paciente con ACV aputacion MII',
//                                        nota:'es un departamento timbre 3',
//                                        estado:''
//				},
//				{
//                                        id_evento_DB:3,
//					id: 999, //id para eventos repetidos
//					title: 'Repeating Event',
//					start: '2017-01-09T16:00:00'
//				},
//				{
//                                        id_evento_DB:4,
//					id: 999,
//					title: 'Repeating Event',
//					start: '2017-01-16T16:00:00'
//				},
//				{
//                                        id_evento_DB:4,
//                                        id:02,
//					title: 'Conference',
//					start: '2017-01-11',
//					end: '2017-01-13'
//				},
//				{
//                                        id_evento_DB:5,
//                                        id:03,
//					title: 'Meeting',
//					start: '2017-01-12T10:30:00',
//					end: '2017-01-12T12:30:00'
//				},
//				{
//                                        id_evento_DB:6  ,
//                                        id:04,
//					title: 'Lunch',
//					start: '2017-01-12T12:00:00'
//				},
//				{
//                                        id_evento_DB:7,
//                                        id:05,
//					title: 'Meeting',
//					start: '2017-01-12T14:30:00'
//				},
//				{
//                                        id_evento_DB:8,
//                                        id:06,
//					title: 'Happy Hour',
//					start: '2017-01-12T17:30:00'
//				},
//				{
//                                        id_evento_DB:9,
//                                        id:07,
//					title: 'Dinner',
//					start: '2017-01-12T20:00:00'
//				},
//				{
//                                        id_evento_DB:10,
//                                        id:08,
//					title: 'Birthday Party',
//					start: '2017-01-13T07:00:00'
//				},
//				{
//                                        id_evento_DB:11,
//                                        id:09,
//					title: 'Click for Google',
//					url: 'http://google.com/',
//					start: '2017-01-28'
//				}
//			]
		});
            };
    
};

