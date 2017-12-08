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
