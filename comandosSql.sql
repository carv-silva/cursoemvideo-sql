create database cadastro
default character set utf8
default collate utf8_general_ci;

use cadastro;

create table pessoas (
	id int not null auto_increment,
	nome varchar(30) not null,
	nascimento date,
	sexo enum ('M', 'F'),
	peso decimal(5,2),
	altura decimal(3,2),
    nacionalidade varchar(20) default 'Brasil',
    primary key(id)
) default charset = utf8;

insert into pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
values
('Maria', '1980-02-015','F','55.2', '1.83', 'Brasil');

alter table pessoas
add column profissao varchar(10) not null after nome; /*adiciona campo dps do nome*/

alter table pessoas
drop column profissao;/*apaga a coluna profissao*/

alter table pessoas
modify column profissao varchar(20) default '' ;

alter table pessoas
change column profissao prof varchar(20) not null default ''; /*muda o nome da coluna */

alter table pessoas
rename to teste; /*muda o nome da tabela inteira*/

select * from pessoas;
desc pessoas;

select * from teste;
desc teste;

create table if not exists cursos(
	nome varchar(30) not null unique,
    descricao text,
    carga int unsigned,
    totaulas int unsigned,
    ano year default '2018'
)default charset = utf8;

alter table cursos
add column idcurso int first; /*add o campo idcurso como primeiro*/

alter table cursos
add primary key (idcurso);

alter table cursos
drop column idcurso;

select * from cursos;
desc cursos;

drop table cursos; /*apaga tabelas*/

select * from  teste;
select * from  cursos;

insert into cursos values
('HTML5','Curso de HTML5','40','37','2014'),
('Algoritmos','Logica de Programação','20','15','2014'),
('Photoshop','Dicas de Photoshop CC','10','8','2014'),
('PGP','Curso de PHP para iniciantes','40','20','2010'),
('Jarva','Introdução a Linguagem Java','10','29','2000'),
('MySQL','Bancos de Dados MySQL','30','15','2016'),
('Word','Curso completo de Word','40','30','2016'),
('Sapateado','Danças Ritimicas','40','30','2018'),
('Cozinha Arabe','Aprenda a fazer Kibe','40','30','2018'),
('YouTuber','Gerar polemica e ganhar inscritos','5','2','2018');

select * from cursos;
desc cursos;

select * from teste;

/*alterando resgistro na tabela com comando UPDATE*/

update cursos
set nome = 'HTM5'
where idcurso = '1';

update cursos
set nome = 'PHP', ano = '2015'
where idcurso = '4';

update cursos
set nome = 'Java', carga = '40', ano = '2015'
where idcurso = '5'
limit 1;/*limita a alteração apenas para uma linha*/

delete from cursos
where idcurso = '10';

truncate table cursos; x/*remove todas linhas*/

drop database cadastro; -- apagando para verificar se  o bkp funcionou

use cadatro;
select * from cursos;

/*apaga o banco e restaura usando o bkp*/

use cadastro;

show tables; -- mostra as tabelas

select * from cursos;

///aula 10 phpmyadmin///

create table amigos (
	id int not null auto_increment,
	nome varchar(30) not null,
	telefone varchar(11),
    primary key(id),
    unique key (nome)
) default charset = utf8;

alter table amigos
add sexo enum('M','F')not null after nome;

insert into amigos
(id, nome, sexo, telefone)
values (NULL, 'Maria','F','2222-3333'), (NULL, 'Joao','M', '2222-3333'),
(NULL, 'Jose','M','3333-2222'),(NULL, 'Ana','F','1111-2222');

update amigos
set telefone = '1111-2222'
where id = '2';

///aula 11 select///

select * from cursos
order  by nome; --> seleciona todos os dado da coluna nome por ordem alfabetica.

desc (nome da table) --->  mostra a tabela

select * from cursos
order  by nome desc(decrescente); --> aqui o desc serve para crescente inverter ordem alfabetica z-a

select nome, carga, ano from cursos
order by ano, nome; --> aqui ele vai ordenar em forma crescente o ano dps o nome

select * from cursos
where ano = '2016' -->  mostra na tabela somente cursos quem tem ano de 2016.
order by 'nome';

select nome, carga from cursos
where ano = '2016' --> nessa consulta ele nao mostra o campo 2016,
order by 'nome'; -->pois ele ja tem conhecimento que todos os cursos que vc pesquisou sao de 2016

result set --> nome tecnico para os dados que retorna de uma consulta

query --> é um pedido de uma informação ou de um dado.
Esse pedido também pode ser entendido como uma consulta, uma solicitação ou, ainda, uma requisição.

// operadores relacionais//

select nome, descricao from cursos
where ano <= '2015' --> aqui ele vai selecionar todos os cursos menor ou igual a 2015
order by nome; -->no mesmo sentindo que nao vai aparecer a coluna de 2015 e 2014 pq ele ja sabe

select nome, ano from cursos
where ano between '2014' and '2016' --> serve para selecionar dados entre ex: "anos" and "anos"
order by ano desc, nome asc; --> order by significa ordenação entre dados

select nome, descricao, ano from cursos
where ano in (2014, 2016) --> aqui ele vai mostra a saida de dados entre 2014 e 2016
order by ano, nome; --> ordenando em ano e dps nome order alfabetica e dps numeros crescente.

select * from cursos
where carga > 35 and totaulas < 30
order by ano, nome;

select nome, carga, totaulas from cursos
where carga > 35 and totaulas < 30; --> aqui ele vai retorna os dados somente qnd tiver
										 carga maior que 35 e totalaulas menos que 30.

select nome, carga, totaulas from cursos
where carga > 35 or totaulas < 30; --> aqui ele vai retorna os dados somente qnd tiver
									  valor de carga maior que 35 ou totalaulas menor que 30 (um ou outro).

--------------####------------------Curso MySQL #12 - SELECT (Parte 2)--------------####------------------

LIKE --> significa parecido geralmente é usando junto com % que significa nenhum ou varios caracteres
ex:
select * from cursos
where nome like 'p%'; --> aqui ele ira retorna a consulta como todos nomes que começa com p
que no caso o % ele representa qualquer conjunto de caractere que vem pela frente
obs: precisa do % e ele é sensitive case , e se vc colocar o % no começo da palvra ele busca os
nome que tenha a letra so no fina da palavra

select * from cursos
where nome like '%a%'; --> aqui ele vai retorna qualquer nome que teja a palavra a por causa do %

select * from cursos
where nome not like '%a%'; --> vai retorna nome sem a letra

select * from cursos
where nome not like '%a%';

update cursos set nome = 'Poo'
where idcurso = '9';  --> muda o valor do nome para Poo atraves do id

select * from  cursos
where nome like 'ph%p'; --> retorna todos os nome que tenha ph no comeco

select * from  cursos
where nome like 'ph%p%'; --> retorna todos curso  que tenha ph no comeco e tenha algum dado dps do p ex: php7

select * from  cursos
where nome like 'ph%p_'; --> retorno todos os cursos com nome que comeca com ph termina com p e tenha alguma coisa no final



select * from  gafanhotos
where nome like '%silva%'; --> retorna todos os nomes que tenha silva ou que comece

select * from  gafanhotos
where nome like '%_silva%'; --. retorna todos os nome que tenha sobrenome silva

select * from  gafanhotos
where nome like '%silva'; --> termina com silva

select * from  gafanhotos
where nome like 'silva%'; -- comeca com silva

select  nacionalidade from gafanhotos; --> retorna todas nacionalidades da tabela

select distinct carga from cursos; --> vai retorna so carga que nao repete valores iguais

select distinct nacionalidade from gafanhotos  --> retorna todas nacionalidades sem repedicao de valores
order by nacionalidade; --> retorna em ordem alfabetica

 select carga from cursos
 order by carga; --> retorna   todas horario de carga da tabela


select distinct carga from cursos
order by carga; --> retorna todas os horarios de carga sem repeticao


--- agregacao ---

select * from cursos; --> retorna toda a tabela curso

select count(*) from cursos; --> conta todos cursos que tem na tabela
select count(nome) from cursos;--> mesmo resultado mais pode usar campo dentro do ()

select * from cursos where carga > 30;

select count(*) from cursos where carga > 30;


select max(carga) from cursos; --> retorna o resultado da maior carga da tabela

select max(totaulas) from cursos where ano = '2016'; --> dentro do curso de 2016 retorna o max numero de aulas

select min(totaulas) from cursos; --> retorna o min de aulas da tabela cursos

select nome, min(totaulas) from cursos where ano = '2016'; --> nao ta funcionando nao sei pq

select sum(totaulas) from cursos; --> retorna a soma do total de aulas

select sum(totaulas) from cursos where ano = '2016'; --> retorna a soma do total de aulas dos cursos onde o ano é 2016


select avg(totaulas) from cursos; --> retorna a media do total de aulas

select avg(totaulas) from cursos where ano = '2016'; --> retorna a media do total de aulas onde o curso e do ano de 2016

######--exerc--####

1 - 'Uma lista com o nome de todas as gafanhotas'
2 - 'Uma lista com os dados de todas aquelas que nasceram entre 1/Jan/2000 e 31/Dez/2015'
3 - 'Uma lista com o nome de todos os homens que trabalaham como Programadores'
4 - 'Uma lista com os dados de todas as mulheres que nasceram no Brasil e que
tem seu nome iniciando com a letra J'
5 - 'Uma lista com o nome e nacionalidade de todos os homens que tem Silva no
nome, nao nasceram no Brasil e pesam menos de 100 kg'
6 - 'Qual e a maior altura entre gafanhotos homens que moram no brasil'
7 - 'Qual e a media de peso dos gafanhotos cadastrados?'
8 - 'Qual e o menor peso entre as gafanhotas mulheres que nasceram foram do
brasil e entre 01/jan/1990 e 31/dez/2000'
9 - 'Quantas gafanhotas mulheres tem mais de 1.90m de altura?'

1 - select * from gafanhotos
where sexo = 'F';

2 - select * from gafanhotos
where nascimento between '2000-01-01' and '2015-12-31'
order by nascimento;

3 - select nome, sexo from gafanhotos
where sexo = 'M' and profissao = 'Programador'
order by nome;

4 - select nome, sexo,nacionalidade from gafanhotos
where nome like 'j%' and sexo = 'F' and nacionalidade = 'Brasil'
order by nome;


5 - select nome, nacionalidade from gafanhotos
where sexo = 'M' and nome like '%Silva%' and nacionalidade != 'Brasil'
and peso < "100";

6 - select max(altura) from gafanhotos
where sexo = 'M' and nacionalidade = 'Brasil';

7 - select avg(peso) from gafanhotos;

8 - select min(peso) from gafanhotos
where sexo ='F' and nacionalidade != 'Brasil'
and nascimento between '1990-01-01' and '2000-12-31';

9 - select count(nome) from gafanhotos
where sexo = 'F' and altura > 1.90;


################--aula 13--###########

select distinct carga from cursos
order by carga; -- mostrando a diferenca entre distinct e group(agrupamento)

select carga from cursos
group by carga;

select totaulas, count(*) from cursos
group by totaulas
order by totaulas;

select carga, count(nome) from cursos
group by carga
having count(nome) > 3;

select ano, count(*) from cursos
where totaulas > 30
group by ano
having ano > 2013
order by count(*) desc;

select carga, count(*) from cursos
where ano > 2015
group by carga
having carga > (select avg(carga) from cursos);

exercs aula 13

1 - "Uma lista com as profissao dos gafanhotos e seus
respectivos gafanhotos e seus respectivos quantitativos"

2 - "Quantos gafanhotos homens e quantas mulheres nasceram apos 01/jan/2005?"

3 - "Uma lista com gafanhotos que nasceram fora do brasil, mostrando o pais de origem
e o total de pessoas nascidas la.So nos interessam os paises que tiveram mais de 3 gafanhotos
com essa nacionalidade"

4 - "Uma lista agrupada pela altura dos gafanhotos, mostrando quantas pessoas pesam
mais de 100kg e que estao acima da media de altura de todos os cadastrados"


1 - select profissao,count(*) from gafanhotos
group by profissao;

2 - select sexo, count(sexo) from gafanhotos
where nascimento > '2005-01-01'
group by sexo;

3 - select nacionalidade, count(*) from gafanhotos
where nacionalidade != 'brasil'
group by nacionalidade
having count(nacionalidade) > 3;

4 -select altura, count(*)from gafanhotos
where peso > '100'
group by altura
having altura > (select avg(altura) from gafanhotos);



 ##########---Aula 15  Chaves Estrangeiras e JOIN---############


DESCRIBE cadastro.gafanhotos;
alter table cadastro.gafanhotos add cursopreferido int; --> adicionando um valor na tabela

---adicionando uma Foreign key---
alter table gafanhotos
add foreign key (cursopreferido)
references cursos(idcurso);


update cadastro.gafanhotos set cursopreferido = '6' where id = '1';


select * from cadastro.gafanhotos;

select * from cadastro.cursos;


delete from cadastro.cursos
where idcurso = '28';

select nome, cursopreferido from gafanhotos; --> aparece nome e curso preferido

select nome, ano from cursos;

select gafanhotos.nome, gafanhotos.cursopreferido, cursos.nome, cursos.ano
from gafanhotos inner JOIN cursos
on cursos.idcurso = gafanhotos.cursopreferido
ORDER by cadastro.gafanhotos.nome; --> aqui ele mostra nome e curso preferido da tabela gafanhotos
--juntos com nome e ano da tabela cursos atraves do join


---obs :: toda vez que usa o join tem que usar a causa On para falar das chaves

---inner join faz a junção de duas tabelas ou mais --> faz a ligacao das linhas
---gafanhotos que preferem cursos so

---outer join considera todos os usuarios das tabelas pega
---vc especifica ela como direita ou esquerda



select gafanhotos.nome, gafanhotos.cursopreferido, cursos.nome, cursos.ano
from gafanhotos left(right) outer JOIN cursos --> esqueda ou direita
on cursos.idcurso = gafanhotos.cursopreferido;
ORDER by cadastro.gafanhotos.nome;


create table gafanhotos_assiste_curso(
    id int not null auto_increment,
    data date,
    idgafanhoto int,
    idcurso int,
    primary key (id),
    foreign key (idgafanhoto) references gafanhotos(id),
    foreign key (idcurso) references cursos(idcurso),
)default charset = utf8;


insert into cadastro.gafanhotos_assiste_curso VALUES
(DEFAULT, '2016-05-12', '1', '19'),
(DEFAULT, '2015-12-22', '3', '6'),
(DEFAULT, '2014-03-01', '22', '12');

SELECT * FROM cadastro.gafanhotos_assiste_curso;

select * from cadastro.gafanhotos g
join cadastro.gafanhotos_assiste_curso a
on g.id = a.idgafanhoto;

select g.nome, c.nome from cadastro.gafanhotos g
join cadastro.gafanhotos_assiste_curso a
on g.id = a.idgafanhoto
join cadastro.cursos c
on c.idcurso = a.idcurso
order by g.nome;


select * from cadastro.gafanhotos gafanhotos
join cadastro.gafanhotos.idgafanhoto(g)
on gafanhotos_assiste_curso;









