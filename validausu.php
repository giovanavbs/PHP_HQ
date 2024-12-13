<?php
    include 'conexao.php';
    
    session_start(); // iniciando sessão
    $Vemail = $_POST['txtemail']; // ElizabehWB@gmail.com
    $Vsenha = $_POST['txtsenha']; // cience 

    //echo $Vemail.'<br>';
    //echo $Vsenha.'<br>';

    $consulta = $cn->query("select cod_usu,nome_usu, desc_email, desc_senha, desc_status from tbUsuario where desc_email = '$Vemail' and desc_senha = '$Vsenha'");

    if($consulta->rowCount() == 1) { // rowCout conta quantas linhas foram encontradas da query, messe caso, 1
        //echo 'usuario ESTA cadastrado';
        $exibeUsuario = $consulta->fetch(PDO::FETCH_ASSOC);

        if($exibeUsuario['desc_status'] == 0){
        $_SESSION['ID'] = $exibeUsuario['cod_usu'];
        $_SESSION['Status']=0;
        header('location:index.php');
        }
        else{
            $_SESSION['ID'] = $exibeUsuario['cod_usu'];
            $_SESSION['Status']=1;
            header('location:index.php');
        }
    }
    else{
        //echo 'usuario NAO cadastrado';
        header('location:erro.php');
    }
?>