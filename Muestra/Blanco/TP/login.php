<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    
    <form class="formulario_acceso" method="POST" action="logica_login.php">
        <h2>Iniciar Sesión</h2>
        <label>Nombre de usuario:</label>
        <input type="text" name="nombre_usuario" required><br> </br>

        <label>Contraseña:</label>
        <input type="password" name="password" required> <br> </br>

        <button type="submit">Acceder</button> <br> </br>

        <a href="../index.php">Volver al Inicio</a>
    </form>
</body>
</html>

