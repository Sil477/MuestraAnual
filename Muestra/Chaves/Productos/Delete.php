<?php
$codigo=$_POST['Cod_Prod'];
$conectar=mysqli_connect("localhost", "root", "", "sistema de stock") or exit ("No se puede conectar con la Base de datos");
$delete=mysqli_query($conectar,query:"DELETE FROM material_stock where Codigo_Barra='$codigo'");
header("Location: ./Productos.php")
?>
<!--Restore: 
INSERT INTO `material_stock` (`Codigo_Producto`, `ID_Tipo_Material`, `Descripcion`, `CANTIDAD`, `ID_Proveedor`, `Codigo_Barra`) VALUES ('4', '1', 'Televisor 65\"', '340', '1', 'LCD-65-0004'); -->