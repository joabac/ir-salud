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
                                
                                if(msg.success)
                                    window.location = 'index.php';
                                else
                                {
                                   $('#login_error').html('Error inesperado: '+msg.message);
                                   //window.location = 'login.php';
                                }
                            },
                            error: function(msg) {
                               
                                $('#login_error').html('Error inesperado: '+msg.responseText);
                            },
                            data: parametros
                        });

                 
               }else
               {
                  $('#login_error').html('Complete todos los campos');
               }
    });
               
});