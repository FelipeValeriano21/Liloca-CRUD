<?php

require 'conexao.php';


$txtid = filter_input(INPUT_GET, 'idCliente');


$sql = "DELETE from  cliente where idCliente = '$txtid';";
if (mysqli_query($conn, $sql)) {
      echo "Registro excluido com sucesso ";
            echo $txtid; 

} else {
      echo "Error: " . $sql . "<br>" . mysqli_error($conn);

}

mysqli_close($conn);

?>