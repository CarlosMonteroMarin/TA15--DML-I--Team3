create table socio (
codigo_socio int auto_increment not null primary key,
dni varchar(9),
direccion varchar(100),
telefono int,
nombre nvarchar(8),
apellidos nvarchar(50)
);

create table libro(
isbn varchar(20) not null primary key,
titulo nvarchar(50),
editorial nvarchar (100),
año_escritura date,
año_edicion date,
editorial_editora nvarchar (100)
);

create table autores(
id_autores int auto_increment not null primary key,
autor nvarchar(10)
);

create table volumen(
id_volumen int auto_increment not null primary key,
deteriorado boolean,
isbn varchar(20),
foreign key (isbn)
references libro(isbn)
on delete cascade
on update cascade
);

create table prestamo(
id_prestamo int auto_increment not null primary key,
nombre nvarchar(20),
fecha_prestamo date,
fecha_devolucion date,
fecha_max date,
codigo_socio int,
id_volumen int,
foreign key (codigo_socio)
references socio(codigo_socio)
on delete set null
on update cascade,
foreign key (id_volumen)
references volumen(id_volumen)
on delete set null
on update cascade
);

alter table prestamo
add constraint fecha_max check (fecha_max<=fecha_prestamo+15);


create table escribe(
isbn varchar(20) not null,
id_autor int not null,
primary key (isbn, id_autor),
foreign key (isbn)
references libro(isbn)
on delete cascade
on update cascade,
foreign key (id_autor)
references autores(id_autores)
on delete cascade 
on update cascade
);

insert into socio (dni,direccion,telefono,nombre, apellidos) values
('39985459C','calle número uno',652597562,'Ruben', 'Martinez Toledo'),
('48564528J','calle número dos',687412365,'Juanjo', 'Bernabeu Limosna'),
('77486585L','calle número tres',621478459,'Elena', 'Martinez Ruiseñor'),
('65879512P','calle número cuatro',698512258,'Ruperta','Jazmín Picardo'),
('11876244J','calle número cinco',654123987,'Capoeira','Brasileira Garcia'),
('84562187C','calle número seis',639852147,'Juan','Cano Pino'),
('65724189D','calle número siete',654128937,'Pachin','Ko Mida'),
('95764362M','calle número ocho',684235791,'Limo','Nada Uroz'),
('84562178C','calle número nueve',684235719,'Phil','Spenser Bandido'),
('54879587Z','calle número diez',695123874,'Marco','Chcecceto Zdarsky');

insert into libro (isbn,titulo,editorial,año_escritura,año_edicion,editorial_editora) values
('584-852-4753-25-1','La vuelta al mundo en 80 dias','CROSSBOOKS','2000-10-18','2001-07-06','CROSSBOOKS'),
('357-59-85247-254','El libro de la selva','EDICIONES LUCIÉRNAGA','1997-05-20','2001-07-23','CROSSBOOKS'),
('456-14789-2-35-25','Los pilares de la tierra','TANTANFAN','2002-09-07','2013-01-15','CROSSBOOKS'),
('35-852-647-85214','El nombre del viento','ZAFIRO EBOOKS','2013-01-15','2013-06-20','ZAFIRO EBOOKS'),
('14-58-267-1478-1-1','El temor de un hombre sabio','PLANETALECTOR','1999-02-28','2003-10-30','ZAFIRO EBOOKS'),
('3514-2-587-95-1-25','Luces de bohemia','PARA DUMMIES','1850-06-12','1913-09-23','ZAFIRO EBOOKS'),
('857-241-369-9518','La sombra del viento','PLANETA CÓMIC','2018-07-09','2018-08-20','ZAFIRO EBOOKS'),
('26-852-34-955-749','El resplandor','EDICIONES LUCIÉRNAGA','1973-11-13','1995-09-17','ZAFIRO EBOOKS'),
('87965-5-28-32-753','Tirant lo blanc','CROSSBOOKS','1706-08-16','1750-10-17','ZAFIRO EBOOKS'),
('2-58-16-852-1-2-369','El niño con pijama de rayas','PARA DUMMIES','2008-09-25','2016-03-17','ZAFIRO EBOOKS');

insert into autores (autor) values
('Joselin'),
('Joselin 1'),
('Joselin 2'),
('Joselin 3'),
('Joselin 4'),
('Joselin 5'),
('Joselin 6'),
('Joselin 7'),
('Joselin 8'),
('Joselin 9');

insert into volumen (deteriorado,isbn) values
(true,'584-852-4753-25-1'),
(false,'456-14789-2-35-25'),
(true,'26-852-34-955-749'),
(true,'357-59-85247-254'),
(false,'2-58-16-852-1-2-369'),
(true,'87965-5-28-32-753'),
(false,'14-58-267-1478-1-1'),
(false,'456-14789-2-35-25'),
(true,'3514-2-587-95-1-25'),
(false,'2-58-16-852-1-2-369');

insert into prestamo(nombre,fecha_prestamo,fecha_devolucion,fecha_max,codigo_socio,id_volumen) values
('prestamo 1','2022-12-11','2022-12-11','2022-12-12',5,6),
('prestamo 2','2022-12-11','2022-12-11','2022-12-12',3,7),
('prestamo 3','2022-08-11','2022-08-11','2022-08-12',7,2),
('prestamo 4','2022-05-11','2022-05-11','2022-05-12',9,1),
('prestamo 5','2022-01-11','2022-01-11','2022-01-12',5,2),
('prestamo 6','2022-01-17','2022-01-27','2022-01-28',8,5),
('prestamo 7','2022-02-17','022-02-27','2022-02-28',2,8),
('prestamo 8','2022-10-17','022-10-27','2022-10-28',6,5),
('prestamo 9','2022-07-17','2022-07-27','2022-07-28',4,9),
('prestamo 10','2021-07-17','2021-07-27','2021-07-28',1,2);

insert into escribe(isbn,id_autor) values
('584-852-4753-25-1',1),
('14-58-267-1478-1-1',5),
('35-852-647-85214',3),
('2-58-16-852-1-2-369',4),
('357-59-85247-254',1),
('456-14789-2-35-25',7),
('3514-2-587-95-1-25',6),
('584-852-4753-25-1',5),
('35-852-647-85214',2),
('3514-2-587-95-1-25',9);