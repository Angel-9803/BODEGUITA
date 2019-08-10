<?php
require_once '../global/ClassConexion.php';
require_once '../model/ClassLogin.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $usuario = $_POST['usuario'];
    $password = sha1($_POST['password']);
}

$objeto = new get_Login($usuario, $password);

if ($data['USUARIO'] == $usuario && $data['PASSWORD'] == $password) {
    session_start();
    $_SESSION['USER_BODEGUITA'] = $usuario;
    $_SESSION['TYPE_USER'] = $data['COD_USUARIO'];
    if ($_SESION['TYPE_USER'] == 'ADMIN') {
        header('location:../view/administrador/index.php');
    } elseif ($_SESION['TYPE_USER'] == 'CLIEN') {
        header('location:../view/cliente/index.php');
    } else {
        header('location:../index.php');
    }
}
