CREATE TABLE estudiantes(
dni_estudiante VARCHAR(8) NOT NULL PRIMARY KEY,
direccion VARCHAR(50),
nombre VARCHAR(20),
telefono INT,
edad int);

CREATE TABLE empresa(
cif VARCHAR(15) NOT NULL PRIMARY KEY,
nombre VARCHAR(20),
telefono INT,
direccion VARCHAR(50));

CREATE  TABLE trabaja(
cif VARCHAR(15) NOT NULL,
dni_estudiante VARCHAR (8) NOT NULL,
PRIMARY KEY (cif, dni_estudiante),
FOREIGN KEY (cif)
REFERENCES empresa(cif)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (dni_estudiante)
REFERENCES estudiantes(dni_estudiante)
ON DELETE CASCADE
ON UPDATE CASCADE);


CREATE TABLE cursos(
codigo_curso INT AUTO_INCREMENT PRIMARY KEY,
programa VARCHAR(30),
fecha_inicio DATE,
fecha_fin DATE,
numero_curso INT);

CREATE TABLE profesores(
dni_profesor VARCHAR(8) NOT NULL PRIMARY KEY,
nombre VARCHAR(30),
apellidos VARCHAR(50),
direccion VARCHAR(50),
telefono INT,
codigo_curso INT,
FOREIGN KEY (codigo_curso)
REFERENCES cursos(codigo_curso)
ON DELETE SET NULL
ON UPDATE CASCADE);

CREATE TABLE cursan(
dni_profesor VARCHAR(8) NOT NULL,
codigo_curso INT NOT NULL,
PRIMARY KEY (dni_profesor, codigo_curso),
FOREIGN KEY (dni_profesor)
REFERENCES profesores (dni_profesor)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (codigo_curso)
REFERENCES cursos (codigo_curso)
ON DELETE CASCADE
ON UPDATE CASCADE);

INSERT INTO estudiantes (dni_estudiante, nombre, direccion, telefono, edad) VALUES
("1111111A","PEPE ROMAN","paseo prim 9",655555555, 21),
("2222222A","ALFONSO RAMIREZ","paseo cajal 97",699999999, 16),
("3333333A","CONFUSIO GARCIA","paseo prim 9",688888888, 17),
("4444444A","PAULO ALONSO","paseo cajal  49",677777777, 19),
("5555555A","MANOLO ROMAN","calle juan ramon 4",622222222, 16),
("6666666A","CARLOS GALLARDO","paseo prim 8",633333333, 20),
("7777777A","RAMON GALLEGO","calle juan ramon 8",622222222, 20),
("8888888A","VICTOR ROMAN","paseo cajal  16",644444444, 21),
("9999999A","FERNANDO FERNANDEZ","paseo prim 12",611111111, 18),
("1010101A","ZEUS MAROTO","calle juan ramon 1",666666666, 16);

INSERT INTO empresa (cif,nombre,telefono,direccion) VALUES
("26826595","AMAZON",111111111,"paseo prim 9"),
("65282365","BQ",222222222,"paseo cajal 97"),
("65238423","AUDI",333333333,"paseo prim 9"),
("89658132","BOSH",444444444,"paseo cajal  49"),
("25263615","MERCADONA",555555555,"calle juan ramon 4"),
("51515151","AOC",666666666,"paseo prim 8"),
("55251032","SAMSUNG",777777777,"calle juan ramon 8"),
("67278292","LG",888888888,"paseo cajal  16"),
("31212999","MICHELIN",999999999,"paseo prim 12"),
("50859099","FORD",100000000,"calle juan ramon 1");


INSERT INTO trabaja (cif,dni_estudiante) VALUES
("26826595","1111111A"),
("65282365","2222222A"),
("65238423","3333333A"),
("89658132","4444444A"),
("25263615","5555555A"),
("51515151","6666666A"),
("55251032","7777777A"),
("67278292","8888888A"),
("31212999","9999999A"),
("50859099","1010101A");

INSERT INTO cursos (programa,fecha_inicio,fecha_fin,numero_curso) VALUES
("1234",'2022-1-1','2022-1-25',200),
("13",'2022-2-1','2022-2-25',201),
("134234",'2022-3-1','2022-3-25',202),
("34431",'2022-4-1','2022-4-25',203),
("14234",'2022-5-1','2022-5-25',204),
("1434",'2022-6-1','2022-6-25',205),
("1565656",'2022-7-1','2022-7-25',206),
("435451",'2022-8-1','2022-8-25',207),
("134545",'2022-9-1','2022-9-25',208),
("145345",'2022-10-1','2022-10-25',209);

INSERT INTO profesores (dni_profesor,nombre,telefono,codigo_curso) VALUES
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

INSERT INTO cursan (dni_profesor,codigo_curso) VALUES
("11112222",1),
("22223333",2),
("33334444",3),
("44445555",4),
("5555666F",5),
("6666777E",6),
("7777888D",7),
("8888999C",8),
("9999000B",9),
("0000000A",10);




