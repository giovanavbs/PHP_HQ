<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>menu</title>
    <!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery livraria -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- JavaScript compilado-->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
    .navbar{
        margin-bottom:0;
    }
</style>

</head>
<body>
   <?php 

   session_start();

   include 'conexao.php';
    include 'nav.php';
    include 'cabecalho.html';

     // variavel consulta vai receber variavel $cn que recebera o resultado de uma query
     $consulta = $cn->query('SELECT cod_hq, nome_hq, preco, desc_capa, qtd FROM tb_hq;');

    ?>

   <div class="container-fluid">
        <div class="row">
            <!-- vai criar 3 linhas de 4 colunas, bootstrap divide em 12 colunas -->
            <?php while ($exibe = $consulta->fetch(PDO::FETCH_ASSOC)){  ?>
            <div class="col-sm-3">
                <img src="img_teste/<?php echo $exibe['desc_capa']; ?>" class="img-responsive" style="width=100%">             
                <div><h4><b><?php echo mb_strimwidth($exibe['nome_hq'],0,30,'...'); ?></b></h4></div>
                <div><h5>R$ <?php echo number_format($exibe['preco'],2,',','.'); ?></h5></div>
           
                <div class="text-center">
                    <a href="detalhes.php?cod=<?php echo $exibe['cod_hq'];?>">
                    <button class="btn btn-lg btn-block btn-primary">
                        <span class="glyphicon glyphicon-question-sign"> detalhes</span>
                    </button>
                    </a>
                </div>

                <div class="text-center" style="margin-top:5px; margin-bottom:5px;">
                  
                    <?php if($exibe['qtd'] > 0) { ?>
                    <button class="btn btn-lg btn-block btn-danger">
                        <span class="glyphicon glyphicon-usd"> comprar</span>
                    </button>

                    <?php } else { ?>

                        <button class="btn btn-lg btn-block btn-danger" disabled>
                        <span class="glyphicon glyphicon-alert"> indisponível</span>
                    </button>

                    <?php } ?>
                </div>
            </div>
            <?php } ?>
        </div>
    </div>
<?php 
    include 'rodape.html';
 ?>
</body>
</html>