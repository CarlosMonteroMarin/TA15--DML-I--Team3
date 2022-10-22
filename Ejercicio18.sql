CREATE TABLE compra (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
fecha DATE NOT NULL,
valor DOUBLE NOT NULL
);

CREATE TABLE inmueble (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
metros DOUBLE NOT NULL,
descripcion VARCHAR(255),
direccion VARCHAR(100)
);

CREATE TABLE piso (
codigo_piso INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
inmueble INT,
FOREIGN KEY (inmueble)
REFERENCES inmueble (id)
ON DELETE SET NULL
ON UPDATE CASCADE
);

CREATE TABLE garaje (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
inmueble INT,
numero INT,
planta INT,
piso INT,
FOREIGN KEY (inmueble)
REFERENCES inmueble (id)
ON DELETE SET NULL
ON UPDATE CASCADE,
FOREIGN KEY (piso)
REFERENCES piso (codigo_piso)
ON DELETE SET NULL
ON UPDATE CASCADE
);

CREATE TABLE recinto (
id INT NOT NULL PRIMARY KEY,
uso VARCHAR(100),
servicio VARCHAR(100),
FOREIGN KEY (id)
REFERENCES inmueble (id)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE persona (
dni VARCHAR(9) NOT NULL PRIMARY KEY,
nombre VARCHAR(15) NOT NULL,
apellidos VARCHAR(30) NOT NULL,
tlf_fijo INT,
movil INT,
codigo_interno INT NOT NULL
);

CREATE TABLE alquiler (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(15),
codigo INT,
metros DOUBLE NOT NULL,
persona VARCHAR(9) NOT NULL,
FOREIGN KEY (persona)
REFERENCES persona (dni)
);

CREATE TABLE pago (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
mes VARCHAR(10) NOT NULL,
valor DOUBLE NOT NULL,
alquiler INT NOT NULL,
FOREIGN KEY (alquiler)
REFERENCES alquiler (id)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE comprar (
id_compra INT NOT NULL,
id_inmueble INT NOT NULL,
dni VARCHAR(9) NOT NULL,
FOREIGN KEY (id_compra)
REFERENCES compra (id)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_inmueble)
REFERENCES inmueble (id)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (dni)
REFERENCES persona (dni)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE alquila (
id_alquiler INT NOT NULL,
id_inmueble INT NOT NULL,
dni VARCHAR(9) NOT NULL,
FOREIGN KEY (id_alquiler)
REFERENCES alquiler (id)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_inmueble)
REFERENCES inmueble (id)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (dni)
REFERENCES persona (dni)
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT INTO compra (fecha, valor) VALUES
('2022-10-10', 13),
('2022-10-10', 13),
('2022-10-10', 13),
('2022-10-10', 13),
('2022-10-10', 13),
('2022-10-10', 13),
('2022-10-10', 13),
('2022-10-10', 13),
('2022-10-10', 13),
('2022-10-10', 13);

INSERT INTO inmueble (metros, descripcion, direccion) VALUES
(25, "Descripción", "Dirección 1"),
(25, "Descripción", "Dirección 2"),
(25, "Descripción", "Dirección 3"),
(25, "Descripción", "Dirección 4"),
(25, "Descripción", "Dirección 5"),
(25, "Descripción", "Dirección 6"),
(25, "Descripción", "Dirección 7"),
(25, "Descripción", "Dirección 8"),
(25, "Descripción", "Dirección 9"),
(25, "Descripción", "Dirección 10");

INSERT INTO piso (inmueble) VALUES
(1),
(2),
(3);

INSERT INTO garaje (inmueble, numero, planta, piso) VALUES
(1, 4, 4, 1),
(1, 4, 3, 1),
(2, 4, 3, null),
(3, 4, 3, null),
(4, 4, 3, null),
(5, 4, 3, null),
(6, 4, 3, null),
(7, 4, 3, null),
(8, 4, 3, null),
(9, 4, 3, null);

INSERT INTO recinto (id, uso, servicio) VALUES
(1, "Se usa para X cosa", "Se ofrecen X servicios"),
(2, "Se usa para X cosa", "Se ofrecen X servicios"),
(3, "Se usa para X cosa", "Se ofrecen X servicios"),
(4, "Se usa para X cosa", "Se ofrecen X servicios"),
(5, "Se usa para X cosa", "Se ofrecen X servicios"),
(6, "Se usa para X cosa", "Se ofrecen X servicios"),
(7, "Se usa para X cosa", "Se ofrecen X servicios"),
(8, "Se usa para X cosa", "Se ofrecen X servicios"),
(9, "Se usa para X cosa", "Se ofrecen X servicios"),
(10, "Se usa para X cosa", "Se ofrecen X servicios");

INSERT INTO persona (dni, nombre, apellidos, tlf_fijo, movil, codigo_interno) VALUES
("34517891A", "Nombre 1", "Apellido 1", 977123456, 623452357, 1234),
("34517891B", "Nombre 2", "Apellido 2", 977123456, 623452357, 1234),
("34517891C", "Nombre 3", "Apellido 3", 977123456, 623452357, 1234),
("34517891D", "Nombre 4", "Apellido 4", 977123456, 623452357, 1234),
("34517891E", "Nombre 5", "Apellido 5", 977123456, 623452357, 1234),
("34517891F", "Nombre 6", "Apellido 6", 977123456, 623452357, 1234),
("34517891G", "Nombre 7", "Apellido 7", 977123456, 623452357, 1234),
("34517891H", "Nombre 8", "Apellido 8", 977123456, 623452357, 1234),
("34517891I", "Nombre 9", "Apellido 9", 977123456, 623452357, 1234),
("34517891J", "Nombre 10", "Apellido 10", 977123456, 623452357, 1234);

INSERT INTO alquiler (nombre, codigo, metros, persona) VALUES
("Alquiler 1", 1234, 25, "34517891A"),
("Alquiler 2", 1234, 25, "34517891B"),
("Alquiler 3", 1234, 25, "34517891C"),
("Alquiler 4", 1234, 25, "34517891D"),
("Alquiler 5", 1234, 25, "34517891E"),
("Alquiler 6", 1234, 25, "34517891F"),
("Alquiler 7", 1234, 25, "34517891G"),
("Alquiler 8", 1234, 25, "34517891H"),
("Alquiler 9", 1234, 25, "34517891I"),
("Alquiler 10", 1234, 25, "34517891J");

INSERT INTO pago (mes, valor, alquiler) VALUES
("Enero", 100000, 1),
("Enero", 100000, 2),
("Enero", 100000, 3),
("Enero", 100000, 4),
("Enero", 100000, 5),
("Enero", 100000, 6),
("Enero", 100000, 7),
("Enero", 100000, 8),
("Enero", 100000, 9),
("Enero", 100000, 10);

INSERT INTO comprar (id_compra, id_inmueble, dni) VALUES
(1, 1, "34517891A"),
(2, 2, "34517891B"),
(3, 3, "34517891C"),
(4, 4, "34517891D"),
(5, 5, "34517891E"),
(6, 6, "34517891F"),
(7, 7, "34517891G"),
(8, 8, "34517891H"),
(9, 9, "34517891I"),
(10, 10, "34517891J");

INSERT INTO alquila (id_alquiler, id_inmueble, dni) VALUES
(1, 1, "34517891A"),
(2, 2, "34517891B"),
(3, 3, "34517891C"),
(4, 4, "34517891D"),
(5, 5, "34517891E"),
(6, 6, "34517891F"),
(7, 7, "34517891G"),
(8, 8, "34517891H"),
(9, 9, "34517891I"),
(10, 10, "34517891J");