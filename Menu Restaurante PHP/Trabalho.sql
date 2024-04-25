-- Criação do banco de dados "RESTAURANTE_MCPF"
CREATE DATABASE RESTAURANTE_MCPF;
USE RESTAURANTE_MCPF;

-- Criação da tabela "Venda_Pedido"
CREATE TABLE Venda_Pedido (
    valor_venda FLOAT,
    id_venda INT,
    fk_Funcionario_id_funcionario INT,
    fk_Cliente_id_cliente INT,
    id_pedido INT PRIMARY KEY,
    hora_pedido TIME,
    valor_pedido FLOAT,
    fk_Funcionario_id_funcionario_ INT,
    fk_Mesa_id_pedido INT
);

-- Criação da tabela "Funcionario"
CREATE TABLE Funcionario (
    id_funcionario INT PRIMARY KEY,
    nome_funcionario VARCHAR(255),
    funcao_funcionario VARCHAR(255)
);

-- Criação da tabela "Recebimento"
CREATE TABLE Recebimento (
    valor_recebimento FLOAT,
    id_recebimento INT PRIMARY KEY,
    fk_Caixa_id_caixa INT
);

-- Criação da tabela "Caixa"
CREATE TABLE Caixa (
    id_caixa INT PRIMARY KEY,
    saldo_inicial_caixa FLOAT,
    total_recebimento_caixa FLOAT,
    saldo_final_caixa FLOAT,
    data_caixa DATE
);

-- Criação da tabela "Compra"
CREATE TABLE Compra (
    valor_compra FLOAT,
    id_compra INT PRIMARY KEY,
    fk_Funcionario_id_funcionario INT,
    fk_Fornecedor_id_fornecedor INT
);

-- Criação da tabela "Fornecedor"
CREATE TABLE Fornecedor (
    id_fornecedor INT PRIMARY KEY,
    nome_fornecedor VARCHAR(255),
    cnpj_fornecedor varchar(255)
);

-- Criação da tabela "Produto"
CREATE TABLE Produto (
    nome_produto VARCHAR(255),
    estoque_produto BOOLEAN,
    valor_produto FLOAT,
    id_produto INT PRIMARY KEY
);

-- Criação da tabela "Cliente"
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    nome_cliente VARCHAR(255),
    cpf_cliente varchar(255)
);

-- Criação da tabela "Refeicao"
CREATE TABLE Refeicao (
    id_refeicao INT PRIMARY KEY,
    Kilo_refeicao FLOAT
);

-- Criação da tabela "Mesa"
CREATE TABLE Mesa (
    status_pedido VARCHAR(255),
    numeracao_pedido INT,
    id_pedido INT PRIMARY KEY
);

-- Criação da tabela "Ingrediente"
CREATE TABLE Ingrediente (
    id_ingrediente INT PRIMARY KEY,
    nome_ingrediente VARCHAR(255),
    quantidade_disponivel INT
);

-- Criação da tabela "Relatorio_Vendas"
CREATE TABLE Relatorio_Vendas (
    id_relatorio INT PRIMARY KEY,
    periodo_inicio DATE,
    periodo_fim DATE,
    valor_total FLOAT

);
-- Criação da tabela "Prato"
CREATE TABLE Prato (
    id_prato INT PRIMARY KEY,
    nome_prato VARCHAR(255),
    descricao_prato VARCHAR(255),
    preco_prato FLOAT
);

-- Criação da tabela "Prato_Ingrediente"
CREATE TABLE Prato_Ingrediente (
    id_prato INT,
    id_ingrediente INT,
    quantidade_utilizada INT,
    PRIMARY KEY (id_prato, id_ingrediente),
    FOREIGN KEY (id_prato) REFERENCES Prato (id_prato),
    FOREIGN KEY (id_ingrediente) REFERENCES Ingrediente (id_ingrediente)
);

-- Criação da tabela "Prato_Mais_Vendido"
CREATE TABLE Prato_Mais_Vendido (
    id_prato INT PRIMARY KEY,
    nome_prato VARCHAR(255),
    quantidade_vendida INT
);


-- Criação da tabela "Mesa_Pedido"
CREATE TABLE Mesa_Pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    status_pedido VARCHAR(255),
    numeracao_pedido INT,
    fk_Mesa_id_pedido INT,
    FOREIGN KEY (fk_Mesa_id_pedido) REFERENCES Mesa (id_pedido)
);

-- Criação da tabela "Pedido_Ingrediente"
CREATE TABLE Pedido_Ingrediente (
    id_pedido INT,
    id_ingrediente INT,
    quantidade_utilizada INT,
    PRIMARY KEY (id_pedido, id_ingrediente),
    FOREIGN KEY (id_pedido) REFERENCES Mesa_Pedido (id_pedido),
    FOREIGN KEY (id_ingrediente) REFERENCES Ingrediente (id_ingrediente)
);



-- Inserção de dados na tabela "Venda_Pedido"
INSERT INTO Venda_Pedido (valor_venda, id_venda, fk_Funcionario_id_funcionario, fk_Cliente_id_cliente, id_pedido, hora_pedido, valor_pedido, fk_Funcionario_id_funcionario_, fk_Mesa_id_pedido)
VALUES (100.00, 1, 1, 1, 1, '12:30:00', 80.00, 1, 1),
       (150.00, 2, 2, 2, 2, '18:45:00', 120.00, 2, 2),
       (200.00, 3, 1, 3, 3, '20:15:00', 180.00, 1, 3);

-- Inserção de dados na tabela "Funcionario"
INSERT INTO Funcionario (id_funcionario, nome_funcionario, funcao_funcionario)
VALUES (1, 'João Silva', 'Garçom'),
       (2, 'Maria Souza', 'Cozinheira'),
       (3, 'Pedro Santos', 'Atendente');

-- Inserção de dados na tabela "Recebimento"
INSERT INTO Recebimento (valor_recebimento, id_recebimento, fk_Caixa_id_caixa)
VALUES (100.00, 1, 1),
       (150.00, 2, 1),
       (200.00, 3, 2);

-- Inserção de dados na tabela "Caixa"
INSERT INTO Caixa (id_caixa, saldo_inicial_caixa, total_recebimento_caixa, saldo_final_caixa, data_caixa)
VALUES (1, 500.00, 100.00, 600.00, '2023-06-14'),
       (2, 700.00, 250.00, 950.00, '2023-06-15'),
       (3, 1000.00, 350.00, 1350.00, '2023-06-16');

-- Inserção de dados na tabela "Compra"
INSERT INTO Compra (valor_compra, id_compra, fk_Funcionario_id_funcionario, fk_Fornecedor_id_fornecedor)
VALUES (200.00, 1, 1, 1),
       (300.00, 2, 2, 2),
       (400.00, 3, 1, 3);

-- Inserção de dados na tabela "Fornecedor"
INSERT INTO Fornecedor (id_fornecedor, nome_fornecedor, cnpj_fornecedor)
VALUES (1, 'Distribuidora Alimentos Ltda', '12345678901234'),
       (2, 'Fornecedor XfornecedorYZ Ltda', '98765432109876'),
       (3, 'Fornecedor ABC Ltda', '56789012345678');
       
       
       
-- Inserção de dados na tabela "Produto"
INSERT INTO Produto (nome_produto, estoque_produto, valor_produto, id_produto)
VALUES ('Arroz', true, 10.00, 1),
       ('Feijão', true, 8.50, 2),
       ('Carne', true, 20.00, 3);

-- Inserção de dados na tabela "Cliente"
INSERT INTO Cliente (id_cliente, nome_cliente, cpf_cliente)
VALUES (1, 'João Silva', '12345678901'),
       (2, 'Maria Santos', '98765432109'),
       (3, 'Pedro Almeida', '56789012345');
       
-- Inserção de dados na tabela "Refeicao"
INSERT INTO Refeicao (id_refeicao, Kilo_refeicao)
VALUES (1, 0.5),
       (2, 0.3),
       (3, 0.8);

-- Inserção de dados na tabela "Mesa"
INSERT INTO Mesa (status_pedido, numeracao_pedido, id_pedido)
VALUES ('Ocupada', 1, 1),
       ('Livre', 2, 2),
       ('Ocupada', 3, 3);

-- Inserção de dados na tabela "Ingrediente"
INSERT INTO Ingrediente (id_ingrediente, nome_ingrediente, quantidade_disponivel)
VALUES (1, 'Sal', 500),
       (2, 'Pimenta', 300),
       (3, 'Azeite', 200);
       
       -- Inserção de dados na tabela "Prato"
INSERT INTO Prato (id_prato, nome_prato, descricao_prato, preco_prato)
VALUES (1, 'Feijoada', 'Deliciosa feijoada brasileira', 25.00),
       (2, 'Lasanha', 'Clássica lasanha italiana', 18.50),
       (3, 'Strogonoff', 'Saboroso strogonoff de carne', 22.00);


-- Inserção de dados na tabela "Relatorio_Vendas"
INSERT INTO Relatorio_Vendas (id_relatorio, periodo_inicio, periodo_fim, valor_total)
VALUES (1, '2023-06-01', '2023-06-30', 1500.00),
       (2, '2023-07-01', '2023-07-31', 2000.00),
       (3, '2023-08-01', '2023-08-31', 1800.00);

-- Inserção de dados na tabela "Prato_Mais_Vendido"
INSERT INTO Prato_Mais_Vendido (id_prato, nome_prato, quantidade_vendida)
VALUES (1, 'Feijoada', 50),
       (2, 'Lasanha', 40),
       (3, 'Strogonoff', 35);

-- Inserção de dados na tabela "Prato_Ingrediente"
INSERT INTO Prato_Ingrediente (id_prato, id_ingrediente)
VALUES (1, 1),
       (1, 2),
       (2, 2),
       (2, 3);

-- Inserção de dados na tabela "Mesa_Pedido"
INSERT INTO Mesa_Pedido (status_pedido, numeracao_pedido, fk_Mesa_id_pedido)
VALUES ('Ocupada', 1, 1),
       ('Livre', 2, 2),
       ('Ocupada', 3, 3);
       
-- Inserção de dados na tabela "Pedido_Ingrediente"
INSERT INTO Pedido_Ingrediente (id_pedido, id_ingrediente, quantidade_utilizada)
VALUES (1, 1, 2),
       (1, 2, 1),
       (2, 3, 3),
       (2, 1, 1),
       (3, 2, 2),
       (3, 3, 2);

-- Consulta de todos os dados da tabelas
SELECT * FROM Venda_Pedido;
SELECT * FROM Funcionario;
SELECT * FROM Recebimento;
SELECT * FROM Caixa;
SELECT * FROM Compra;
SELECT * FROM Fornecedor;
SELECT * FROM Produto;
SELECT * FROM Cliente;
SELECT * FROM Refeicao;
SELECT * FROM Mesa;
SELECT * FROM Ingrediente;
SELECT * FROM Relatorio_Vendas;
SELECT * FROM Prato_Mais_Vendido;
SELECT * FROM Prato_Ingrediente;
SELECT * FROM Mesa_Pedido;
SELECT * FROM Pedido_Ingrediente;
SELECT *FROM Prato;

SET SQL_SAFE_UPDATES=0;

-- Atualização do estoque de ingredientes após um pedido
UPDATE Ingrediente
JOIN Pedido_Ingrediente ON Ingrediente.id_ingrediente = Pedido_Ingrediente.id_ingrediente
SET Ingrediente.quantidade_disponivel = CAST(Ingrediente.quantidade_disponivel AS SIGNED) - Pedido_Ingrediente.quantidade_utilizada
WHERE Pedido_Ingrediente.id_pedido = 80;

SELECT * FROM Ingrediente;

SELECT p.nome_prato, pmv.quantidade_vendida
FROM Prato p
JOIN Prato_Mais_Vendido pmv ON p.id_prato = pmv.id_prato
ORDER BY pmv.quantidade_vendida DESC;









