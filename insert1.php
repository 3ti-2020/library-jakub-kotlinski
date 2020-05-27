<?php
    require("connection1.php");
    $tytul = $_GET["tytul"];
    $isbn = $_GET["isbn"];

    $conn->query("insert into `tytuly` (`id`,`tytul`,`ISBN`) values (NULL,'".$tytul."','".$isbn."');");

    header('Location: /library.php');

$conn->close(); 
?>