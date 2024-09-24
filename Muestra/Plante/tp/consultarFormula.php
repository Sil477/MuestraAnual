<table>
    <tr>
        <th>Número de Fórmula</th>
        <th>ID del Producto</th>
        <th>Cantidad</th>
        <th>Número de Etapa</th>
        <th>ID Tipo Producto</th>
        <th>Acciones</th>
    </tr>
    <?php
    // Conexión a la base de datos
    $conectar = mysqli_connect("localhost", "root", "", "gestion_produccion") or exit("No se puede conectar con la Base de datos");

    // Consulta
    $consulta = mysqli_query($conectar, "SELECT * FROM formula");

    while ($listar_formula = mysqli_fetch_assoc($consulta)) {
        // Obtener el ID del producto
        $productoID = $listar_formula['ID_Producto'];
        $productoConsulta = mysqli_query($conectar, "SELECT * FROM producto WHERE Codigo_Producto = '$productoID'");
        $productoData = mysqli_fetch_assoc($productoConsulta);

        // Obtener el ID de tipo de producto
        $tipoID = $listar_formula['ID_Tipo_Producto'];
        $tipoConsulta = mysqli_query($conectar, "SELECT * FROM tipo_producto WHERE ID_Tipo_Producto = '$tipoID'");
        $tipoData = mysqli_fetch_assoc($tipoConsulta);
    ?>
        <tr>
            <td><?php echo $listar_formula['nro_Formula']; ?></td>
            <td><?php echo $productoData['Codigo_Producto'] . ' - ' . $productoData['Descripcion']; ?></td>
            <td><?php echo $listar_formula['Cantidad']; ?></td>
            <td><?php echo $listar_formula['Nro_Etapa']; ?></td>
            <td><?php echo $tipoData['Descripcion']; ?></td>
            <td>
                <a href="editarFormula.php?nro_Formula=<?php echo $listar_formula['nro_Formula']; ?>">Modificar</a> |
                <a href="deleteFormula.php?nro_formula=<?php echo $listar_formula['nro_Formula']; ?>">Eliminar</a>
            </td>
        </tr>
    <?php 
    } 
    ?>
</table>
