<?php
//conectar com banco dados
$conectar = mysql_connect('localhost','root','');
$banco    = mysql_select_db('loja');

if (isset($_POST['Gravar']))
{
//receber as variaveis do HTML
    $codigo       = $_POST['codigo'];
    $nome           = $_POST['nome'];

    $sql = "insert into categoria (codigo,nome)
            values ('$codigo','$nome')";

    $resultado = mysql_query($sql);
    
    if ($resultado == TRUE)
    {
         echo "Dados gravados com sucesso.";
    }
    else
    {
         echo "Erro ao gravar os dados.";
    }
}
if (isset($_POST['Alterar']))
{
    //receber as variaveis do HTML
    $nome = $_POST['nome'];
    $codigo = $_POST['codigo'];

    $sql = "update categoria set nome = '$nome' where codigo = '$codigo'";

    $resultado = mysql_query($sql);

    if ($resultado == TRUE)
    {
        echo "Dados alterados com sucesso.";
    }
    else
    {
        echo "Erro ao alterar os dados";
    }
}
if (isset($_POST['Excluir']))
{
    //receber as variaveis do HTML
    $nome = $_POST['nome'];
    $codigo = $_POST['codigo'];

    $sql = "delete from categoria
            where codigo = '$codigo'";

    $resultado = mysql_query($sql);

    if ($resultado == TRUE)
    {
        echo "Dados deletados";
    }
    else
    {
        echo "Erro ao excluir dados";
    }
}
if (isset($_POST['Pesquisar']))
{
    $sql = "select * from categoria";

    $resultado = mysql_query($sql);

    if (mysql_num_rows($resultado) == 0)
    {
        echo "Dados não encontrados";
    }
    else
    {
        echo "<b>"."Pesquisa por Categorias: "."</b><br>";
        while($dados = mysql_fetch_array($resultado))
    
        echo "Codigo :".$dados['codigo']."<br>".
             "Nome   :".$dados['nome']."<br><br>";
    }
}
?>