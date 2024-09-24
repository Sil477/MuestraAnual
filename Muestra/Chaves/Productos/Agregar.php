<?php
$conectar=mysqli_connect("localhost", "root", "", "sistema de stock") or exit ("No se puede conectar con la Base de datos");
$autofill=mysqli_query($conectar,query:"SELECT max(Codigo_Producto) FROM material_stock" );
$resultado=mysqli_fetch_row($autofill)['0']+1;
$TiposMateriales=mysqli_fetch_all(mysqli_query($conectar,query:"SELECT ID_Tipo_Producto FROM tipo_material" ));
$Proveedores=mysqli_fetch_all(mysqli_query($conectar,query:"SELECT ID_Proveedor FROM proveedor" ));
?>

<?php 
$checks=0;
$matID=$_POST["matID"];
$desc=filter_var($_POST["desc"],FILTER_SANITIZE_STRING);
$stock=filter_var($_POST["Stock"],FILTER_SANITIZE_NUMBER_INT);
$provID=filter_var($_POST["provID"],FILTER_SANITIZE_NUMBER_INT);
$barcode=filter_var($_POST["barcode"],FILTER_SANITIZE_STRING);

    foreach ($TiposMateriales as $test){
        if ($matID==current($test)){
            $checks+=1;
        }
    }
    foreach ($Proveedores as $test){
        if ($provID==current($test)){
            $checks+=1;
        }
    }
    if ($checks ==2){
        $Agregar=mysqli_query($conectar,query:"INSERT INTO material_stock
        VALUES('$resultado', '$matID','$desc','$stock','$provID','$barcode')");
        echo $Agregar;
        $checks = 0;
        header("Location: ./Productos.php");
    }
?>
<!--$Agregar=mysqli_query($conectar,query:"INSERT INTO clases
VALUES(DEFAULT, '$resultado', '$matID','$desc','$stock','$provID','$barcode')")-->

