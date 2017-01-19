<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<?php
  session_start();
  session_unset();
  srand();
  include("../php/config.php");
  
  $challenge = "";
  for ($i = 0; $i < 80; $i++) {
    $challenge .= dechex(rand(0, 15));
  }
  $_SESSION['challenge'] = $challenge;
  
  include "login/md5.js.php";

?>
<html>
    <head>
        <meta charset="UTF-8">
        <title>IR Salud</title>
        <link href="js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="js/jquery-ui/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
        <link href="js/jquery-ui/jquery-ui.theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        
        <script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
        <script src="js/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
        <script src="js/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
       
    </head>
    <body>
        
        <div class="container">
            <div class="row">
              <div class="Absolute-Center is-Responsive">
                <div id="logo-container"></div>
                <div class="col-sm-12 col-md-10 col-md-offset-1">
                  <form action="" id="loginForm">
                    <div class="form-group input-group">
                      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                      <input class="form-control" type="text" name='username' placeholder="Usuario"/>          
                    </div>
                    <div class="form-group input-group">
                      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                      <input class="form-control" type="password" name='password' placeholder="Contraseña"/>     
                    </div>
                    <div class="checkbox">
                      <label>
                          <input type="checkbox"><span>Recordarme</span>
                      </label>
                    </div>
                    <div class="form-group">
                      <button type="button" class="btn btn-def btn-block">Ingresar</button>
                    </div>
                    <div class="form-group text-center">
                      <a href="#">Recuperar Contraseña</a> &nbsp;
                    </div>
                  </form>        
                </div>  
              </div>    
            </div>
        </div>
    </body>
    
</html>
