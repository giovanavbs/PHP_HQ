<!doctype html>

<html lang="pt-br">
<head>
<meta charset="utf-8">
<title>Minha Loja</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	
	<style>
	
	.navbar{
		margin-bottom: 0;
	}
	
	
	</style>
	
	
	
</head>

<body>	
	
	<?php
	
	session_start();
	
	include 'conexao.php';	
	include 'nav.php';
	include 'cabecalho.html';

    if(!empty ($_GET['cod'])){ // se nao estiver vazia a variavel cd
	$cod_hq = $_GET['cod'];

    $consulta = $cn ->query("select * from vw_hq where cod_hq = '$cod_hq'");
    $exibe = $consulta ->fetch(PDO::FETCH_ASSOC);
    } else {
        header("location:index.php");
    }

	?>
	
<div class="container-fluid">
	
	
	
	<div class="row">
		
		 <div class="col-sm-4 col-sm-offset-1">
			 
			 <h1>Detalhes do Produto</h1>
			 
			 <img src="img_sm/<?php echo $exibe['desc_capa'];?>" class="img-responsive" style="width:100%;">
			
		</div>
		
				
 		 <div class="col-sm-7"><h1><?php echo $exibe['nome_hq'];?></h1>
		
		<p><?php echo $exibe['desc_hq'];?></p>
		
        <p><b>ISBN: </b><?php echo $exibe['num_isbn'];?></p>

        <p><b>Categoria: </b><?php echo $exibe['desc_ed'];?></p>

		<p><b>Nome do Autor: </b><?php echo $exibe['nome_autor'];?></p>

        <p><b>Numero de Páginas:</b> <?php echo $exibe['num_pag'];?></p>
		
		<p><h5><b>Preço: </b>R$ <?php echo number_format($exibe['preco'],2,',','.');?></h5></p>
			 

		<button class="btn btn-lg btn-success">Comprar</button>
				
		</div>		
	

	
</div>
	
	<?php
	
	include 'rodape.html';
	
	?>
	
</body>
</html>