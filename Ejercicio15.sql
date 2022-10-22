CREATE TABLE menu (
id_menu INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(15) NOT NULL,
num_personas INT DEFAULT 0
);

CREATE TABLE dia (
fecha DATE NOT NULL PRIMARY KEY,
temperatura DOUBLE NOT NULL,
menu INT NOT NULL,
FOREIGN KEY (menu)
REFERENCES menu (id_menu)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE plato (
nombre VARCHAR(50) NOT NULL PRIMARY KEY,
descripcion VARCHAR(100),
tipo VARCHAR(10) NOT NULL
);

CREATE TABLE contiene (
menu INT,
plato VARCHAR(50) NOT NULL,
cantidad INT,
PRIMARY KEY (menu, plato),
FOREIGN KEY (menu)
REFERENCES menu (id_menu)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (plato)
REFERENCES plato (nombre)
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT INTO menu (nombre, num_personas) VALUES
("Menú 1", 13),
("Menú 2", 3),
("Menú 3", 18),
("Menú 4", 25),
("Menú 5", 7),
("Menú 6", 4),
("Menú 7", 10),
("Menú 8", 11),
("Menú 9", 25),
("Menú 10", 12);

INSERT INTO dia (fecha, temperatura, menu) VALUES
('2022-10-10', 13, 1),
('2022-10-11', 14, 2),
('2022-10-12', 15, 3),
('2022-10-13', 16, 4),
('2022-10-14', 17, 5),
('2022-10-15', 18, 6),
('2022-10-16', 19, 7),
('2022-10-17', 20, 8),
('2022-10-18', 21, 9),
('2022-10-19', 22, 10);

INSERT INTO plato (nombre, descripcion, tipo) VALUES
("Plato 1", "Descripción plato 1", "Primero"),
("Plato 2", "Descripción plato 2", "Segundo"),
("Plato 3", "Descripción plato 3", "Postre"),
("Plato 4", "Descripción plato 4", "Primero"),
("Plato 5", "Descripción plato 5", "Segundo"),
("Plato 6", "Descripción plato 6", "Postre"),
("Plato 7", "Descripción plato 7", "Primero"),
("Plato 8", "Descripción plato 8", "Segundo"),
("Plato 9", "Descripción plato 9", "Postre"),
("Plato 10", "Descripción plato 10", "Primero");

INSERT INTO contiene (menu, plato, cantidad) VALUES
(1, "Plato 1", 3),
(1, "Plato 2", 3),
(1, "Plato 3", 3),
(2, "Plato 4", 3),
(2, "Plato 5", 3),
(2, "Plato 6", 3),
(3, "Plato 7", 3),
(3, "Plato 8", 3),
(3, "Plato 9", 3),
(3, "Plato 10", 3);
