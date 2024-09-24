<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Puesto 3</title>
    <link rel="stylesheet" href="./Estilo.css">
</head>
<body>
<div class="general">
        <div class="contenedor">
            <h1>Puesto N°3</h1>
            </div>
        <div class="contenedor">

            <form id="formu" action="" method="POST">
                <input type="text" name="Orden" placeholder="Número de Orden">
                <input type="submit" value="Cargar OP">
            </form>
            
            <div>
                <p>ID_Produccion: </p>
                <div class="box">
                    <?php //include "getOP.php"; ?>
                </div>
            </div>
            
        </div>

        <div class="general">
            <div class="container">
                <table>
                    <tr>
                        <th>Materiales</th>
                        <th>Codigo de barras</th>
                        <th>Cantidad</th>
                    </tr>
                    <tr>
                        <td>CON-32-0001</td>
                        <td class="barcode">CON-32-0001</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>MANGAR-0001</td>
                        <td class="barcode">MANGAR-0001</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>LCD-32-0001</td>
                        <td class="barcode">LCD-32-0001</td>
                        <td>1</td>
                    </tr>
            </table>
            </div>
            <div class="container">
                <button>Completado</button>
            </div>
        </div>

    </div>
</body>
</html>