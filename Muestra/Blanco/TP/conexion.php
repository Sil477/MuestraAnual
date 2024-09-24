<?php 
    $conectar=mysqli_connect("localhost", "root", "", "sistema de stock") or exit ("No se puede conectar con la Base de datos");
    $consulta=mysqli_query($conectar,query:"SELECT * FROM orden_produccion" )
?>
<?php while($orden_de_produccion = mysqli_fetch_assoc($consulta)){ ?>
    <tr>
        <td><?php echo $orden_de_produccion ['ID_Op']?></td>
        <td><?php echo $orden_de_produccion ['Fecha_Inicio_OP'] ?></td>
        <td><?php echo $orden_de_produccion ['Fecha_Cierre_OP']?></td>
        <td><?php echo $orden_de_produccion ['Cantidad_a_Producir'] ?></td>
        <td><?php echo $orden_de_produccion ['Estado'] ?></td>
        <td><?php echo $orden_de_produccion ['ID_USUARIO'] ?></td>
    </tr>
<?php }?>


