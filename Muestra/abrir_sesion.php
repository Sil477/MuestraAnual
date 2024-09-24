<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Abrir conexión a BD</title>
</head>
<body>
    <?php
    $conectar=mysqli_connect("(IP DEL SERVIDOR)", "root", "", "sistema de stock") or exit ("No se puede conectar con la Base de datos");
    if(!$conectar) {
        echo "Error: No se pudo conectar a MySQL." . PHP_EOL;
    }
    echo "Éxito: Se realizó una conexión apropiada a MySQL! La base de datos mi_bd es genial." . PHP_EOL;
    echo "Información del host: " . mysqli_get_host_info($conectar) . PHP_EOL;

    mysqli_close($conectar);
    ?>

</body>
</html>