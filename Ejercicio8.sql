CREATE TABLE cliente(
dni_cliente VARCHAR (8) NOT NULL PRIMARY KEY,
nombre VARCHAR(30),
apellidos VARCHAR(30),
direccion VARCHAR(30),
telefono int,
tarjeta_credito int);

CREATE TABLE reserva(
id_reserva int auto_increment primary key,
fecha_reserva date,
dni_cliente VARCHAR (8),
FOREIGN KEY (dni_cliente)
REFERENCES cliente (dni_cliente)
ON DELETE SET NULL
ON UPDATE CASCADE);

CREATE TABLE tarjeta_embarque(
id_tarjeta_embarque int auto_increment primary key);


CREATE TABLE obtiene (
dni_cliente VARCHAR(8),
id_reserva INT,
id_tarjeta_embarque INT,
PRIMARY KEY (dni_cliente, id_reserva, id_tarjeta_embarque),
FOREIGN KEY (dni_cliente)
REFERENCES cliente (dni_cliente)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_reserva)
REFERENCES reserva (id_reserva)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_tarjeta_embarque)
REFERENCES tarjeta_embarque (id_tarjeta_embarque)
ON DELETE CASCADE
ON UPDATE CASCADE);


CREATE TABLE avion(
id_avion INT AUTO_INCREMENT PRIMARY KEY,
fecha_inicial date,
fecha_final date,
categoria VARCHAR(25));

CREATE TABLE asiento(
id_asiento INT AUTO_INCREMENT PRIMARY KEY,
fila INT,
columna INT, 
planta int, 
id_tarjeta_embarque INT,
id_avion INT,
FOREIGN KEY (id_tarjeta_embarque)
REFERENCES tarjeta_embarque (id_tarjeta_embarque)
ON DELETE SET NULL
ON UPDATE CASCADE,
FOREIGN KEY (id_avion)
REFERENCES avion (id_avion)
ON DELETE SET NULL
ON UPDATE CASCADE);

CREATE TABLE aeropuerto(
id_aeropuerto INT auto_increment primary key,
pais VARCHAR (15),
nombre VARCHAR (30),
localidad VARCHAR (30));

CREATE TABLE vuelo(
id_vuelo INT AUTO_INCREMENT PRIMARY KEY,
fecha_salida date,
fecha_llegada date,
id_avion INT,
id_aeropuerto_desp INT,
id_aeropuerto_aterr INT,
FOREIGN KEY (id_avion)
REFERENCES avion (id_avion)
ON DELETE SET NULL
ON UPDATE CASCADE,
FOREIGN KEY (id_aeropuerto_desp)
REFERENCES aeropuerto (id_aeropuerto)
ON DELETE SET NULL
ON UPDATE CASCADE,
FOREIGN KEY (id_aeropuerto_aterr)
REFERENCES aeropuerto (id_aeropuerto)
ON DELETE SET NULL
ON UPDATE CASCADE);

INSERT INTO cliente (dni_cliente,nombre,telefono,direccion,tarjeta_credito) values
("11112222","PEPE",979797979,"CALLE 7527",16556),
("22223333","ANTONIO",878787878,"CALLE 5675",25445),
("33334444","LAURA",656565656,"CALLE 4586",35464564),
("44445555","ANTONIOA",245345353,"CALLE 455",43233),
("5555666F","RAMONA",534534533,"CALLE 4654",583688),
("6666777E","MENGANA",353453345,"CALLE 575",683838),
("7777888D","ANA",237545342,"CALLE 8653",78383838),
("8888999C","FULANO",325737833,"CALLE 7586",836838),
("9999000B","MENGANO",387354374,"CALLE 4755",92262),
("0000000A","JOSE",378534533,"CALLE 4755",10425);


INSERT INTO reserva (dni_cliente,fecha_reserva) values
("11112222",'2022-1-1'),
("22223333",'2022-2-1'),
("33334444",'2022-3-1'),
("44445555",'2022-4-1'),
("5555666F",'2022-5-1'),
("6666777E",'2022-6-1'),
("7777888D",'2022-7-1'),
("8888999C",'2022-8-1'),
("9999000B",'2022-9-1'),
("0000000A",'2022-10-1');


 INSERT INTO tarjeta_embarque(id_tarjeta_embarque) values
 (1),
 (2),
 (3),
 (4),
 (5),
 (6),
 (7),
 (8),
 (9),
 (10);
 
INSERT INTO avion (fecha_inicial,fecha_final,categoria) values 
('2022-1-1','2022-1-25',"200"),
('2022-2-1','2022-2-25',"201"),
('2022-3-1','2022-3-25',"202"),
('2022-4-1','2022-4-25',"203"),
('2022-5-1','2022-5-25',"204"),
('2022-6-1','2022-6-25',"205"),
('2022-7-1','2022-7-25',"206"),
('2022-8-1','2022-8-25',"207"),
('2022-9-1','2022-9-25',"208"),
('2022-10-1','2022-10-25',"209");

INSERT INTO aeropuerto (pais,nombre,localidad) values 
("España","Aeropuerto1 ","valencia"),
("España","Aeropuerto2","tarragona"),
("España","Aeropuerto3","madrid"),
("España","Aeropuerto44","barcelona"),
("España","Aeropuerto5","bibao"),
("España","Aeropuerto6","reus"),
("España","Aeropuerto7","granada"),
("España","Aeropuerto8","san sebastian"),
("España","Aeropuerto9","tenerife"),
("España","Aeropuerto10", "mallorca");



