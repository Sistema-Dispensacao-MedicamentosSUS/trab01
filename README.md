# TRABALHO 01:  Sistema de dispensação de medicamentos do SUS
Trabalho desenvolvido durante a disciplina de BD1

# Sumário

### 1. COMPONENTES<br>
Integrantes do grupo<br>
Maciel da Silva Rocha: email_maciel.rocha@hotmail.com<br>
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

[Protótipo da visão do usuário](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/master/Vis%C3%A3o%20do%20Paciente.pdf)<br>
[Protótipo da visão do funcionário do posto de saúde - WIP](www.google.com)<br>

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
        
![Alt text](https://github.com/Sistema-Dispensacao-MedicamentosSUS/trab01/blob/e67cb3605f45334af1c65ceb2c2cf07a636c5221/modelo_conceitual.png?raw=true "Modelo Conceitual")
    
    B) NOTACAO UML (Caso esteja fazendo a disciplina de analise)
    C) QUALIDADE 
        Garantir que a semântica dos atributos seja clara no esquema
        Criar o esquema de forma a garantir a redução de informação redundante, possibilidade de valores null, 
        e tuplas falsas
    
        
    
#### 5.1 Validação do Modelo Conceitual
    [Grupo01]: [Nomes dos que participaram na avaliação]
    [Grupo02]: [Nomes dos que participaram na avaliação]

#### 5.2 DECISÕES DE PROJETO
    lista_medicamentos: Este atributo é multivalorado para permitir que o usuário cadastre vários, sem limite.

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
    lista_medicamentos: lista de medicamentos que o cidadão deseja obter.
    
    


### 6	MODELO LÓGICO<br>
        a) inclusão do modelo lógico do banco de dados
        b) verificação de correspondencia com o modelo conceitual 
        (não serão aceitos modelos que não estejam em conformidade)

>## Marco de Entrega 02 em: (Data definida no cronograma)<br>

### 7	MODELO FÍSICO<br>
        a) inclusão das instruções de criacão das estruturas DDL 
        (criação de tabelas, alterações, etc..)
          
        
### 8	INSERT APLICADO NAS TABELAS DO BANCO DE DADOS<br>
#### 8.1 DETALHAMENTO DAS INFORMAÇÕES
        a) inclusão das instruções de inserção dos dados nas tabelas criadas pelo script de modelo físic
        b) formato .SQL

#### 8.2 INCLUSÃO DO SCRIPT PARA CRIAÇÃO DE TABELA E INSERÇÃO DOS DADOS
        a) Junção dos scripts anteriores em um único script 
        (create para tabelas e estruturas de dados + dados a serem inseridos)
        b) Criar um novo banco de dados para testar a restauracao 
        (em caso de falha na restauração o grupo não pontuará neste quesito)
        c) formato .SQL
#### 8.3 INCLUSÃO DO SCRIPT PARA EXCLUSÃO DE TABELAS EXISTENTES, CRIAÇÃO DE TABELA NOVAS E INSERÇÃO DOS DADOS
        a) Junção dos scripts anteriores em um único script 
        (Drop table + Create de tabelas e estruturas de dados + dados a serem inseridos)
        b) Criar um novo banco de dados para testar a restauracao 
        (em caso de falha na restauração o grupo não pontuará neste quesito)
        c) formato .SQL


### 9	TABELAS E PRINCIPAIS CONSULTAS<br>
    OBS: Incluir para cada tópico as instruções SQL + imagens (print da tela) mostrando os resultados.<br>
#### 9.1	CONSULTAS DAS TABELAS COM TODOS OS DADOS INSERIDOS (Todas) <br>
#### 9.2	CONSULTAS DAS TABELAS COM FILTROS WHERE (Mínimo 4)<br>
#### 9.3	CONSULTAS QUE USAM OPERADORES LÓGICOS, ARITMÉTICOS E CAMPOS RENOMEADOS (Mínimo 6)
     a) Criar no mínimo 2 com operadores lógicos
     b) Criar no mínimo 2 com operadores aritméticos
     c) Criar no mínimo 2 com operação de renomear campo
#### 9.4	CONSULTAS QUE USAM OPERADORES LIKE (Mínimo 4) <br>

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
### 10	ATUALIZAÇÃO DA DOCUMENTAÇÃO DOS SLIDES PARA APRESENTAÇAO FINAL (Mínimo 6 e Máximo 10)<br>
### 11	TUTORIAL COMPLETO DE PASSOS PARA RESTAURACAO DO BANCO E EXECUCAO DE PROCEDIMENTOS ENVOLVIDOS NO TRABALHO PARA OBTENÇÃO DOS RESULTADOS<br>
        a) Outros grupos deverão ser capazes de restaurar o banco 
        b) executar todas as consultas presentes no trabalho
        c) executar códigos que tenham sido construídos para o trabalho 
        d) realizar qualquer procedimento executado pelo grupo que desenvolveu o trabalho
        
### 12   DIFICULDADES ENCONTRADAS PELO GRUPO<br>
### 13   TRABALHO DE MINERAÇÃO DE DADOS
        a) captura das informaçõs
        b) integração com banco de dados em desenvolvimento
        c) atualização da documentação do trabalho incluindo a mineração de dados
        
### 13  FORMATACAO NO GIT: https://help.github.com/articles/basic-writing-and-formatting-syntax/

### 14 Backup completo do banco de dados postgres 
    a) deve ser realizado no formato "backup" 
        (Em Dump Options #1 Habilitar opções Don't Save Owner e Privilege)
    b) antes de postar o arquivo no git o mesmo deve ser testado/restaurado por outro grupo de alunos/dupla
    c) informar aqui o grupo de alunos/dupla que realizou o teste.
    
>## Marco de Entrega 04/Entrega Final em: (Data definida no cronograma)<br>
    
### OBSERVAÇÕES IMPORTANTES

#### Todos os arquivos que fazem parte do projeto (Imagens, pdfs, arquivos fonte, etc..), devem estar presentes no GIT. Os arquivos do projeto vigente não devem ser armazenados em quaisquer outras plataformas.
1. Caso existam arquivos com conteúdos sigilosos, comunicar o professor que definirá em conjunto com o grupo a melhor forma de armazenamento do arquivo.

#### Todos os grupos deverão fazer Fork deste repositório e dar permissões administrativas ao usuário deste GIT, para acompanhamento do trabalho.

#### Os usuários criados no GIT devem possuir o nome de identificação do aluno (não serão aceitos nomes como Eu123, meuprojeto, pro456, etc). Em caso de dúvida comunicar o professor.


Link para BrModelo:<br>
http://sis4.com/brModelo/brModelo/download.html
<br>


Link para curso de GIT<br>
![https://www.youtube.com/curso_git](https://www.youtube.com/playlist?list=PLo7sFyCeiGUdIyEmHdfbuD2eR4XPDqnN2?raw=true "Title")
