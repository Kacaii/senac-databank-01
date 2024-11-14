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

CREATE TABLE biblioteca ();

CREATE TABLE livros (
    id_livro INTERGER,
    PRIMARY KEY (id_livro)
);

CREATE TABLE livro_autor (); -- Tabela associativa

CREATE TABLE alunos ();

CREATE TABLE editora ();

CREATE TABLE emprestimos ();
