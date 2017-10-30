/* Lógico_1: */

CREATE TABLE Unidade_saude (
    nome VARCHAR,
    bairro VARCHAR,
    id_posto INT PRIMARY KEY,
    cidade VARCHAR,
    FK_Tipo_unidade_id_tipo INT
);

CREATE TABLE Pessoa (
    nome VARCHAR,
    cpf BIGINT PRIMARY KEY,
    sexo CHAR
);

CREATE TABLE Medicamento (
    nome VARCHAR,
    id_medicamento INT PRIMARY KEY
);

CREATE TABLE Tipo_unidade (
    id_tipo INT PRIMARY KEY,
    nome VARCHAR
);

CREATE TABLE Cidadao (
    cartao_sus INT,
    email VARCHAR,
    FK_lista_medicamento_lista_medicamento_PK INT,
    cidade VARCHAR,
    FK_Pessoa_cpf INT,
    FK_Unidade_saude_id_posto INT,
    PRIMARY KEY (cartao_sus, FK_Pessoa_cpf)
);

CREATE TABLE Funcionario_sus (
    matricula INT,
    FK_Pessoa_cpf INT,
    PRIMARY KEY (matricula, FK_Pessoa_cpf)
);

CREATE TABLE Lote_medicamentos (
    id_lote INT PRIMARY KEY,
    data_validade DATE,
    data_fabricacao DATE
);

CREATE TABLE Estoque_tem_Unidade_saude_Medicamento_Lote_medicamentos (
    quantidade INT,
    FK_Unidade_saude_id_posto INT,
    FK_Medicamento_id_medicamento INT,
    FK_Lote_medicamentos_id_lote INT
);

CREATE TABLE lista_medicamento (
    lista_medicamento_PK INT NOT NULL PRIMARY KEY,
    lista_medicamento VARCHAR
);
 
ALTER TABLE Unidade_saude ADD CONSTRAINT FK_Unidade_saude_1
    FOREIGN KEY (FK_Tipo_unidade_id_tipo)
    REFERENCES Tipo_unidade (id_tipo)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Cidadao ADD CONSTRAINT FK_Cidadao_1
    FOREIGN KEY (FK_lista_medicamento_lista_medicamento_PK)
    REFERENCES lista_medicamento (lista_medicamento_PK)
    ON DELETE NO ACTION ON UPDATE NO ACTION;
 
ALTER TABLE Cidadao ADD CONSTRAINT FK_Cidadao_2
    FOREIGN KEY (FK_Pessoa_cpf)
    REFERENCES Pessoa (cpf)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Cidadao ADD CONSTRAINT FK_Cidadao_3
    FOREIGN KEY (FK_Unidade_saude_id_posto)
    REFERENCES Unidade_saude (id_posto)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Funcionario_sus ADD CONSTRAINT FK_Funcionario_sus_1
    FOREIGN KEY (FK_Pessoa_cpf)
    REFERENCES Pessoa (cpf)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Estoque_tem_Unidade_saude_Medicamento_Lote_medicamentos ADD CONSTRAINT FK_Estoque_tem_Unidade_saude_Medicamento_Lote_medicamentos_0
    FOREIGN KEY (FK_Unidade_saude_id_posto)
    REFERENCES Unidade_saude (id_posto);
 
ALTER TABLE Estoque_tem_Unidade_saude_Medicamento_Lote_medicamentos ADD CONSTRAINT FK_Estoque_tem_Unidade_saude_Medicamento_Lote_medicamentos_1
    FOREIGN KEY (FK_Medicamento_id_medicamento)
    REFERENCES Medicamento (id_medicamento);
 
ALTER TABLE Estoque_tem_Unidade_saude_Medicamento_Lote_medicamentos ADD CONSTRAINT FK_Estoque_tem_Unidade_saude_Medicamento_Lote_medicamentos_2
    FOREIGN KEY (FK_Lote_medicamentos_id_lote)
    REFERENCES Lote_medicamentos (id_lote);
