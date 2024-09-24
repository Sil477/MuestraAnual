<?php
$nro_formula = $_GET['nro_formula'];
$conectar = mysqli_connect("localhost", "root", "", "gestion_produccion") or exit("No se puede conectar con la Base de datos");
$delete = mysqli_query($conectar, "DELETE FROM formula WHERE Nro_Formula='$nro_formula'");
header("Location: http://localhost/produccionTelevisores/formula.php");
?>
