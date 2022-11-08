<?php 

include "conexao.php";

if (isset($_POST['update'])) {

    $txtid = $_POST['idCliente'];
    $txtnome = $_POST['nome'];
    $txtemail = $_POST['email'];
    $txttelefone = $_POST['telefone'];
    $txtendereco = $_POST['endereco'];
    $txtcpf = $_POST['cpf'];

      $sql = "UPDATE cliente SET nome ='$txtnome', email ='$txtemail', telefone ='$txttelefone', 'txtendereco' ='$txtendereco', cpf ='$txtcpf' WHERE  idCliente ='$txtid'"; 

      $result = $conn->query($sql); 

      if ($result == TRUE) {

          echo "Record updated successfully.";

      }else{

          echo "Error:" . $sql . "<br>" . $conn->error;

      }

  } 

  ?>