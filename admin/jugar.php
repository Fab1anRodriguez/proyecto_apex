<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Juego</title>
    <link rel="stylesheet" href="../css/estilo2.css">

</head>
<body>

    <div class="game-container">
        <h2>¡Prepárate para la batalla! 🎮</h2>
        <img src="../img/juego.jpeg" alt="Imagen del Juego">

        <div class="boton">
            <button class="btn-jugar">Jugar</button>
            <button class="btn-avatar">Cambiar Avatar</button>
            <button class="btn-estadisticas">Estadísticas</button>
            <button class="btn-cerrar" onclick="cerrarSesion()">Cerrar Sesión</button>
        </div>
    </div>

    <script>
        function cerrarSesion() {
            window.location.href = 'logout.php'; 
        }
    </script>

<script>
        function EditarUsuario() {
            window.location.href = 'admin_jugador.php'; 
        }
    </script>

</body>
</html>
