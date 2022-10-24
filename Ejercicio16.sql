create table usuario(
id_usuario int auto_increment not null primary key,
contraseña varchar(10),
nombre varchar(10),
apellidos varchar(50),
email varchar(100),
foto varchar(255) comment 'meter codigo url'
);

insert into usuario (contraseña,nombre,apellidos,email,foto) values
('39985459C','Ruben', 'Martinez Toledo','email1','url foto1'),
('48564528J','Juanjo', 'Bernabeu Limosna','email2','url foto2'),
('77486585L','Elena', 'Martinez Ruiseñor','email3','url foto3'),
('65879512P','Ruperta','Jazmín Picardo','email4','url foto4'),
('11876244J','Capoeira','Brasileira Garcia','email5','url foto5'),
('84562187C','Juan','Cano Pino','email6','url foto6'),
('65724189D','Pachin','Ko Mida','email7','url foto7'),
('95764362M','Limo','Nada Uroz','email8','url foto8'),
('84562178C','Phil','Spenser Bandido','email9','url foto9'),
('54879587Z','Marco','Chcecceto Zdarsky','email10','url foto10');

create table telefono(
numero int not null primary key,
id_usuario int,
foreign key (id_usuario)
references usuario(id_usuario)
on delete cascade on update cascade
);

insert into telefono (numero,id_usuario) values
(652597562,10),
(687412365,8),
(621478459,10),
(698512258,7),
(654123987,6),
(639852147,5),
(654128937,3),
(684235791,9),
(684235719,1),
(695123874,2);

create table escribir(
id_escribe int not null,
id_escrito int not null,
primary key(id_escribe,id_escrito),
foreign key (id_escribe)
references usuario(id_usuario)
on delete cascade on update cascade,
foreign key (id_escrito)
references usuario(id_usuario)
on delete cascade on update cascade
);

insert into escribir (id_escribe,id_escrito) values
(9,10),
(6,8),
(5,10),
(4,7),
(3,6),
(1,5),
(2,3),
(10,9),
(8,1),
(6,2);

create table seguir(
id_sigue int not null,
id_seguido int not null,
primary key(id_sigue,id_seguido),
foreign key (id_sigue)
references usuario(id_usuario)
on delete cascade on update cascade,
foreign key (id_seguido)
references usuario(id_usuario)
on delete cascade on update cascade
);

insert into seguir (id_sigue,id_seguido) values
(3,5),
(4,6),
(5,2),
(6,1),
(7,3),
(8,5),
(2,8),
(10,10),
(8,7),
(6,2);

create table post(
id_post int auto_increment not null primary key,
descripcion varchar(255),
max_caracteres int,
id_usuario int,
foreign key (id_usuario)
references usuario(id_usuario)
on delete cascade on update cascade
);

insert into post (descripcion,max_caracteres,id_usuario) values
('Descripcion Post 1',562,10),
('Descripcion Post 2',322,8),
('Descripcion Post 3',582,10),
('Descripcion Post 4',912,7),
('Descripcion Post 5',403,6),
('Descripcion Post 6',157,5),
('Descripcion Post 7',325,3),
('Descripcion Post 8',562,9),
('Descripcion Post 9',772,1),
('Descripcion Post 10',832,2);

create table reaccionar(
id_usuario int not null,
id_post int not null,
primary key (id_usuario,id_post),
foreign key (id_usuario)
references usuario(id_usuario)
on delete cascade on update cascade,
foreign key (id_post)
references post(id_post)
on delete cascade on update cascade
);

insert into reaccionar (id_usuario,id_post) values
(1,5),
(5,1),
(2,8),
(6,3),
(7,9),
(10,2),
(6,4),
(1,7),
(5,6),
(8,10);

create table compartir(
id_usuario int not null,
id_post int not null,
primary key (id_usuario,id_post),
foreign key (id_usuario)
references usuario(id_usuario)
on delete cascade on update cascade,
foreign key (id_post)
references post(id_post)
on delete cascade on update cascade
);

insert into compartir (id_usuario,id_post) values
(3,5),
(7,1),
(10,8),
(8,3),
(2,9),
(1,2),
(9,4),
(4,7),
(6,6),
(5,10);

create table comentar(
id_usuario int not null,
id_post int not null,
primary key (id_usuario,id_post),
foreign key (id_usuario)
references usuario(id_usuario)
on delete cascade on update cascade,
foreign key (id_post)
references post(id_post)
on delete cascade on update cascade
);

insert into comentar (id_usuario,id_post) values
(3,2),
(7,10),
(10,3),
(8,6),
(2,7),
(1,1),
(9,9),
(4,5),
(6,4),
(5,3);