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





 










