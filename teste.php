<!DOCTYPE HTML>
<html lang="pt-br">
<head>
    <meta charset="utf-08">
     <title>mostrar produtos</title>
</head>
<body>

    <?php
        include 'conexao.php';
        // variavel consulta vai receber variavel $cn que recebera o resultado de uma query
        $consulta = $cn->query('select * from vw_hq');
        // variavel $exibe recebera o resultado da consulta em forma de uma matriz tabela - enquanto exibe estiver recebeendo dados do consulta o loop repete
       while ($exibe = $consulta->fetch(PDO::FETCH_ASSOC)){

        echo $exibe ['nome_hq'].'<br>';
        echo $exibe ['preco'].'<br>';
        echo $exibe ['desc_ed'].'<br>';
        echo '<hr>';
       };

    ?>

</body>
</html>