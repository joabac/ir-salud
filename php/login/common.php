<?php
  session_start();
  function is_authenticated() {
    error_log("is authenticated - Sessionstat: ".  session_status() ." Sesion COMMON:". $_SESSION['authenticated']." usuario: ".$_SESSION['username']);
    return isset($_SESSION['authenticated']) && $_SESSION['authenticated'] == "yes";
  }
  
  function require_authentication() {
    
    if (!is_authenticated()) {
      header("Location:login.php");
      exit;
    }
  }
  
  function require_authenticationAdmin() {
    if (!is_authenticated()) {
      header("Location:../login.php");
      exit;
    }
  }
?>