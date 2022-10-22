CREATE TABLE socio (
codigo_socio VARCHAR(8) NOT NULL PRIMARY KEY,
dni VARCHAR(9) NOT NULL,
direccion VARCHAR(30) NOT NULL,
telefono INT NOT NULL,
nombre VARCHAR(15) NOT NULL,
apellidos VARCHAR(50) NOT NULL
);

CREATE TABLE prestamo (
id_prestamo INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(15) NOT NULL,
fecha_prestamo DATE NOT NULL,
fecha_maxima_devolucion DATE NOT NULL,
fecha_devolucion DATE NOT NULL,
socio VARCHAR(8),
FOREIGN KEY (socio)
REFERENCES socio (codigo_socio)
ON DELETE SET NULL
ON UPDATE CASCADE
);

CREATE TABLE articulo (
id_articulo INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(15) NOT NULL,
año_obra DATE NOT NULL,
deterioro BOOLEAN NOT NULL,
descripcion_deterioro VARCHAR(100)
);

CREATE TABLE pelicula (
id_articulo INT NOT NULL PRIMARY KEY,
duracion DOUBLE NOT NULL,
FOREIGN KEY (id_articulo)
REFERENCES articulo (id_articulo)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE cd (
id_articulo INT NOT NULL PRIMARY KEY,
numero_canciones INT NOT NULL,
FOREIGN KEY (id_articulo)
REFERENCES articulo (id_articulo)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE libro (
id_articulo INT NOT NULL PRIMARY KEY,
numero_paginas INT NOT NULL,
FOREIGN KEY (id_articulo)
REFERENCES articulo (id_articulo)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE autor (
id_autor INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(15),
pais VARCHAR(15)
);

CREATE TABLE presta (
id_prestamo INT NOT NULL,
id_articulo INT NOT NULL,
PRIMARY KEY (id_prestamo, id_articulo),
FOREIGN KEY (id_prestamo)
REFERENCES prestamo (id_prestamo)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_articulo)
REFERENCES articulo (id_articulo)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE escribe (
id_autor INT NOT NULL,
id_articulo INT,
PRIMARY KEY (id_autor, id_articulo),
FOREIGN KEY (id_autor)
REFERENCES autor (id_autor)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_articulo)
REFERENCES articulo (id_articulo)
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT INTO socio (codigo_socio, dni, direccion, telefono, nombre, apellidos) VALUES
("A1234567", "12345678A", "Calle 1", 987654321, "Nombre1", "Apellidos1"),
("B1234567", "12345678B", "Calle 2", 639201035, "Nombre2", "Apellidos2"),
("C1234567", "12345678C", "Calle 3", 784654236, "Nombre3", "Apellidos3"),
("D1234567", "12345678D", "Calle 4", 987653456, "Nombre4", "Apellidos4"),
("E1234567", "12345678E", "Calle 5", 385194358, "Nombre5", "Apellidos5"),
("F1234567", "12345678F", "Calle 6", 783548463, "Nombre6", "Apellidos6"),
("G1234567", "12345678G", "Calle 7", 423698025, "Nombre7", "Apellidos7"),
("H1234567", "12345678H", "Calle 8", 119848636, "Nombre8", "Apellidos8"),
("I1234567", "12345678I", "Calle 9", 274862453, "Nombre9", "Apellidos9"),
("J1234567", "12345678J", "Calle 10", 538457628, "Nombre10", "Apellidos10");

INSERT INTO prestamo (nombre, fecha_prestamo, fecha_maxima_devolucion, fecha_devolucion, socio) VALUES
("Prestamo 1", '2022-10-10', '2022-10-20', '2022-10-15', "A1234567"),
("Prestamo 2", '2022-10-10', '2022-10-20', '2022-10-15', "B1234567"),
("Prestamo 3", '2022-10-10', '2022-10-20', '2022-10-15', "C1234567"),
("Prestamo 4", '2022-10-10', '2022-10-20', '2022-10-15', "D1234567"),
("Prestamo 5", '2022-10-10', '2022-10-20', '2022-10-15', "E1234567"),
("Prestamo 6", '2022-10-10', '2022-10-20', '2022-10-15', "F1234567"),
("Prestamo 7", '2022-10-10', '2022-10-20', '2022-10-15', "G1234567"),
("Prestamo 8", '2022-10-10', '2022-10-20', '2022-10-15', "H1234567"),
("Prestamo 9", '2022-10-10', '2022-10-20', '2022-10-15', "I1234567"),
("Prestamo 10", '2022-10-10', '2022-10-20', '2022-10-15', "J1234567");

INSERT INTO articulo (nombre, año_obra, deterioro, descripcion_deterioro) VALUES
("Artículo 1", '2010-10-17', true, "Se deteriora"),
("Artículo 2", '2010-10-17', false, "No se deteriora"),
("Artículo 3", '2010-10-17', true, "Se deteriora"),
("Artículo 4", '2010-10-17', false, "No se deteriora"),
("Artículo 5", '2010-10-17', true, "Se deteriora"),
("Artículo 6", '2010-10-17', false, "No se deteriora"),
("Artículo 7", '2010-10-17', true, "Se deteriora"),
("Artículo 8", '2010-10-17', false, "No se deteriora"),
("Artículo 9", '2010-10-17', true, "Se deteriora"),
("Artículo 10", '2010-10-17', false, "No se deteriora");

INSERT INTO pelicula (id_articulo, duracion) VALUES
(1, 120),
(2, 100),
(3, 100),
(4, 70),
(5, 150),
(6, 90),
(7, 95),
(8, 100),
(9, 90),
(10, 70);

INSERT INTO cd (id_articulo, numero_canciones) VALUES
(1, 8),
(2, 10),
(3, 7),
(4, 12),
(5, 8),
(6, 7),
(7, 15),
(8, 8),
(9, 10),
(10, 13);

INSERT INTO libro (id_articulo, numero_paginas) VALUES
(1, 300),
(2, 600),
(3, 1000),
(4, 500),
(5, 400),
(6, 200),
(7, 325),
(8, 613),
(9, 800),
(10, 700);

INSERT INTO autor (nombre, pais) VALUES
("Sanderson", "Nebraska"),
("Autor 2", "País 2"),
("Autor 3", "País 3"),
("Autor 4", "País 4"),
("Autor 5", "País 5"),
("Autor 6", "País 6"),
("Autor 7", "País 7"),
("Autor 8", "País 8"),
("Autor 9", "País 9"),
("Autor 10", "País 10");

INSERT INTO presta (id_prestamo, id_articulo) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(4, 7),
(4, 5),
(5, 3),
(5, 8),
(6, 7);

INSERT INTO escribe (id_autor, id_articulo) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(4, 7),
(4, 5),
(5, 3),
(5, 8),
(6, 7);