<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Orden de Producto</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>ORDEN DE PRODUCTO</h1>


        <form class="formulario_acceso" action="enviar_datos.php" method="POST"> 
            <div class="form-group">
                <label for="fechaInicio">Fecha de orden inicio</label>
                <input type="date" id="fechaInicio" name="fechaInicio">
            </div>
            <div class="form-group">
                <label for="fechaFin">Fecha de finalización de orden</label>
                <input type="date" id="fechaFin" name="fechaFin">
            </div>
            <div class="form-group">
                <label for="cantidadProducida">Cantidad producida</label>
                <input type="number" id="cantidadProducida" name="cantidadProducida">
            </div>
            <p></p>
            <div class="buttons"> 

                <button type="submit">Enviar</button>
                <button type="reset">Cancelar</button>
            </div>
        </form>
    </div>
</body>
</html>
