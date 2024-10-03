-- IMPORTANTE: A sINTaxe do SQLITE é ligeiramente diferente
-- da utilizada no MySQL.
-- Em vez de AUTO_INCREMENT, deve-se utilizar INTEGER
-- para números que aumentam automaticamente.


-- Criando tabelas

CREATE TABLE produtos (
    id_produto INTEGER PRIMARY KEY,
    nome VARCHAR(255),
    categoria VARCHAR(255),
    preco DECIMAL,
    estoque INT
);

CREATE TABLE clientes (
    id_cliente INTEGER PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255),
    telefone VARCHAR(255)
);

CREATE TABLE vendas (
    id_venda INTEGER PRIMARY KEY,
    id_produto INT,
    id_cliente INT,
    quantidade INT,
    data_venda DATE,
    FOREIGN KEY (id_produto) REFERENCES produtos (id_produto),
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);

-- Inserindo dados

INSERT INTO produtos (nome, categoria, preco, estoque) VALUES
('iphone 8', 'smartphone', 1200.00, 15),
('redmi note 9', 'smartphone', 3500.00, 10),
('fones de ouvido', 'acessorios', 200.00, 25),
('carregador portatil', 'acessórios', 80.00, 40),
('monitor', 'perifericos', 900.00, 5);

INSERT INTO clientes (nome, email, telefone) VALUES
('Maria Silva', 'maria.silva@example.com', '123456789'),
('João Santos', 'joao.santos@example.com', '987654321'),
('Ana Costa', 'ana.costa@example.com', '456123789'),
('Carlos Souza', 'carlos.souza@example.com', '321654987'),
('Beatriz Lima', 'beatriz.lima@example.com', '654987321');

INSERT INTO vendas (id_produto, id_cliente, quantidade, data_venda) VALUES
(1, 1, 2, '2024-09-01'),
(2, 2, 1, '2024-09-02'),
(3, 3, 3, '2024-09-03'),
(4, 4, 1, '2024-09-04'),
(5, 5, 2, '2024-09-05'),
(1, 2, 1, '2024-09-06'),
(2, 3, 5, '2024-09-07'),
(3, 4, 2, '2024-09-08'),
(4, 1, 1, '2024-09-09'),
(5, 3, 3, '2024-09-10');

-- Atualizando dados

UPDATE produtos SET preco = 5600 WHERE id_produto = 1;
UPDATE clientes SET telefone = 123098567 WHERE id_cliente = 1;

-- Removendo dados

DELETE FROM produtos WHERE id_produto = 5;
DELETE FROM clientes WHERE id_cliente = 5;

-- Consultando dados

SELECT * FROM produtos WHERE categoria = 'smartphone';
SELECT * FROM vendas WHERE data_venda = '2024-09-01';
SELECT * FROM vendas GROUP BY quantidade;
-- Vai ficar faltando o exercicio da receita total

-- Ordenando dados

SELECT * FROM produtos ORDER BY nome ASC;
SELECT * FROM clientes ORDER BY nome DESC;
