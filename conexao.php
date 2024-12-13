<?php
    $servidor = "Localhost";
    $usuario = "smphp";
    $senha = "1234566";
    $banco = "db_spcomic";

    $cn = new PDO("mysql:host=$servidor;dbname=$banco", $usuario, $senha);
?>