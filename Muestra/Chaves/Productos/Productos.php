<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de productos</title>
    <link rel="stylesheet" href="./Estilo.css">
</head>
<body>
    <section><h1>Productos</h1></section>
        <div class="container">
            <button id="botonToggle" onclick="toggleTablas()">Cambiar a Tipo de Producto</button>
            <button id="AgregarPop" onclick="abrirFormulario()">Agregar Producto</button>
            <div class="container">
                <form action="Delete.php" method="post">
                    <input type="text" name="Cod_Prod" placeholder="Codigo del producto" required>
                    <input type="submit" value="Eliminar Producto">
                </form>
        </div>
            <table id="Productos">
                <tr>
                    <th>Código de producto</th>
                    <th>ID de tipo de producto</th>
                    <th>Descripción</th>
                    <th>Stock</th>
                    <th>ID_Proveedor</th>
                    <th>Codigo de Barras</th>
                </tr>
                <?php include "Consulta.php"; ?>
            </table>
            <table id="Tipos">
                <tr>
                    <th>ID de tipo de producto</th>
                    <th>Descripción</th>
                </tr>
                <?php include "ConsultaTipos.php"; ?>
            </table>
        </div>
        <div class="form-popup" id="myForm">
                <button class="pop" id="Cerrar" onclick="cerrarFormulario()">X</button>
                <h2>Agregar un producto:</h2>
                <form action="Agregar.php" method="POST">
                    <input type="number" name="matID" placeholder="ID del tipo de material" required>
                    <input type="text" name="desc" placeholder="Descripción" required>
                    <input type="number" name="Stock" placeholder="Stock" required>
                    <input type="text" name="provID" placeholder="ID del proveedor" required>
                    <input type="text" name="barcode" placeholder="Codigo de barras del Producto" required>
                    <input type="submit" value="Agregar producto">
                </form>
            </div>
    <script>
        var toggle = true;
        var tipos = document.getElementById("Tipos");
        var productos =document.getElementById("Productos");
        var boton = document.getElementById("botonToggle");
        onload(toggleTablas());
        function toggleTablas(){
            if (toggle==false){
                tipos.style.display = "block";
                productos.style.display = "none";
                boton.innerHTML = "Cambiar a Productos";
            }
            else{
                productos.style.display = "block";
                tipos.style.display = "none";
                boton.innerHTML = "Cambiar a Tipo de Producto";
            }
            toggle=!toggle;
        }
    </script>
    <script> /*Abrir formulario de agregar productos */
        function abrirFormulario() {
            document.getElementById("myForm").style.display = "block";
        }
        function cerrarFormulario() {
            document.getElementById("myForm").style.display = "none";
        }
    </script>
</body>
</html>