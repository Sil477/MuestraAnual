<?php
$conectar=mysqli_connect("localhost", "root", "", "gestion_produccion") or exit ("No se puede conectar con la Base de datos");

if (isset($_GET['id_Formula'])) {
    $id_Formula = $_GET['id_Formula'];
    $consulta = mysqli_query($conectar, "SELECT * FROM formula WHERE id_Formula = '$id_Formula'");
    $data = mysqli_fetch_assoc($consulta);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Fórmula</title>
    <link rel="stylesheet" href="./styles.css">
</head>
<body>
    <h1>Editar Fórmula</h1>
    <form action="modificarFormula.php" method="POST">
        <input type="hidden" name="id_Formula" value="<?php echo $data['id_Formula']; ?>">
        
        <label for="matID">ID del Producto:</label>
        <select id="matID" name="matID" required>
            <?php
            $productos = mysqli_query($conectar, "SELECT * FROM producto");
            while ($producto = mysqli_fetch_assoc($productos)) {
                echo '<option value="' . $producto['Codigo_Producto'] . '"' . ($producto['Codigo_Producto'] == $data['ID_Producto'] ? ' selected' : '') . '>' . $producto['Codigo_Producto'] . ' - ' . $producto['Descripcion'] . '</option>';
            }
            ?>
        </select>

        <label for="cantidad">Cantidad:</label>
        <input type="number" id="cantidad" name="cantidad" value="<?php echo $data['Cantidad']; ?>" required>

        <label for="etapaID">Número de Etapa:</label>
        <input type="number" id="etapaID" name="etapaID" value="<?php echo $data['Nro_Etapa']; ?>" required>

        <label for="tipoID">ID Tipo Producto:</label>
        <select id="tipoID" name="tipoID" required>
            <?php
            $tipos = mysqli_query($conectar, "SELECT * FROM tipo_producto");
            while ($tipo = mysqli_fetch_assoc($tipos)) {
                echo '<option value="' . $tipo['ID_Tipo_Producto'] . '"' . ($tipo['ID_Tipo_Producto'] == $data['ID_Tipo_Producto'] ? ' selected' : '') . '>' . $tipo['Descripcion'] . '</option>';
            }
            ?>
        </select>

        <input type="submit" value="Guardar Cambios">
    </form>
</body>
</html>
