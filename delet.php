<?php
    require("connection1.php");
    $id = $_GET["id"];

    $conn->query("DELETE from tabela_id WHERE id_id='$id'");

    header('Location: /library.php');

$conn->close(); 
?>
