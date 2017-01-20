/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* global moment */

var IrSalud;


$(document).ready(function() {

    IrSalud = new irSalud();
    IrSalud.init();
//declaro eventos principales de botonera
    $('#agenda').on('click',function()
    {
            $('#calendar').show();
            IrSalud.calendario();
    });
		
});


function irSalud()
{

this.init = function()
{

    
    if(typeof IrSalud === 'undefined')
    {
         IrSalud = this;
    }
    
 //eventos de edicion de agenda
    $('#editaEvento').on('click',function(evento)
    {
            console.log('edita');
            editaEvento();
            
    });
    
    $('#guardaEvento').on('click',function(evento)
    {
            console.log('guarda');
    });
    
    $('#eliminaEvento').on('click',function(evento)
    {
            console.log('elimina');
    });
   
//    $('#EditarEvento').on('hidden.bs.modal', function (e) {
//        console.log(e);
//    });

    $('[data-toggle="tooltip"]').tooltip();

};

var editaEvento = function()
{
        readOnlyEvento(false);
        
};

var clearFormEventos = function()
{
    $('#titulo').val('Evento');
    $('#start').val();
    $('#end').val();
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
};

var showEditEvent = function(evento,infoJs,formatoVista)
{
    
    /*
     * {
        title: 'visitar Jose',
        start: '2017-01-07',
        end: '2017-01-10',
        nombre:'Jose',
        apellido:'Perez',
        edad:'84',
        telefonoFijo:'03424537807',
        telefonoCelular:'0342155009810',
        direccion:'blas parera 425',
        descripcion:'paciente con ACV aputacion MII',
        nota:'es un departamento timbre 3'
        }

     */
    clearFormEventos();
    //bloqueo los campos
    readOnlyEvento(true);
    
    //carga de valores leidos
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
    
    $('#EditarEvento').modal({
                keyboard: false,
                backdrop:true
              }
            );
    $('#horaDesde').mask('00:00');
    $('#horaHasta').mask('00:00');
    
    $('.edadPaciente').mask('000');
    $('.telefono-fijo').mask('0#');
    $('.telefono-celular').mask('0#');
    $('.nombre').mask('SSSSSSSSSSSSSSSSSSSS');
    $('.apellido').mask('SSSSSSSSSSSSSSSSSSSS');
    
    
    
};

this.calendario = function(){   
    //inicializo agenda
    var fecha_inicial = moment.call().format('YYYY-MM-DD'); 
    
    $('#calendar').fullCalendar({
			theme: true,
                        height: $('#contenido').height()-30,
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay,listMonth'
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
                            showEditEvent(calEvent,jsEvent,view);
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
			editable: true,
                        locale:'es',
			eventLimit: true, // allow "more" link when too many events
			events: [
				{
					title: 'All Day Event',
					start: '2017-01-01'
				},
				{
					title: 'visitar Jose',
					start: '2017-01-07T11:00:00',
					end: '2017-01-10T16:00:00',
                                        nombre:'Jose',
                                        apellido:'Perez',
                                        edad:'84',
                                        telefonoFijo:'03424537807',
                                        telefonoCelular:'0342155009810',
                                        direccion:'blas parera 425',
                                        descripcion:'paciente con ACV aputacion MII',
                                        nota:'es un departamento timbre 3'
                                        
				},
				{
					id: 999, //id para eventos repetidos
					title: 'Repeating Event',
					start: '2017-01-09T16:00:00'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2017-01-16T16:00:00'
				},
				{
					title: 'Conference',
					start: '2017-01-11',
					end: '2017-01-13'
				},
				{
					title: 'Meeting',
					start: '2017-01-12T10:30:00',
					end: '2017-01-12T12:30:00'
				},
				{
					title: 'Lunch',
					start: '2017-01-12T12:00:00'
				},
				{
					title: 'Meeting',
					start: '2017-01-12T14:30:00'
				},
				{
					title: 'Happy Hour',
					start: '2017-01-12T17:30:00'
				},
				{
					title: 'Dinner',
					start: '2017-01-12T20:00:00'
				},
				{
					title: 'Birthday Party',
					start: '2017-01-13T07:00:00'
				},
				{
					title: 'Click for Google',
					url: 'http://google.com/',
					start: '2017-01-28'
				}
			]
		});
            };
    
};

