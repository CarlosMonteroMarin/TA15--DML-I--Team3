create table ciclo(
codigo_int_ciclo int auto_increment primary key,
nombre varchar(20),
grado varchar (20));

create table aula(
id_aula int auto_increment primary key,
nombre varchar(20),
codigo int,
metros double);

create table asignaturas(
codigo_int_assig int auto_increment primary key,
codigo_europeo int,
nombre varchar(20),
codigo_interno2 int, 
id_aula int,
foreign key (codigo_interno2)
references asignaturas (codigo_int_assig)
on delete set null
on update cascade,
foreign key (id_aula)
references aula (id_aula)
on delete set null
on update cascade);

create table tiene(
codigo_int_assig int,
codigo_int_ciclo int,
primary key (codigo_int_ciclo, codigo_int_assig),
foreign key (codigo_int_assig)
references asignaturas (codigo_int_assig)
on delete cascade
on update cascade,
foreign key (codigo_int_ciclo)
references ciclo (codigo_int_ciclo)
on delete cascade
on update cascade);

create table profesor(
codigo_int_profesor int auto_increment primary key,
dni varchar(8),
nombre varchar (20),
direccion varchar (50),
telefono int,
email varchar (50),
n_seguridad_social int,
años_antiguedad double,
fecha_inicio date,
fecha_fin date,
codigo_int_assig int,
Foreign Key (codigo_int_assig)
References asignaturas (codigo_int_assig)
On Delete Set Null
On Update Cascade);

Create Table horario(
id_horario int auto_increment primary key,
hora date,
dia_semana varchar (15),
id_aula int,
codigo_int_profesor int,
Foreign Key (id_aula)
References aula (id_aula)
On Delete Set Null
On Update Cascade,
Foreign Key (codigo_int_profesor)
References profesor (codigo_int_profesor)
On Delete Set Null
On Update Cascade);

INSERT INTO ciclo (nombre,grado) values
("SMX","Medio"),
("SMX2","Medio"),
("ASIX","Superior"),
("DAM","Superior"),
("DAW","Superior"),
("SMX3","Medio"),
("DAM2","Superior"),
("ASIX2","Superior"),
("SMX4","Medio"),
("SMX5","Medio");

INSERT INTO aula (nombre,codigo,metros) values
("Aula-1",1,45),
("Aula-2",2,55),
("Aula-3",3,25),
("Aula-4",4,54),
("Aula-5",5,22),
("Aula-6",6,33),
("Aula-7",7,42),
("Aula-8",8,23),
("Aula-9",9,15),
("Aula-10",10,45);

INSERT INTO asignaturas (codigo_europeo,nombre,codigo_interno2,id_aula) VALUES
(1111,"MATES",1,10),
(2222,"CATALAN",2,9),
(3333,"CASTELLANO",3,8),
(4444,"INGLES",4,7),
(5555,"FISICA",5,6),
(6666,"QUIMICA",6,5),
(7777,"QUIMICA2",7,4),
(8888,"RELIGION",8,3),
(9999,"ALEMAN",9,2),
(1000,"INFORMATICA",10,1);

INSERT INTO tiene (codigo_int_assig,codigo_int_ciclo) values
(1,10),
(2,9),
(3,8),
(4,7),
(5,6),
(6,5),
(7,4),
(8,3),
(9,2),
(10,1);

INSERT INTO profesor (dni,nombre,telefono,n_seguridad_social,años_antiguedad,fecha_inicio,fecha_fin,codigo_int_assig) values
("11112222","PEPE",979797979,112424,5,'2022-1-1','2022-1-25',1),
("22223333","ANTONIO",878787878,242412,9,'2022-2-1','2022-2-25',2),
("33334444","LAURA",656565656,34242,2,'2022-3-1','2022-3-25',3),
("44445555","ANTONIOA",245345353,44242,7,'2022-4-1','2022-4-25',4),
("5555666F","RAMONA",534534533,5427,1,'2022-5-1','2022-5-25',5),
("6666777E","MENGANA",353453345,6354345,2,'2022-6-1','2022-6-25',6),
("7777888D","ANA",237545342,453457,2,'2022-7-1','2022-7-25',7),
("8888999C","FULANO",325737833,845634564,6,'2022-8-1','2022-8-25',8),
("9999000B","MENGANO",387354374,9546457,7,'2022-9-1','2022-9-25',9),
("0000000A","JOSE",378534533,104554645,9,'2022-10-1','2022-10-25',10);


INSERT INTO horario  (dia_semana,id_aula,codigo_int_profesor) values
("Lunes",10,1),
("martes",9,2),
("miercoles",8,3),
("jueves",7,4),
("viernes",6,5),
("lunes",5,6),
("martes",4,7),
("miercoles",3,8),
("jueves",2,9),
("viernes",1,10);







