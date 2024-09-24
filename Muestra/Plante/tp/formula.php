<?php
$conectar = mysqli_connect("localhost", "root", "", "gestion_produccion") or exit("No se puede conectar con la Base de datos");

// Consulta para obtener las fórmulas junto con los nombres de producto y tipo de producto, ordenado por nro_Formula
$consulta = mysqli_query($conectar, "
    SELECT 
        f.id_Formula, 
        f.nro_Formula, 
        p.Codigo_Producto, 
        p.Descripcion AS Producto_Descripcion, 
        f.Cantidad, 
        f.Nro_Etapa, 
        t.Descripcion AS Tipo_Producto_Descripcion 
    FROM formula f
    JOIN producto p ON f.ID_Producto = p.Codigo_Producto
    JOIN tipo_producto t ON f.ID_Tipo_Producto = t.ID_Tipo_Producto
    ORDER BY f.nro_Formula ASC, f.id_Formula ASC
");


?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fórmulas</title>
    <link rel="stylesheet" href="./styles.css">
</head>
<body>
    <h1>Lista de Fórmulas</h1>
    <table>
        <thead>
            <tr>
                <th>ID Fórmula</th>
                <th>Número de Fórmula</th>
                <th>Producto</th>
                <th>Cantidad</th>
                <th>Número de Etapa</th>
                <th>Tipo de Producto</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($row = mysqli_fetch_assoc($consulta)) { ?>
                <tr>
                    <td><?php echo $row['id_Formula']; ?></td>
                    <td><?php echo $row['nro_Formula']; ?></td>
                    <td><?php echo $row['Codigo_Producto'] . ' - ' . $row['Producto_Descripcion']; ?></td>
                    <td><?php echo $row['Cantidad']; ?></td>
                    <td><?php echo $row['Nro_Etapa']; ?></td>
                    <td><?php echo $row['Tipo_Producto_Descripcion']; ?></td>
                    <td>
                        <a href="editarFormula.php?id_Formula=<?php echo $row['id_Formula']; ?>">Modificar</a> |
                        <a href="deleteFormula.php?id_Formula=<?php echo $row['id_Formula']; ?>">Eliminar</a>
                    </td>
                </tr>
            <?php } ?>
        </tbody>
    </table>
    <a href="agregarFormula.php">Agregar Nueva Fórmula</a>
</body>
</html>
