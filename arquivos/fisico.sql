/* Lógico_1: */

CREATE TABLE Unidade_saude (
    nome VARCHAR,
    bairro VARCHAR,
    id_posto INTEGER PRIMARY KEY,
    FK_Tipo_unidade_id_tipo INTEGER,
    FK_cidade_id_cidade INTEGER
);

CREATE TABLE Pessoa (
    nome VARCHAR,
    cpf BIGINT PRIMARY KEY UNIQUE,
    sexo CHAR
);

CREATE TABLE Medicamento (
    id_medicamento INTEGER PRIMARY KEY,
    nome VARCHAR
);

CREATE TABLE Tipo_unidade (
    id_tipo INTEGER PRIMARY KEY,
    nome VARCHAR
);

CREATE TABLE Cidadao (
    cartao_sus BIGINT PRIMARY KEY,
    email VARCHAR,
    FK_Unidade_saude_id_posto INTEGER,
    FK_cidade_id_cidade INTEGER,
    FK_Pessoa_cpf BIGINT
);

CREATE TABLE Funcionario_sus (
    matricula INTEGER PRIMARY KEY,
    FK_Pessoa_cpf BIGINT
);

CREATE TABLE Lote_medicamentos (
    id_lote INTEGER PRIMARY KEY,
    data_validade DATE,
    data_fabricacao DATE
);

CREATE TABLE estoque_unidade (
    quantidade INTEGER,
    FK_Unidade_saude_id_posto INTEGER,
    FK_Medicamento_id_medicamento INTEGER,
    FK_Lote_medicamentos_id_lote INTEGER
);

CREATE TABLE cidade (
    id_cidade INTEGER PRIMARY KEY,
    nome_cidade VARCHAR
);

CREATE TABLE cidadao_medicamento (
    FK_Medicamento_id_medicamento INTEGER,
    FK_Cidadao_cartao_sus BIGINT
);
 
ALTER TABLE Unidade_saude ADD CONSTRAINT FK_Unidade_saude_1
    FOREIGN KEY (FK_Tipo_unidade_id_tipo)
    REFERENCES Tipo_unidade (id_tipo)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Unidade_saude ADD CONSTRAINT FK_Unidade_saude_2
    FOREIGN KEY (FK_cidade_id_cidade)
    REFERENCES cidade (id_cidade)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Cidadao ADD CONSTRAINT FK_Cidadao_1
    FOREIGN KEY (FK_Unidade_saude_id_posto)
    REFERENCES Unidade_saude (id_posto)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Cidadao ADD CONSTRAINT FK_Cidadao_2
    FOREIGN KEY (FK_cidade_id_cidade)
    REFERENCES cidade (id_cidade)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Cidadao ADD CONSTRAINT FK_Cidadao_3
    FOREIGN KEY (FK_Pessoa_cpf)
    REFERENCES Pessoa (cpf);
 
ALTER TABLE Funcionario_sus ADD CONSTRAINT FK_Funcionario_sus_1
    FOREIGN KEY (FK_Pessoa_cpf)
    REFERENCES Pessoa (cpf)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE estoque_unidade ADD CONSTRAINT FK_estoque_unidade_0
    FOREIGN KEY (FK_Unidade_saude_id_posto)
    REFERENCES Unidade_saude (id_posto);
 
ALTER TABLE estoque_unidade ADD CONSTRAINT FK_estoque_unidade_1
    FOREIGN KEY (FK_Medicamento_id_medicamento)
    REFERENCES Medicamento (id_medicamento);
 
ALTER TABLE estoque_unidade ADD CONSTRAINT FK_estoque_unidade_2
    FOREIGN KEY (FK_Lote_medicamentos_id_lote)
    REFERENCES Lote_medicamentos (id_lote);
 
ALTER TABLE cidadao_medicamento ADD CONSTRAINT FK_cidadao_medicamento_0
    FOREIGN KEY (FK_Medicamento_id_medicamento)
    REFERENCES Medicamento (id_medicamento)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE cidadao_medicamento ADD CONSTRAINT FK_cidadao_medicamento_1
    FOREIGN KEY (FK_Cidadao_cartao_sus)
    REFERENCES Cidadao (cartao_sus)
    ON DELETE SET NULL ON UPDATE CASCADE;