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

	// header pode não funcionar por conta dos includes - trocar pelo js "<html><script>location.href='index.php'</script></html>"
    
    if(empty($_GET['txtBuscar'])) {
        echo "<html><script>location.href='index.php'</script></html>";
    }

	$pesquisa = $_GET['txtBuscar'];
    $consulta = $cn->query("select * from vw_hq where nome_hq like concat ('%','$pesquisa','%') or nome_autor like concat ('%','$pesquisa','%')");
    if ($consulta->rowCount() == 0) { // ->rowCount() == 0 = nenhuma linha foi encontrada com a pesquisa
        echo "<html><script>location.href='erro2.php'</script></html>";
    }
	?>
	
<div class="container-fluid"> 
	
	
	<?php while ($exibe = $consulta->fetch(PDO::FETCH_ASSOC)) { ?>
	<div class="row" style="margin-top: 15px;">
		
		<div class="col-sm-1 col-sm-offset-1"><img src="img_teste/<?php echo $exibe['desc_capa'] ?>" class="img-responsive"></div>
		<div class="col-sm-5"><h4 style="padding-top:20px"><?php echo $exibe['nome_hq']; ?></h4></div>
		<div class="col-sm-2"><h4 style="padding-top:20px">R$ <?php echo number_format($exibe['preco'],2,',','.'); ?></h4></div>
		<div class="col-sm-2 col-xs-offset-right-1" style="padding-top:20px">
        <a href="detalhes.php?cod=<?php echo $exibe['cod_hq'];?>">
        <button class="btn btn-lg btn-block btn-default">
		<span class="glyphicon glyphicon-info-sign" style="color: cadetblue;"> Detalhes</span>
		</button>
        </a>
		
		
		</div> 
				
	</div>		
	<?php } ?>

	
</div>
	
	<?php
	
	include 'rodape.html';
	
	?>
	
</body>
</html>