/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var IrSaludPacientes;

$(document).ready( 
        function() {

   
//declaro eventos principales de botonera
    $('#checkall').on('click', function () {
        if ($("#mytable #checkall").is(':checked')) {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", true);
            });

        } else {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", false);
            });
        }
       });
    

});


function irSaludPacientes()
{

  this.init = function()
  {

        

  };
}