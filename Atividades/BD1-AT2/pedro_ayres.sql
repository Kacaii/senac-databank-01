-- A Atividade do dia 2024-10-10 começa na linha 78  

CREATE TABLE vendas (
    id_venda INTEGER, -- `INTEGER PRIMARY KEY` == ` INT AUTO_INCREMENT`
    produto TEXT,
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
('Celular', 'Eletronicos', 4, 230.00, '2024-10-10'), -- Adicionado recentemente
('Camisa_da_Nike', 'Roupa', 5, 50.00, '2024-10-10'); -- Adicionado recentemente


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

-- #4B

SELECT
    ROUND(AVG(preco_unidade))
        AS media_de_preco
FROM vendas
WHERE categoria = 'Higiene';

-- Atividade 10/10/2024

-- 'Quantas vendas foram realizadas na categoria "Alimentos" e "Eletrônicos"?'
--
SELECT
    COUNT(CASE
        WHEN categoria = 'Alimentos'
            THEN id_venda
    END)
        AS alimentos,
    COUNT(
        CASE
            WHEN categoria = 'Eletronicos'
                THEN id_venda
        END
    ) AS eletronicos
FROM vendas;

-- Quantas vendas foram realizadas no total?
--
SELECT COUNT(id_venda) AS total_vendas FROM vendas LIMIT 200;

-- Qual foi o menor preço por unidade vendido?
--
SELECT MIN(preco_unidade) AS menor_preco FROM vendas LIMIT 200;

-- Qual foi o maior preço por unidade vendido
--
SELECT MAX(preco_unidade) AS maior_preco FROM vendas LIMIT 200;

-- Qual foi o maior valor total de uma venda?
--
SELECT MAX(quantidade * preco_unidade) AS maior_valor_total FROM vendas;

-- Qual é a média de valor das vendas realizadas
-- na categoria "Higiene" e "Roupa"?
--
SELECT
    AVG(CASE
        WHEN categoria = 'Higiene'
            THEN quantidade * preco_unidade
    END)
        AS media_higiene,
    AVG(CASE
        WHEN categoria = 'Roupa'
            THEN quantidade * preco_unidade
    END)
        AS media_roupa
FROM vendas;
