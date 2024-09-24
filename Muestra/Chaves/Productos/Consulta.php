<?php 
    $conectar=mysqli_connect("localhost", "root", "", "sistema de stock") or exit ("No se puede conectar con la Base de datos");
    $consulta=mysqli_query($conectar,query:"SELECT * FROM material_stock" )
?>
<?php while($listar_producto = mysqli_fetch_assoc($consulta)){ ?>
    <tr>
        <td><?php echo $listar_producto['Codigo_Barra']?></td>
        <td><?php echo $listar_producto['ID_Tipo_Material'] ?></td>
        <td><?php echo $listar_producto['Descripcion']?></td>
        <td><?php echo $listar_producto['CANTIDAD'] ?></td>
        <td><?php echo $listar_producto['ID_Proveedor']?></td>
        <td class="barcode"><?php echo $listar_producto['Codigo_Barra']?></td>
    </tr>
<?php }?>