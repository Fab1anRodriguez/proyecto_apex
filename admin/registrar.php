<?php
include '../conex/conexion.php'; 

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = trim($_POST['nombre']);
    $email = trim($_POST['email']);
    $contraseña = trim($_POST['contraseña']);
    $repetir_contraseña = trim($_POST['repetir_contraseña']);

    if (empty($nombre) || strlen($nombre) < 3) {
        die("Error: El nombre debe tener al menos 3 caracteres.");
    }
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        die("Error: Correo electrónico no válido.");
    }
    if (strlen($contraseña) < 6) {
        die("Error: La contraseña debe tener al menos 6 caracteres.");
    }
    if ($contraseña !== $repetir_contraseña) {
        die("Error: Las contraseñas no coinciden.");
    }

    $contraseña_hash = password_hash($contraseña, PASSWORD_DEFAULT);
    $vida = 100;
    $id_Nivel = 1;
    $id_estado = 1;
    $id_rol = 2;

    $sql = "INSERT INTO usuarios (nombre, email, contraseña, vida, id_Nivel, id_estado, id_rol) 
            VALUES (?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssiiii", $nombre, $email, $contraseña_hash, $vida, $id_Nivel, $id_estado, $id_rol);

    if ($stmt->execute()) {
        echo "<script>alert('Registro exitoso'); window.location.href='../index.html';</script>";
    } else {
        echo "Error en la consulta: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar</title>
    <link rel="stylesheet" href="../css/estilo1.css">
    <script src="../validaciones.js" defer></script>
</head>
<body class="body">
    <div class="form-container">
        <h2>Registrarse</h2>
        <form method="POST" id="registerForm" action="">
            <input type="text" name="nombre" placeholder="Ingrese su nombre" required>
            <span class="error-message"></span>

            <input type="email" name="email" placeholder="Ingrese su correo" required>
            <span class="error-message"></span>

            <input type="password" name="contraseña" placeholder="Ingrese su contraseña" required>
            <span class="error-message"></span>

            <input type="password" name="repetir_contraseña" placeholder="Repetir contraseña" required>
            <span class="error-message"></span>

            <button type="submit">Registrarse</button>
            <p><a href="../index.html">Iniciar sesión</a></p>
        </form>
    </div>
</body>
</html>
