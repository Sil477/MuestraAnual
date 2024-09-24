<?php

$servidor = "localhost";
$usuario = "root";
$password = "";
$base_datos = "linea_produccion";

$conexion = new mysqli($servidor, $usuario, $password, $base_datos);

if ($conexion -> connect_error) {
    die("conexión fallida: ". $conexion -> connect_error);
}

$conexion -> set_charset("utf8");
if (!$conexion -> set_charset("utf8")){
    die("Error al cargar carateres utf8 " . $conexion->error); //die detine la ejecucion con opcion de mensaje
}
?>