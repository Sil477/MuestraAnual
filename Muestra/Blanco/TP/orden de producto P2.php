<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Orden de Producto</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>ORDEN DE PRODUCTO</h1>
        <form class="formulario_acceso" method="POST" action="eliminar.php"> <!-- Cambia a tu archivo PHP para eliminar -->
            <label for="ordenProducto">Orden de producto</label>
            <table class="tabla">
                <tr>
                    <th>ID_Op</th>
                    <th>Fecha_Inicio_OP</th>
                    <th>Fecha_Cierre_OP</th>
                    <th>Cantidad_a_Producir</th>
                    <th>Estado</th>
                    <th>ID_USUARIO</th>
                    <th>Eliminar</th> <!-- Nueva columna para seleccionar eliminar -->
                </tr>
                <?php 
                include "conexion.php"; // Conexión a la base de datos
                
                $consulta = mysqli_query($conectar, "SELECT * FROM orden_produccion"); // Consulta correctamente
                while ($orden_de_produccion = mysqli_fetch_assoc($consulta)) { ?>
                    <tr>
                        <td><?php echo $orden_de_produccion['ID_Op']; ?></td>
                        <td><?php echo $orden_de_produccion['Fecha_Inicio_OP']; ?></td>
                        <td><?php echo $orden_de_produccion['Fecha_Cierre_OP']; ?></td>
                        <td><?php echo $orden_de_produccion['Cantidad_a_Producir']; ?></td>
                        <td><?php echo $orden_de_produccion['Estado']; ?></td>
                        <td><?php echo $orden_de_produccion['ID_USUARIO']; ?></td>
                        <td><input type="checkbox" name="id_op[]" value="<?php echo $orden_de_produccion['ID_Op']; ?>"></td> <!-- Checkbox para seleccionar -->
                    </tr>
                <?php } ?>
            </table>
            <div class="button">
                <button type="submit">Eliminar</button> <!-- Botón para enviar el formulario -->
            </div>
        </form>
    </div>
</body>
</html>
