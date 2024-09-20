-- Criando tabelas

create table produtos (
    id_produto integer primary key,
    nome varchar(255),
    categoria varchar(255),
    preco decimal,
    estoque int
);

create table clientes (
    id_cliente integer primary key,
    nome varchar(255),
    email varchar(255),
    telefone varchar(255)
);

create table vendas (
    id_venda integer primary key,
    id_produto int,
    id_cliente int,
    quantidade int,
    data_venda date,
    foreign key (id_produto) references produtos (id_produto),
    foreign key (id_cliente) references clientes (id_cliente)
);

-- Inserindo dados

insert into produtos (nome, categoria, preco, estoque) values
('iphone 8', 'smartphone', 1200.00, 15),
('redmi note 9', 'smartphone', 3500.00, 10),
('fones de ouvido', 'acessorios', 200.00, 25),
('carregador portatil', 'acessórios', 80.00, 40),
('monitor', 'perifericos', 900.00, 5);

insert into clientes (nome, email, telefone) values
('Maria Silva', 'maria.silva@example.com', '123456789'),
('João Santos', 'joao.santos@example.com', '987654321'),
('Ana Costa', 'ana.costa@example.com', '456123789'),
('Carlos Souza', 'carlos.souza@example.com', '321654987'),
('Beatriz Lima', 'beatriz.lima@example.com', '654987321');

insert into vendas (id_produto, id_cliente, quantidade, data_venda) values
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

update produtos set preco = 5600 where id_produto = 1;
update clientes set telefone = 123098567 where id_cliente = 1;

-- Removendo dados

delete from produtos where id_produto = 5;
delete from clientes where id_cliente = 5;

-- Consultando dados

select * from produtos where categoria = 'smartphone';
select * from vendas where data_venda = '2024-09-01';
