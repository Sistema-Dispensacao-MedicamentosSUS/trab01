# TRABALHO 01:  Sistema de dispensação de medicamentos do SUS
Trabalho desenvolvido durante a disciplina de BD1

# Sumário

### 1. COMPONENTES<br>
Integrantes do grupo<br>
Lucas Francisco Vetis Bregonci: lucasvetis@hotmail.com<br>
Yan Carlos Cordeiro Pitangui: yanpitangui@gmail.com<br>

### 2.INTRODUÇÃO E MOTIVAÇAO<br>
Hoje o sistema dispensação de medicamentos do SUS funciona de forma manual sem o uso de nenhum sistema informatizado para o atendimento a população.<br> O nosso projeto propõe que o usuário do sistema de saúde possa saber o estoque do posto de saúde e receber a notificação da chegada do medicamento.<br>

### 3.MINI-MUNDO<br>
O funcionário do posto de saúde faz o cadastro dos medicamentos disponíveis para a população, do cidadão usuário do SUS e a manutenção das informações no sistema (entrada e saída de medicamentos, atualização e cadastro dos dados do cidadão). Ele deve conseguir colocar o usuário do SUS na fila de medicamentos que não tem estoque imediato.<br>
O usuário do sistema faz o login no sistema com o seu CPF ou cartão do sus, e recebe uma listagem dos medicamentos que estão disponíveis, bem como uma listagem com seus dados básicos. Quando existe falta de medicamentos, o cidadão deverá receber uma notificação quando o estoque estiver disponível, bem como o prazo máximo para retirada. Caso contrário, o cidadão perderá o lugar na fila e terá que entrar novamente.

### 4.RASCUNHOS BÁSICOS DA INTERFACE (MOCKUPS)<br>
Neste ponto a codificação não e necessária, somente as ideias de telas devem ser criadas, o princípio aqui é pensar na criação da interface para identificar possíveis informações a serem armazenadas ou descartadas <br>

Ferramenta utilizada: ADOBE EXPERIENCE DESIGN CC (BETA)

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
        
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/arquivos/modelo_conceitual.png?raw=true "Modelo Conceitual")
    
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
    Bairro:Campo que contém bairro onde fica localizado a unidade de saúde.
    Idposto:campo que armazena o numero único de identificação de cada posto.
    
    [Tipo  de Unidade]:Tabela que armazena o tipo especifico de cada unidade de saúde.
    Nome:Campo que guarda o nome do tipo da unidade de saúde
    Id_tipo:campo que armazena o numero de identificação de cada posto.
    
    [Medicamento]:Tabela que armazena as informaçoes relativas ao medicamento.
    Nome:Campo que guarda o nome do medicamento.
    Id_medicamento:campo que armazena o numero de identificação do medicamento.
    
    [lote_medicamento]:Tabela que armazena as informaçoes relativas ao lote do medicamento.
    data_validade:campo que guarda a data de validade do lote do medicamento.
    data_fabricação:campo que guarda a data de fabricação do lote do medicamento.
    Id_lote:campo que armazena o numero de identificação do lote do medicamento.
    
    [estoque]: tabela associativa que liga medicamentos à lotes e a unidades de saude.
    Quantidade:Campo que contém a quantidade do medicamento disponivel, referente ao lote e unidade associado.
    
    [Funcionário]:Tabela que armazena  as informações relativas ao funcionário.
    Matricula:Campo que guarda o número da matricula para cada funcionário da unidade de saúde.
    
    [Cidadão]:Tabela que armazena  as informações relativas ao cidadão.
    email:Campo que guarda o emaildo cidadão.
    cartão_sus:campo que armazena o numero de identificação do sus do cidadão.
    
    [Cidade]:Tabela que armazena a cidade onde reside o cidadão.
    id_cidade:Campo que guarda o numero de identificação da cidade.
    nome:campo que guarda o nome da cidade.
    
    [Cidadão Medicamento]:Tabela que armazena os medicamentos que o cidadão deseja.
    
### 6	MODELO LÓGICO<br>
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/892a26703352928a84a9f2429db9c49c84bf01c8/arquivos/L%C3%B3gico_1.png?raw=true "Modelo Conceitual")

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
SELECT * FROM cidade;
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/select_cidade.PNG?raw=true "Select Cidade")
```sql
SELECT * FROM estoque_unidade;
```
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/imagens/select_estoque_unidade.PNG?raw=true "Select Estoque_unidade")
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
#### 9.6	CONSULTAS COM JUNÇÃO E ORDENAÇÃO (Mínimo 6)<br>
        a) Uma junção que envolva todas as tabelas possuindo no mínimo 3 registros no resultado
        b) Outras junções que o grupo considere como sendo as de principal importância para o trabalho
#### 9.7	CONSULTAS COM GROUP BY E FUNÇES DE AGRUPAMENTO (Mínimo 6)<br>
#### 9.8	CONSULTAS COM LEFT E RIGHT JOIN (Mínimo 4)<br>
#### 9.9	CONSULTAS COM SELF JOIN E VIEW (Mínimo 6)<br>
        a) Uma junção que envolva Self Join
        b) Outras junções com views que o grupo considere como sendo de relevante importância para o trabalho
#### 9.10	SUBCONSULTAS (Mínimo 3)<br>
