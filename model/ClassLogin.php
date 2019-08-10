<?php
/**
 *
 */
class IniciarSesion
{

  function __construct(argument)
  {

  }

  public function get_Login($arg_Usuarios, $arg_Password){
    $objeto = new Conexion();
    $conexion = $objeto->bodeguita_Conexion();

    $query = "SELECT * FROM BODEGUITA.USUARIOS WHERE USUARIOS = :_USUARIO AND PASSWORD = :_PASSWORD";
    $stmt = $conexion->prepare($query);
    $stmt->bindParam(':_USUARIO',$arg_Usuarios);
    $stmt->bindParam(':_PASSWORD',$arg_Password);

    if (isset($stmt)) {
      if ($stmt->execute()) {
        $data = $stmt->fetch();
        return $data;
      }else{
        echo "¡Error no se puede ejecutar la consulta";
        die();
      }
    }else{
      echo "¡Error Consulta vacia ingrese los parametros necesarios";
      die();
    }
  }o
}

 ?>
