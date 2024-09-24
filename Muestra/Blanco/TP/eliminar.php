<?php
include "conexion.php"; // Asegúrate de incluir la conexión a la base de datos 

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['id_op'])) {
    $ids = $_POST['id_op']; // Obtiene los ID seleccionados

    foreach ($ids as $id) {
        // Eliminar el registro de la base de datos
        $query = "DELETE FROM orden_produccion WHERE ID_Op = ?";
        $stmt = $conectar->prepare($query); // Cambia $conexion a $conectar
        if ($stmt) {
            $stmt->bind_param("i", $id); // 'i' para integer
            $stmt->execute();
            $stmt->close(); // Cerrar la declaración
        } else {
            echo "Error en la preparación de la declaración: " . mysqli_error($conectar);
        }
    }

    // Redirige a la página de orden de producto
    header("Location: orden de producto P2.php"); // Cambia 'index.php' por tu página principal
    exit;
} else {
    echo "No se seleccionaron órdenes para eliminar.";
}
?>
