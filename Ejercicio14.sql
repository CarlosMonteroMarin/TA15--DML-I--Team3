CREATE TABLE celebridad(
dni VARCHAR(8) NOT NULL PRIMARY KEY,
nombre varchar (30),
apellidos VARCHAR (50),
numero_ss int,
telefono_fijo int);

CREATE TABLE usuario(
id_usuario INT auto_increment primary key,
contraseña VARCHAR(30),
telefono int,
nombre varchar(30),
apellidos varchar (30),
email varchar(50),
foto blob, 
celebridad boolean,
dni VARCHAR(8),
FOREIGN KEY (dni)
REFERENCES celebridad (dni)
ON DELETE SET NULL
ON UPDATE CASCADE);

CREATE TABLE bloquear(
id_usuario int,
id_usuario_bloqueado int,
PRIMARY KEY (id_usuario, id_usuario_bloqueado),
FOREIGN KEY (id_usuario)
REFERENCES usuario (id_usuario)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_usuario_bloqueado)
REFERENCES usuario (id_usuario)
ON DELETE CASCADE
ON UPDATE CASCADE);


CREATE TABLE contacto(
id_contacto INT auto_increment PRIMARY KEY,
nombre varchar(20),
comentario varchar(255),
id_usuario int,
FOREIGN KEY (id_usuario)
REFERENCES usuario (id_usuario)
ON DELETE CASCADE
ON UPDATE CASCADE);

CREATE TABLE grupo(
id_grupo int auto_increment primary key,
nombre varchar(20),
id_usuario int,
FOREIGN KEY (id_usuario)
REFERENCES usuario (id_usuario)
ON DELETE CASCADE
ON UPDATE CASCADE);

CREATE TABLE formado_por(
id_grupo int,
id_contacto int,
PRIMARY KEY (id_grupo, id_contacto),
FOREIGN KEY (id_grupo)
REFERENCES grupo (id_grupo)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_contacto)
REFERENCES contacto (id_contacto)
ON DELETE CASCADE
ON UPDATE CASCADE);

INSERT INTO celebridad (dni,nombre,telefono_fijo,numero_ss) values
("11112222","PEPE",979797979,1),
("22223333","ANTONIO",878787878,2),
("33334444","LAURA",656565656,3),
("44445555","ANTONIOA",245345353,4),
("5555666F","RAMONA",534534533,5),
("6666777E","MENGANA",353453345,6),
("7777888D","ANA",237545342,7),
("8888999C","FULANO",325737833,8),
("9999000B","MENGANO",387354374,9),
("0000000A","JOSE",378534533,10);

INSERT INTO usuario (dni,nombre,telefono,contraseña) values 
("11112222","PEPE",979797979,"*****"),
("22223333","ANTONIO",878787878,"*****"),
("33334444","LAURA",656565656,"*****"),
("44445555","ANTONIOA",245345353,"*****"),
("5555666F","RAMONA",534534533,"*****"),
("6666777E","MENGANA",353453345,"******"),
("7777888D","ANA",237545342,"******"),
("8888999C","FULANO",325737833,"*****"),
("9999000B","MENGANO",387354374,"******"),
("0000000A","JOSE",378534533,"*****");


INSERT INTO bloquear(id_usuario,id_usuario_bloqueado) values 
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7);

INSERT INTO contacto (nombre,comentario,id_usuario) values
("grupo fiesta", "grupo para la fiesta de pepe", 4),
("grupo fiesta", "grupo para la fiesta de pepe", 5),
("grupo fiesta", "grupo para la fiesta de pepe", 3),
("grupo fiesta", "grupo para la fiesta de pepe", 7),
("grupo fiesta", "grupo para la fiesta de pepe", 8),
("grupo fiesta", "grupo para la fiesta de pepe", 2);

