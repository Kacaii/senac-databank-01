-- ===========================
-- == INSERÇÃO DE DADOS ==
-- ===========================

-- Inserindo categorias
INSERT INTO categorias (nome) VALUES
('Ficção'),
('Não-ficção'),
('Ciência'),
('Tecnologia'),
('História');

-- Inserindo alunos
INSERT INTO alunos (nome) VALUES
('João Silva'),
('Maria Oliveira'),
('Pedro Costa'),
('Ana Lima'),
('Lucas Souza');

-- Inserindo editoras
INSERT INTO editoras (nome, cidade_editora) VALUES
('Editora XYZ', 'São Paulo'),
('Editora ABC', 'Rio de Janeiro'),
('Editora Delta', 'Belo Horizonte'),
('Editora Gamma', 'Curitiba');

-- Inserindo autores
INSERT INTO autores (nome) VALUES
('J.K. Rowling'),
('George Orwell'),
('Isaac Asimov'),
('Gabriel García Márquez'),
('Agatha Christie');

-- Inserindo livros
INSERT INTO livros (titulo, ano_publi, id_editora, isbn) VALUES
('Harry Potter e a Pedra Filosofal', 1997, 1, 9780747532699),
('1984', 1949, 2, 9780451524935),
('Fundação', 1951, 3, 9780553293357),
('Cem Anos de Solidão', 1967, 4, 9780307389732),
('Assassinato no Expresso do Oriente', 1934, 5, 9780062693662);

-- Inserindo livro_autor
INSERT INTO livro_autor (id_livro, id_autor) VALUES
(1, 1),  -- "Harry Potter e a Pedra Filosofal" de J.K. Rowling
(2, 2),  -- "1984" de George Orwell
(3, 3),  -- "Fundação" de Isaac Asimov
(4, 4),  -- "Cem Anos de Solidão" de Gabriel García Márquez
(5, 5);  -- "Assassinato no Expresso do Oriente" de Agatha Christie

-- Inserindo autor_editora
INSERT INTO autor_editora (id_autor, id_editora) VALUES
(1, 1),  -- J.K. Rowling com Editora XYZ
(2, 2),  -- George Orwell com Editora ABC
(3, 3),  -- Isaac Asimov com Editora Delta
(4, 4),  -- Gabriel García Márquez com Editora Gamma
(5, 5);  -- Agatha Christie com Editora Delta

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
(5, 5, '2024-11-05', '2024-11-19');
