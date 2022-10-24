create table guerra(
nombre varchar(30) not null primary key,
año_inicio date,
año_fin date
);

alter table guerra
add constraint año_fin check (año_fin>año_inicio);

create table bando(
nombre varchar(20) not null primary key,
ganador boolean
);

create table participan(
nombre_guerra varchar(30) not null,
nombre_bando varchar (20) not null,
primary key (nombre_guerra, nombre_bando),
foreign key (nombre_guerra)
references guerra(nombre)
on delete cascade on update cascade,
foreign key (nombre_bando)
references bando(nombre)
on delete cascade on update cascade
);

create table pais (
nombre varchar (20) not null primary key,
año_entrada date,
año_salida date,
nombre_bando varchar(20),
foreign key (nombre_bando)
references bando(nombre)
on delete set null on update cascade
);

alter table pais
add constraint año_entrada check (año_salida>año_entrada);

create table tiempo_independencia (
id_pais int auto_increment not null primary key,
fecha_inicio date,
fecha_fin date,
nombre_pais varchar(20),
foreign key (nombre_pais)
references pais(nombre)
on delete cascade
on update cascade
);

alter table tiempo_independencia
add constraint fecha_inicio check (fecha_fin>fecha_inicio);

insert into guerra (nombre,año_inicio,año_fin) values
('guerra 1','1995-10-12','1995-11-12'),
('guerra 2','1996-10-12','1996-11-12'),
('guerra 3','1997-10-12','1997-11-12'),
('guerra 4','1995-11-12','1995-12-12'),
('guerra 5','1995-08-12','1995-11-12'),
('guerra 6','2020-10-12','2021-11-12'),
('guerra 7','1916-10-12','1932-11-12'),
('guerra 8','1756-08-12','1785-03-12'),
('guerra 9','2055-06-12','2058-11-21'),
('guerra 10','1995-01-05','2023-11-12');

insert into bando (nombre,ganador) values
('bando 1',true),
('bando 2',false),
('bando 3',true),
('bando 4',true),
('bando 5',false),
('bando 6',false),
('bando 7',true),
('bando 8',false),
('bando 9',true),
('bando 10',false);

insert into participan (nombre_guerra,nombre_bando) values
('guerra 1','bando 1'),
('guerra 1','bando 2'),
('guerra 1','bando 3'),
('guerra 2','bando 1'),
('guerra 2','bando 5'),
('guerra 3','bando 7'),
('guerra 3','bando 10'),
('guerra 4','bando 2'),
('guerra 4','bando 4'),
('guerra 4','bando 8');

insert into pais (nombre,año_entrada,año_salida,nombre_bando) values 
('pais 1','1958-10-05','2001-04-15','bando 3'),
('pais 2','1854-05-12','1978-03-20','bando 7'),
('pais 3','1982-03-05','2021-09-01','bando 2'),
('pais 4','2005-08-30','2007-04-15','bando 3'),
('pais 5','1999-10-05','2013-08-26','bando 4'),
('pais 6','1978-01-25','1978-10-05','bando 6'),
('pais 7','1958-10-05','2011-04-15','bando 5'),
('pais 8','1730-10-05','1860-04-15','bando 9'),
('pais 9','1988-06-25','2015-07-01','bando 1'),
('pais 10','1998-10-05','2001-04-15','bando 3');

insert into tiempo_independencia (fecha_inicio,fecha_fin,nombre_pais) values 
('1915-10-05','2021-04-15','pais 1'),
('1940-10-05','2021-06-15','pais 3'),
('1913-10-05','2021-04-13','pais 9'),
('1985-10-05','2021-10-08','pais 10'),
('1906-10-05','2021-05-16','pais 6'),
('1997-10-05','2021-01-03','pais 2'),
('1874-10-05','2021-04-15','pais 5'),
('1958-10-05','2021-10-26','pais 7'),
('1725-10-05','2001-11-05','pais 4'),
('1452-10-05','2001-12-25','pais 2');