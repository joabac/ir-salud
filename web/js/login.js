/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {


$('#ingresar').on('click', function()
    {
        
        $('#login_error').html('');
        if($('#nombreUsuario').val() !== '' && $('#pass') !== ''){
                   // crypt();
                   
                    var the_resp = hex_md5($('#challenge').val()+ hex_md5($('#pass').val())); 
                    var parametros = {'parametro':'authenticateOnDb','challenge':the_resp,'sessionChallenge': $('#challenge').val(),'username':$('#nombreUsuario').val()};
                    $.ajax({
                            type: "POST",
                //            url: "../scripts/utiles.php",
                            url: "utiles.php",
                            dataType: "json",
                            success: function(msg) {
                                
                                if(msg)
                                    window.location = 'index.php';
                                else
                                {
                                    window.location = 'login.php';
                                }
                            },
                            error: function(msg) {
                                
                                var mensaje;
                                if(msg.responseText.includes('SOAP'))
                                    mensaje = "Error en acceso a servicios.";
                                else
                                {   
                                    mensaje = "Error inesperado.";
                                }
                                //mensaje error
                            },
                            data: parametros
                        });

                 
               }else
               {
                  $('#login_error').html('Complete todos los campos');
               }
    });
               
});