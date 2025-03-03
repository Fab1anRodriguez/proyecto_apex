<?php
session_start();
include '../conex/conexion.php'; // Asegúrate de que la ruta sea correcta

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];

    if (empty($email) || empty($password)) {
        die("❌ Error: Todos los campos son obligatorios.");
    }

    $sql = "SELECT id_usuario, email, contraseña, id_rol, id_estado FROM usuarios WHERE email = ?";
    $stmt = $conexion->prepare($sql);

    if (!$stmt) {
        die("❌ Error en la consulta SQL: " . $conexion->error);
    }

    $stmt->bind_param("s", $email);
    $stmt->execute();
    $resultado = $stmt->get_result();

    if ($resultado->num_rows == 1) {
        $fila = $resultado->fetch_assoc();

        // Verificar si el usuario está inactivo
        if ($fila['id_estado'] != 1) {
            die("❌ Error: Tu cuenta está inactiva o bloqueada. Contacta con un administrador.");
        }

        // Verificar la contraseña con password_verify
        if (password_verify($password, $fila['contraseña'])) {
            $_SESSION['id_usuario'] = $fila['id_usuario'];
            $_SESSION['email'] = $fila['email'];
            $_SESSION['rol'] = $fila['id_rol'];

            // Redirigir según el rol
            if ($fila['id_rol'] == 1) {
                $_SESSION['admin'] = true;
                header("Location: admin_panel.php");
            } else {
                header("Location: jugar.php");
            }
            exit();
        } else {
            die("❌ Error: Contraseña incorrecta.");
        }
    } else {
        die("❌ Error: Usuario no encontrado.");
    }

    $stmt->close();
    $conexion->close();
}
?>
