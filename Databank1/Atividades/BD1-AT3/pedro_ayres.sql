-- =====================
-- == TABELA ORIGINAL ==
-- =====================

CREATE TABLE biblioteca (
    id_livro INT,
    titulo VARCHAR(100),
    autor VARCHAR(100),
    categoria VARCHAR(100),
    ano_pubi YEAR,
    editora VARCHAR(100),
    cidade_editora VARCHAR(100),
    isbn INT,
    id_aluno VARCHAR(100),
    nome_aluno VARCHAR(100),
    data_emprestimo DATE,
    date_devolucao DATE
);

-- ==========================
-- == ATIVIDADE 2024-11-14 ==
-- == TABELAS NORMALIZADAS ==
-- ==========================

CREATE TABLE categorias (
    id INTEGER PRIMARY KEY,
    nome TEXT
);

CREATE TABLE alunos (
    id INTEGER PRIMARY KEY,
    nome TEXT
);

CREATE TABLE editoras (
    id INTEGER PRIMARY KEY,
    nome TEXT,
    cidade_editora TEXT
);


CREATE TABLE autores (
    id INTEGER PRIMARY KEY,
    nome TEXT,
    id_editora INT,
    FOREIGN KEY (id_editora) REFERENCES editoras (id)
);

CREATE TABLE livros (
    id INTEGER PRIMARY KEY,
    titulo TEXT,
    ano_publi INT,
    id_autor INT,
    FOREIGN KEY (id_autor) REFERENCES autores (id),
    id_editora INT,
    FOREIGN KEY (id_editora) REFERENCES editoras (id),
    isbn INT
);

-- Tabela associativa
CREATE TABLE livro_autor (
    id INTEGER PRIMARY KEY,
    id_livro INT,
    id_autor INT,
    FOREIGN KEY (id_livro) REFERENCES livros (id),
    FOREIGN KEY (id_autor) REFERENCES autores (id)
);

CREATE TABLE emprestimos (
    id INTEGER PRIMARY KEY,
    data_emprestimo DATE,
    data_devolucao DATE,
    id_aluno INTEGER,
    FOREIGN KEY (id_aluno) REFERENCES alunos (id)
);
