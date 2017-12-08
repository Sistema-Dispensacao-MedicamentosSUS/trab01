CREATE TABLE Unidade_saude (
    nome VARCHAR,
    id_posto INTEGER PRIMARY KEY,
    FK_Tipo_unidade_id_tp_unidade INTEGER,
    FK_Logradouro_cep BIGINT
);

CREATE TABLE Pessoa (
    nome VARCHAR,
    cpf BIGINT PRIMARY KEY,
    sexo CHAR
);

CREATE TABLE Medicamento (
    id_medicamento INTEGER PRIMARY KEY,
    nome VARCHAR
);

CREATE TABLE Tipo_unidade (
    id_tp_unidade INTEGER PRIMARY KEY,
    tp_unidade_descricao VARCHAR
);

CREATE TABLE Cidadao (
    num_endereco INTEGER,
    cartao_sus BIGINT PRIMARY KEY,
    FK_Unidade_saude_id_posto INTEGER,
    FK_Logradouro_cep BIGINT,
    FK_Pessoa_cpf BIGINT,
    senha VARCHAR
);

CREATE TABLE Funcionario_sus (
    matricula INTEGER PRIMARY KEY,
    FK_Pessoa_cpf BIGINT,
    senha VARCHAR
);

CREATE TABLE Lote_medicamentos (
    id_lote INTEGER PRIMARY KEY,
    data_validade DATE,
    data_fabricacao DATE
);

CREATE TABLE estoque (
    quantidade INTEGER,
    data_entrada DATE,
    id_estoque INTEGER PRIMARY KEY,
    FK_Unidade_saude_id_posto INTEGER,
    FK_Medicamento_id_medicamento INTEGER,
    FK_Lote_medicamentos_id_lote INTEGER
);

CREATE TABLE Municipio (
    id_municipio INTEGER PRIMARY KEY,
    nome_municipio VARCHAR,
    FK_Estado_id_estado INTEGER
);

CREATE TABLE Estado (
    nome_estado VARCHAR,
    id_estado INTEGER PRIMARY KEY
);

CREATE TABLE Bairro (
    id_bairro INTEGER PRIMARY KEY,
    FK_Municipio_id_municipio INTEGER,
    nome_bairro VARCHAR
);

CREATE TABLE Contato (
    id_contato INTEGER PRIMARY KEY,
    descricao_contato VARCHAR,
    FK_Pessoa_cpf BIGINT,
    FK_Tipo_contato_id_tp_contato INTEGER
);

CREATE TABLE Tipo_contato (
    id_tp_contato INTEGER PRIMARY KEY,
    tp_contato_descricao VARCHAR
);

CREATE TABLE Retirada (
    dt_hr_retirada TIMESTAMP,
    quantidade_retirada BIGINT,
    id_retirada INTEGER,
    FK_Estoque_id_estoque INTEGER,
    FK_Funcionario_sus_matricula INTEGER,
    FK_Cidadao_cartao_sus BIGINT
);

CREATE TABLE Logradouro (
    nome_rua VARCHAR,
    cep BIGINT PRIMARY KEY,
    FK_Bairro_id_bairro INTEGER
);

CREATE TABLE cidadao_medicamento (
    FK_Medicamento_id_medicamento INTEGER,
    FK_Cidadao_cartao_sus BIGINT
);

ALTER TABLE Unidade_saude ADD CONSTRAINT FK_Unidade_saude_1
    FOREIGN KEY (FK_Tipo_unidade_id_tp_unidade)
    REFERENCES Tipo_unidade (id_tp_unidade)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Unidade_saude ADD CONSTRAINT FK_Unidade_saude_2
    FOREIGN KEY (FK_Logradouro_cep)
    REFERENCES Logradouro (cep)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Cidadao ADD CONSTRAINT FK_Cidadao_1
    FOREIGN KEY (FK_Unidade_saude_id_posto)
    REFERENCES Unidade_saude (id_posto)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Cidadao ADD CONSTRAINT FK_Cidadao_2
    FOREIGN KEY (FK_Logradouro_cep)
    REFERENCES Logradouro (cep)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Cidadao ADD CONSTRAINT FK_Cidadao_3
    FOREIGN KEY (FK_Pessoa_cpf)
    REFERENCES Pessoa (cpf);
 
ALTER TABLE Funcionario_sus ADD CONSTRAINT FK_Funcionario_sus_1
    FOREIGN KEY (FK_Pessoa_cpf)
    REFERENCES Pessoa (cpf)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE estoque ADD CONSTRAINT FK_estoque_unidade_0
    FOREIGN KEY (FK_Unidade_saude_id_posto)
    REFERENCES Unidade_saude (id_posto);
 
ALTER TABLE estoque ADD CONSTRAINT FK_estoque_unidade_1
    FOREIGN KEY (FK_Medicamento_id_medicamento)
    REFERENCES Medicamento (id_medicamento);
 
ALTER TABLE estoque ADD CONSTRAINT FK_estoque_unidade_2
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
	
ALTER TABLE retirada ADD CONSTRAINT FK_retirada_0
    FOREIGN KEY (FK_Cidadao_cartao_sus)
    REFERENCES Cidadao (cartao_sus)
    ON DELETE SET NULL ON UPDATE CASCADE;
	
ALTER TABLE retirada ADD CONSTRAINT FK_retirada_1
    FOREIGN KEY (FK_Estoque_id_estoque)
    REFERENCES Estoque (id_estoque)
    ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE retirada ADD CONSTRAINT FK_retirada_2
    FOREIGN KEY (FK_Funcionario_sus_matricula)
    REFERENCES Funcionario_sus (matricula)
    ON DELETE SET NULL ON UPDATE CASCADE;
	
ALTER TABLE municipio ADD CONSTRAINT FK_municipio_0
    FOREIGN KEY (FK_Estado_id_estado)
    REFERENCES estado (id_estado)
    ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE bairro ADD CONSTRAINT FK_bairro_0
    FOREIGN KEY (FK_Municipio_id_municipio)
    REFERENCES municipio (id_municipio)
    ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE logradouro ADD CONSTRAINT FK_logradouro_0
    FOREIGN KEY (FK_Bairro_id_bairro)
    REFERENCES bairro (id_bairro)
    ON DELETE SET NULL ON UPDATE CASCADE;

	
/* inserts do banco */

INSERT INTO Estado (id_estado, nome_estado) VALUES
	(1, 'Acre'),
    (2, 'Alagoas'),
    (3, 'Amapá'),
    (4, 'Amazonas'),
    (5, 'Bahia'),
    (6, 'Ceará'),
    (7, 'Distrito Federal'),
    (8, 'Espírito Santo'),
    (9, 'Goiás'),
    (10, 'Maranhão'),
    (11, 'Mato Grosso'),
    (12, 'Mato Grosso do Sul'),
    (13, 'Minas Gerais'),
    (14, 'Pará'),
    (15, 'Paraíba'),
    (16, 'Paraná'),
    (17, 'Pernambuco'),
    (18, 'Piauí'),
    (19, 'Rio de Janeiro'),
    (20, 'Rio Grande do Norte'),
    (21, 'Rio Grande do Sul'),
    (22, 'Rondônia'),
    (23, 'Roraima'),
    (24, 'Santa Catarina'),
    (25, 'São Paulo'),
    (26, 'Sergipe'),
    (27, 'Tocantins');

INSERT INTO Municipio VALUES
	(1, 'Vila Velha',8),
	(2, 'Vitória', 8),
	(3, 'Serra', 8),
	(4, 'Cariacica', 8),
	(5, 'Viana', 8);

INSERT INTO Bairro (id_bairro, nome_bairro, FK_Municipio_id_municipio) VALUES 
	(1, 'Ilha das Flores',1),
	(2, 'Paul', 1),
	(3, 'Carapina', 3),
	(4, 'Centro', 2),
	(5, 'Campo Grande', 4);
	
INSERT INTO Logradouro (cep, nome_rua, FK_Bairro_id_bairro) VALUES
	(29115510, 'Rua Luiz Soares do Nascimento', 1),
	(29115156, 'Beco Antigo', 2),
	(29146190, 'Rua Américo Siqueira', 5),
	(29010100, 'Rua Dionísio Rosendo', 4);
	
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
	('Keila', 3201933, 'F'),
	('Kaua', 2593481, 'M'),
	('Magna', 7123761, 'F'),
	('Yan', 14833208717, 'M'),
	('Lucia', 876543172, 'F'),
	('Ana Maria', 2346666012, 'F');
	
INSERT INTO funcionario_sus VALUES
	(12345, 55556789012, 'ata'),
	(23456, 23456789012, 'abc');

INSERT INTO unidade_saude (id_posto, nome, FK_Tipo_unidade_id_tp_unidade, FK_Logradouro_cep) VALUES
	(1, 'Japa 1', 1, 29115156),
	(2, 'Unidade de Saúde de Campo Grande', 2, 29010100),
	(3, 'Unidade Estadual Capixaba', 3, 29146190);

INSERT INTO lote_medicamentos (id_lote, data_fabricacao, data_validade) VALUES
	(1, '2017-04-28', '2020-04-28'),
	(2, '2016-05-20', '2017-04-28'),
	(3, '2016-12-13', '2025-03-12'),
	(4, '2015-07-19', '2019-05-22'),
	(5, '2017-01-09', '2018-02-22');

INSERT INTO cidadao (cartao_sus, FK_Unidade_saude_id_posto, FK_Logradouro_cep, FK_Pessoa_cpf, num_endereco, senha) VALUES 
	(123456789, 2, 29010100, 12345678900, 201, '551b490fc091bf5fd419e60dd5f09504'),
	(234567890, 1, 29146190, 23456789999, 359, '916507e02a88d1eb045768ae84a3ecca'),
	(66662123, 3, 29115156, 2346666012, 44, '313d20ea10d91382ea8f241bf5b1d96b'),
	(12312312, 1, 29115510, 14833208717, 207, '313d20ea10d91382ea8f241bf5b1d96b');
	
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
	
INSERT INTO estoque (id_estoque, quantidade, data_entrada, FK_Unidade_saude_id_posto, FK_Medicamento_id_medicamento, FK_Lote_medicamentos_id_lote) VALUES 
	(1, 50, '2017-04-28', 1, 10, 3),
	(2, 10, '2016-05-20', 2, 6, 2),
	(3, 13, '2016-12-13', 2, 3, 5),
	(4, 7, '2017-01-09', 3, 5, 1),
	(5, 20, '2016-11-02', 3, 9, 4);
	

	
INSERT INTO Retirada (id_retirada, quantidade_retirada, dt_hr_retirada, FK_Estoque_id_estoque, FK_Funcionario_sus_matricula, FK_Cidadao_cartao_sus) VALUES
	(1, 2, '2017-04-23 04:05:06', 1, 12345, 12312312),
	(2, 10, '2017-04-23 05:06:07', 1, 12345, 12312312),
	(3, 4, '2016-02-23 05:06:07', 2, 12345, 234567890);
	
INSERT INTO Tipo_contato VALUES
	(1, 'E-mail'),
	(2, 'Telefone'),
	(3, 'Celular'),
	(4, 'Fax');

INSERT INTO Contato VALUES
	(1, 'joao@gmail.com', 12345678900, 1),
	(2, 'maria@gmail.com', 23456789012, 1),
	(3, 'jose@gmail.com', 55556789012, 1),
	(4, 'thiago@gmail.com', 23456789999, 1),
	(5, 'yan@gmail.com', 14833208717, 1);
	
/*drops do banco*/
DROP TABLE IF EXISTS cidadao_medicamento;
DROP TABLE IF EXISTS retirada;
DROP TABLE IF EXISTS contato;
DROP TABLE IF EXISTS tipo_contato;
DROP TABLE IF EXISTS estoque;
DROP TABLE IF EXISTS funcionario_sus;
DROP TABLE IF EXISTS lote_medicamentos;
DROP TABLE IF EXISTS medicamento;
DROP TABLE IF EXISTS cidadao;
DROP TABLE IF EXISTS pessoa;
DROP TABLE IF EXISTS unidade_saude;
DROP TABLE IF EXISTS tipo_unidade;
DROP TABLE IF EXISTS logradouro;
DROP TABLE IF EXISTS bairro;
DROP TABLE IF EXISTS municipio;
DROP TABLE IF EXISTS estado;