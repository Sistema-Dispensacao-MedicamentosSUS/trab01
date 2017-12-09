SELECT * FROM cidadao;
SELECT * FROM cidadao_medicamento;
SELECT * FROM logradouro;
SELECT * FROM bairro;
SELECT * FROM municipio;
SELECT * FROM estado;
SELECT * FROM estoque;
SELECT * FROM funcionario_sus;
SELECT * FROM lote_medicamentos;
SELECT * FROM medicamento;
SELECT * FROM pessoa;
SELECT * FROM tipo_unidade;
SELECT * FROM unidade_saude;
SELECT * FROM tipo_contato;
SELECT * FROM contato;

SELECT * FROM estoque WHERE quantidade>12;

SELECT * FROM estoque WHERE quantidade<20;

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

SELECT * FROM pessoa WHERE nome ILIKE 'Jo%';

UPDATE pessoa SET sexo='F', nome='Teste' WHERE cpf=2593481;
DELETE FROM tipo_contato WHERE id_tp_contato=4;
DELETE FROM pessoa WHERE nome='Keila';
DELETE FROM pessoa WHERE cpf=2593481;
DELETE FROM pessoa WHERE nome LIKE '%gna';
UPDATE contato SET descricao_contato='thiaguinho@gmail.com' WHERE id_contato=4;

/*JOINS */

SELECT * FROM cidadao 
INNER JOIN pessoa on (pessoa.cpf=cidadao.FK_Pessoa_cpf)
INNER JOIN contato on (pessoa.cpf=contato.FK_Pessoa_cpf)
INNER JOIN tipo_contato on (tipo_contato.id_tp_contato=contato.FK_Tipo_contato_id_tp_contato)
INNER JOIN logradouro on (cidadao.FK_Logradouro_cep=logradouro.cep)
INNER JOIN bairro on (logradouro.FK_Bairro_id_bairro=bairro.id_bairro)
INNER JOIN municipio on (municipio.id_municipio=bairro.FK_Municipio_id_municipio)
INNER JOIN estado on (municipio.FK_Estado_id_estado=estado.id_estado)
INNER JOIN unidade_saude on (unidade_saude.id_posto=cidadao.FK_Unidade_saude_id_posto)
INNER JOIN tipo_unidade on (unidade_saude.FK_Tipo_unidade_id_tp_unidade=tipo_unidade.id_tp_unidade)
INNER JOIN estoque on (unidade_saude.id_posto=estoque.FK_unidade_saude_id_posto)
INNER JOIN lote_medicamentos on (estoque.FK_lote_medicamentos_id_lote=lote_medicamentos.id_lote)
INNER JOIN medicamento on (medicamento.id_medicamento=estoque.FK_medicamento_id_medicamento)
INNER JOIN cidadao_medicamento on (cidadao_medicamento.FK_cidadao_cartao_sus=cidadao.cartao_sus)
INNER JOIN retirada on (retirada.FK_cidadao_cartao_sus=cidadao.cartao_sus)
INNER JOIN funcionario_sus on (funcionario_sus.matricula=retirada.FK_funcionario_sus_matricula);

SELECT pessoa.nome, pessoa.cpf, cidadao.cartao_sus, contato.descricao_contato FROM pessoa
INNER JOIN cidadao on (cidadao.fk_pessoa_cpf=pessoa.cpf)
INNER JOIN contato on (pessoa.cpf=contato.fk_pessoa_cpf);

SELECT cidadao.cartao_sus, medicamento.nome FROM cidadao
INNER JOIN cidadao_medicamento on (cidadao.cartao_sus=cidadao_medicamento.fk_cidadao_cartao_sus)
INNER JOIN medicamento on (medicamento.id_medicamento=cidadao_medicamento.fk_medicamento_id_medicamento);

SELECT estado.nome_estado, municipio.nome_municipio, bairro.nome_bairro, logradouro.nome_rua FROM estado
INNER JOIN municipio on (estado.id_estado=municipio.fk_estado_id_estado)
INNER JOIN bairro on (municipio.id_municipio=bairro.fk_municipio_id_municipio)
INNER JOIN logradouro on (bairro.id_bairro=logradouro.fk_bairro_id_bairro);

SELECT unidade_saude.nome, tipo_unidade.tp_unidade_descricao FROM unidade_saude
INNER JOIN tipo_unidade on (unidade_saude.fk_tipo_unidade_id_tp_unidade=tipo_unidade.id_tp_unidade);

SELECT pessoa.nome, cidadao.cartao_sus, logradouro.nome_rua, bairro.nome_bairro, municipio.nome_municipio, estado.nome_estado FROM pessoa
INNER JOIN cidadao on (cidadao.fk_pessoa_cpf=pessoa.cpf)
INNER JOIN logradouro on (logradouro.cep=cidadao.fk_logradouro_cep)
INNER JOIN bairro on (bairro.id_bairro=logradouro.fk_bairro_id_bairro)
INNER JOIN municipio on (municipio.id_municipio=bairro.fk_municipio_id_municipio)
INNER JOIN estado on (estado.id_estado=municipio.fk_estado_id_estado);

SELECT pessoa.nome, funcionario_sus.matricula FROM pessoa
INNER JOIN funcionario_sus on (pessoa.cpf=funcionario_sus.fk_pessoa_cpf);


/*GROUP BY */
SELECT cidadao.cartao_sus, count(cidadao.cartao_sus) as "numero_medicamento" FROM cidadao
INNER JOIN cidadao_medicamento on (cidadao.cartao_sus=cidadao_medicamento.fk_cidadao_cartao_sus)
INNER JOIN medicamento on (medicamento.id_medicamento=cidadao_medicamento.fk_medicamento_id_medicamento)
group by cidadao.cartao_sus;

SELECT DISTINCT cidadao.cartao_sus FROM cidadao
INNER JOIN cidadao_medicamento on (cidadao.cartao_sus=cidadao_medicamento.fk_cidadao_cartao_sus)
INNER JOIN medicamento on (medicamento.id_medicamento=cidadao_medicamento.fk_medicamento_id_medicamento);

SELECT estado.nome_estado, count(logradouro.cep) as "qtd_ruas" FROM estado
INNER JOIN municipio on (estado.id_estado=municipio.fk_estado_id_estado)
INNER JOIN bairro on (municipio.id_municipio=bairro.fk_municipio_id_municipio)
INNER JOIN logradouro on (bairro.id_bairro=logradouro.fk_bairro_id_bairro)
group by estado.nome_estado;

SELECT estado.nome_estado, count(bairro.id_bairro) as "qtd_bairros" FROM estado
INNER JOIN municipio on (estado.id_estado=municipio.fk_estado_id_estado)
INNER JOIN bairro on (municipio.id_municipio=bairro.fk_municipio_id_municipio)
group by estado.nome_estado;

SELECT estado.nome_estado, count(municipio.id_municipio) as "qtd_cidades" FROM estado
INNER JOIN municipio on (estado.id_estado=municipio.fk_estado_id_estado)
group by estado.nome_estado;

SELECT pessoa.cpf, count(contato.fk_pessoa_cpf) from pessoa
INNER JOIN contato on (contato.fk_pessoa_cpf=pessoa.cpf)
group by pessoa.cpf;

/* LEFT/RIGHT JOIN */
SELECT cidadao.cartao_sus, unidade_saude.nome FROM cidadao
LEFT JOIN unidade_saude on (cidadao.fk_unidade_saude_id_posto=unidade_saude.id_posto);

SELECT pessoa.nome, funcionario_sus.matricula FROM pessoa
LEFT JOIN funcionario_sus on (pessoa.cpf=funcionario_sus.fk_pessoa_cpf);


SELECT cidadao.cartao_sus, unidade_saude.nome FROM cidadao
RIGHT JOIN unidade_saude on (cidadao.fk_unidade_saude_id_posto=unidade_saude.id_posto);

SELECT pessoa.nome, funcionario_sus.matricula FROM pessoa
RIGHT JOIN funcionario_sus on (pessoa.cpf=funcionario_sus.fk_pessoa_cpf);

/* SELF JOIN */
CREATE VIEW Cidadao_endereco as
SELECT pessoa.nome, cidadao.cartao_sus, logradouro.nome_rua, bairro.nome_bairro, municipio.nome_municipio, estado.nome_estado FROM pessoa
INNER JOIN cidadao on (cidadao.fk_pessoa_cpf=pessoa.cpf)
INNER JOIN logradouro on (logradouro.cep=cidadao.fk_logradouro_cep)
INNER JOIN bairro on (bairro.id_bairro=logradouro.fk_bairro_id_bairro)
INNER JOIN municipio on (municipio.id_municipio=bairro.fk_municipio_id_municipio)
INNER JOIN estado on (estado.id_estado=municipio.fk_estado_id_estado);

CREATE VIEW Cidadao_contato as
SELECT pessoa.nome, pessoa.cpf, cidadao.cartao_sus, contato.descricao_contato FROM pessoa
INNER JOIN cidadao on (cidadao.fk_pessoa_cpf=pessoa.cpf)
INNER JOIN contato on (pessoa.cpf=contato.fk_pessoa_cpf);

CREATE VIEW Num_medicamentos as
SELECT cidadao.cartao_sus, count(cidadao.cartao_sus) as "numero_medicamento" FROM cidadao
INNER JOIN cidadao_medicamento on (cidadao.cartao_sus=cidadao_medicamento.fk_cidadao_cartao_sus)
INNER JOIN medicamento on (medicamento.id_medicamento=cidadao_medicamento.fk_medicamento_id_medicamento)
group by cidadao.cartao_sus;

SELECT a.nome, b.nome from
pessoa a, pessoa b
WHERE a.cpf<>b.cpf;

SELECT a.nome_bairro, b.nome_bairro
from bairro a, bairro b
WHERE a.fk_municipio_id_municipio=b.fk_municipio_id_municipio AND a.id_bairro<>b.id_bairro;

SELECT a.nome_rua, b.nome_rua
from logradouro a, logradouro b
WHERE a.fk_bairro_id_bairro<>b.fk_bairro_id_bairro;

/* subconsultas */
SELECT * from pessoa
where nome = ( SELECT pessoa.nome where nome like '%an');

SELECT * from pessoa
where nome = ( SELECT pessoa.nome where nome like 'T%');

SELECT * from pessoa
where nome = ( SELECT pessoa.nome where nome like 'J%');

SELECT * from cidadao where
cidadao.fk_logradouro_cep = (select logradouro.cep  from logradouro where logradouro.nome_rua like '%Nascimento');

