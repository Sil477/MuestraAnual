<?php
session_start();

$usuario_id = $_SESSION['usuario_id'];
$usuario_rol = $_SESSION['usuario_rol'];

// Verificar si el usuario tiene el rol adecuado (supervisor o cliente)
if ($usuario_rol != 'supervisor' && $usuario_rol != 'cliente') {
    echo "No tienes permiso para acceder a esta página.";
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Puesto 1</title>
</head>
<body>
    <h1>Puesto 3</h1>
    <!-- Contenido para supervisores y operadores -->
</body>
</html>
