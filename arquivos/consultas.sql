SELECT * FROM cidadao;
SELECT * FROM cidadao_medicamento;
SELECT * FROM cidade;
SELECT * FROM estoque_unidade;
SELECT * FROM funcionario_sus;
SELECT * FROM lote_medicamentos;
SELECT * FROM medicamento;
SELECT * FROM pessoa;
SELECT * FROM tipo_unidade;
SELECT * FROM unidade_saude;

SELECT * FROM estoque_unidade WHERE quantidade>12;

SELECT * FROM estoque_unidade WHERE quantidade<20;

SELECT * FROM lote_medicamentos WHERE data_validade<current_date;

SELECT * FROM lote_medicamentos WHERE data_validade>current_date;


SELECT * FROM pessoa WHERE sexo='F';

SELECT * FROM pessoa WHERE sexo='M';

SELECT * FROM lote_medicamentos WHERE (data_validade-current_date)>=30;

SELECT * FROM lote_medicamentos WHERE (data_validade-'2017-01-01')<100;

SELECT id_lote, (data_validade-current_date) as "dias_vencimento" FROM lote_medicamentos;

SELECT id_lote, (current_date-data_fabricacao) as "dias_fabricacao" FROM lote_medicamentos;

SELECT * FROM medicamento WHERE nome LIKE '%ina';

SELECT * FROM medicamento WHERE nome LIKE '%ol';

SELECT * FROM medicamento WHERE nome LIKE '%am';

