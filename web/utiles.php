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
    
    $start_sanit = (filter_input(INPUT_POST,'start',FILTER_SANITIZE_STRING) == "")?null:filter_input(INPUT_POST,'start',FILTER_SANITIZE_STRING);
    $end_sanit = (filter_input(INPUT_POST,'end',FILTER_SANITIZE_STRING) == "")?null:filter_input(INPUT_POST,'end',FILTER_SANITIZE_STRING) ;
    
    $start = filter_var($start_sanit,FILTER_VALIDATE_REGEXP, array('options' =>array('regexp'=>'/\d{4}-\d{2}-\d{2}/'))) ;
    $end = filter_var($end_sanit,FILTER_VALIDATE_REGEXP,array("options"=>array("regexp"=>'/\d{4}-\d{2}-\d{2}/')));
    
    if($start == false)
    {
        echo '{"success":false, "message":"Error de parametros"}';
        exit;
    }
    if($end === false)
    {
        echo '{"success":false, "message":"Error de parametros"}';
        exit;
    }
    
    if($id_usuario == null)
    {
        echo '{"success":false, "message":"Error de parametros"}';
        exit;
    }
    if($id_evento === null)
    {
        $evento = json_decode($info_evento);
        if($evento->estado !== "nuevo")
        {    
            echo '{"success":false, "message":"Error de parametros"}';
            exit;
        }
    }
    if($info_evento === null)
    {
        echo '{"success":false, "message":"Error de parametros"}';
        exit;
    }
    return IrDao::guardaEvento($id_usuario,$info_evento,$id_evento,$start,$end);
    
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


if($resultado == 'eliminaEvento')
{
    $id_evento = (filter_input(INPUT_POST,'id_evento',FILTER_SANITIZE_NUMBER_INT) == "")?null:filter_input(INPUT_POST,'id_evento',FILTER_SANITIZE_NUMBER_INT) ;

    if($id_evento === null)
    {
        return '{error:"Error de parametros"}';
    }
    
    return json_encode(IrDao::eliminaEvento($id_evento)); 
}

if($resultado == 'loadEventos')
{    
    
    $start_sanit = (filter_input(INPUT_POST,'start',FILTER_SANITIZE_STRING) == "")?null:filter_input(INPUT_POST,'start',FILTER_SANITIZE_STRING);
    $end_sanit = (filter_input(INPUT_POST,'end',FILTER_SANITIZE_STRING) == "")?null:filter_input(INPUT_POST,'end',FILTER_SANITIZE_STRING) ;
    
    $start = filter_var($start_sanit,FILTER_VALIDATE_REGEXP, array('options' =>array('regexp'=>'/\d{4}-\d{2}-\d{2}/'))) ;
    $end = filter_var($end_sanit,FILTER_VALIDATE_REGEXP,array("options"=>array("regexp"=>'/\d{4}-\d{2}-\d{2}/')));
    
    if($start == false)
    {
        return '{error:"Error de parametros"}';
    }
    if($end === false)
    {
        return '{error:"Error de parametros"}';
    }
    
//    $respuesta = array();
//
//
//    $objeto_respuesta = array('id_evento_DB' => 5,'id'=>100,'color'=>'#7ae7bf','title'=>'visitar Jose','start'=>'2017-01-07T11:00:00','end'=>'2017-01-10T08:00:00','nombre'=>'Jose','apellido'=>'Perez','edad'=>84,'telefonoFijo'=>'03424537807','telefonoCelular'=>'0342155009810','direccion'=>'blas parera 425','descripcion'=>'paciente con ACV aputacion MII','nota'=>'es un departamento timbre 3','estado'=>'');
//    
//    
//    
//    array_push($respuesta,$objeto_respuesta);
//    
//    $retorno = json_encode($respuesta);
//    
//    echo $retorno;
//    exit;
    
    echo json_encode(IrDao::loadEventos($start,$end));
    exit;
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
    $id_usuario = (filter_input(INPUT_POST,'id_usuario',FILTER_SANITIZE_NUMBER_INT) == "")?null:filter_input(INPUT_POST,'id_usuario',FILTER_SANITIZE_NUMBER_INT) ;
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