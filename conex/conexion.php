<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "free_fire"; // Asegúrate de que el nombre de la BD es correcto

$conn = new mysqli($servername, $username, $password, $database);

// Verificar conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}
?>
