-- Adicionei um GIF no repositorio mostrando como interagir com a database

CREATE TABLE vendas (
    id_venda INTEGER, -- `INTEGER PRIMARY KEY` == ` INT AUTO_INCREMENT`
    produto TEXT, -- Usando `TEXT` ao inves de `VARCHAR(255)`
    categoria TEXT,
    quantidade INT,
    preco_unidade DECIMAL,
    data_venda DATE,
    PRIMARY KEY (id_venda)
);

-- DROP TABLE vendas;

INSERT INTO vendas (
    produto,
    categoria,
    quantidade,
    preco_unidade,
    data_venda
) VALUES
('Arroz', 'Alimentos', 5, 10.00, '2024-09-01'),
('Feijão', 'Alimentos', 3, 7.50, '2024-02-02'),
('Sabão', 'Limpeza', 2, 12.00, '2024-09-02'),
('Café', 'Alimentos', 6, 8.00, '2024-09-03'),
('Detergente', 'Limpeza', 4, 5.00, '2024-09-03'),
('Leite', 'Alimentos', 10, 4.50, '2024-09-04'),
('Sabonete', 'Higiene', 6, 3.00, '2024-09-04'),
('Pão', 'Alimentos', 15, 1.50, '2024-09-05'),
('Shampoo', 'Higiene', 1, 15.00, '2024-09-05'),
('Creme Dental', 'Higiene', 3, 8.00, '2024-09-06'),
('Celular', 'Eletronicos', 23, 235.00, '2024-10-10');

-- #1A

SELECT
    COUNT(id_venda)
        AS vendas_de_alimentos
FROM
    vendas
WHERE categoria = 'Alimentos';

-- #1B

SELECT COUNT(id_venda) AS vendas_totais FROM vendas;

-- #2A

SELECT
    ROUND(AVG(preco_unidade / quantidade), 2)
        AS preco_medio_por_unidade
FROM vendas;

-- #1B

SELECT ROUND(AVG(quantidade)) AS quantidade_media_por_venda FROM vendas;

-- #3A

SELECT MIN(preco_unidade) AS menor_preco FROM vendas;

-- #3B

SELECT MAX(preco_unidade) AS maior_preco FROM vendas;

-- #4A

SELECT MAX(preco_unidade * quantidade) AS maior_venda FROM vendas;

-- Atividade 10/10/2024
-- TODO: Terminar
--
SELECT COUNT(id_venda)
FROM vendas
WHERE categoria IN ('Alimentos', 'Eletronicos') GROUP BY categoria;
