<nav class="navbar navbar-light" style="background-color:#7a0c12">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">SpiderComic</a>
    </div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="index.php">Home <span class="sr-only">(current)</span></a></li>
        <li><a href="lanc.php">Lançamentos</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Categorias<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <!-- troquei o valor da variavel cat para procurar de acordo com a coluna cod_ed no lugar da desc_ed ja que todas as infos do select estao na tb_hq -->
            <li><a href="categoria.php?cat=1">Amazing Spider-Man</a></li>
            <li><a href="categoria.php?cat=2">The Spectacular Spider-Man</a></li>
            <li><a href="categoria.php?cat=3">Web of Spider-Man</a></li>
            <li><a href="categoria.php?cat=4">Sensational Spider-Man</a></li>
            <li><a href="categoria.php?cat=5">Peter Parker: Spider-Man</a></li>
            <li><a href="categoria.php?cat=6">Friendly Neighborhood Spider-Man</a></li>
            <li><a href="categoria.php?cat=7">Ultimate Spider-Man</a></li>
            <li><a href="categoria.php?cat=8">Best of Spider-Man</a></li>
            <li><a href="categoria.php?cat=9">Symbiote Spider-Man</a></li>
            <li><a href="categoria.php?cat=10">Ben Reilly: Spider-Man</a></li>
            <li><a href="categoria.php?cat=11">Essencial Spider-Man</a></li>
            <li><a href="categoria.php?cat=12">Miles Morales: Spider-Man</a></li>
            <li><a href="categoria.php?cat=13">Spider-Man: Spider-Verse</a></li>
            <li><a href="categoria.php?cat=14">Superior Spider-Man</a></li>
            <li><a href="categoria.php?cat=15">Avenging Spider-Man</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left" role="search" name="frmpesquisa" method="get" action="busca.php">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Buscar" name="txtBuscar">
        </div>
        <button type="submit" class="btn btn-default">Buscar</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">Contato</a></li>

      <?php if(empty($_SESSION['ID'])) { ?> <!-- se estiver vazia a sessão ID mostrar menu logon-->

        <li><a href="formlogon.php"><span class="glyphicon glyphicon-log-in"> Logon</a></li>
        <?php } else { // senao estiver vazia

          if($_SESSION['Status'] == 0) { //  se a sessão status valrr 0 mostrar o nome do usuario
          $consulta_usuario = $cn->query("select nome_usu from tbUsuario where cod_usu = '$_SESSION[ID]'");

          $exibe_usuario = $consulta_usuario->fetch(PDO::FETCH_ASSOC);
          
        ?>
          <li><a href="#"><span class="glyphicon glyphicon-user"> <?php echo $exibe_usuario['nome_usu']; ?> </a></li>
          <li><a href="sair.php"><span class="glyphicon glyphicon-log-out"> Sair</a></li>
         
          <?php } else { ?> <!-- senao for 0 vai ser 1 entao criar o botão adm -->
            <li><a href="adm.php"><button class="btn btn-sm btn-danger">Administrador</button></a></li>
            <li><a href="sair.php"><span class="glyphicon glyphicon-log-out"> Sair</a></li> 
          <?php } } ?>
        
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>