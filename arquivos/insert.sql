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
	