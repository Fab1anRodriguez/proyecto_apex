<?php
session_start();
include '../conex/conexion.php';

if (!isset($_SESSION['admin']) || $_SESSION['admin'] !== true) {
    header("Location: ../index.html");
    exit();
}

if (isset($_GET['id'])) {
    $id = intval($_GET['id']);
    $sql = "UPDATE usuarios SET id_estado = 1 WHERE id_usuario = ?";
    $stmt = $conexion->prepare($sql); // CAMBIO: Se usa $conexion en lugar de $conn
    $stmt->bind_param("i", $id);

    if ($stmt->execute()) {
        echo "<script>alert('Usuario desbloqueado correctamente'); window.location.href='admin_jugadores.php';</script>";
    } else {
        echo "<script>alert('Error al desbloquear'); window.location.href='admin_jugadores.php';</script>";
    }

    $stmt->close();
}
?>
