<?php 
// Conexión a la base de datos
$conectar = mysqli_connect("localhost", "root", "", "sistema de stock");

// Verificar si la conexión fue exitosa
if (!$conectar) {
    die("Error en la conexión con la base de datos: " . mysqli_connect_error());
}

// Verificar si el formulario ha sido enviado
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Obtener los datos del formulario
    $fechaInicio = $_POST['fechaInicio'];
    $fechaFin = $_POST['fechaFin'];
    $cantidadProducida = $_POST['cantidadProducida'];

    // Consulta SQL para insertar datos
    $sql = "INSERT INTO orden_produccion (Fecha_Inicio_OP, Fecha_Cierre_OP, Cantidad_a_Producir) 
            VALUES ('$fechaInicio', '$fechaFin', '$cantidadProducida')";

    // Ejecutar la consulta
    if (mysqli_query($conectar, $sql)) {
        echo "Datos insertados correctamente";
    } else {
        echo "Error: " . mysqli_error($conectar);
    }
}

// Cerrar la conexión
mysqli_close($conectar);
?>
