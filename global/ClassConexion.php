<?php

class Conexion
{

  function __construct(argument)
  {

  }

  public function bodeguita_Conexion(){
    try {
      $host = '18.191.133.167';
      $bd = 'BODEGUITA';
      $usuario = 'user_bodeguita';
      $password = 'Bodeguita_password123';
      $conexion = PDO("mysql:host=$host;dbname=$bd", $usuario, $password);
      if (isset($conexion)) {
        return $conexion;
      }else{
        echo "¡Error de Conexion";
        die();
      }
    } catch (PDOException $e) {
      echo "¡Error de Conexion"." ".$e->getMessage();
      die();
    }

  }
}
 ?>
