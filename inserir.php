
<?php

include 'conexao.php';

// get the post records
$txtid = $_POST['idCliente'];
$txtnome = $_POST['nome'];
$txtemail = $_POST['email'];
$txttelefone = $_POST['telefone'];
$txtendereco = $_POST['endereco'];
$txtcpf = $_POST['cpf'];

$sql = "INSERT INTO cliente (idCliente, nome, email, telefone, endereco, cpf) VALUES ('$txtid', '$txtnome', '$txtemail', '$txttelefone', '$txtendereco', '$txtcpf');";
if (mysqli_query($conn, $sql)) {
      echo "New record created successfully";
      header("Location: consulta.php");
} else {
      echo "Error: " . $sql . "<br>" . mysqli_error($conn);

}

mysqli_close($conn);

?>