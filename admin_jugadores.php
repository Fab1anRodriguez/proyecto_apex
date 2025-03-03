<?php
session_start();
include(__DIR__ . "/conex/conexion.php");

// Verificar si el usuario es administrador
if (!isset($_SESSION['id_rol']) || $_SESSION['id_rol'] != 1) {
    die("Acceso denegado.");
}

$sql = "SELECT u.id_usuario, u.email, e.estado 
        FROM usuarios u
        JOIN estado e ON u.id_estado = e.id_estado
        WHERE u.id_estado = 2"; // Estado "Inactivo" (bloqueado)
$result = $conexion->query($sql);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrar Jugadores</title>
    <link rel="stylesheet" href="css/estilo.css">
</head>
<body>
    <div class="admin-container">
        <h2>Jugadores Bloqueados</h2>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Correo</th>
                <th>Estado</th>
                <th>Acción</th>
            </tr>
            <?php while ($row = $result->fetch_assoc()) { ?>
                <tr>
                    <td><?= $row['id_usuario']; ?></td>
                    <td><?= $row['email']; ?></td>
                    <td><?= $row['estado']; ?></td>
                    <td><a href="desbloquear_jugador.php?id=<?= $row['id_usuario']; ?>" class="btn-desbloquear">Desbloquear</a></td>
                </tr>
            <?php } ?>
        </table>
        <a href="admin_panel.php">Volver al Panel</a>
    </div>
</body>
</html>
