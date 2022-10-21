CREATE TABLE accidente_geografico(
id_accidente INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(20),
coor_x DOUBLE,
coor_y DOUBLE);

CREATE TABLE lago(
id_accidente int,
extension INT,
FOREIGN KEY (id_accidente)
REFERENCES accidente_geografico (id_accidente)
ON DELETE SET NULL
ON UPDATE CASCADE);

CREATE TABLE montaña(
id_accidente int,
altura INT,
FOREIGN KEY (id_accidente)
REFERENCES accidente_geografico (id_accidente)
ON DELETE SET NULL
ON UPDATE CASCADE);

CREATE TABLE rio(
id_accidente int,
longitud INT,
FOREIGN KEY (id_accidente)
REFERENCES accidente_geografico (id_accidente)
ON DELETE SET NULL
ON UPDATE CASCADE);

CREATE TABLE pais(
nombre_pais VARCHAR(20) NOT NULL PRIMARY KEY,
extension INT,
poblacion INT);

CREATE TABLE localidad(
nombre_localidad VARCHAR(20) NOT NULL PRIMARY KEY,
nombre_pais varchar(20),
FOREIGN KEY (nombre_pais)
REFERENCES pais (nombre_pais)
ON DELETE SET NULL
ON UPDATE CASCADE);

CREATE TABLE pasar(
id_accidente INT,
nombre_localidad VARCHAR(20),
PRIMARY KEY (id_accidente, nombre_localidad),
FOREIGN KEY (id_accidente)
REFERENCES rio (id_accidente)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (nombre_localidad)
REFERENCES localidad (nombre_localidad)
ON DELETE CASCADE
ON UPDATE CASCADE);

CREATE table ubicado(
id_accidente INT,
nombre_pais VARCHAR(20),
PRIMARY KEY (id_accidente, nombre_pais),
FOREIGN KEY (id_accidente)
REFERENCES accidente_geografico (id_accidente)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (nombre_pais)
REFERENCES pais (nombre_pais)
ON DELETE CASCADE
ON UPDATE CASCADE);



INSERT INTO accidente_geografico (nombre,coor_x,coor_y) VALUES
("MONTAÑA 1",54,343),
("MONTAÑA 2",444,444),
("MONTAÑA 3",666,234),
("MONTAÑA 4",566,434),
("RIO 4",764,222),
("RIO 1",657,988),
("RIO 2",890,324),
("RIO 3",445,683),
("LAGO1 ",238,056),
("LAGO 2",677,454);

INSERT INTO lago (id_accidente,extension) values
("9 ",238056),
("10",677454);

INSERT INTO montaña (id_accidente,altura) values
(1,54343),
(2,444444),
(3,666234),
(4,56643);

INSERT INTO rio (id_accidente,longitud) values
(5,76422),
(6,6588),
(7,8324),
(8,4683);

INSERT INTO  pais (nombre_pais,extension,poblacion) values
("España",6545,4566),
("Francia",5231,1232),
("Portugal",5866,3535),
("Italia",354,986),
("Alemania",643,927),
("UK",535,5343),
("EEUU",4646,4564),
("Marruecos",546,456),
("Andorra",5446,4564),
("iran",523,231);

INSERT INTO localidad (nombre_pais,nombre_localidad) VALUES
("España","FDFG"),
("Francia","GFSHGH"),
("Portugal","GFSHSGFH"),
("Italia","GFS"),
("Alemania","TYRYK"),
("UK","MKFDN"),
("EEUU","SFGHGFH"),
("Marruecos","HGSGH"),
("Andorra","YIOHL"),
("iran","LFHS");

insert INTO pasar (id_accidente,nombre_localidad) values
(5,"SFGHGFH"),
(6,"HGSGH"),
(7,"YIOHL"),
(8,"LFHS");





