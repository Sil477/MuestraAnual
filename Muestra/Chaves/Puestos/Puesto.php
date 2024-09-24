<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Puesto 1</title>
    <link rel="stylesheet" href="./Estilo.css">
</head>
<body>
    <div class="general">
        <div class="contenedor">
            <h1>Puesto N°1</h1>
            </div>
        <div class="contenedor">

            <form id="formu" action="" method="POST">
                <p>OP:</p>
                <input type="text" name="Orden" placeholder="Número de Orden">
                <input type="submit" value="Cargar OP">
            </form>

            <p>Cantidad a Producir:</p>
            <form id="formu" action="" method="POST">
                <input type="text" name="Producto" placeholder="Código de Producto">
                <input type="submit" value="Cargar producto">
            </form>

            
        </div>

        <div class="general">
            <div class="container">
                <p id="Formula">Formula 0001</p>
                <button>Cargar Materiales</button>
            </div>
            <div class="container">
                <table>
                    <tr>
                        <th>Materiales</th>
                        <th>Cantidad</th>
                    </tr>
                    <tr>
                        <td>PPA-0001</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>PLA-MAIN-0001</td>
                        <td>1</td>
                    </tr>
            </table>
            </div>
        </div>

    </div>
</body>
</html>