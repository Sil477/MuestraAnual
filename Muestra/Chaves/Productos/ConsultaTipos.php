<?php 
    $conectar=mysqli_connect("localhost", "root", "", "sistema de stock") or exit ("No se puede conectar con la Base de datos");
    $consulta=mysqli_query($conectar,query:"SELECT * FROM tipo_material" )
?>
<?php while($listar_producto = mysqli_fetch_assoc($consulta)){ ?>
    <tr>
        <td><?php echo $listar_producto['ID_Tipo_Producto'] ?></td>
        <td><?php echo $listar_producto['Descripcion']?></td>
    </tr>
<?php }?>