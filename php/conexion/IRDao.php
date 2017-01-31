<?php
include_once("PdoWrapper.php");

class IrDao
{
    //recupera usuarios disponibles solo sus emails
    private function isAdmin($email){
            if(!filter_var($email, FILTER_VALIDATE_EMAIL))
                return false;

            $db_handle = pg_connect($strCnx);

            if ($db_handle) 
            {

               $query2 = "select admin from ".DB_ESQUEMA."usuarios where email like '".$email."';"; 
               $result2 = pg_query($db_handle,$query2);
               if($result2){

                    $row2 = pg_fetch_row($result2);

                    if ($row2){

                        if($row2[0] == 'true')
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                     }
              }
            }
    }
    static function getUnUsuario($email)
    {        
        try
        {

            $sql = "SELECT id_usuario FROM ".DB_ESQUEMA."usuarios WHERE email like '".$email."';";

            $pdoWrapper = new PdoWrapper();
            $query =  $pdoWrapper->query($sql);

            $columna =$query->fetchAll();
            if($columna){
                
                return $columna[0]['id_usuario'];
            }
            else 
            {
                return '{"success":false}';

            }
        } catch (Exception $ex) {
                $mensaje = "Error al recuperar información  EpeDao::getUnUsuario.";
                return '{"success":false,"message":"'.$mensaje.'"}';
                exit;
        }
    }
    static function getPacientes($criterio) {
        
        try
        {
                $select = "id_usuario,email";
                $from = DB_ESQUEMA ."usuarios ";
        //        $where = "email = 'OTROS'";
                $sql = "SELECT $select FROM $from ";
                $pdoWrapper = new PdoWrapper();
                $query =  $pdoWrapper->query($sql);
                
                $row =$query->fetchAll();
                if($row){
                    return $row;
                }
                else 
                {
                    return '{"success":false}';

                }
                
        } catch (Exception $ex) {
            
                $mensaje = "Error al recuperar informacion  EpeDao::getUsers.";
                return '{"success":false,"message":"'.$mensaje.'"}';    
        }
    }
    
    
    static function authenticateOnDb($challenge,$sessionChallenge,$username)
    {   
        
        try
        {
                $select = "password,id_usuario";
                $from = DB_ESQUEMA ."usuarios ";
                $where = " username = '".$username."' ";
                $sql = "SELECT $select FROM $from WHERE $where";
                $pdoWrapper = new PdoWrapper();
                $query =  $pdoWrapper->query($sql);

                $row =$query->fetch(PDO::FETCH_ASSOC);
                
                if($row !== false)
                {
                    $pass = $row['password'];
                    $id_usuario = $row['id_usuario'];
                    
                    $var_hashed_md5 = md5($sessionChallenge.$pass);
                    if($var_hashed_md5 === $challenge)
                        {
                            session_start();
                            $_SESSION['authenticated'] = "yes";
                            $_SESSION['username'] = $username;
                            $_SESSION['id_usuario'] = $id_usuario;
                            
                            echo '{"success":true,"message":"OK"}';
                            exit;
                        }
                    else{
                            echo '{"success":false,"message":"Datos incorrectos."}';
                            exit;

                       }
                }
                else 
                {
                        $mensaje = "Datos incorrectos.";
                        echo '{"success":false,"message":"'.$mensaje.'"}';
                        exit;

                }
                
        } catch (Exception $ex) {
            
                $mensaje = "Error al recuperar información.";
                echo '{"success":false,"message":"'.$mensaje.'"}';
                exit;
        }    
    }
    
    static function getEstilo($email,$id_capa_estilo)
    {
        try
        {
                //metodos implementados aprovechando la ejecucion en bloque de las transaciones

                $sql = "SELECT estilo_json FROM ".DB_ESQUEMA."estilo_x_capa_x_usuario WHERE id_usuario = (select id_usuario from ".DB_ESQUEMA."usuarios where email like '".$email."') and id_capa=".$id_capa_estilo.";";
             
                $pdoWrapper = new PdoWrapper();
                $query =  $pdoWrapper->query($sql);

                $row =$query->fetchAll();
                
                if($row)
                {

                        return $row;
                }
                else 
                {
                    return '{"success":false}';

                }
        
        } catch (Exception $ex) {
                $mensaje = "Error al recuperar informacion  EpeDao::getEstilo.";
                return '{"success":false,"message":"'.$mensaje.'"}';        
        }      
    }
    
    /**
     * 
     * @param type $email
     * @param type $id_capa_estilo
     * @return string
     */
    static function getCapaLimite($email,$id_capa)
    {
        try
        {
                //metodos implementados aprovechando la ejecucion en bloque de las transaciones

                $sql = "SELECT poligonos_geojson AS limite,resolucion_permitida AS resolucion_permitida FROM ".DB_ESQUEMA."limites_x_capa_x_usuario WHERE id_usuario = (select id_usuario from ".DB_ESQUEMA."usuarios where email like '".$email."') and id_capa=".$id_capa.";";            
                $pdoWrapper = new PdoWrapper();
                $query =  $pdoWrapper->query($sql);

                $row =$query->fetchAll();
                
                if($row)
                {
                        return $row;
                }
                else 
                {
                    return '{"success":false}';

                }
        
        } catch (Exception $ex) {
                $mensaje = "Error al recuperar informacion  EpeDao::getCapaLimite.";
                return '{"success":false,"message":"'.$mensaje.'"}';      
        }     
    }
    
    
    static function getPerfil($id_usuario){
    
        /*
         * id_usuario, nombre,apellido,username,imagen
         */

        try
        {
                //metodos implementados aprovechando la ejecucion en bloque de las transaciones
                $sql = "SELECT id_usuario ,nombre ,apellido,username ,imagen FROM ".DB_ESQUEMA."usuarios WHERE id_usuario=".$id_usuario;
                $pdoWrapper = new PdoWrapper();
                $query =  $pdoWrapper->query($sql);

                $row =$query->fetch(PDO::FETCH_OBJ);
                
                if($row)
                {
                        echo '{"success":true,"perfil":'.json_encode($row).'}';
                        exit;
                }
                else 
                {
                    echo '{"success":false,"message":"Error al recuperar información"}';
                    exit;

                }
        
        } catch (Exception $ex) {
                $mensaje = "Error al recuperar información";
                echo '{"success":false,"message":"'.$mensaje.'"}';
                exit;
                
        } 
}

static function setPerfil($user_name,$perfil)
{
    
    $id_usuario = EpeDao::getUnUsuario($user_name);
        //metodos implementados aprovechando la ejecucion en bloque de las transaciones

    $perfil_json = json_decode($perfil);
    
     try
        {
                //metodos implementados aprovechando la ejecucion en bloque de las transaciones

                $sql = "UPDATE ".DB_ESQUEMA."usuarios SET nombre='".$perfil_json->nombre."', apellido='".$perfil_json->apellido."', avatarfile='".$perfil_json->avatarfile."' WHERE usuarios.id_usuario=".$id_usuario.";";
                $pdoWrapper = new PdoWrapper();
                $query =  $pdoWrapper->query($sql);

                $row =$query->fetchAll();
                
                if($row)
                {
                        return '{"success":true}';
                }
                else
                {
                     $mensaje = "Error al guardar el perfil.";
                     return '{"success":false,"message":"'.$mensaje.'"}';
                   
                }
        
        } catch (Exception $ex) {
                $mensaje = "Error al guaradr información  EpeDao::setPerfil.";
                return '{"success":false,"message":"'.$mensaje.'"}';
                
        } 

        
}


static function getConfInicialMapa($user_name)
{   
     try
        {
                //metodos implementados aprovechando la ejecucion en bloque de las transaciones

                $sql = "SELECT configura_mapa_x_usuario.id_capa_inicial,configura_mapa_x_usuario.extent_inicial FROM ".DB_ESQUEMA."usuarios, ".DB_ESQUEMA."configura_mapa_x_usuario WHERE configura_mapa_x_usuario.id_usuario = usuarios.id_usuario AND email LIKE '".$user_name."'"; 

                $pdoWrapper = new PdoWrapper();
                $query =  $pdoWrapper->query($sql);

                $row =$query->fetchAll();
                
                if($row)
                {
                        return $row;
                }
                else
                {
                     $mensaje = "Error al recuperar configuración inicial.";
                     return '{"success":false,"message":"'.$mensaje.'"}';
                     
                }
        
        } catch (Exception $ex) {
                $mensaje = "Error al recuperar configuración inicial  EpeDao::getConfInicialMapa.";
                return '{"success":false,"message":"'.$mensaje.'"}';
                
        } 

        
}

static function guardaEvento($id_usuario,$info_evento,$id_evento,$start,$end)
{
 
    $evento_json = json_decode($info_evento);
    if($evento_json->estado === "nuevo")
    {   
            try
            {
                    //metodos implementados aprovechando la ejecucion en bloque de las transaciones
                    $pdoWrapper = new PdoWrapper();
                    $pdoWrapper->initTransaction();
                    $evento_json->estado = '';
                    
                    $info_evento = json_encode($evento_json);

                    $query2 ="INSERT INTO ".DB_ESQUEMA."\"agendaEventos\"(info_evento,id_usuario,startevent,endevent) VALUES ('".$info_evento."', ".$id_usuario.", '".$start."'::DATE, '".$end."'::DATE) RETURNING id;";

                    $query = $pdoWrapper->query($query2);

                    $row = $row=$query->fetch(PDO::FETCH_OBJ);
                    
                    if($row)
                    {
                            if($pdoWrapper->commit()===false)
                            {                                  
                                $pdoWrapper->rollback();
                                $mensaje = "Error al guardar evento.";
                                echo '{"success":false,"message":"'.$mensaje.'"}';
                                exit;
                            }
                            else
                            {
                                
                                echo '{"success":true, "id_evento_DB":'.$row->id.'}';
                                exit;
                            }
                            
                    }
                    else
                    {
                        $pdoWrapper->rollback();
                        $mensaje = "Error al guardar evento.";
                        echo '{"success":false,"message":"'.$mensaje.'"}';
                        exit;
                    }

            } catch (Exception $ex) {
                    $pdoWrapper->rollback();
                    $mensaje = "Error al guardar evento";
                    echo '{"success":false,"message":"'.$mensaje.'"}';
                    exit;
            } 
    }
    if($evento_json->estado === "editado")
    {    
         /*id ,info_evento,id_usuario*/
            try
            {
                    //metodos implementados aprovechando la ejecucion en bloque de las transaciones
                    

                    $pdoWrapper = new PdoWrapper();
                    if($pdoWrapper->initTransaction() === true)
                    {
                        $query1 = "DELETE FROM ".DB_ESQUEMA."\"agendaEventos\" WHERE id = ".$id_evento.";";
                        
                        $query =  $pdoWrapper->query($query1);

                        $evento_json->estado = '';
                    
                        $info_evento = json_encode($evento_json);

                        $query2 ="INSERT INTO ".DB_ESQUEMA."\"agendaEventos\"(info_evento,id_usuario,startevent,endevent) VALUES ('".$info_evento."', ".$id_usuario.", '".$start."'::DATE, '".$end."'::DATE);";                

                        $query = $pdoWrapper->query($query2);

                        $row =$query->fetchAll();

                        if($row)
                        {
                            if($pdoWrapper->commit()===false)
                            {    
                                $pdoWrapper->rollback();
                                $mensaje = "Error al guardar evento.";
                                echo '{"success":false,"message":"'.$mensaje.'"}';
                                exit;
                            }
                            else
                            {
                                echo '{"success":true}';
                                exit;
                            }
                                
                                
                        }
                        else
                        {
                            $pdoWrapper->rollback();
                            $mensaje = "Error al guardar evento.";
                            echo '{"success":false,"message":"'.$mensaje.'"}';
                            exit;
                        }
                        
                    }
                    else
                        {
                            $pdoWrapper->rollback();
                            $mensaje = "Error al guardar evento.";
                            echo '{"success":false,"message":"'.$mensaje.'"}';
                            exit;
                        }
            } catch (Exception $ex) {
                    
                    $mensaje = "Error al guardar evento.";
                    echo '{"success":false,"message":"'.$mensaje.'"}';
                    exit;
            } 
    }
   
}

static function eliminaEvento($id_evento)
{

         /*id ,info_evento,id_usuario*/
        try
        {
                //metodos implementados aprovechando la ejecucion en bloque de las transaciones
                $query1 = "DELETE FROM ".DB_ESQUEMA."\"agendaEventos\" WHERE id = ".$id_evento.";";

                $pdoWrapper = new PdoWrapper();
                $query =  $pdoWrapper->query($query1);

                $row =$query->fetchAll();

                if($row)
                {
                        echo '{"success":true}';
                        exit;
                }
                else
                {
                     $mensaje = "Error al eliminar evento.";
                     echo '{"success":false,"message":"'.$mensaje.'"}';
                     exit;
                }

        } catch (Exception $ex) {
                $mensaje = "Error al eliminar evento";
                echo '{"success":false,"message":"'.$mensaje.'"}';
                exit;
        } 
   
}



static function loadEventos($start,$end){
    
    try
    {
            //metodos implementados aprovechando la ejecucion en bloque de las transaciones
            
        
            $sql = "SELECT id,info_evento,id_usuario
                    FROM ".DB_ESQUEMA."\"agendaEventos\" ae
                    WHERE (ae.startevent , ae.endevent) OVERLAPS ('".$start."'::DATE, '".$end."'::DATE);"; 
     
            $pdoWrapper = new PdoWrapper();
            $query =  $pdoWrapper->query($sql);


            if($query->rowCount() > 0)
            {
                    
                   $respuesta = array();
                    
                    while($row=$query->fetch(PDO::FETCH_OBJ)) 
                    {
                        $unEvento = json_decode($row->info_evento);
                        $objeto_respuesta = array('id_evento_DB' => $row->id,
                                    'id'=>$unEvento->id,
                                    'color'=>$unEvento->color,
                                    'title'=>$unEvento->title,
                                    'start'=>$unEvento->start,
                                    'end'=>$unEvento->end,
                                    'nombre'=>$unEvento->nombre,
                                    'apellido'=>$unEvento->apellido,
                                    'edad'=>$unEvento->edad,
                                    'telefonoFijo'=>$unEvento->telefonoFijo,
                                    'telefonoCelular'=>$unEvento->telefonoCelular,
                                    'direccion'=>$unEvento->direccion,
                                    'descripcion'=>$unEvento->descripcion,
                                    'nota'=>$unEvento->nota,
                                    'estado'=>$unEvento->estado);
                        
                        array_push($respuesta,$objeto_respuesta);
                        
                    }
                    
                        
                        //$retorno = json_encode($respuesta);
                        
                        return $respuesta;
            }
            else //sin eventos en el rango
            {
                $respuesta = array();
                
                return $respuesta;
            }


    } 
    catch (Exception $ex) {
            $mensaje = "Error al recuperar eventos";
            return '{"success":false,"message":"'.$mensaje.'"}';
    }                                        
}
}
?>