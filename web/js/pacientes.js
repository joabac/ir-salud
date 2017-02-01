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
 
    jsGrid.locale("es");
    $("#pacientesGrid").jsGrid({
        width: "100%",
        

 
        filtering: true,
        editing: true,
        sorting: true,
        paging: true,
        autoload: true,
        pageLoading: true,
        pageSize: 15,
        pageButtonCount: 5,
        
        deleteConfirm: function(item) {
            return "El paciente \"" + item.Nombre + "\" será eliminado. Está Seguro?";
        },
        rowClick: function(args) {
            console.log( args.item);
        },
        updatedItem: function(item) {
            console.log( item);
        },
        controller: db,

        fields: [
            { name: "Name", type: "text", width: 150 },
            { name: "Age", type: "number", width: 50 },
            { name: "Address", type: "text", width: 200 },
            { name: "Country", type: "select", items: db.countries, valueField: "Id", textField: "Name" },
            { name: "Married", type: "checkbox", title: "Is Married", sorting: false },
            {
                type: "control",
                modeSwitchButton: false,
                editButton: false
            }
        ]
            
        
    });
 
        

  };
}