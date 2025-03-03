<?php
session_start();
if (!isset($_SESSION['admin']) || $_SESSION['admin'] !== true) {
    header("Location: ../index.html"); // Redirige si no es admin
    exit();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel de Administración</title>
    <link rel="stylesheet" href="css/estilo.css">
</head>
<body>
    <h2>Bienvenido al Panel de Administración</h2>
    <a href="admin_jugadores.php">Administrar Jugadores</a>
    <br>
    <a href="logout.php">Cerrar Sesión</a>
</body>
</html>
