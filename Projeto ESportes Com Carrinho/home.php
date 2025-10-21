<?php
$connect = mysql_connect('localhost','root','');
$db      = mysql_select_db('loja');

session_start();

$status="";

if (isset($_POST['codigo']) && $_POST['codigo']!=""){
   $codigo = $_POST['codigo'];
   $resultado = mysql_query("SELECT descricao,preco,foto1 FROM produto WHERE codigo = '$codigo'");
   $row = mysql_fetch_assoc($resultado);
   $descricao = $row['descricao'];
   $preco = $row['preco'];
   $foto1 = $row['foto1'];

   $cartArray = array($codigo => array(
     'codigo' => $codigo, 
     'descricao' => $descricao,
     'preco' => $preco,
     'quantity' => 1,
     'foto' => $foto1
 ));

   if(empty($_SESSION["shopping_cart"])) {
     $_SESSION["shopping_cart"] = $cartArray;
     $status = "<div class='box'>Produto foi add ao carrinho !</div>";
     }
     else{
     $array_keys = array_keys($_SESSION["shopping_cart"]);
 
    if(in_array($codigo,$array_keys)) {
      $status = "<div class='box' style='color:red;'>
      Produto foi adicionado ao carrinho!</div>";
     }
     else {
     $_SESSION["shopping_cart"] = array_merge($_SESSION["shopping_cart"],$cartArray);
     $status = "<div class='box'>Produto  foi add ao carrinho!</div>";
      }
 
      }

 }
 ?>

<?php
if(!empty($_SESSION["shopping_cart"])) 
     $cart_count = count(array_keys($_SESSION["shopping_cart"]));
?>
<div class="cart_div">
<a href="cart.php"><img src="css/carrinho.png" height=50 width=50/>Carrinho<span>
<?php echo $cart_count; ?></span></a>
</div>


<div style="clear:both;"></div>

<div class="message_box" style="margin:10px 0px;">
<?php echo $status; ?>
</div>




 
<HTML>
<HEAD>
<link rel="stylesheet" href="css/styles.css">
 <TITLE>PowerPlay - Home</TITLE>
</HEAD>
<body>
    <form name="formulario" method="post" action="home.php">
      <div id="imga">
       <img src="css/Logo.png" width=20% align="left">
       </div>
       <a href="usuario.html"><img src="css/Login.png" width=15% align="right"></a>
       <br><br>
       <div class="titulo">
       <h1>Produtos Mais Buscados <br> Filtros:</h1><br>
       </div>
       <br><br>
       
       <!------ pesquisar Categorias -------------->
          <div id="select">
        <label for="">Categoria: </label>
        <select name="categoria">
        <option value="" selected="selected">Selecione...</option>
        </div>
 
        <?php
        $query = mysql_query("SELECT codigo, nome FROM categoria");
        while($categoria = mysql_fetch_array($query))
        {?>
        <option value="<?php echo $categoria['codigo']?>">
                       <?php echo $categoria['nome']   ?></option>
        <?php }
        ?>
        </select>
       
        <!------ pesquisar Classificacao -------------->
        
        <label for="">Tipo: </label>
        <select name="tipo">
        <option value="" selected="selected">Selecione...</option>
        
        <?php
        $query = mysql_query("SELECT codigo, nome FROM tipo");
        while($tipo = mysql_fetch_array($query))
        {?>
        <option value="<?php echo $tipo['codigo']?>">
                       <?php echo $tipo['nome']   ?></option>
        <?php }
        ?>
        </select>
       
       <!------ pesquisar marcas -------------->
       
       <label for="">Marcas: </label>
        <select name="marca">
        <option value="" selected="selected">Selecione...</option>
       
 
        <?php
        $query = mysql_query("SELECT codigo, nome FROM marca");
        while($marca = mysql_fetch_array($query))
        {?>
        <option value="<?php echo $marca['codigo']?>">
                       <?php echo $marca['nome']   ?></option>
        <?php }
        ?>
        </select>
        <div id="btn2">
        <input  type="submit" name="pesquisar" value="Filtrar">
        </div>
    </form>
<br><br>
<?php
 
if (isset($_POST['pesquisar']))
{
//verifica que a op��o marca e modelo foi selecionada ou n�o
$marca          = (empty($_POST['marca']))? 'null' : $_POST['marca'];
$categoria      = (empty($_POST['categoria']))? 'null' : $_POST['categoria'];
$tipo  = (empty($_POST['tipo']))? 'null' : $_POST['tipo'];
 
//---------- pesquisar  marca escolhida ----------------
 
if (($marca <> 'null') and ($categoria == 'null') and ($tipo == 'null'))
{
     $sql_produtos = "SELECT produto.codigo, produto.descricao, produto.cor, produto.tamanho, produto.preco, produto.foto1, produto.foto2
                            FROM produto, marca, categoria, tipo
                            WHERE produto.codmarca = marca.codigo
                            and produto.codcategoria = categoria.codigo
                            and produto.codtipo = tipo.codigo
                            and marca.codigo = $marca ";
                           
     $seleciona_produtos = mysql_query($sql_produtos);
}
 
//---------- pesquisar categoria escolhida ----------------
 
if (($marca == 'null') and ($categoria <> 'null') and ($tipo == 'null'))
{
     $sql_produtos = "SELECT produto.codigo, produto.descricao, produto.cor, produto.tamanho, produto.preco, produto.foto1, produto.foto2
                            FROM produto, marca, categoria, tipo
                            WHERE produto.codmarca = marca.codigo
                            and produto.codcategoria = categoria.codigo
                            and produto.codtipo = tipo.codigo
                            and categoria.codigo = $categoria ";
                           
     $seleciona_produtos = mysql_query($sql_produtos);
}
 
//---------- pesquisar marca e categoria escolhida ----------------
 
//---------- pesquisar tipo escolhido ----------------
 
if (($marca == 'null') and ($categoria == 'null') and ($tipo <> 'null'))
{
     $sql_produtos = "SELECT produto.codigo, produto.descricao, produto.cor, produto.tamanho, produto.preco, produto.foto1, produto.foto2
                            FROM produto, marca, categoria, tipo
                            WHERE produto.codmarca = marca.codigo
                            and produto.codcategoria = categoria.codigo
                            and produto.codtipo = tipo.codigo
                            and tipo.codigo = $tipo ";
                           
     $seleciona_produtos = mysql_query($sql_produtos);
}

if (($marca <> 'null') and ($categoria <> 'null') and ($tipo == 'null'))
{
     $sql_produtos = "SELECT produto.codigo, produto.descricao, produto.cor, produto.tamanho, produto.preco, produto.foto1, produto.foto2
                            FROM produto, marca, categoria, tipo
                            WHERE produto.codmarca = marca.codigo
                            and produto.codcategoria = categoria.codigo
                            and produto.codtipo = tipo.codigo
                            and marca.codigo = $marca 
                            and categoria.codigo = $categoria";
                           
     $seleciona_produtos = mysql_query($sql_produtos);
}

if (($marca == 'null') and ($categoria <> 'null') and ($tipo <> 'null'))
{
     $sql_produtos = "SELECT produto.codigo, produto.descricao, produto.cor, produto.tamanho, produto.preco, produto.foto1, produto.foto2
                            FROM produto, marca, categoria, tipo
                            WHERE produto.codmarca = marca.codigo
                            and produto.codcategoria = categoria.codigo
                            and produto.codtipo = tipo.codigo
                            and tipo.codigo = $tipo 
                            and categoria.codigo = $categoria";
                           
     $seleciona_produtos = mysql_query($sql_produtos);
}

if (($marca <> 'null') and ($categoria == 'null') and ($tipo <> 'null'))
{
     $sql_produtos = "SELECT produto.codigo, produto.descricao, produto.cor, produto.tamanho, produto.preco, produto.foto1, produto.foto2
                            FROM produto, marca, categoria, tipo
                            WHERE produto.codmarca = marca.codigo
                            and produto.codcategoria = categoria.codigo
                            and produto.codtipo = tipo.codigo
                            and tipo.codigo = $tipo
                            and marca.codigo = $marca";
                           
     $seleciona_produtos = mysql_query($sql_produtos);
}

if (($marca <> 'null') and ($categoria <> 'null') and ($tipo <> 'null'))
{
     $sql_produtos = "SELECT produto.codigo, produto.descricao, produto.cor, produto.tamanho, produto.preco, produto.foto1, produto.foto2
                            FROM produto, marca, categoria, tipo
                            WHERE produto.codmarca = marca.codigo
                            and produto.codcategoria = categoria.codigo
                            and produto.codtipo = tipo.codigo
                            and tipo.codigo = $tipo
                            and marca.codigo = $marca
                            and categoria.codigo = $categoria";
                           
     $seleciona_produtos = mysql_query($sql_produtos);
}
 
//---------- pesquisar marca e categoria e tipo escolhido ----------------
 
// colocar mais filtros ?????
 
 
 
//---------- mostrar as informa��es dos produtos  ----------------
if(mysql_num_rows($seleciona_produtos) == 0)
{
   echo '<h1>Desculpe, mas sua busca nao retornou resultados ... </h1>';
}
else
{
   echo "Resultado da pesquisa de Produtos: <br><br>";
   while ($dados = mysql_fetch_object($seleciona_produtos))
{
    echo "<form method='post' action=''>";
    echo "<input type='hidden' name='codigo' value='".$dados->codigo."' />";
    echo "Descricao: ".$dados->descricao." ";
    echo " / Cor: ".$dados->cor." ";
    echo " / Tamanho: ".$dados->tamanho." ";
    echo " / Preco: R$".$dados->preco."<br><br>";
    echo '<img src="fotos/'.$dados->foto1.'" width="200" /> ';
    echo '<img src="fotos/'.$dados->foto2.'" width="200" /><br><br>';
    echo "<button type='submit' class='buy'>COMPRAR</button>";
    echo "</form><br><br>";
}
   }
   
}
?>
</body>
 
</HTML>
 