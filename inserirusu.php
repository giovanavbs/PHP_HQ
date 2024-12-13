<?php 
    include 'conexao.php';

    $nome = $_POST['txtnome'];
    $email = $_POST['txtemail'];
    $senha = $_POST['txtsenha'];
    $end = $_POST['txtendereco'];
    $cidade = $_POST['txtcidade'];
    $cep = $_POST['txtcep'];

    /* testendo var
    echo $nome.'<br>';
    echo $email .'<br>';
    echo $senha .'<br>';
    echo $end .'<br>';
    echo $cidade .'<br>';
    echo $cep .'<br>';
    */

    $consulta = $cn->query("select desc_email from tbUsuario where desc_email = '$email'");
    $exibe = $consulta->fetch(PDO::FETCH_ASSOC);

    if($consulta->rowCount() == 1) {
        header('Location:erro1.php');
    } 
    else {
        $incluir = $cn->query("
        insert into tbUsuario(nome_usu, desc_email, desc_senha, desc_status, endereco, cidade, CEP)
        values('$nome','$email','$senha','0','$end','$cidade','$cep')");
        header('Location:ok.php');
    }
?>