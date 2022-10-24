create table estadio(
nombre varchar(20) not null primary key,
año_creacion date
);

insert into estadio (nombre,año_creacion) values 
('Estadio 1','2001-04-15'),
('Estadio 2','2002-04-15'),
('Estadio 3','2003-04-15'),
('Estadio 4','2004-04-15'),
('Estadio 5','2005-04-15'),
('Estadio 6','2006-04-15'),
('Estadio 7','2007-04-15'),
('Estadio 8','2008-04-15'),
('Estadio 9','2009-04-15'),
('Estadio 10','2010-04-15');

create table partido(
id_partido int auto_increment not null primary key,
nombre varchar(20),
poblacion varchar(15)
);

insert into partido (nombre,poblacion) values 
('Partido 1','Poblacion 1'),
('Partido 2','Poblacion 2'),
('Partido 3','Poblacion 3'),
('Partido 4','Poblacion 4'),
('Partido 5','Poblacion 5'),
('Partido 6','Poblacion 6'),
('Partido 7','Poblacion 7'),
('Partido 8','Poblacion 8'),
('Partido 9','Poblacion 9'),
('Partido 10','Poblacion 10');

create table arbitro(
dni varchar(9) not null primary key,
nombre varchar(10),
apellidos varchar(50)
);

insert into arbitro (dni,nombre,apellidos) values
('39985459C','Ruben', 'Martinez Toledo'),
('48564528J','Juanjo', 'Bernabeu Limosna'),
('77486585L','Elena', 'Martinez Ruiseñor'),
('65879512P','Ruperta','Jazmín Picardo'),
('11876244J','Capoeira','Brasileira Garcia'),
('84562187C','Juan','Cano Pino'),
('65724189D','Pachin','Ko Mida'),
('95764362M','Limo','Nada Uroz'),
('84562178C','Phil','Spenser Bandido'),
('54879587Z','Marco','Chcecceto Zdarsky');

create table arbitra(
id_partido int,
dni_arbitro varchar(9),
primary key (id_partido,dni_arbitro),
foreign key (id_partido)
references partido(id_partido)
on delete cascade on update cascade,
foreign key (dni_arbitro)
references arbitro(dni)
on delete cascade on update cascade
);

insert into arbitra (id_partido,dni_arbitro) values
(10,'39985459C'),
(1,'48564528J'),
(9,'77486585L'),
(2,'65879512P'),
(8,'11876244J'),
(3,'84562187C'),
(7,'65724189D'),
(4,'95764362M'),
(6,'84562178C'),
(5,'54879587Z');

create table equipo (
nombre varchar(10) not null primary key,
año_creacion date,
nombre_estadio varchar(20),
foreign key (nombre_estadio)
references estadio(nombre)
on delete set null on update cascade
);

insert into equipo (nombre,año_creacion,nombre_estadio) values 
('Equipo 1','2001-04-15','Estadio 4'),
('Equipo 2','2012-04-15','Estadio 5'),
('Equipo 3','2020-04-15','Estadio 8'),
('Equipo 4','2012-04-15','Estadio 1'),
('Equipo 5','2017-04-15','Estadio 2'),
('Equipo 6','2021-04-15','Estadio 6'),
('Equipo 7','2022-04-15','Estadio 9'),
('Equipo 8','2021-04-15','Estadio 3'),
('Equipo 9','2012-04-15','Estadio 7'),
('Equipo 10','2006-04-15','Estadio 10');

create table juega(
nombre_equipo varchar(10) not null,
nombre_estadio varchar(20) not null,
id_partido int not null,
primary key (nombre_equipo, nombre_estadio, id_partido),
foreign key (nombre_equipo)
references equipo(nombre)
on delete cascade on update cascade,
foreign key (nombre_estadio)
references estadio(nombre)
on delete cascade on update cascade,
foreign key (id_partido)
references partido(id_partido)
on delete cascade on update cascade
);

insert into juega (nombre_equipo,nombre_estadio,id_partido) values 
('Equipo 1','Estadio 10',5),
('Equipo 2','Estadio 9',4),
('Equipo 3','Estadio 8',3),
('Equipo 4','Estadio 7',2),
('Equipo 5','Estadio 6',1),
('Equipo 6','Estadio 5',10),
('Equipo 7','Estadio 4',9),
('Equipo 8','Estadio 3',8),
('Equipo 9','Estadio 2',7),
('Equipo 10','Estadio 1',6);

create table entrenador(
dni varchar(9) not null primary key,
nombre varchar(10),
apellidos varchar(50),
nombre_equipo varchar(10),
foreign key (nombre_equipo)
references equipo(nombre)
on delete set null on update cascade
);

insert into entrenador (dni,nombre,apellidos,nombre_equipo) values
('11111111A','Jaime', 'Martinez Toledo','Equipo 5'),
('22222222B','Juanjo', 'Cubano Perez','Equipo 4'),
('33333333C','Elena', 'Rodriguez Ruiseñor','Equipo 3'),
('44444444D','Carmin','Lupita Picardo','Equipo 2'),
('55555555E','Paco','Brasileira Garcia','Equipo 1'),
('66666666F','Juan','Tulapo Redondo','Equipo 10'),
('77777777G','Limbo','Ko Dados','Equipo 9'),
('88888888H','Cambo','Barquín Ruperto','Equipo 8'),
('99999999I','Thomas','Spenser Gorrino','Equipo 7'),
('10101010J','Marcus','Daneto Zdarsky','Equipo 6');

create table jugador(
dni varchar(9) not null primary key,
nombre varchar(10),
apellidos varchar(50),
nombre_equipo varchar(10),
foreign key (nombre_equipo)
references equipo(nombre)
on delete set null on update cascade
);

insert into jugador (dni,nombre,apellidos,nombre_equipo) values
('01010101A','Atun', 'SalinasToledo','Equipo 5'),
('02020202B','Juanjo', 'Timon Rato','Equipo 5'),
('03030303C','Elena', 'Cardenas Pagor','Equipo 3'),
('04040404D','Jaime','Lupita Tucado','Equipo 2'),
('05050505E','Paco','Binaria Tocarte','Equipo 3'),
('06060606F','Juan','Garnido Pinario','Equipo 3'),
('07070707G','Jasmin','Timado Retoque','Equipo 9'),
('08080808H','Pelon','Barqueta Cubierto','Equipo 9'),
('09090909I','Jesus','Lucar Gorrino','Equipo 9'),
('20202020J','Lurdes','Gachete Timado','Equipo 2');

create table ficha_estadistica(
id_estadistica int auto_increment not null primary key,
goles int,
faltas int,
minutos_jugados double,
dni_jugador varchar(9),
foreign key (dni_jugador)
references jugador(dni)
on delete cascade on update cascade
);

insert into ficha_estadistica (goles,faltas,minutos_jugados,dni_jugador) values
(10,4, 35.5,'01010101A'),
(3,1, 48.5,'02020202B'),
(5,2,63.2,'03030303C'),
(8,3,24.1,'04040404D'),
(6,2,75,'05050505E'),
(2,1,36,'06060606F'),
(5,1,64.25,'07070707G'),
(3,4,47,'08080808H'),
(1,2,36.45,'09090909I'),
(2,1,78.4,'20202020J');