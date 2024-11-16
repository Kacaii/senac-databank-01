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
