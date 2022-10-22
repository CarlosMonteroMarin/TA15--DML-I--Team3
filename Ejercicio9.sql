CREATE TABLE receta (
id_receta INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
tiempo_elaboracion INT NOT NULL,
tipo_plato VARCHAR(10) NOT NULL
);

CREATE TABLE paso (
id_paso INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
descripcion VARCHAR(255) NOT NULL,
id_receta INT NOT NULL,
FOREIGN KEY (id_receta)
REFERENCES receta (id_receta)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE utensilio (
id_utensilio INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(30) NOT NULL
);

CREATE TABLE ingrediente (
id_ingrediente INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(30) NOT NULL
);

CREATE TABLE necesita (
id_paso INT,
id_utensilio INT,
id_ingrediente INT,
FOREIGN KEY (id_paso)
REFERENCES paso (id_paso)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_utensilio)
REFERENCES utensilio (id_utensilio)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_ingrediente)
REFERENCES ingrediente (id_ingrediente)
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT INTO receta (nombre, tiempo_elaboracion, tipo_plato) VALUES
("Receta 1", 30, "Primero"),
("Receta 2", 20, "Segundo"),
("Receta 3", 15, "Postre"),
("Receta 4", 25, "Primero"),
("Receta 5", 20, "Segundo"),
("Receta 6", 30, "Postre"),
("Receta 7", 20, "Primero"),
("Receta 8", 15, "Segundo"),
("Receta 9", 25, "Postre"),
("Receta 10", 20, "Primero");

INSERT INTO paso (descripcion, id_receta) VALUES
("Hacer X cosa", 1),
("Hacer Y cosa", 1),
("Hacer Z cosa", 1),
("Hacer X cosa", 2),
("Hacer X cosa", 4),
("Hacer X cosa", 6),
("Hacer Y cosa", 6),
("Hacer X cosa", 7),
("Hacer X cosa", 8),
("Hacer Y cosa", 8);

INSERT INTO utensilio (nombre) VALUES
("Utensilio 1"),
("Utensilio 2"),
("Utensilio 3"),
("Utensilio 4"),
("Utensilio 5"),
("Utensilio 6"),
("Utensilio 7"),
("Utensilio 8"),
("Utensilio 9"),
("Utensilio 10");

INSERT INTO ingrediente (nombre) VALUES
("Ingrediente 1"),
("Ingrediente 2"),
("Ingrediente 3"),
("Ingrediente 4"),
("Ingrediente 5"),
("Ingrediente 6"),
("Ingrediente 7"),
("Ingrediente 8"),
("Ingrediente 9"),
("Ingrediente 10");

INSERT INTO necesita (id_paso, id_utensilio, id_ingrediente) VALUES
(1, 1, 1),
(1, 2, 2),
(3, 1, 5),
(5, 3, 2),
(5, 6, 8),
(2, 10, 9),
(5, 7, 6),
(1, 8, 4),
(2, 3, 9),
(4, 5, 2);