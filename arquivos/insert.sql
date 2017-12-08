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