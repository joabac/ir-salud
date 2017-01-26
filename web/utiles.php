<?php

include_once '../php/conexion/IRDao.php';

if(!session_status())
    {
        print 'sesion error';
        return;
    }
//ini_set('error_reporting', 1); //E_ALL); 
//TODO reemplazar por un switch
$resultado = filter_input(INPUT_POST, 'parametro');

//********************************* Admin

if($resultado == 'logout')
{
    session_unset();
    echo '{"success":true,"message":"logout"}';
       
}
if($resultado == 'authenticateOnDb')
{

    $user_name = (filter_input(INPUT_POST,'username',FILTER_SANITIZE_STRING) == "")?null:filter_input(INPUT_POST,'username',FILTER_SANITIZE_STRING) ;
    $challenge = (filter_input(INPUT_POST,'challenge',FILTER_SANITIZE_STRING) == "")?null:filter_input(INPUT_POST,'challenge',FILTER_SANITIZE_STRING) ;
    $sessionChallenge = (filter_input(INPUT_POST,'sessionChallenge',FILTER_SANITIZE_STRING) == "")?null:filter_input(INPUT_POST,'sessionChallenge',FILTER_SANITIZE_STRING) ;
    
    if($user_name == null)
    {
        return '{error:"Error de parametros"}';
    }
    if($challenge === null)
    {
        return '{error:"Error de parametros"}';
    }
    if($sessionChallenge === null)
    {
        return '{error:"Error de parametros"}';
    }
    
    return json_encode(IrDao::authenticateOnDb($challenge,$sessionChallenge,$user_name));
}

if($resultado == 'getUsers')
{
    return getUsers();
}

if($resultado == 'getCapasDisp')
{
    $id = $_REQUEST['id_user'];
    return getCapasDisponibles($id);
}

if($resultado == 'getCapasAsoc')
{
    $id = $_REQUEST['id_user'];
    return getCapasAsociadas($id);
}

if($resultado == 'guardaEvento')
{
    $id_usuario = (filter_input(INPUT_POST,'id_usuario',FILTER_SANITIZE_NUMBER_INT) == "")?null:filter_input(INPUT_POST,'id_usuario',FILTER_SANITIZE_NUMBER_INT) ;
    $id_evento = (filter_input(INPUT_POST,'id_evento',FILTER_SANITIZE_STRING) == "")?null:filter_input(INPUT_POST,'id_evento',FILTER_SANITIZE_STRING) ;
    $info_evento = (filter_input(INPUT_POST,'info_evento',FILTER_DEFAULT) == "")?null:filter_input(INPUT_POST,'info_evento',FILTER_DEFAULT) ;
    
    return IrDao::guardaEvento($id_usuario,$info_evento,$id_evento);
    
}

if($resultado == 'getCapasAll')
{
       
    return getCapasAll();
    
}

if($resultado == 'getInfoCapa')
{
    $id_capa = $_REQUEST['id_capa'];
    
    return getInfoCapa($id_capa);
    
}

if($resultado == 'guardaCapaNueva')
{
    return guardaCapaNueva(); 
}

if($resultado == 'guardaCapaEdicion')
{
    return guardaCapaEdicion(); 
}


//************************************ Editor

if($resultado == 'guardaEvento')
{
    
    $id_usuario = (filter_input(INPUT_POST,'id_usuario',FILTER_SANITIZE_NUMBER_INT) == "")?null:filter_input(INPUT_POST,'id_usuario',FILTER_SANITIZE_NUMBER_INT) ;
    $id_evento = (filter_input(INPUT_POST,'id_evento',FILTER_SANITIZE_NUMBER_INT) == "")?null:filter_input(INPUT_POST,'id_evento',FILTER_SANITIZE_NUMBER_INT) ;
    $info_evento = (filter_input(INPUT_POST,'info_evento',FILTER_SANITIZE_STRING) == "")?null:filter_input(INPUT_POST,'info_evento',FILTER_SANITIZE_STRING) ;
   
    return json_encode(IrDao::guardaEvento($id_usuario,$info_evento,$id_evento)); 
}

if($resultado == 'eliminaEvento')
{
    $id_evento = (filter_input(INPUT_POST,'id_evento',FILTER_SANITIZE_NUMBER_INT) == "")?null:filter_input(INPUT_POST,'id_evento',FILTER_SANITIZE_NUMBER_INT) ;
    
    return json_encode(IrDao::eliminaEvento($id_evento)); 
}

if($resultado == 'loadEventos')
{    
    return json_encode("[{
                                        id_evento_DB:5,
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
				}]");
    
    return json_encode(IrDao::loadEventos());
}

if($resultado == 'getLimiteVisual')
{
    $user_name = $_REQUEST['user_name'];
    $id_capa = $_REQUEST['id_capa'];
    
    return getLimiteVisual($user_name,$id_capa); 
}

if($resultado == 'borrarCapa')
{
    $id_capa = $_REQUEST['id_capa'];
    return borrarCapa($id_capa); 
}

if($resultado == 'getTipoCapa')
{
    $nombre_capa = $_REQUEST['nombre_capa'];
    return getTipoCapa($nombre_capa); 
}

if($resultado == 'getPerfil')
{
    $id_usuario = (filter_input(INPUT_POST,'$id_usuario',FILTER_SANITIZE_NUMBER_INT) == "")?null:filter_input(INPUT_POST,'$id_usuario',FILTER_SANITIZE_NUMBER_INT) ;
    return json_encode(IrDao::getPerfil($id_usuario)); 
}

if($resultado == 'setPerfil')
{
    $user_name = $_REQUEST['user_name'];
    $perfil = $_REQUEST['perfil'];
    return setPerfil($user_name,$perfil); 
}


if($resultado == 'getConfInicialMapa')
{
    $user_name = $_REQUEST['user_name'];
    
    return getConfInicialMapa($user_name); 
}
else
{   
    return;

}

?>