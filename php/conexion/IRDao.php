<?php
include_once("../php/conexion/PdoWrapper.php");

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
                $mensaje = "Error al recuperar informacion  EpeDao::getUnUsuario.";
                return '{"success":false,"message":"'.$mensaje.'"}';
                exit;
        }
    }
    static function getUsers() {
        
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
        session_start();
        $_SESSION['authenticated'] = "yes";
        $_SESSION['username'] = $username;
        echo  '{"success":true,"message":""}';
        die;
        
        try
        {
                $select = "password";
                $from = DB_ESQUEMA ."usuarios ";
                $where = " email = '".$username."' ";
                $sql = "SELECT $select FROM $from WHERE $where";
                $pdoWrapper = new PdoWrapper();
                $query =  $pdoWrapper->query($sql);

                $row =$query->fetchColumn(0);
                
                if($row){
                   
                    $var_hashed_md5 = md5($sessionChallenge . $row);
                    if($var_hashed_md5 === $challenge)
                        {
                            return '{"success":true,"message":""}';
                        }
                    else{
                            return '{"success":false,"message":"Datos incorrectos"}';

                       }
                }
                else 
                {
                        $mensaje = "Error al recuperar informacion  authenticateOnDb.";
                        return '{"success":false,"message":"'.$mensaje.'"}';

                }
                
        } catch (Exception $ex) {
            
                $mensaje = "Error al recuperar informacion  EpeDao::getUsers.";
                return '{"success":false,"message":"'.$mensaje.'"}';        
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
    
    
    static function getPerfil($email){
    

        try
        {
                //metodos implementados aprovechando la ejecucion en bloque de las transaciones

                $sql = "SELECT nombre,apellido,email,usuario,admin,avatarfile FROM ".DB_ESQUEMA."usuarios WHERE email LIKE '".$email."'";
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
                $mensaje = "Error al recuperar informacion  EpeDao::getPerfil.";
                return '{"success":false,"message":"'.$mensaje.'"}';
                
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

static function guardaEstiloEdicion($email,$id_capa_estilo,$estilo)
{

    $id_usuario = EpeDao::getUnUsuario($email);
        //metodos implementados aprovechando la ejecucion en bloque de las transaciones

    $perfil_json = json_decode($perfil);

    
    try
        {
                //metodos implementados aprovechando la ejecucion en bloque de las transaciones
                $query1 = "DELETE FROM ".DB_ESQUEMA."estilo_x_capa_x_usuario WHERE id_usuario = (SELECT id_usuario FROM ".DB_ESQUEMA."usuarios WHERE email like '".$email."') and id_capa = ".$id_capa_estilo.";";

                $pdoWrapper = new PdoWrapper();
                $query =  $pdoWrapper->query($query1);
                
                $query2 ="INSERT INTO ".DB_ESQUEMA."estilo_x_capa_x_usuario(id_usuario, id_capa,estilo_json) VALUES (".$id_usuario.", ".$id_capa_estilo.",'".$estilo."');";                

                $query =  $pdoWrapper->query($query2);
                
                $row =$query->fetchAll();
                
                if($row)
                {
                        return '{"success":true}';
                }
                else
                {
                     $mensaje = "Error al guardar el estilo.";
                     return '{"success":false,"message":"'.$mensaje.'"}';
                     exit;
                }
        
        } catch (Exception $ex) {
                $mensaje = "Error al guaradr estilo  EpeDao::guardaEstiloEdicion.";
                return '{"success":false,"message":"'.$mensaje.'"}';
                exit;
        } 

   
}

static function load_mapas($email){
    
    try
    {
            //metodos implementados aprovechando la ejecucion en bloque de las transaciones

            $sql = 'SELECT capas_usuario.id_capa, capas_usuario.protocolo, nombre_capa, url, version_wms, nombre_fantasia, CAST("singleTile" AS bool),CAST("isBaseLayer" AS bool), "numZoomLevels", CAST(visibility  AS bool),CAST(transparent  AS bool), nivel_de_arbol, estilo_wms, version_wfs, select_control, estilo_wfs, "featureNS"  
                    FROM (SELECT capas_asociadas.id_capa,protocolo FROM '.DB_ESQUEMA.'capas_asociadas WHERE id_usuario = (select id_usuario from '.DB_ESQUEMA.'usuarios where email like \''.$email.'\')) AS capas_usuario, '.DB_ESQUEMA.'atributos_por_capa
                    WHERE atributos_por_capa.id_capa = capas_usuario.id_capa ORDER BY "isBaseLayer" DESC'; 
     
            $pdoWrapper = new PdoWrapper();
            $query =  $pdoWrapper->query($sql);

            $row =$query->fetchAll();

            if($row)
            {
                    return $row;
            }
            else
            {
                 $mensaje = "Error al recuperar capas.";
                 return '{"success":false,"message":"'.$mensaje.'"}';
                 exit;
            }


    } 
    catch (Exception $ex) {
            $mensaje = "Error al recuperar capas  EpeDao::load_mapas.";
            return '{"success":false,"message":"'.$mensaje.'"}';
    }                                        
}
}
?>