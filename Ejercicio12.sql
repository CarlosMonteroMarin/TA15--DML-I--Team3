CREATE TABLE empresa (
cif VARCHAR(9) NOT NULL PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
direccion VARCHAR(30) NOT NULL,
telefono INT NOT NULL,
codigo_interno INT NOT NULL
);

CREATE TABLE proyecto (
id_proyecto INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
fecha_inicio DATE,
fecha_finalizacion DATE,
fecha_prevista_finalizar DATE,
empresa VARCHAR(9) NOT NULL,
FOREIGN KEY (empresa)
REFERENCES empresa (cif)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE trabajador (
dni VARCHAR(9) NOT NULL PRIMARY KEY,
nombre VARCHAR(15) NOT NULL,
apellidos VARCHAR(30) NOT NULL,
codigo_trabajador INT NOT NULL
);

CREATE TABLE profesion (
id_profesion INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(15) NOT NULL
);

CREATE TABLE trabaja (
id_proyecto INT NOT NULL,
dni VARCHAR(9) NOT NULL,
horas_trabajadas INT,
PRIMARY KEY (id_proyecto, dni),
FOREIGN KEY (id_proyecto)
REFERENCES proyecto (id_proyecto)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (dni)
REFERENCES trabajador (dni)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE ejerce_de (
dni VARCHAR(9) NOT NULL,
id_profesion INT NOT NULL,
PRIMARY KEY (dni, id_profesion),
FOREIGN KEY (dni)
REFERENCES trabajador (dni)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_profesion)
REFERENCES profesion (id_profesion)
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT INTO empresa (cif, nombre, direccion, telefono, codigo_interno) VALUES
("35264785A", "Empresa 1", "Dirección 1", 647281296, 132),
("35264785B", "Empresa 2", "Dirección 2", 564589465, 133),
("35264785C", "Empresa 3", "Dirección 3", 839483456, 134),
("35264785D", "Empresa 4", "Dirección 4", 364465446, 135),
("35264785E", "Empresa 5", "Dirección 5", 346235932, 136),
("35264785F", "Empresa 6", "Dirección 6", 929538345, 137),
("35264785G", "Empresa 7", "Dirección 7", 346452654, 138),
("35264785H", "Empresa 8", "Dirección 8", 674575427, 139),
("35264785I", "Empresa 9", "Dirección 9", 143645647, 140),
("35264785J", "Empresa 10", "Dirección 10", 26454745, 141);

INSERT INTO proyecto (fecha_inicio, fecha_finalizacion, fecha_prevista_finalizar, empresa) VALUES
('2022-10-10', '2022-10-10', '2022-10-10', "35264785A"),
('2022-10-10', '2022-10-10', '2022-10-10', "35264785B"),
('2022-10-10', '2022-10-10', '2022-10-10', "35264785C"),
('2022-10-10', '2022-10-10', '2022-10-10', "35264785D"),
('2022-10-10', '2022-10-10', '2022-10-10', "35264785E"),
('2022-10-10', '2022-10-10', '2022-10-10', "35264785F"),
('2022-10-10', '2022-10-10', '2022-10-10', "35264785G"),
('2022-10-10', '2022-10-10', '2022-10-10', "35264785H"),
('2022-10-10', '2022-10-10', '2022-10-10', "35264785I"),
('2022-10-10', '2022-10-10', '2022-10-10', "35264785J");

INSERT INTO trabajador (dni, nombre, apellidos, codigo_trabajador) VALUES
("75682357A", "Nombre 1", "Apellido 1", 13),
("75682357B", "Nombre 2", "Apellido 2", 14),
("75682357C", "Nombre 3", "Apellido 3", 15),
("75682357D", "Nombre 4", "Apellido 4", 16),
("75682357E", "Nombre 5", "Apellido 5", 17),
("75682357F", "Nombre 6", "Apellido 6", 18),
("75682357G", "Nombre 7", "Apellido 7", 19),
("75682357H", "Nombre 8", "Apellido 8", 20),
("75682357I", "Nombre 9", "Apellido 9", 21),
("75682357J", "Nombre 10", "Apellido 10", 22);

INSERT INTO profesion (nombre) VALUES
("Profesión 1"),
("Profesión 2"),
("Profesión 3"),
("Profesión 4"),
("Profesión 5"),
("Profesión 6"),
("Profesión 7"),
("Profesión 8"),
("Profesión 9"),
("Profesión 10");

INSERT INTO trabaja (id_proyecto, dni, horas_trabajadas) VALUES
(1, "75682357A", 1),
(1, "75682357B", 3),
(1, "75682357C", 5),
(2, "75682357D", 1),
(3, "75682357E", 3),
(4, "75682357F", 5),
(5, "75682357G", 1),
(5, "75682357H", 3),
(6, "75682357I", 5),
(7, "75682357J", 1);

INSERT INTO ejerce_de (dni, id_profesion) VALUES
("75682357A", 1),
("75682357B", 2),
("75682357C", 3),
("75682357D", 4),
("75682357E", 5),
("75682357F", 6),
("75682357G", 7),
("75682357H", 8),
("75682357I", 9),
("75682357J", 10);