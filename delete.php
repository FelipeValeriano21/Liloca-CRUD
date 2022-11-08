<?php 

include "conexao.php"; 

if (isset($_GET['idCliente'])) {

    $user_id = $_GET['idCliente'];

    $sql = "DELETE FROM cliente WHERE idCliente =  ' $user_id' ";

     $result = $conn->query($sql);

     if ($result == TRUE) {

        echo "Record deleted successfully.";
        header("Location: consulta.php");

    } else{

      echo "Nao foi";

    }

}else{

      echo "ta vazio";

} 

?>