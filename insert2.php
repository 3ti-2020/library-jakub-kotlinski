<?php
    require("connection1.php");
    $autor = $_GET["autor"];
    $tytul = $_GET["tytul"];

    $conn->query("insert into `tabela_id` (`id_id`,`id_autor`,`id_tytul`) values (NULL,'".$autor."','".$tytul."');");

    header('Location: /library.php');

$conn->close(); 
?>