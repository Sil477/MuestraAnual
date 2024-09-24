<?php
$conectar=mysqli_connect("localhost", "root", "", "sistema de stock") or exit ("No se puede conectar con la Base de datos");
$consulta=mysqli_query($conectar,query:"SELECT max(Codigo_Producto) FROM material_stock" );
$resultado=mysqli_fetch_assoc($consulta);
?>
<?php
$matid=$_POST['matID'];
$desc=$_POST['desc'];
$stock=$_POST['stock'];
?>
