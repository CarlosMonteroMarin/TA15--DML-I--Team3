create table departamento(
id_departamento int auto_increment not null primary key,
nombre varchar(20)
);

create table empleado(
id_trabajador int auto_increment not null primary key,
dni varchar(9) not null unique,
n_ss int unique,
nombre varchar(15),
apellidos varchar(50),
direccion varchar(100),
telefono int,
id_departamento int,
dni_responsable varchar(9),
foreign key (id_departamento)
references departamento(id_departamento)
on delete set null
on update cascade,
foreign key (dni_responsable)
references empleado(dni)
on delete set null on update cascade
);

create table contrato(
id_contrato int auto_increment not null primary key,
fecha_inicial date,
fecha_final date,
categoria varchar(10),
dni_empleado varchar(9),
foreign key (dni_empleado)
references empleado(dni)
on delete no action on update cascade
);

alter table contrato
add constraint fecha_inicial check (fecha_final>fecha_inicial);

create table nomina (
id_nomina int auto_increment not null primary key,
fecha date,
salario double,
id_contrato int,
foreign key (id_contrato)
references contrato(id_contrato)
on delete cascade on update cascade
);

insert into departamento (nombre) values
('departamento 1'),
('departamento 2'),
('departamento 3'),
('departamento 4'),
('departamento 5'),
('departamento 6'),
('departamento 7'),
('departamento 8'),
('departamento 9'),
('departamento 10');

insert into empleado (dni,n_ss,nombre,apellidos,direccion,telefono,id_departamento,dni_responsable) values
('39985459C',1111111,'Ruben', 'Martinez Toledo','calle número uno',652597562,5,null),
('48564528J',1111112,'Juanjo', 'Bernabeu Limosna','calle número dos',687412365,1,'39985459C'),
('77486585L',1111113,'Elena', 'Martinez Ruiseñor','calle número tres',621478459,9,'48564528J'),
('65879512P',1111114,'Ruperta','Jazmín Picardo','calle número cuatro',698512258,6,'39985459C'),
('11876244J',1111115,'Capoeira','Brasileira Garcia','calle número cinco',654123987,3,'39985459C'),
('84562187C',1111116,'Juan','Cano Pino','calle número seis',639852147,2,'48564528J'),
('65724189D',1111117,'Pachin','Ko Mida','calle número siete',654128937,4,'65879512P'),
('95764362M',1111118,'Limo','Nada Uroz','calle número ocho',684235791,7,'39985459C'),
('84562178C',1111119,'Phil','Spenser Bandido','calle número nueve',684235719,8,'48564528J'),
('54879587Z',1111121,'Marco','Chcecceto Zdarsky','calle número diez',695123874,10,'65879512P');

insert into contrato (fecha_inicial,fecha_final,categoria,dni_empleado) values 
('2000-10-05','2001-04-15','AAA1A','48564528J'),
('2010-08-05','2012-04-15','AAA1B','11876244J'),
('1995-10-05','2020-04-15','AAA1C','84562178C'),
('2007-11-05','2012-04-15','AAA1D','65724189D'),
('2015-10-05','2017-04-15','AAA1E','77486585L'),
('2014-10-05','2021-04-15','AAA1F','95764362M'),
('2019-10-05','2022-04-15','AAA1G','48564528J'),
('2015-10-05','2021-04-15','AAA1H','65724189D'),
('2004-10-05','2012-04-15','AAA1I','54879587Z'),
('2000-10-05','2006-04-15','AAA1J','48564528J');

insert into nomina (fecha,salario,id_contrato) values 
('2000-10-05',10000,5),
('2010-08-05',20000,6),
('1995-10-05',30000,1),
('2007-11-05',999.85,9),
('2015-10-05',1999.85,3),
('2014-10-05',2999.85,2),
('2019-10-05',1500,4),
('2015-10-05',2500,7),
('2004-10-05',3500,8),
('2000-10-05',4000,10);