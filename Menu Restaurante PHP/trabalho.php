<?php
$host = 'localhost';
$usuario = 'root';
$senha = '';
$bdnome = 'restaurante_mcpf';

$conexao = mysqli_connect($host, $usuario, $senha, $bdnome);

if (mysqli_connect_errno()) {
    die('Error: ' . mysqli_connect_errno());
}

// Verifica se o formulário foi enviado
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $cliente = $_POST['cliente'];
    $prato = $_POST['prato'];
    $mesa = $_POST['mesa'];
    $ingrediente = $_POST['ingrediente'];
    $preco = $_POST['preco'];

    // Insere o novo pedido no banco de dados
    $sql = "INSERT INTO pedido (cliente, prato, mesa, ingrediente, preco) VALUES ('$cliente', '$prato', '$mesa', '$ingrediente', $preco)";
    if (mysqli_query($conexao, $sql)) {
        echo "Pedido cadastrado com sucesso!";
    } else {
        echo "Erro ao cadastrar o pedido: " . mysqli_error($conexao);
    }
}

// Cria a tabela 'pedido' se não existir
$query = "CREATE TABLE IF NOT EXISTS pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente VARCHAR(100) NOT NULL,
    prato VARCHAR(100) NOT NULL,
    mesa INT NOT NULL,
    ingrediente VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
)";
if (mysqli_query($conexao, $query)) {
    echo "Tabela 'pedido' criada com sucesso!";
} else {
    echo "Erro ao criar a tabela 'pedido': " . mysqli_error($conexao);
}

// Consulta os pedidos cadastrados
$sql = "SELECT * FROM pedido";
$resultado = mysqli_query($conexao, $sql);

mysqli_close($conexao);

?>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://classless.de/classless.css">
    <title>Cadastro de Pedidos</title>
    <style>
        .hidden-table {
            display: none;
        }
        
        body {
            background-image: url("https://png.pngtree.com/background/20210710/original/pngtree-restaurant-food-poster-picture-image_1015893.jpg");
            background-size: cover;
            color: white;
        }
        
        /* Remove o fundo branco da barra de entrada de texto */
        input[type="text"],
        input[type="number"] {
            background-color: transparent;
            border: none;
            border-bottom: 1px solid white;
            color: white;
        }
        
        /* Estilize os botões */
        input[type="submit"],
        button {
            background-color: white;
            color: black;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            margin-top: 10px;
        }
        
        /* Estilize a tabela de pedidos */
        table {
            border-collapse: collapse;
            margin-top: 20px;
            color: white;
        }
        
        th, td {
            padding: 8px;
            text-align: left;
        }
        
        th {
            background-color: #333;
        }
        
        td {
            border-bottom: 1px solid white;
        }
    </style>
    <script>
        function mostrarPedidos() {
            var tabelasPedidos = document.getElementsByClassName("hidden-table");
            for (var i = 0; i < tabelasPedidos.length; i++) {
                tabelasPedidos[i].style.display = "table";
            }
        }
    </script>
</head>
<body class="classless">
    <h1>Cadastro de Pedidos</h1>
    <form method="POST" action="">
        <label for="cliente">Nome do Cliente:</label>
        <input type="text" id="cliente" name="cliente" required><br><br>

        <label for="prato">Prato:</label>
        <input type="text" id="prato" name="prato" required><br><br>

        <label for="mesa">Mesa:</label>
        <input type="number" id="mesa" name="mesa" required><br><br>

        <label for="ingrediente">Ingrediente:</label>
        <input type="text" id="ingrediente" name="ingrediente" required><br><br>

        <label for="preco">Preço:</label>
        <input type="number" id="preco" name="preco" required><br><br>

        <input type="submit" value="Cadastrar">
    </form>

    <button onclick="mostrarPedidos()">Mostrar Pedidos</button>

    <?php
    if (mysqli_num_rows($resultado) > 0) {
        echo "<table class='hidden-table'>";
        echo "<tr>";
        echo "<th>ID</th>";
        echo "<th>Cliente</th>";
        echo "<th>Prato</th>";
        echo "<th>Mesa</th>";
        echo "<th>Ingrediente</th>";
        echo "<th>Preço</th>";
        echo "</tr>";

        while ($row = mysqli_fetch_assoc($resultado)) {
            echo "<tr>";
            echo "<td>".$row['id']."</td>";
            echo "<td>".$row['cliente']."</td>";
            echo "<td>".$row['prato']."</td>";
            echo "<td>".$row['mesa']."</td>";
            echo "<td>".$row['ingrediente']."</td>";
            echo "<td>".$row['preco']."</td>";
            echo "</tr>";
        }

        echo "</table>";
    } else {
        echo "<p>Nenhum pedido cadastrado.</p>";
    }
    ?>
</body>
</html>

