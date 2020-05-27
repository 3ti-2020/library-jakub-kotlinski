<?php
    require("connection1.php");
    $imie = $_GET["imie"];
    $nazwisko = $_GET["nazwisko"];

    $conn->query("insert into `autorzy` (`id`,`imie`,`nazwisko`) values (NULL,'".$imie."','".$nazwisko."');");

    header('Location: /library.php');

$conn->close(); 
?>