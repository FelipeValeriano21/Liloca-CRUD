
<?php

include 'conexao.php';

// get the post records

$txtemail = $_POST['email'];
$txtcpf = $_POST['cpf'];

$sql = "SELECT * FROM cliente WHERE email ='$txtemail' AND cpf = '$txtcpf'";
if (mysqli_query($conn, $sql)<=0) {
      echo "Entrou";
  
} else {
      echo "Error: " . $sql . "<br>" . mysqli_error($conn);
      

}

mysqli_close($conn);

?>