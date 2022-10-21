CREATE TABLE almacen(
numero_almacen INT AUTO_INCREMENT PRIMARY KEY,
descripcion VARCHAR(255),
direccion varchar(50));

CREATE TABLE estanteria(
numero_estanteria VARCHAR(3) NOT NULL PRIMARY KEY,
nombre VARCHAR (20),
numero_almacen INT,
FOREIGN KEY (numero_almacen)
REFERENCES almacen (numero_almacen)
ON DELETE SET NULL
ON UPDATE CASCADE);

CREATE TABLE almacena(
numero_almacen INT,
numero_estanteria VARCHAR(3),
PRIMARY KEY (numero_almacen, numero_estanteria),
FOREIGN KEY (numero_almacen)
REFERENCES almacen (numero_almacen)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (numero_estanteria)
REFERENCES estanteria (numero_estanteria)
ON DELETE CASCADE
ON UPDATE CASCADE);

CREATE TABLE tipo_pieza(
letras_tipo_pieza VARCHAR(5) NOT NULL PRIMARY KEY,
descripcion VARCHAR(255));


CREATE TABLE pieza(
letra_pieza VARCHAR(5) NOT NULL PRIMARY KEY,
numero int,
cantidad int,
precio double,
letras_tipo_pieza VARCHAR(5),
FOREIGN KEY (letras_tipo_pieza)
REFERENCES tipo_pieza (letras_tipo_pieza)
ON DELETE SET NULL
ON UPDATE CASCADE);

CREATE TABLE se_compone(
letra_pieza VARCHAR(5),
letra_pieza_compuesta VARCHAR (5),
cantidad int,
PRIMARY KEY (letra_pieza, letra_pieza_compuesta),
FOREIGN KEY (letra_pieza)
REFERENCES pieza (letra_pieza)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (letra_pieza_compuesta)
REFERENCES pieza (letra_pieza)
ON DELETE CASCADE
ON UPDATE CASCADE);

INSERT INTO almacen (descripcion,direccion) VALUES
("Descripcion de un almacen ngfjdfjgFDGfhfgjhj","CALLE 123"),
("Descripcion de un almacen ngfjdfjgDGfhfgjhj"," CALLE 234"),
("Descripcion de un almacen ngfjdfjgFGfDhfgjhj","CALLE 345"),
("Descripcion de un almacen ngfjdfjgfdgdfgfhfgjhj","CALLE 456"),
("Descripcion de un almacen ngfjdfjgafhfgjhj","CALLE 567"),
("Descripcion de un almacen ngfjdfjSDFFSDgfhfgjhj","CALLE 678"),
("Descripcion de un almacen ngfjdfjgfhfgjhj","CALLE 789"),
("Descripcion de un almacen ngfjdfSDFSjgfhfgjhj","CALLE 890"),
("Descripcion de un almacen ngfjdfjFgfhfgjhj","CALLE 3453"),
("Descripcion de un almacen ngfjdfjgFEWFfhfgjhj","CALLE 32424");

INSERT INTO estanteria (numero_estanteria,nombre,numero_almacen) VALUES
("AAA","alfa",1),
("BBB","beta",2),
("CCC","charly",3),
("DDD","delta",4),
("EEE","eco",5),
("FFF","forky",6),
("GGG","gato",7),
("HHH","helo",8),
("III","india",9),
("JJJ","jota",10);

INSERT INTO almacena (numero_estanteria,numero_almacen) VALUES
("AAA",1),
("BBB",2),
("CCC",3),
("DDD",4),
("EEE",5),
("FFF",6),
("GGG",7),
("HHH",8),
("III",9),
("JJJ",10);

INSERT INTO tipo_pieza (letras_tipo_pieza,descripcion) VALUES
("ABC","Descripcion tipo pieza 1"),
("BCD","Descripcion tipo pieza 2"),
("HFH","Descripcion tipo pieza 3"),
("WFF","Descripcion tipo pieza 4"),
("BHJ","Descripcion tipo pieza 5"),
("ADA","Descripcion tipo pieza 6"),
("MHM","Descripcion tipo pieza 7"),
("RTR","Descripcion tipo pieza 8"),
("UYU","Descripcion tipo pieza 9"),
("UYR","Descripcion tipo pieza 10");


