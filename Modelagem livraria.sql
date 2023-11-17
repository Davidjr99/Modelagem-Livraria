create database db_livraria; /* criando o banco de dados */
use db_livraria; /* acessando o banco de dados */
create table tb_livro(
	pk_id_livro int auto_increment primary key, /* tipo inteiro por ser numerico */
	nome_livro varchar(100), /* valor alfa-numerico */
	genero enum('fantasia','suspense','comedia','auto-ajuda','ficcao','biografia', 'misterio', 'aventura'),
    data_publi date, /* tipo data ano-mes-dia */
    capa_dura enum('roller','mole','cartao','parana'), /* para valores pré definidos */
    valor_livro decimal(10,2),
    rating enum('bom','otimo','regular','ruim','pessimo')
); /* criação da tabela */

create table tb_editora(
pk_id_editora int primary key not null auto_increment,
nome_editora varchar(50),
telefone_editora varchar(50),
endereco_editora varchar(50)
);

create table tb_autor(
pk_id_autor int primary key not null auto_increment,
nome_autor varchar(100),
endereco_autor varchar(50),
pais_origem varchar(50)
);

alter table tb_livro add column fk_id_editora int ;
alter table tb_livro add column fk_id_autor int ;

alter table tb_livro add constraint fk_id_autor foreign key (fk_id_autor) references tb_autor(pk_id_autor);
alter table tb_livro add constraint fk_id_editora foreign key (fk_id_editora) references tb_editora(pk_id_editora);

describe tb_livro; /* exibe a estrutura */
select * from tb_livro; /* exibe o conteudo da tabela */

insert into tb_livro
(pk_id_livro, nome_livro, genero, autor_livro, editora_livro, data_publi, capa_dura, valor_livro, rating) value
(1,'Perdida','ficcao','Carina Rissi','Verus Editora','2013-06-27','roller',47.79,'regular'),
(2,'Arafat','suspense','Giordono Danta','Dark Side','2013-06-27','parana',17.16,'bom'),
(3,'O físico','biografia','Osório Matsunada','Instituto Cultural','2013-06-27','roller',50,'ruim'),
(4,'Garota Exemplar','suspense','Gillian Flynn','Intriseca','2013-06-27','parana',60.23,'otimo'),
(5,'A musicista','misterio','Gillian Flynn','Instituto Cultural','2013-06-27','roller',20,'bom'),
(6,'Dialogos Impossiveis','comedia','Verissimo','lero lero','2013-06-27','mole',10,'ruim');




/*ADD COLUNA*/
alter table tb_livro add column fk_id_editora int ;
alter table tb_livro add column fk_id_autor int ;

/*ADD CHAVE PRIMARIA*/
alter table tb_livro add constraint fk_id_autor foreign key (fk_id_autor) references tb_autor(pk_id_autor);
alter table tb_livro add constraint fk_id_editora foreign key (fk_id_editora) references tb_editora(pk_id_editora);

select tb_livro.nome_livro, tb_livro.rating, tb_editora.nome_editora
from tb_livro join tb_editora
on tb_livro.fk_id_autor = tb_editora.pk_id_editora; 




insert into tb_autor
(nome_autor, endereco_autor, pais_origem) value
('Gillian Flynn', 'Kansas City', 'EUA'),
('Paulo Coelho', 'roraima', 'brasil'),

('Gregorio de Matos', 'sao paulo', 'brasil'),
('Machado de Assis','amazonas', 'brasil'),
('Carlos Drummond de Andrade', 'parana', 'brasil'),
('Graciliano Ramos', 'rio grande do sul', 'brasil'),
('Eça de Queiros', 'bahia', 'brasil'),
('Pepetela', 'sao paulo', 'brasil'),
('Guimarães Rosa', 'pernambuco', 'brasil'),
('Bernado Carvalho', 'rio de janeiro', 'brasil');

insert into tb_editora
(nome_editora, telefone_editora, endereco_editora) value
('Intrinseca', '(11)9898-551', 'rua lapa tito, 54'),
('Paralela', '(11)9471-185', 'rua martins luizo, 87'),
('Gold', '(11)9111-111', 'rua rodrigues, 54'),
('Companhia das Letras', '(11)9111-185', 'rua Launa, 584'),
('Livraria Garnier', '(11)9471-551', 'rua Davi Machado, 68'),
('Jose Olympio', '(11)9111-185', 'rua Gabriella, 131'),
('Typographia', '(11)9471-551', 'rua cristal, 98'),
('Leya', '(11)5517-551', 'rua Pingo, 84');

insert into tb_livro (nome_livro, genero, data_publi, capa_dura, valor_livro, rating, fk_id_autor, fk_id_editora) value
('Garota Exemplar', 'suspense', '2013-06-27', 'roller', 60.23, 'bom', 1, 1),
('Lugares escuros', 'misterio', '2013-06-27', 'roller', 49.60, 'otimo',1 , 1),
('Objetos Cortantes', 'suspense', '2006-09-18', 'cartao', 15.23, 'regular', 1, 1),
('Dark Places', 'suspense', '2010-05-04', 'cartao', 89.00, 'bom',1 , 1),
('O Alquimista', 'romance','1998-05-27', 'cartao', 40, 'bom', 2,2),
('O Diário de um Mago', 'ficcao',  '1987-05-27', 'roller', 23.99, 'bom', 2,2),
('Brida', 'misterio','2013-06-27', 'roller', 20, 'bom', 2,2),
('Veronika Decide Morrer', 'comedia', '2013-06-27', 'mole', 10, 'regular',2,2),
('Onze Minutos', 'ficcao', '2003-05-27', 'roller', 6, 'bom',2,2),
('Quincas Borba', 'Romance',  '1891-05-27', 'roller', 30,  'bom', 3 ,3),
('Poemas Escolhidos', 'poesia', '1970-05-27', 'roller', 30, 'bom',4  ,4),
('Claro Enigma', 'Poesia',  '1951-05-27', 'roller', 30, 'bom', 5 ,5),
('Angústia', 'Romance',  '1936-05-27', 'roller', 30, 'bom', 6 ,6),
('A Reliquia','Ficcao',  '1887-05-27', 'roller', 30, 'bom', 7 ,7),
('Mayombe', 'Ficcao', '1979-05-27', 'roller', 52.77, 'bom', 8 ,8),
('Campo Geral', 'ficcao', '1994-05-27', 'roller', 41.32, 'bom', 9 ,2),
('Nove Noites', 'ficcao', '1994-05-27', 'roller', 44.94, 'bom', 10 , 2);

select * from tb_livro;