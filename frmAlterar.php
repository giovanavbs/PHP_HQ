<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Minha Loja - Logon de usuário</title>
	
<meta name="viewport" content="width=device-width, initial-scale=1">
	
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<script src="jquery.mask.js"></script>

<script>
	
	
/* mscara para o preço */	
$(document).ready(function(){
	
$('#preco').mask('000.000.000.000.000,00', {reverse: true});	
	
});
	
</script>
	
<style>

.navbar{
	margin-bottom: 0;
}
	
	
</style>
	
	
	
	
</head>

<body>
	
<?php
	
	
    session_start();	
	
    // se a sessão id estiver vazia ou se a sessão estatus for diferente de adm entao execute
        if(empty($_SESSION['Status']) || $_SESSION['Status'] != 1){
                header('location:index.php');  // redireciona para página index.php
        }
	// recuperando os IDs enviados pela pagina lista.php
	$cd = $_GET['id']; 
	$cd2 = $_GET['id2'];
	$cd3 = $_GET['id3'];
	
	
	include 'conexao.php';	
	include 'nav.php';
	include 'cabecalho.html';
	
	
	$consulta = $cn->query("SELECT * FROM tb_hq WHERE cod_hq='$cd'");	
	$exibe = $consulta->fetch(PDO::FETCH_ASSOC);
	
	$consultaCat = $cn->query("SELECT cod_ed, desc_ed FROM tb_edicao where cod_ed ='$cd2' union select cod_ed, desc_ed FROM tb_edicao where cod_ed !='$cd2'");
	
	$consultaAutor = $cn->query("SELECT cod_autor, nome_autor FROM tb_autor where cod_autor='$cd3' union select cod_autor, nome_autor FROM tb_autor where cod_autor !='$cd3'");
	
	?>
	
	
	<div class="container-fluid">
	
		<div class="row">
		
			<div class="col-sm-4 col-sm-offset-4">
				
				<h2>Alteração de produto</h2>
				
				<form method="post" action="alterarProduto.php?cd_altera=<?php echo $cd; ?>" name="incluiProd" enctype="multipart/form-data">
				
					<div class="form-group">
				
						<label for="txtisbn">Isbn</label>
						<input type="text" name="txtisbn" value="<?php echo $exibe['num_isbn']; ?>"  class="form-control" required id="txtisbn">
					</div>
				
					<div class="form-group">					

						<label for="sltcat">Categoria</label>

						<select class="form-control" name="sltcat">
							<?php					
								while($exibecat = $consultaCat->fetch(PDO::FETCH_ASSOC)){
							?>
							<option value="<?php echo $exibecat['cod_ed'];?>"><?php echo $exibecat['desc_ed'];?></option>;
							<?php }	?>	
						</select>
					</div>
					
					<div class="form-group">
				
						<label for="txtlivro">Nome do Livro</label>
						<input type="text" name="txtlivro" value="<?php echo $exibe['nome_hq']; ?>"  class="form-control" required id="txtlivro">
					</div>
					
					<div class="form-group">					

						<label for="sltautor">Autor</label>

						<select class="form-control" name="sltautor">
							<?php					
								while($exibeautor = $consultaAutor->fetch(PDO::FETCH_ASSOC)){
							?>
							<option value="<?php echo $exibeautor['cod_autor'];?>"><?php echo $exibeautor['nome_autor'];?></option>;
							<?php }	?>	
						</select>
					</div>
		
					
					<div class="form-group">
				
					<label for="txtpag">Número de páginas</label>
					
					<input type="number" class="form-control" value="<?php echo $exibe['num_pag']; ?>" name="txtpag" required id="txtpag">

					</div>
					
					<div class="form-group">
				
					<label for="preco">Preço</label>
					
					<input type="text" class="form-control" required name="txtpreco" value="<?php echo $exibe['preco']; ?>" id="preco">

					</div>
					
					<div class="form-group">
				
					<label for="txtqtde">Quantidade em Estoque</label>
					
					<input type="number" class="form-control" name="txtqtde" value="<?php echo $exibe['qtd']; ?>" required id="txtqtde">

					</div>
					
					<div class="form-group">
				
					<label for="txtresumo">Resumo da obra</label>
					
						<textarea rows="5" class="form-control" name="txtresumo"><?php echo $exibe['desc_hq']; ?></textarea>
						

					</div>
					
					<div class="form-group">
				
					<label for="txtfoto1">Foto Principal</label>
					
					<input type="file" accept="img_sm/*" class="form-control" name="txtfoto1" id="foto1">

					</div>
					
					<div class="form-group">
						
					<img src="img_sm/<?php echo $exibe['desc_capa']; ?>" width="100px" >
						
					</div>
					
					<div class="form-group">
				
					<label for="sltlanc">Lançamento?</label>
					
					<select class="form-control" name="sltlanc">					  				
					<!-- se o sg_lancamento == S este valor estará selecionado senão vazio -->
					<option value="S" <?=($exibe['sg_lancamento'] == 'S')?'selected':''?>>Sim</option>	<option value="N" <?=($exibe['sg_lancamento'] == 'N')?'selected':''?>>Não</option>	  
					</select>
						

					</div>
						
					<button type="submit" class="btn btn-lg btn-default">
					
					<span class="glyphicon glyphicon-pencil"> Alterar </span>
					
				</button>
				
				</form>
				
			</div>
		</div>
	</div>
	
	<?php include 'rodape.html' ?>
	
</body>
</html>