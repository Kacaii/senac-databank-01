CREATE DATABASE AyresDB;

USE AyresDB;

CREATE TABLE
    departamentos (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(255),
        bloco VARCHAR(40)
    );

CREATE TABLE
    empregados (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(255),
        salario INT,
        matricula INT,
        data_nascimento DATE,
        id_departamento INT,
        FOREIGN key (id_departamento) REFERENCES departamentos (id)
    );

INSERT INTO
    departamentos (nome, bloco)
VALUES
    ('TI', 'Bloco B'),
    ('RH', 'Bloco C'),
    ('FI', 'Bloco A'),
    ('Admin', 'Bloco B');

INSERT INTO
    empregados (
        nome,
        salario,
        matricula,
        data_nascimento,
        id_departamento
    )
VALUES
    ('Tamires Oliveira', 1024, 357, '1998-01-07', 04),
    ('Roberta Miranda', 3065, 357, '2001-01-07', 1),
    ('Cáscio Silva', 5365, 147, '1999-08-01', 4),
    ('Maria Silva', 7824, 357, '2010-07-10', 1);

START TRANSACTION;

UPDATE empregados
SET
    salario = salario * 1.1
WHERE
    id_departamento = 1;

COMMIT;
