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
	
/* inserts do banco */
INSERT INTO medicamento VALUES
	(1, 'Acamprosato'),
    (2, 'Baclofeno'),
    (3, 'Dissulfiram'),
    (4, 'Paroxetina'),
    (5, 'Sertralina'),
    (6, 'Trazodona'),
    (7, 'Haloperidol'),
    (8, 'Ziprazidona'),
    (9, 'Zuclopentixol'),
    (10, 'Clonazepam');
	
	
INSERT INTO tipo_unidade VALUES
	(1, 'Bairro'),
	(2, 'Municipal'),
	(3, 'Estadual');
	
INSERT INTO pessoa VALUES
	('Joao de Nazaré', 12345678900, 'M'),
	('Maria de Jesus', 23456789012, 'F'),
	('Jose Albuquerque', 55556789012, 'M'),
	('Thiago Leifert', 23456789999, 'M'),
	('Ana Maria', 2346666012, 'F');
	
INSERT INTO funcionario_sus VALUES
	(12345, 55556789012),
	(23456, 23456789012);
	
INSERT INTO cidade VALUES
	(1, 'Vila Velha'),
	(2, 'Vitória'),
	(3, 'Serra'),
	(4, 'Cariacica');

INSERT INTO unidade_saude VALUES
	('Japa 1', 'Paul', 1, 1, 1),
	('Unidade de Saúde da Serra', 'Serra Sede', 2, 2, 3),
	('Unidade Estadual Capixaba', 'Centro', 3, 3, 2);

INSERT INTO lote_medicamentos (id_lote, data_fabricacao, data_validade) VALUES
	(1, '2017-04-28', '2020-04-28'),
	(2, '2016-05-20', '2017-04-28'),
	(3, '2016-12-13', '2025-03-12'),
	(4, '2015-07-19', '2019-05-22'),
	(5, '2017-01-09', '2018-02-22');

INSERT INTO cidadao VALUES
	(123456789, 'joao@gmail.com', 2, 3, 12345678900),
	(234567890, 'thiago@gmail.com', 1, 1, 23456789999),
	(66662123, 'ana@gmail.com', 3, 3, 2346666012);
	
INSERT INTO cidadao_medicamento (fk_cidadao_cartao_sus, fk_medicamento_id_medicamento) VALUES
	(123456789, 2),
	(123456789, 6),
	(123456789, 7),
	(123456789, 10),
	(234567890, 1),
	(234567890, 3),
	(234567890, 4),
	(66662123, 5),
	(66662123, 8),
	(66662123, 9);
	
INSERT INTO estoque_unidade VALUES
	(50, 1, 10, 3),
	(10, 2, 6, 2),
	(13, 2, 3, 5),
	(0, 3, 5, 1),
	(20, 3, 9, 4);
	