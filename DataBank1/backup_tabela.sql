-- Criando Tabelas

CREATE TABLE departamentos (
    id INTEGER,
    nome VARCHAR(255),
    bloco VARCHAR(40),
    PRIMARY KEY (id)
);

CREATE TABLE empregados (
    id INTEGER,
    nome VARCHAR(255),
    salario INT,
    matricula INT,
    data_nascimento DATE,
    id_departamento INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_departamento) REFERENCES departamentos (id)
);

-- Inserindo Dados

INSERT INTO departamentos (nome, bloco)
VALUES
('TI', 'Bloco B'),
('RH', 'Bloco C'),
('FI', 'Bloco A'),
('Admin', 'Bloco B');

INSERT INTO empregados (
    nome,
    salario,
    matricula,
    data_nascimento,
    id_departamento
)
VALUES
('Tamires Oliveira', 1024, 357, '1998-01-07', 4),
('Roberta Miranda', 3065, 357, '2001-01-07', 2),
('Cáscio Silva', 5365, 147, '1999-08-01', 3),
('Maria Silva', 7824, 357, '2010-07-10', 1);

-- Retorna a quantidade total dos empregados por departamento

SELECT
    id_departamento,
    ROUND(AVG(salario)) AS media_salarial
FROM empregados
GROUP BY id_departamento;

-- Lista o total de empregados na empresa

SELECT
    COUNT(id)
        AS total_empregados
FROM empregados; --  

-- Lista a media salarial, o menor e o maior salario

SELECT
    ROUND(AVG(salario)) AS media_salarial,
    ROUND(MIN(salario)) AS menor_salario,
    ROUND(MAX(salario)) AS maior_salario
FROM empregados;

-- Lista cada departamento com o total de salario pago

SELECT
    id_departamento,
    SUM(salario)
        AS salario_por_departamento
FROM
    empregados
GROUP BY
    id_departamento;
