<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="library.css">
    <title>Document</title>
</head>
<body>
    <div class="container">
        <div class="item1">
            <div class="name"><h1>Zbiór Książek</h1></div>
        </div>
        <div class="item2">
        <div class="insert">
                <form action="insert.php">
                    <input type="text" name="imie" placeholder="imie">
                    <input type="text" name="nazwisko" placeholder="nazwisko">
                    <input type="submit" value="insert">
                </form>
                <br>
                <form action="insert1.php">
                    <input type="text" name="tytul" placeholder="tytuł">
                    <input type="text" name="isbn" placeholder="ISBN">
                    <input type="submit" value="insert">
                </form>
                <?php 
                    require("connection1.php");

                    $result_autor = $conn->query("SELECT * FROM autorzy");
                    

                    echo("<form action='insert2.php' method='GET'  class='insert'>");
                    echo("<select name='autor'>");
                    while($row=$result_autor->fetch_assoc() ){
                        echo("<option value='".$row['id']."'>".$row['imie']." ".$row['nazwisko']."</option>");
                    }
                    echo("</select>");

                    $result_tytuly = $conn->query("SELECT * FROM tytuly");
                    echo("<select name='tytul'>");
                    while($row=$result_tytuly->fetch_assoc() ){
                        echo("<option value='".$row['id']."'>".$row['tytul']."</option>");
                    }
                    echo("</select>");

                    echo("<input type='submit' value='DODAJ'>");
                    echo("</form>");
                ?>
            </div>

            <div class="input">
                <?php 
                    require("connection1.php");

                    $sql = "SELECT id_id, imie, nazwisko, tytul FROM tytuly, tabela_id, autorzy WHERE autorzy.id=tabela_id.id_autor AND tytuly.id=tabela_id.id_tytul";
                 
                     $result = $conn->query( $sql );
                 
                     echo("<table class='moja_tabela'>");

                     echo("<tr class= 'row'>
                             <th class='col'>id</th>
                             <th class='col'>imie</th>
                             <th class='col'>nazwisko</th>
                             <th class='col'>tytul</th>
                             <th class='col'>delet</th>
                         </tr>");

                     While( $row = $result->fetch_assoc() )
                     {
                         echo("<tr class='row'>");
                         echo("<td class='col'>".$row['id_id']."</td><td class='col'>
                         ".$row['imie']."</td><td class='col'>".$row['nazwisko']."
                         </td><td class='col'>".$row['tytul']."</td><td class='col'>

                         <form action='delet.php' method='GET'>
                        <input type='hidden' name='id' value=".$row['id_id'].">
                        <input type='submit' value='delete'>
                        </form> </td>");
                         echo("</tr>");
                     }

                     echo("</table>"); 

                     $conn->close(); 
                ?>
            </div>
        </div>
    </div>
    
</body>
</html>