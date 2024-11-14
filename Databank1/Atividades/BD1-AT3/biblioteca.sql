-- =====================
-- == TABELA ORIGINAL ==
-- =====================

CREATE TABLE biblioteca (
    id_livro INT,
    titulo VARCHAR(100),
    autor VARCHAR(100),
    categoria VARCHAR(100),
    ano_publi YEAR,
    editora VARCHAR(100),
    cidade_editora VARCHAR(100),
    isbn INT,
    id_aluno VARCHAR(100),
    nome_aluno VARCHAR(100),
    data_emprestimo DATE,
    data_devolucao DATE
);

-- ==========================
-- == ATIVIDADE 2024-11-14 ==
-- == TABELAS NORMALIZADAS ==
-- ==========================

-- TODO: Terminar depois e enviar ate 2024-11-14 17:00

CREATE TABLE categorias (
    id INTERGER,
    PRIMARY KEY (id),
    nome VARCHAR(100)
);

-- Tabela associativa
CREATE TABLE livro_autor (
    id_livro INTERGER,
    id_autor INTERGER,
    FOREIGN KEY (id_livro) REFERENCES livros (id),
    FOREIGN KEY (id_autor) REFERENCES autores (id)
);

CREATE TABLE alunos ();

CREATE TABLE editoras (
    id INTERGER,
    nome VARCHAR(100),
    cidade_editora VARCHAR(100)
);

CREATE TABLE autores (
    id_autor INTERGER,
    nome VARCHAR(100),
    editora VARCHAR(100),
    FOREIGN KEY (editora) REFERENCES editoras (id)
);

CREATE TABLE emprestimos ();

CREATE TABLE livros (
    id_livro INTERGER,
    PRIMARY KEY (id_livro),
    titulo VARCHAR(100),
    autor VARCHAR(100),
    FOREIGN KEY (autor) REFERENCES autores (id),
    editora VARCHAR(100),
    FOREIGN KEY (editora) REFERENCES editoras (id),
    isbn INT
);
