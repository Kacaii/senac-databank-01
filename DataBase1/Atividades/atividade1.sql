CREATE database atividade;

use atividade;

CREATE TABLE
    departamento (
        id_depart INT AUTO_INCREMENT PRIMARY key,
        nome VARCHAR(255),
        bloco VARCHAR(255),
        data_criacao DATE
    );

CREATE TABLE
    empregados (
        id_empregado INT AUTO_INCREMENT PRIMARY key,
        nome VARCHAR(255),
        salario DECIMAL,
        data_admissao DATE,
        matricula INT,
        id_depart INT,
        FOREIGN Key (id_depart) REFERENCES departamento (id_depart)
    );

INSERT INTO
    departamento (nome, bloco, data_criacao)
VALUES
    ("RH", "A", "1984-07-12"),
    ("FIN", "B", "1984-08-19"),
    ("MARKETING", "C", "1985-08-19"),
    ("TI", "D", "1987-09-17"),
    ("P&D", "E", "1988-10-19"),
    ("JUR", "F", "1989-11-12 ");

INSERT INTO
    empregados (
        nome,
        salario,
        data_admissao,
        matricula,
        id_depart
    )
VALUES
    ("Josias Roberto", 1450.0, "2002-03-21", 0001, 2),
    ("Maria Silva", 1600.0, "2021-04-10", 0002, 1),
    ("Carlos Souza", 1550.0, "2019-05-15", 0003, 3),
    ("Ana Pereira", 1700.0, "2020-06-20", 0004, 1),
    ("Lucas Lima", 1500.0, "2018-07-30", 0005, 2),
    ("Fernanda Costa", 1650.0, "2022-08-05", 0006, 3),
    ("Roberto Alves", 1750.0, "2017-09-25", 0007, 4),
    ("Juliana Mendes", 1800.0, "2016-10-12", 0008, 5),
    ("Diego Oliveira", 1400.0, "2023-11-01", 0009, 2),
    ("Clara Santos", 1500.0, "2020-12-18", 0010, 3);

SELECT
    *
FROM
    empregados;
