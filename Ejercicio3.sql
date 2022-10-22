CREATE TABLE comunidad_autonoma (
nombre VARCHAR(50) NOT NULL PRIMARY KEY,
poblacion INT,
superficie DOUBLE
);

CREATE TABLE provincia (
codigo_postal INT NOT NULL PRIMARY KEY,
poblacion INT,
superficie DOUBLE,
nombre CHAR(50),
comunidad_autonoma CHAR(50),
FOREIGN KEY (comunidad_autonoma)
REFERENCES comunidad_autonoma (nombre)
ON DELETE SET NULL
ON UPDATE CASCADE
);

CREATE TABLE localidad (
nombre VARCHAR(50) NOT NULL PRIMARY KEY,
poblacion INT,
comunidad_autonoma CHAR(50),
provincia INT,
capital_provincia INT, 
FOREIGN KEY (comunidad_autonoma)
REFERENCES comunidad_autonoma (nombre)
ON DELETE SET NULL
ON UPDATE CASCADE,
FOREIGN KEY (provincia)
REFERENCES provincia (codigo_postal)
ON DELETE SET NULL
ON UPDATE CASCADE,
FOREIGN KEY (capital_provincia)
REFERENCES provincia (codigo_postal)
ON DELETE SET NULL
ON UPDATE CASCADE
);

INSERT INTO comunidad_autonoma (nombre, poblacion, superficie) VALUES
("Andalucía", 8427000, 87599),
("Aragón", 1321000, 47720),
("Principado de Asturias", 1022000, 10604),
("Illes Balears",  1188000, 4992),
("Canarias", 2207000, 7492),
("Cantabria", 581641, 5321),
("Castilla y León", 2408000, 94226),
("Castilla-La Mancha", 2035000, 79463),
("Cataluña", 7566000, 32108),
("Comunitat Valenciana", 4975000, 23255);

INSERT INTO provincia (codigo_postal, poblacion, superficie, nombre, comunidad_autonoma) VALUES
(23001, 113457, 424, "Jaén", "Andalucía"),
(24019, 113465, 400, "Málaga", "Andalucía"),
(35671, 10000, 300, "Lleida", "Cataluña"),
(35345, 3242, 300, "Tarragona", "Cataluña"),
(10294, 54754, 300, "Besaya", "Cantabria"),
(32543, 54743, 300, "Santander", "Cantabria"),
(94363, 23536, 300, "Barcelona", "Cataluña"),
(85723, 12423, 300, "Valencia", "Comunitat Valenciana"),
(15473, 65474, 300, "Castellón", "Comunitat Valenciana"),
(24663, 57564, 300, "Alicante", "Comunitat Valenciana");

INSERT INTO localidad (nombre, poblacion, comunidad_autonoma, provincia, capital_provincia) VALUES
("Asdfg", 10234, "Cantabria", 32543, 32543),
("Riudecols", 1100, "Cataluña", 35345, 35345),
("Asfas", 1100, "Cataluña", 35345, 35345),
("poggers", 1100, "Cataluña", 35345, 35345),
("Piñatown", 1100, "Cataluña", 35345, 35345),
("Sitio", 1100, "Cataluña", 35345, 35345),
("Sitio2", 1100, "Cataluña", 35345, 35345),
("Sitio3", 1100, "Cataluña", 35345, 35345),
("Sitio4", 1100, "Cataluña", 35345, 35345),
("Sitio5", 1100, "Cataluña", 35345, 35345);