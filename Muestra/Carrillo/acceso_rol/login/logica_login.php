<?php
session_start();
include 'conexion.php'; // se incluye la conexión a la base de datos

// Verificar si el formulario fue enviado
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nombre_usuario = $_POST['nombre_usuario'];
    $password = $_POST['password'];

    // Consulta para obtener el usuario y su rol
    $sql = "SELECT id_usuario, nombre_usuario, password, id_rol 
            FROM usuarios 
            WHERE nombre_usuario = ?";

    $stmt = $conexion->prepare($sql);
    $stmt->bind_param('s', $nombre_usuario);
    $stmt->execute();
    $result = $stmt->get_result();

    // Verificar si el usuario existe
    if ($result->num_rows > 0) {
        $usuario = $result->fetch_assoc();

        // Verificar la contraseña (comparación directa si no está hasheada)
        if ($password == $usuario['password']) {
            // Guardar el ID y rol del usuario en la sesión
            $_SESSION['usuario_id'] = $usuario['id_usuario'];
            $_SESSION['usuario_rol'] = ($usuario['id_rol'] == 1) ? 'supervisor' : 'operador'; // Aquí asumimos que id_rol=1 es supervisor

            // Redirigir a la página gestion_linea si el rol es supervisor
            if ($_SESSION['usuario_rol'] == 'supervisor') {
                header('Location: usuarios.php');
                exit();
            } else {
                echo "No tienes permiso para acceder a esta página.";
            }
        } else {
            echo "Contraseña incorrecta.";
        }
    } else {
        echo "Usuario no encontrado.";
    }
}
?>