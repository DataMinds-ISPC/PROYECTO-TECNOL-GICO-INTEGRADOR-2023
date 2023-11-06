<?php

$server = "localhost";
$user = "root";
$pass ="";
$db = "dataminds"

$conexion = new mysqli($server, $user, $pass, $db);

if($conexion->connect_errno){ 
    die("connexion Fallida" . $conexion->conexion->connect_errno);
} else { 
    echo"conectado";
} 


?>