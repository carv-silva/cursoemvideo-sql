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
('1','HTML5','Curso de HTML5','40','37','2014'),
('2','Algoritmos','Logica de Programação','20','15','2014'),
('3','Photoshop','Dicas de Photoshop CC','10','8','2014'),
('4','PGP','Curso de PHP para iniciantes','40','20','2010'),
('5','Jarva','Introdução a Linguagem Java','10','29','2000'),
('6','MySQL','Bancos de Dados MySQL','30','15','2016'),
('7','Word','Curso completo de Word','40','30','2016'),
('8','Sapateado','Danças Ritimicas','40','30','2018'),
('9','Cozinha Arabe','Aprenda a fazer Kibe','40','30','2018'),
('10','YouTuber','Gerar polemica e ganhar inscritos','5','2','2018');

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

truncate table cursos; /*remove todas linhas*/

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






 










