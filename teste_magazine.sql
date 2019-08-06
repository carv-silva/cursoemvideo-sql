

create database cadastro_teste
default character set utf8
default collate utf8_general_ci;

use cadastro_teste;

create table funcionarios (
	id int not null auto_increment,
	nome varchar(30),
	cpf varchar(11) not null,
	endereco varchar(45),
	numero int,
	bairro varchar(25),
    cidade varchar(25),
    estado varchar(2),
	cep varchar(8),
    primary key(id)
) default charset = utf8;


insert into funcionarios
(nome, cpf, endereco, numero, bairro, cidade, estado, cep)
values
('SUELI DOS SANTOS', '99718456953','JULIO DE SOUZA PORTELA, 416','101', 'OSTERNACK', 'CURITIBA', 'PR', '81930000'),
('EMANUELLE PERON', '99673800120','WILSON GABIATI, 745','203', 'BNH - 4 PLANO', 'DOURADOS', 'MS', '79800000'),
('ELISANGELA DIONISIO DA SILVA', '99653923153','BOM PASTOR 1852','90', 'VILA INES', 'JALES', 'SP', '15700000'),
('VITOR HUGO MARCIANO', '99407000168','ALMIRANTE LUIS PENIDO BURNIE 47','1111', 'JD SANDRA', 'SAO PAULO', 'SP', '5860000'),
('ALINE APARECIDA SANTOS LIMA', '99141108191','F 16','387', 'VILA POPULAR', 'DOURADOS', 'MS', '79800000'),
('CLAUDIO MARCOS NUNES', '99099616953','MARIO ZAMBORENZI 1849','246', 'CAMPO CUMPRIDO', 'CURITIBA', 'PR', '81230310'),
('LEANDRO OLIVEIRA MEDINA', '98652397104','A 1','2349', 'BALSAMO', 'CAMPO GRANDE', 'MS', '79073120'),
('OZIEL PEREIRA DA SILVA', '98597639920','RIO TIETE 165','10', 'B ALTO', 'CURITIBA', 'PR', '82840350'),
('ROSINEI MARIA TEIXEIRA', '98572164634','GERALDO SERRANO N 1082','333', 'SAO JOSE', 'DIVINOPOLIS', 'MG', '35500001');



create table estoque (
	item int,
	descricao varchar(25),
	saldo int
) default charset = utf8;


insert into estoque
(item, descricao, saldo)
values
('283940','NOTBOOK','500'),
('930491','LIVRO','2530'),
('382947','CELULAR IPHONE X','10'),
('382947','CELULAR IPHONE X','1000'),
('203840','GELADEIRA','50'),
('203947','MAQUINA DE LAVAR','10'),
('102738','CHIP','500'),
('209384','BICICLETA','20');

create table clientes(
	id int not null auto_increment,
	nome varchar(30),
	rg varchar(9),
	cpf varchar(11) not null,
	dtNascimento varchar(10),
	sexo enum ('M', 'F'),
	nomeMae varchar(30),
	nomePai varchar(30),
	celular varchar(12), 
	primary key(id)
)default charset = utf8;


insert into clientes
(nome, rg, cpf, dtNascimento, sexo, nomeMae, nomePai, celular)
values
('GISLENE DE MENEZES', '6701781', '59584050125', '9/3/1973', 'F', 'ELZA MARIA GEROMIN', 'IVAN GEROMIN', '991192538'),
('EWALDO MENDES', '3554691', '', '12/10/1946', 'M', 'LUZILDA NALINE MENDES', 'EDUARDO MENDES', '991963943'),
('DIRLENE A FERNANDES FARIA', '20266504', '17361458866', '10/18/1968', 'F', 'CONCEICAO AVELAR FERNANDES', 'JOSE FERNANDE FL', '919283948'),
('ADAO SANTO', '5991402', '79724469891', '2/22/1953', 'M', 'ERCILIA VITAL SANTO', 'DOMINGOS SANTO FILHO', '921839439'),
('SERGIO MOREIRA SOUZA', '120838540', '2092692860', '9/12/1956', 'M', 'VIRGINIA DIAS FRANCO', 'PEDRO MOREIRA SOUZA', '992918394'),
('MARLENE PEDRO DA SILVA', '299412374', '25405553816', '8/18/1967', 'F', 'ILZA A SILVA', 'JUSTINO PEDRO SILVA', '930193384'),
('PAULO CESAR GAMBARINI', '9428696', '92406653820', '8/9/1957', 'M', 'ANGELINA MEDEIROS GAMBARINI', 'DURVAL GAMBARINI', '912338193'),
('MARCOS ANTONIO CORTEZ', '255931086', '16193358838', '3/21/1973', 'M', 'JOANA DA SILVA SANTANA', '', ''),
('SUELI MARIA MICHELINI ROCHITI', '14810616', '16195856851', '8/9/1961', 'F', 'MARIA DORES SOUZA MICHELINE', 'ADALTO MICHELINE', '991938492'),
('MARIA LUCIA RODRIGUES SILVA', '11803318', '198373805', '9/4/1949', 'F', 'ORLANDA RAMOS DA SILVA', 'JORGE RODRIGUES', '918948193'),
('CARLOS A CAMPESI DEVIDES', '18293718', '5005542850', '3/26/1964', 'M', 'MARIA DEBORA CAMPESI DEVIDES', 'FERNANDINHO DEVIDES', '939183844'),
('MARIA SOCORRO VIEIRA SOUZA', '1719995', '22645250459', '10/1/1956', 'F', 'CRISTINA MARIA SOUZA', 'JOSE VIEIRA SOUZA', '919309183');


update clientes
set celular = '913345948' --> 1
where id = '4001';

update clientes
set celular = '913345948'
where id = '8';

select * from clientes
where celular = '913345948'; 


select * from clientes
where cpf = ''; ---> 2/1


update clientes
set cpf = '12345678910' --> 2/2
where id = '192';

update clientes
set cpf = '12345678910'
where id = '2';


select count(*) from funcionarios
where estado = 'PR'; --> 3/3

insert into clientes
(nome, rg, cpf, dtNascimento, sexo, nomeMae, nomePai, celular) --> 4
values
('Rafael Oliveira dos Santos', '123456789', '10987654321', '04/08/1992', 'M', 'Maria de Lurdes dos Santos', 'Jose Carlos dos Santos', '992839183'); 


select * from estoque
where item = '382947'; ---> 5/1

delete from estoque 
where saldo = '10'; --> 5/2











