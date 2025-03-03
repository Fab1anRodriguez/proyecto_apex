<?php
session_start();
include '../conex/conexion.php'; // Ajusta la ruta según tu estructura

if (!isset($_SESSION['admin']) || $_SESSION['admin'] !== true) {
    die("❌ Acceso denegado.");
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrar Jugadores</title>
    <link rel="stylesheet" href="../css/estilo.css">
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
            <?php
            // Verificar conexión
            if (!$conexion) {
                die("❌ Error: No se pudo conectar a la base de datos.");
            }

            // Consulta para obtener jugadores bloqueados (id_estado = 2)
            $sql = "SELECT id_usuario, email, id_estado FROM usuarios WHERE id_estado = 2";
            $result = $conexion->query($sql);

            if (!$result) {
                die("❌ Error en la consulta: " . $conexion->error);
            }

            while ($row = $result->fetch_assoc()) {
                echo "<tr>
                        <td>{$row['id_usuario']}</td>
                        <td>{$row['email']}</td>
                        <td>" . ($row['id_estado'] == 2 ? 'Inactivo' : 'Activo') . "</td>
                        <td><a href='desbloquear_jugador.php?id={$row['id_usuario']}' class='btn-desbloquear'>Desbloquear</a></td>
                    </tr>";
            }
            ?>
        </table>
        <a href="admin_panel.php">Volver al Panel</a>
    </div>
</body>
</html>
