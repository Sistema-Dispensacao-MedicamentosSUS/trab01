# TRABALHO 01:  Sistema de dispensação de medicamentos do SUS
Trabalho desenvolvido durante a disciplina de BD1

# Sumário

### 1. COMPONENTES<br>
Integrantes do grupo<br>
Lucas Francisco Vetis Bregonci: lucasvetis@hotmail.com<br>
Yan Carlos Cordeiro Pitangui: yanpitangui@gmail.com<br>

### 2.INTRODUÇÃO E MOTIVAÇAO<br>
Hoje o sistema dispensação de medicamentos do SUS funciona de forma manual sem o uso de nenhum sistema informatizado para o atendimento a população.<br> O nosso projeto propõe que o usuário do sistema de saúde possa saber o estoque do posto de saúde e receber a notificação da chegada do medicamento,para assim tornar o processo mais conveniente para o usuário e e agilizar os processos de retirada.<br>

### 3.MINI-MUNDO<br>
O funcionário do posto de saúde faz o cadastro dos medicamentos disponíveis para a população, e a manutenção das informações no sistema (entrada e saída de medicamentos,quantidade que chegou em estoque,quantidade que foi retirada, atualização e cadastro dos dados do cidadão)é ele também que irá fazer a entrega dos medicamentos na hora que o usuário for fazer a retirada dos medicamentos.
O usuário do sistema faz o login no sistema com o seu CPF ou cartão do sus, e recebe uma listagem dos medicamentos que ele requereu e estão disponíveis na unidade de saúde do bairro em que ele foi cadastrado, bem como uma listagem com seus dados básicos,relatorio dos ultimos 3 meses contendo quais medicamentos foram requeridos em cada mes,também sera mostrado se tem os medicamentos que ele pediu nas unidades centrais no caso as estaduais ou municipais. Quando existe falta de medicamentos, o cidadão deverá receber uma notificação quando o estoque estiver disponível, bem como o prazo máximo para retirada. Caso contrário,ele ficará sem os medicamentos,não se tem privilegio nem fila de espera,o cidadão terá que ir no posto de saúde do bairro que ele foi cadastrado e fazer a retirada no local fisico onde esta se encontra.O cidadão so podera se cadastrar em um bairro,o cadastro dos usuários vai ser feito so para pessoas residentes no estado do espirito santo assim também como as unidades de saúde cadastradas.

### 4.RASCUNHOS BÁSICOS DA INTERFACE (MOCKUPS)<br>
Neste ponto a codificação não e necessária, somente as ideias de telas devem ser criadas, o princípio aqui é pensar na criação da interface para identificar possíveis informações a serem armazenadas ou descartadas <br>

Ferramenta utilizada: BALSAMIQ MOCKUPS

[Protótipo da visão do usuário](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/visao_cidadao.pdf)<br>
[Protótipo da visão do funcionário do posto de saúde - WIP](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/visao_funcionario.pdf)<br>

#### 4.1 TABELA DE DADOS DO SISTEMA:
    a) Esta tabela deve conter todos os atributos do sistema e um mínimo de 10 linhas.
    b) Esta tabela tem a intenção de simular um relatório com todos os dados que serão armazenados 
    e deve ser criada antes do modelo conceitual
    c) Após criada esta tabela não deve ser modificada, pois será comparada com a tabela final na conclusão do trabalho
    
#### 4.2 QUAIS PERGUNTAS PODEM SER RESPONDIDAS COM O SISTEMA PROPOSTO?
    1. Relatório de quantidade de usuários por posto de saúde.
    2. Relatório de quantidade de medicamentos em estoque.
    3. Relatório de utilização mensal de medicamentos por posto de saúde.
    4. Relatório de utilização mensal de medicamentos por pessoa.
    5. Relatório de utilização anual de medicamentos por posto de saúde.
    6. Relatório de utilização anual de medicamentos por pessoa.
    7. Relatório de usuários por sexo.
    8. Relatório de usuários por posto de saúde.
    9. Relatório de usuários por região.
    10. Relatório de espera de medicamentos.
    
>## Marco de Entrega 01 em: (06/09/2017)<br>

### 5.MODELO CONCEITUAL<br>
    A) NOTACAO ENTIDADE RELACIONAMENTO
        * Para nosso prótótipo limitaremos o modelo conceitual nas 6 principais entidades do escopo
        * O protótipo deve possui no mínimo duas relações N para N
        * o mínimo de entidades do modelo conceitual será igual a 5
        
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/7a2c562d0566ba9868d4b8cf2ba957da1ef94f05/arquivos/modelo_conceitual.png?raw=true "Modelo Conceitual")
    
    B) NOTACAO UML (Caso esteja fazendo a disciplina de analise)
    C) QUALIDADE 
        Garantir que a semântica dos atributos seja clara no esquema
        Criar o esquema de forma a garantir a redução de informação redundante, possibilidade de valores null, 
        e tuplas falsas
    
        
    
#### 5.1 Validação do Modelo Conceitual
    [Grupo01]: Leonir dos Reis Alves
    [Grupo02]: [Nomes dos que participaram na avaliação]

#### 5.2 DECISÕES DE PROJETO

    O cidadão poderá ter apenas uma unidade de referência, que é a do seu bairro. Através do seu endereço poderá pegar da unidade municipal e estadual de onde mora.

#### 5.3 DESCRIÇÃO DOS DADOS 
    [Unidade  de saúde]:Tabela que armazena as informaçoes relativas da unidade de saúde.
    Nome:Campo que guarda o nome da unidade de saúde
    Idposto:campo que armazena o numero único de identificação de cada posto.
    
    [Tipo  de Unidade]:Tabela que armazena o tipo especifico de cada unidade de saúde.
    tp_unidade_descricao:Campo que descreve de que tipo  é a unidade.
    Id_unidade:campo que armazena o numero de identificação do tipo de unidade.
    
    [Medicamento]:Tabela que armazena as informaçoes relativas ao medicamento.
    Nome:Campo que guarda o nome do medicamento.
    Id_medicamento:campo que armazena o numero de identificação do medicamento.
    
    [lote_medicamento]:Tabela que armazena as informaçoes relativas ao lote do medicamento.
    data_validade:campo que guarda a data de validade do lote do medicamento.
    data_fabricação:campo que guarda a data de fabricação do lote do medicamento.
    Id_lote:campo que armazena o numero de identificação do lote do medicamento.
    
    [estoque]: tabela associativa que liga medicamentos à lotes e a unidades de saude.
    Quantidade:Campo que contém a quantidade do medicamento disponivel, referente ao lote e unidade associado.
    data_entrada:Campo que armazena a data de entrada de um lote de medicamentos na unidade se saúde.
    Id_estoque:campo que armazena o numero de identificação do id_estoque do medicamento.
    
    [Funcionário]:Tabela que armazena  as informações relativas ao funcionário.
    Matricula:Campo que guarda o número da matricula para cada funcionário da unidade de saúde.
    senha:Campo que guarda a senha de logon do funcionário.
   
    [Cidadão]:Tabela que armazena  as informações relativas ao cidadão.
    senha:Campo que guarda a senha de logon do cidadão.
    cartão_sus:campo que armazena o numero de identificação do sus do cidadão.
    num_endereco:campo que armazena o numero de endereco da residencia do cidadão.
    
    [Cidade]:Tabela que armazena a cidade onde reside o cidadão.
    id_cidade:Campo que guarda o numero de identificação da cidade.
    nome:campo que guarda o nome da cidade.
    
    [Retirada]:Tabela que armazena as informaçoes a respeito da retirada de um medicamento.
    dt_hr_retirada:Campo que guarda a data de retirada do medicamento.
    quantidade_retirada:Campo que guarda a quantidade retirada do medicamento.
    id_retirada:Campo que guarda o numero de identificação da retirada.

    [tipo_contato]:Tabela que armazena as informaçoes a respeito do tipo de contato 
    id_tp_contato:Campo que guarda o numero de identificação do tipo de contato.
    tp_contato_descricao:Campo que descreve o tipo de contato.
    
    [Logradouro]:Tabela que armazena as informaçoes a respeito do logradouro. 
    nome_rua:Campo que armazena o nome da rua onde reside cidadão.
    id_tp_contato:Campo que guarda o numero de identificacao do logradouro.
    cep:Campo que armazena o numero do cep  da rua.
    
    [Bairro]:Tabela que armazena as informaçoes a respeito do bairro.
    id_bairro:Campo que guarda o numero de identificação do bairro.
    nome_bairro:Campo que armazena o nome do bairro onde reside cidadão.
    
    [Municipio]:Tabela que armazena as informaçoes a respeito do municipio.
    id_municipio:Campo que guarda o numero de identificação do municipio.
    nome_municipio:Campo que armazena o nome do municipio onde reside cidadão.
    
    [Estado]:Tabela que armazena as informaçoes a respeito do estado.
    id_estado:Campo que guarda o numero de identificação do estado.
    nome_estado:Campo que armazena o nome do estado reside cidadão.
    
    
    
    
    
### 6	MODELO LÓGICO<br>
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/arquivos/L%C3%B3gico_1.png?raw=true "Modelo Lógico")

>## Marco de Entrega 02 em: (Data definida no cronograma)<br>

### 7	MODELO FÍSICO<br>
[Modelo Físico](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/arquivos/fisico.sql)
        
### 8	INSERT APLICADO NAS TABELAS DO BANCO DE DADOS<br>
#### 8.1 DETALHAMENTO DAS INFORMAÇÕES
[Inserts](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/arquivos/insert.sql)

#### 8.2 INCLUSÃO DO SCRIPT PARA CRIAÇÃO DE TABELA E INSERÇÃO DOS DADOS
[Modelo Físico + Inserts](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/arquivos/fisico_insert.sql)
#### 8.3 INCLUSÃO DO SCRIPT PARA EXCLUSÃO DE TABELAS EXISTENTES, CRIAÇÃO DE TABELA NOVAS E INSERÇÃO DOS DADOS
[Modelo Físico + Inserts + Drops](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/arquivos/fisico_insert_drop.sql)

### 9	TABELAS E PRINCIPAIS CONSULTAS<br>
#### 9.1	CONSULTAS DAS TABELAS COM TODOS OS DADOS INSERIDOS (Todas) <br>
```sql
SELECT * FROM cidadao;
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/select_cidadao.PNG?raw=true "Select Cidadao")
```sql
SELECT * FROM cidadao_medicamento;
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/select_cidadao_medicamento.PNG?raw=true "Select Cidadao_medicamento")
```sql
SELECT * FROM logradouro;
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/select_logradouro.PNG?raw=true "Select logradouro")
```sql
SELECT * FROM bairro;
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/select_bairro.PNG?raw=true "Select bairro")
```sql
SELECT * FROM municipio;
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/select_municipio.PNG?raw=true "Select municipio")
```sql
SELECT * FROM estado;
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/select_estado.PNG?raw=true "Select estado")
```sql
SELECT * FROM estoque;
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/select_estoque.PNG?raw=true "Select Estoque_unidade")
```sql
SELECT * FROM funcionario_sus;
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/select_funcionario_sus.PNG?raw=true "Select Funcionario_sus")
```sql
SELECT * FROM lote_medicamentos;
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/select_lote_medicamentos.PNG?raw=true "Select Lote_medicamentos")
```sql
SELECT * FROM medicamento;
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/select_medicamento.PNG?raw=true "Select Cidade")
```sql
SELECT * FROM pessoa;
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/select_pessoa.PNG?raw=true "Select Pessoa")
```sql
SELECT * FROM tipo_unidade;
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/select_tipo_unidade.PNG?raw=true "Select Tipo_unidade")
```sql
SELECT * FROM unidade_saude;
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/select_unidade_saude.PNG?raw=true "Select Unidade_saude")
```sql
SELECT * FROM tipo_contato;
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/select_tipo_contato.PNG?raw=true "Select tipo_contato")
```sql
SELECT * FROM contato;
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/select_contato.PNG?raw=true "Select contato")
#### 9.2	CONSULTAS DAS TABELAS COM FILTROS WHERE (Mínimo 4)<br>
```sql
SELECT * FROM estoque_unidade WHERE quantidade>12;
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/where_1.PNG?raw=true "Select where")
```sql
SELECT * FROM estoque_unidade WHERE quantidade<20;
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/where_2.PNG?raw=true "Select where")
```sql
SELECT * FROM lote_medicamentos WHERE data_validade<current_date;
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/where_3.PNG?raw=true "Select where")
```sql
SELECT * FROM lote_medicamentos WHERE data_validade>current_date;
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/where_4.PNG?raw=true "Select where")
#### 9.3	CONSULTAS QUE USAM OPERADORES LÓGICOS, ARITMÉTICOS E CAMPOS RENOMEADOS (Mínimo 6)<br>
```sql
SELECT * FROM pessoa WHERE sexo='F';
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/logico_1.PNG?raw=true "Select Logico")
```sql
SELECT * FROM pessoa WHERE sexo='M';
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/logico_2.PNG?raw=true "Select Logico")
```sql
SELECT * FROM lote_medicamentos WHERE (data_validade-current_date)>=30;
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/aritm_1.PNG?raw=true "Select Aritmetico")
```sql
SELECT * FROM lote_medicamentos WHERE (data_validade-'2017-01-01')<100;
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/aritm_2.PNG?raw=true "Select Aritmetico")
```sql
SELECT id_lote, (data_validade-current_date) as "dias_vencimento" FROM lote_medicamentos;
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/renom_1.PNG?raw=true "Select Renomeado")
```sql
SELECT id_lote, (current_date-data_fabricacao) as "dias_fabricacao" FROM lote_medicamentos;
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/renom_2.PNG?raw=true "Select Renomeado")
#### 9.4	CONSULTAS QUE USAM OPERADORES LIKE (Mínimo 4) <br>
```sql
SELECT * FROM medicamento WHERE nome LIKE '%ina';
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/like_1.PNG?raw=true "Select Like")
```sql
SELECT * FROM medicamento WHERE nome LIKE '%ol';
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/like_2.PNG?raw=true "Select Like")
```sql
SELECT * FROM medicamento WHERE nome LIKE '%am';
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/like_3.PNG?raw=true "Select Like")
```sql
SELECT * FROM pessoa WHERE nome ILIKE 'Jo%';
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/like_4.PNG?raw=true "Select Like")
>## Marco de Entrega 03 em: (Data definida no cronograma)<br>
    
#### 9.5	ATUALIZAÇÃO E EXCLUSÃO DE DADOS (Mínimo 6)<br>
```sql
UPDATE pessoa SET sexo='F', nome='Teste' WHERE cpf=2593481;
DELETE FROM tipo_contato WHERE id_tp_contato=4;
DELETE FROM pessoa WHERE nome='Keila';
DELETE FROM pessoa WHERE cpf=2593481;
DELETE FROM pessoa WHERE nome LIKE '%gna';
UPDATE contato SET descricao_contato='thiaguinho@gmail.com' WHERE id_contato=4;
```
#### 9.6	CONSULTAS COM JUNÇÃO E ORDENAÇÃO (Mínimo 6)<br>
```sql
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
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/join_1.PNG?raw=true "Select Join")

```sql
SELECT pessoa.nome, pessoa.cpf, cidadao.cartao_sus, contato.descricao_contato FROM pessoa
INNER JOIN cidadao on (cidadao.fk_pessoa_cpf=pessoa.cpf)
INNER JOIN contato on (pessoa.cpf=contato.fk_pessoa_cpf);
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/join_2.PNG?raw=true "Select Join")
```sql
SELECT cidadao.cartao_sus, medicamento.nome FROM cidadao
INNER JOIN cidadao_medicamento on (cidadao.cartao_sus=cidadao_medicamento.fk_cidadao_cartao_sus)
INNER JOIN medicamento on (medicamento.id_medicamento=cidadao_medicamento.fk_medicamento_id_medicamento);
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/join_3.PNG?raw=true "Select Join")
```sql
SELECT estado.nome_estado, municipio.nome_municipio, bairro.nome_bairro, logradouro.nome_rua FROM estado
INNER JOIN municipio on (estado.id_estado=municipio.fk_estado_id_estado)
INNER JOIN bairro on (municipio.id_municipio=bairro.fk_municipio_id_municipio)
INNER JOIN logradouro on (bairro.id_bairro=logradouro.fk_bairro_id_bairro);
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/join_4.PNG?raw=true "Select Join")
```sql
SELECT pessoa.nome, cidadao.cartao_sus, logradouro.nome_rua, bairro.nome_bairro, municipio.nome_municipio, estado.nome_estado FROM pessoa
INNER JOIN cidadao on (cidadao.fk_pessoa_cpf=pessoa.cpf)
INNER JOIN logradouro on (logradouro.cep=cidadao.fk_logradouro_cep)
INNER JOIN bairro on (bairro.id_bairro=logradouro.fk_bairro_id_bairro)
INNER JOIN municipio on (municipio.id_municipio=bairro.fk_municipio_id_municipio)
INNER JOIN estado on (estado.id_estado=municipio.fk_estado_id_estado);
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/join_5.PNG?raw=true "Select Join")
```sql
SELECT pessoa.nome, funcionario_sus.matricula FROM pessoa
INNER JOIN funcionario_sus on (pessoa.cpf=funcionario_sus.fk_pessoa_cpf);
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/join_6.PNG?raw=true "Select Join")
#### 9.7	CONSULTAS COM GROUP BY E FUNÇES DE AGRUPAMENTO (Mínimo 6)<br>
#### 9.8	CONSULTAS COM LEFT E RIGHT JOIN (Mínimo 4)<br>
#### 9.9	CONSULTAS COM SELF JOIN E VIEW (Mínimo 6)<br>
        a) Uma junção que envolva Self Join
        b) Outras junções com views que o grupo considere como sendo de relevante importância para o trabalho
#### 9.10	SUBCONSULTAS (Mínimo 3)<br>
