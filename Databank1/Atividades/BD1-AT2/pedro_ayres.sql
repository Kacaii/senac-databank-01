-- sqlfluff: disable L003

-- A Atividade do dia 2024-10-10 começa na linha 78  
create table vendas (
    id_venda integer, -- `integer primary key` == ` int auto_increment`
    produto text,
    categoria text,
    quantidade int,
    preco_unidade decimal,
    data_venda date,
    primary key (id_venda)
);

-- drop table vendas;
insert into vendas (
    produto,
    categoria,
    quantidade,
    preco_unidade,
    data_venda
) values
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
('Camisa_da_Nike', 'Roupa', 5, 50.00, '2024-10-10');  -- Adicionado recentemente


-- #1A
select count(id_venda) as vendas_de_alimentos
from vendas
where categoria = 'Alimentos'
;


-- #1B
select count(id_venda) as vendas_totais
from vendas
;

-- #2A
select round(avg(preco_unidade / quantidade), 2) as preco_medio_por_unidade
from vendas
;

-- 2B
select round(avg(quantidade)) as quantidade_media_por_venda
from vendas
;

-- #3A
select min(preco_unidade) as menor_preco
from vendas
;

-- #3B
select max(preco_unidade) as maior_preco
from vendas
;

-- #4A
select max(preco_unidade * quantidade) as maior_venda
from vendas
;

-- #4B
select round(avg(preco_unidade)) as media_de_preco
from vendas
where categoria = 'Higiene'
;

-- Atividade 10/10/2024
-- 'Quantas vendas foram realizadas na categoria "Alimentos" e "Eletrônicos"?'
--
select
    count(case when categoria = 'Alimentos' then id_venda end) as alimentos,
    count(case when categoria = 'Eletronicos' then id_venda end) as eletronicos
from vendas
;

-- Quantas vendas foram realizadas no total?
--
select count(id_venda) as total_vendas
from vendas
limit 200
;


-- Qual foi o menor preço por unidade vendido?
--
select min(preco_unidade) as menor_preco
from vendas
limit 200
;

-- Qual foi o maior preço por unidade vendido
--
select max(preco_unidade) as maior_preco
from vendas
limit 200
;

-- Qual foi o maior valor total de uma venda?
--
select max(quantidade * preco_unidade) as maior_valor_total
from vendas
;

-- Qual é a média de valor das vendas realizadas
-- na categoria "Higiene" e "Roupa"?
--
select
    avg(
        case when categoria = 'Higiene' then quantidade * preco_unidade end
    ) as media_higiene,
    avg(
        case when categoria = 'Roupa' then quantidade * preco_unidade end
    ) as media_roupa
from vendas
;
