-- =====================
-- == TABELA ORIGINAL ==
-- =====================

-- CREATE TABLE IF NOT EXISTS biblioteca (
--     id_livro INT,
--     titulo VARCHAR(100),
--     autor VARCHAR(100),
--     categoria VARCHAR(100),
--     ano_pubi YEAR,
--     editora VARCHAR(100),
--     cidade_editora VARCHAR(100),
--     isbn INT,
--     id_aluno VARCHAR(100),
--     nome_aluno VARCHAR(100),
--     data_emprestimo DATE,
--     date_devolucao DATE
-- );

-- ==========================
-- == ATIVIDADE 2024-11-14 ==
-- == TABELAS NORMALIZADAS ==
-- ==========================

CREATE TABLE IF NOT EXISTS categorias (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS alunos (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS editoras (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    cidade_editora TEXT
);


CREATE TABLE IF NOT EXISTS autores (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS livros (
    id INTEGER PRIMARY KEY,
    titulo TEXT NOT NULL,
    ano_publi INT,
    id_editora INT,
    isbn INT UNIQUE,
    FOREIGN KEY (id_editora) REFERENCES editoras (id)
);

-- Tabela associativa
CREATE TABLE IF NOT EXISTS livro_autor (
    id INTEGER PRIMARY KEY,
    id_livro INT NOT NULL,
    id_autor INT NOT NULL,
    FOREIGN KEY (id_livro) REFERENCES livros (id),
    FOREIGN KEY (id_autor) REFERENCES autores (id),
    UNIQUE (id_livro, id_autor)
);

-- Tabela associativa
CREATE TABLE IF NOT EXISTS autor_editora (
    id INTEGER PRIMARY KEY,
    id_autor INT NOT NULL,
    id_editora INT NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES autores (id),
    FOREIGN KEY (id_editora) REFERENCES editoras (id),
    UNIQUE (id_autor, id_editora)
);

CREATE TABLE IF NOT EXISTS emprestimos (
    id INTEGER PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_livro INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    FOREIGN KEY (id_aluno) REFERENCES alunos (id),
    FOREIGN KEY (id_livro) REFERENCES livros (id),
    UNIQUE (id_livro, data_devolucao)
);

-- ===========================
-- == INSERÇÃO DE DADOS ==
-- ===========================

-- Inserindo categorias
INSERT INTO categorias (nome) VALUES
('Ficção'),
('Não-ficção'),
('Ciência'),
('Tecnologia'),
('História'),
('Filosofia'),
('Psicologia'),
('Literatura Brasileira'),
('Poesia'),
('Arte'),
('Romance'),
('Mistério'),
('Drama'),
('Comédia'),
('Biografia');

-- Inserindo alunos
INSERT INTO alunos (nome) VALUES
('João Silva'),
('Maria Oliveira'),
('Pedro Costa'),
('Ana Lima'),
('Lucas Souza'),
('Beatriz Almeida'),
('Carlos Pereira'),
('Fernanda Santos'),
('Gustavo Martins'),
('Helena Costa'),
('Igor Martins'),
('Juliana Rocha'),
('Carlos Henrique'),
('Tatiane Silva'),
('Roberto Lima');

-- Inserindo editoras
INSERT INTO editoras (nome, cidade_editora) VALUES
('Editora XYZ', 'São Paulo'),
('Editora ABC', 'Rio de Janeiro'),
('Editora Delta', 'Belo Horizonte'),
('Editora Gamma', 'Curitiba'),
('Editora Beta', 'Porto Alegre'),
('Editora Omega', 'Salvador'),
('Editora Alpha', 'Recife'),
('Editora Lambda', 'Fortaleza'),
('Editora Zeta', 'Manaus'),
('Editora Sigma', 'Florianópolis'),
('Editora Pi', 'Campinas'),
('Editora Kappa', 'Belém');

-- Inserindo autores
INSERT INTO autores (nome) VALUES
('J.K. Rowling'),
('George Orwell'),
('Isaac Asimov'),
('Gabriel García Márquez'),
('Agatha Christie'),
('Luiz Fernando Veríssimo'),
('Clarice Lispector'),
('Machado de Assis'),
('Cecília Meireles'),
('Mario Vargas Llosa'),
('Dan Brown'),
('William Shakespeare'),
('Emily Dickinson'),
('Oscar Wilde');

-- Inserindo livros
INSERT INTO livros (titulo, ano_publi, id_editora, isbn) VALUES
('Harry Potter e a Pedra Filosofal', 1997, 1, 9780747532699),
('1984', 1949, 2, 9780451524935),
('Fundação', 1951, 3, 9780553293357),
('Cem Anos de Solidão', 1967, 4, 9780307389732),
('Assassinato no Expresso do Oriente', 1934, 5, 9780062693662),
('O Primo Basílio', 1878, 3, 9788535915764),
('A Moreninha', 1844, 2, 9788526015678),
('Grande Sertão: Veredas', 1956, 1, 9788525033963),
('A Hora da Estrela', 1977, 4, 9788574064454),
('O Aleph', 1949, 4, 9788574064072),
('O Código Da Vinci', 2003, 2, 9780385504201),
('Morte no Nilo', 1937, 2, 9780062073501),
('Romeu e Julieta', 1597, 3, 9780743482837),
('Poemas', 1890, 4, 9780140423202),
('O Retrato de Dorian Gray', 1890, 5, 9780141442548);

-- Inserindo livro_autor
INSERT INTO livro_autor (id_livro, id_autor) VALUES
(1, 1),  -- "Harry Potter e a Pedra Filosofal" de J.K. Rowling
(2, 2),  -- "1984" de George Orwell
(3, 3),  -- "Fundação" de Isaac Asimov
(4, 4),  -- "Cem Anos de Solidão" de Gabriel García Márquez
(5, 5),  -- "Assassinato no Expresso do Oriente" de Agatha Christie
(6, 6),  -- "O Primo Basílio" de José de Alencar
(7, 7),  -- "A Moreninha" de Joaquim Manuel de Macedo
(8, 8),  -- "Grande Sertão: Veredas" de João Guimarães Rosa
(9, 9),  -- "A Hora da Estrela" de Clarice Lispector
(10, 10),  -- "O Aleph" de Jorge Luis Borges
(11, 11),  -- "O Código Da Vinci" de Dan Brown
(12, 5),  -- "Morte no Nilo" de Agatha Christie
(13, 12),  -- "Romeu e Julieta" de William Shakespeare
(14, 13),  -- "Poemas" de Emily Dickinson
(15, 14);  -- "O Retrato de Dorian Gray" de Oscar Wilde

-- Inserindo autor_editora
INSERT INTO autor_editora (id_autor, id_editora) VALUES
(1, 1),  -- J.K. Rowling com Editora XYZ
(2, 2),  -- George Orwell com Editora ABC
(3, 3),  -- Isaac Asimov com Editora Delta
(4, 4),  -- Gabriel García Márquez com Editora Gamma
(5, 5),  -- Agatha Christie com Editora Delta
(6, 3),  -- José de Alencar com Editora Alpha
(7, 2),  -- Joaquim Manuel de Macedo com Editora Omega
(8, 1),  -- João Guimarães Rosa com Editora Beta
(9, 4),  -- Clarice Lispector com Editora Lambda
(10, 4),  -- Jorge Luis Borges com Editora Lambda
(11, 2),  -- Dan Brown com Editora Sigma
(5, 2),  -- Agatha Christie com Editora Sigma
(12, 3),  -- William Shakespeare com Editora Pi
(13, 4),  -- Emily Dickinson com Editora Kappa
(14, 5);  -- Oscar Wilde com Editora Zeta

-- Inserindo empréstimos
INSERT INTO emprestimos (
    id_aluno, id_livro, data_emprestimo, data_devolucao
) VALUES
-- João Silva pegou "Harry Potter e a Pedra Filosofal"
(1, 1, '2024-11-01', '2024-11-15'),
(2, 2, '2024-11-02', '2024-11-16'),  -- Maria Oliveira pegou "1984"
(3, 3, '2024-11-03', '2024-11-17'),  -- Pedro Costa pegou "Fundação"
(4, 4, '2024-11-04', '2024-11-18'),  -- Ana Lima pegou "Cem Anos de Solidão"
-- Lucas Souza pegou "Assassinato no Expresso do Oriente"
(5, 5, '2024-11-05', '2024-11-19'),
-- Beatriz Almeida pegou "O Primo Basílio"
(6, 6, '2024-11-06', '2024-11-20'),
(7, 7, '2024-11-07', '2024-11-21'),  -- Carlos Pereira pegou "A Moreninha"
-- Fernanda Santos pegou "Grande Sertão: Veredas"
(8, 8, '2024-11-08', '2024-11-22'),
-- Gustavo Martins pegou "A Hora da Estrela"
(9, 9, '2024-11-09', '2024-11-23'),
(10, 10, '2024-11-10', '2024-11-24'),  -- Helena Costa pegou "O Aleph"
-- Igor Martins pegou "O Código Da Vinci"
(11, 11, '2024-11-11', '2024-11-25'),
(12, 12, '2024-11-12', '2024-11-26'),  -- Juliana Rocha pegou "Morte no Nilo"
-- Carlos Henrique pegou "Romeu e Julieta"
(13, 13, '2024-11-13', '2024-11-27'),
(14, 14, '2024-11-14', '2024-11-28'),  -- Tatiane Silva pegou "Poemas"
-- Roberto Lima pegou "O Retrato de Dorian Gray"
(15, 15, '2024-11-15', '2024-11-29');
