/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



$(document).ready(function() {

    //congelo variables y constantes
    
    const id_usuario = $('#id_usuario').val();
    
    
    IrSalud = new irSalud();
    IrSalud.init();
    
    irSaludPacientes = new irSaludPacientes();
    irSaludPacientes.init();
    
    getPerfil();
    
//declaro eventos principales de botonera
    $('#agenda').on('click',function()
    {
            $('#buscar-pacientes').hide();
            $('#calendar').show();
            IrSalud.calendario();
    });
    
    $('#pacientes').on('click',function()
    {
            $('#buscar-pacientes').show();
            $('#calendar').hide();
        
    });
    
    $('#salir').on('click',function()
    {
        IrSalud.salir();
    });		
});


var getPerfil = function()
{
    var id =parseInt(id_usuario.value);
    var parametros = {'parametro':'getPerfil','id_usuario':id};
                $.ajax({
                        method: "POST",
                        url: "utiles.php",//__busquedaCalle,
                        data: parametros,
                        dataType: "json",
                        error: function(res) 
                        {
                            mensajeError("Error",res.responseText);
                           
                        },
                        success: function(res) {
                            
                            if(res.success === true)
                            {
                                console.log(res.perfil);
                                $('#perfil').attr('src',res.perfil.imagen);
                            }
                            else
                            {
                               
                                mensajeError("Error",res.message);
                                
                            }

                        }
                });
};