create table empleado(
dni varchar(9) not null primary key,
nombre varchar(10),
apellidos varchar(50),
numero_ss int,
telefono_fijo int,
telefono_movil int
);

insert into empleado (dni,nombre,apellidos,numero_ss,telefono_fijo,telefono_movil) values
('39985459C','Ruben', 'Martinez Toledo',1111111,987532145,652597562),
('48564528J','Juanjo', 'Bernabeu Limosna',1111112,987532146,687412365),
('77486585L','Elena', 'Martinez Ruiseñor',1111113,987532147,621478459),
('65879512P','Ruperta','Jazmín Picardo',1111114,987532125,698512258),
('11876244J','Capoeira','Brasileira Garcia',1111115,987532126,654123987),
('84562187C','Juan','Cano Pino',1111116,987532129,639852147),
('65724189D','Pachin','Ko Mida',1111117,987533333,654128937),
('95764362M','Limo','Nada Uroz',1111118,987534444,684235791),
('84562178C','Phil','Spenser Bandido',1111119,987531586,684235719),
('54879587Z','Marco','Chcecceto Zdarsky',1111121,987534527,695123874),
('39985450C','Rubon', 'Martinez Toledo',1111131,111132145,61197562),
('48564520J','Juanjon', 'Bernabeu Limosna',1111132,222232146,622412365),
('77486580L','Eleno', 'Martinez Ruiseñor',1111133,333332147,633478459),
('65879510P','Ruperto','Jazmín Picardo',1111134,444432125,644512258),
('11876240J','Capoeiro','Brasileira Garcia',1111135,555532126,655123987),
('84562180C','Juanon','Cano Pino',1111136,666632129,666652147),
('65724180D','Pachon','Ko Mida',1111137,777733333,677128937),
('95764360M','Limon','Nada Uroz',1111138,888834444,688235791),
('84562170C','Philon','Spenser Bandido',1111139,999931586,699235719),
('54879580Z','Marcon','Chcecceto Zdarsky',1111141,959534527,655812387);

create table cocinero(
dni varchar(9) not null primary key,
años_servicio double,
fecha_inicio date,
foreign key (dni)
references empleado(dni)
on delete cascade on update cascade
);

insert into cocinero (dni,años_servicio,fecha_inicio) values
('39985459C',20,'1999-01-02'),
('48564528J',17,'1999-02-03'),
('77486585L',16,'1999-03-04'),
('65879512P',15,'1999-04-05'),
('11876244J',14,'1999-05-06'),
('84562187C',14,'1999-06-07'),
('65724189D',12,'1999-07-08'),
('95764362M',11,'1999-08-09'),
('84562178C',09,'1999-09-10'),
('54879587Z',08,'1999-10-11');

create table pinche(
dni varchar(9) not null primary key,
fecha_nacimiento date,
dni_cocinero varchar(9),
foreign key (dni)
references empleado(dni)
on delete cascade on update cascade,
foreign key (dni_cocinero)
references cocinero(dni)
on delete set null on update cascade
);

insert into pinche (dni_cocinero,fecha_nacimiento,dni) values
('39985459C','1999-01-02','48564520J'),
('48564528J','1999-02-03','39985450C'),
('77486585L','1999-03-04','77486580L'),
('65879512P','1999-04-05','65879510P'),
('11876244J','1999-05-06','11876240J'),
('84562187C','1999-06-07','84562180C'),
('65724189D','1999-07-08','65724180D'),
('95764362M','1999-08-09','95764360M'),
('84562178C','1999-09-10','84562170C'),
('54879587Z','1999-10-11','54879580Z');

create table plato (
nombre varchar(20) not null primary key,
precio double,
tipo_plato varchar(10)
);

insert into plato (nombre,precio,tipo_plato) values
('Plato1',11,'Primero'),
('Plato2',12,'Segundo'),
('Plato3',13,'Postre'),
('Plato4',14,'Tapa'),
('Plato5',15,'Primero'),
('Plato6',16,'Segundo'),
('Plato7',17,'Postre'),
('Plato8',18,'Tapa'),
('Plato9',19,'Primero'),
('Plato10',20,'Segundo');

create table cocina(
dni_cocinero varchar(9) not null,
nombre_plato varchar(10) not null,
primary key (dni_cocinero,nombre_plato),
foreign key (dni_cocinero)
references cocinero(dni)
on delete cascade on update cascade,
foreign key (nombre_plato)
references plato(nombre)
on delete cascade on update cascade
);

insert into cocina (dni_cocinero,nombre_plato) values
('39985459C','Plato1'),
('48564528J','Plato2'),
('77486585L','Plato3'),
('65879512P','Plato4'),
('11876244J','Plato5'),
('84562187C','Plato6'),
('65724189D','Plato7'),
('95764362M','Plato8'),
('84562178C','Plato9'),
('54879587Z','Plato10');

create table ingrediente(
nombre varchar(20) not null primary key,
cantidad int not null
);

insert into ingrediente (nombre,cantidad) values
('Ingrediente1',10),
('Ingrediente2',20),
('Ingrediente3',30),
('Ingrediente4',40),
('Ingrediente5',50),
('Ingrediente6',60),
('Ingrediente7',70),
('Ingrediente8',80),
('Ingrediente9',90),
('Ingrediente10',100);

create table gasta(
nombre_plato varchar(20) not null,
nombre_ingrediente varchar(20) not null,
cantidad_usada int,
primary key (nombre_plato, nombre_ingrediente),
foreign key (nombre_plato)
references plato(nombre)
on delete cascade on update cascade,
foreign key (nombre_ingrediente)
references ingrediente(nombre)
on delete cascade on update cascade
);

insert into gasta (nombre_ingrediente,nombre_plato,cantidad_usada) values
('Ingrediente1','Plato1',1),
('Ingrediente2','Plato1',2),
('Ingrediente3','Plato1',3),
('Ingrediente4','Plato1',4),
('Ingrediente2','Plato2',2),
('Ingrediente3','Plato2',3),
('Ingrediente4','Plato2',4),
('Ingrediente9','Plato3',9),
('Ingrediente8','Plato3',8),
('Ingrediente7','Plato3',7);

create table almacen(
id_almacen int auto_increment not null primary key,
nombre varchar(10),
descripcion varchar(255)
);

insert into almacen (nombre,descripcion) values
('Almacen1','Primer almacen'),
('Almacen2','Segundo almacen'),
('Almacen3','Tercer almacen'),
('Almacen4','Cuarto almacen'),
('Almacen5','Quinto almacen'),
('Almacen6','Sexto almacen'),
('Almacen7','Septimo almacen'),
('Almacen8','Octavo almacen'),
('Almacen9','Noveno almacen'),
('Almacen10','Decimo almacen');

create table almacena (
nombre_ingrediente varchar(20) not null,
id_almacen int not null,
primary key(nombre_ingrediente, id_almacen),
foreign key (nombre_ingrediente)
references ingrediente(nombre)
on delete cascade on update cascade,
foreign key (id_almacen)
references almacen(id_almacen)
on delete cascade on update cascade
);

insert into almacena (nombre_ingrediente,id_almacen) values
('Ingrediente1',1),
('Ingrediente2',2),
('Ingrediente3',3),
('Ingrediente4',4),
('Ingrediente2',10),
('Ingrediente3',7),
('Ingrediente4',6),
('Ingrediente9',9),
('Ingrediente8',8),
('Ingrediente7',7);

create table estanteria(
id int auto_increment not null primary key,
tamaño double,
id_almacen int,
foreign key (id_almacen)
references almacen(id_almacen)
on delete cascade on update cascade
);

insert into estanteria (tamaño,id_almacen) values
(27.5,1),
(33.4,10),
(43.6,3),
(7.58,5),
(300,3),
(12,4),
(48.9,8),
(53.2,7),
(65,9),
(29,7);