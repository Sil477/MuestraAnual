<?php
$conectar = mysqli_connect("localhost", "root", "", "gestion_produccion") or exit("No se puede conectar con la Base de datos");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nroFormula = filter_var($_POST["nro_Formula"], FILTER_SANITIZE_NUMBER_INT);
    $matID = filter_var($_POST["matID"], FILTER_SANITIZE_STRING); // Asegúrate de que es STRING si el Código de Producto incluye letras
    $cantidad = filter_var($_POST["cantidad"], FILTER_SANITIZE_NUMBER_INT);
    $etapaID = filter_var($_POST["etapaID"], FILTER_SANITIZE_NUMBER_INT);
    $tipoID = filter_var($_POST["tipoID"], FILTER_SANITIZE_NUMBER_INT);

    // Depuración para verificar los valores
    echo "Número de Fórmula: " . $nroFormula . "<br>";
    echo "Producto seleccionado: " . $matID . "<br>";
    echo "Cantidad: " . $cantidad . "<br>";
    echo "ID Etapa: " . $etapaID . "<br>";
    echo "ID Tipo Producto: " . $tipoID . "<br>";

    // Verifica si el producto existe antes de hacer la inserción
    $checkProduct = mysqli_query($conectar, "SELECT * FROM producto WHERE Codigo_Producto = '$matID'");
    if (mysqli_num_rows($checkProduct) > 0) {
        // Realiza la inserción solo si el producto existe
        $agregar = mysqli_query($conectar, "INSERT INTO formula (nro_Formula, Cantidad, Nro_Etapa, ID_Tipo_Producto, ID_Producto) 
            VALUES ('$nroFormula', '$cantidad', '$etapaID', '$tipoID', '$matID')");

        if ($agregar) {
            header("Location: http://localhost/produccionTelevisores/formula.php");
        } else {
            echo "Error al insertar en la tabla formula: " . mysqli_error($conectar);
        }
    } else {
        echo "Error: El producto con ID '$matID' no existe en la tabla producto.";
    }
}
?>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Fórmula</title>
    <link rel="stylesheet" href="./styles.css">
</head>
<body>
    <h1>Agregar una Fórmula</h1>
    <form action="agregarFormula.php" method="POST">
        <label for="nro_Formula">Número de Fórmula:</label>
        <input type="number" name="nro_Formula" placeholder="Número de Fórmula" required>

        <label for="matID">ID del Producto:</label>
        <select name="matID" required>
            <?php
            // Consulta para obtener los productos
            $productos = mysqli_query($conectar, "SELECT * FROM producto");
            while ($producto = mysqli_fetch_assoc($productos)) {
                echo '<option value="' . $producto['Codigo_Producto'] . '">' . $producto['Codigo_Producto'] . ' - ' . $producto['Descripcion'] . '</option>';
            }
            ?>
        </select>

        <label for="cantidad">Cantidad:</label>
        <input type="number" name="cantidad" placeholder="Cantidad" required>

        <label for="etapaID">Número de Etapa:</label>
        <input type="number" name="etapaID" placeholder="Número de Etapa" required>

        <label for="tipoID">ID Tipo Producto:</label>
        <select name="tipoID" required>
            <?php
            // Consulta para obtener los tipos de productos
            $tipos = mysqli_query($conectar, "SELECT * FROM tipo_producto");
            while ($tipo = mysqli_fetch_assoc($tipos)) {
                echo '<option value="' . $tipo['ID_Tipo_Producto'] . '">' . $tipo['Descripcion'] . '</option>';
            }
            ?>
        </select>

        <input type="submit" value="Agregar Fórmula">
    </form>
</body>
</html>
