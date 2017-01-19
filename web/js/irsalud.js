/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var IrSalud;


$(document).ready(function() {

//declaro eventos principales de botonera
    $('#agenda').on('click',function()
    {
       
               irSalud();
    });
		
});


function irSalud()
{
    
    if(typeof IrSalud === 'undefined')
    {
         IrSalud = this;
    }
    
    //inicializo agenda
    var fecha_inicial = moment.call().format('YYYY-MM-DD'); 
    $('#panel_agenda').fullCalendar({
			theme: true,
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay,listMonth'
			},
			defaultDate: fecha_inicial,
			navLinks: true, // can click day/week names to navigate views
			editable: true,
                        locale:'es',
			eventLimit: true, // allow "more" link when too many events
			events: [
				{
					title: 'All Day Event',
					start: '2017-01-01'
				},
				{
					title: 'Long Event',
					start: '2017-01-07',
					end: '2017-01-10'
				},
				{
					id: 999,
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

