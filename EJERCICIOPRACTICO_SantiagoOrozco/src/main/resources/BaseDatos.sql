/* Se crea la base de datos */
DROP SCHEMA IF EXISTS cine;
DROP USER IF EXISTS usuario_cine;
CREATE SCHEMA cine;

CREATE USER 'usuario_cine'@'%' IDENTIFIED BY 'Cine_Clave.';

/* Se asignan los privilegios sobre la base de datos cine al usuario creado */
GRANT ALL PRIVILEGES ON cine.* TO 'usuario_cine'@'%';
FLUSH PRIVILEGES;

USE cine;

/* Tabla de género - para clasificar las películas/obras */
CREATE TABLE genero (
  id_genero INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  descripcion VARCHAR(200),
  activo BOOLEAN DEFAULT TRUE,
  PRIMARY KEY (id_genero)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

/* Tabla de funciones (películas/obras) */
CREATE TABLE funcion (
  id_funcion INT NOT NULL AUTO_INCREMENT,
  titulo VARCHAR(100) NOT NULL,
  director VARCHAR(100) NOT NULL,
  duracion_min INT,
  fecha DATE,
  hora TIME,
  precio DOUBLE,
  asientos_disponibles INT,
  activo BOOLEAN DEFAULT TRUE,
  PRIMARY KEY (id_funcion)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

/* Tabla de usuarios */
CREATE TABLE usuario (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  username varchar(20) NOT NULL,
  password varchar(512) NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellidos VARCHAR(30) NOT NULL,
  correo VARCHAR(75) NULL,
  telefono VARCHAR(15) NULL,
  activo boolean,
  PRIMARY KEY (id_usuario))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

/* Tabla de roles disponibles */
CREATE TABLE role (  
  rol varchar(20),
  PRIMARY KEY (rol)  
);

INSERT INTO role (rol) VALUES ('ADMIN'), ('USER');

/* Asignación de roles a los usuarios */
CREATE TABLE rol (
  id_rol INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(20),
  id_usuario INT,
  PRIMARY KEY (id_rol)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

INSERT INTO rol (id_rol, nombre, id_usuario) VALUES
 (1, 'ADMIN', 1), 
 (2, 'USER', 1),
 (3, 'USER', 2),
 (4, 'USER', 3);

/* Inserción de usuarios (con contraseñas cifradas) */
INSERT INTO usuario (id_usuario, username, password, nombre, apellidos, correo, telefono, activo) VALUES 
(1, 'juan', '$2a$10$P1.w58XvnaYQUQgZUCk4aO/RTRl8EValluCqB3S2VMLTbRt.tlre.', 'Juan', 'Castro Mora', 'jcastro@gmail.com', '4556-8978', true),
(2, 'rebeca', '$2a$10$GkEj.ZzmQa/aEfDmtLIh3udIH5fMphx/35d0EYeqZL5uzgCJ0lQRi', 'Rebeca', 'Contreras Mora', 'acontreras@gmail.com', '5456-8789', true),
(3, 'pedro', '$2a$10$koGR7eS22Pv5KdaVJKDcge04ZB53iMiw76.UjHPY.XyVYlYqXnPbO', 'Pedro', 'Mena Loria', 'lmena@gmail.com', '7898-8936', true);

/* Inserción de géneros */
INSERT INTO genero (id_genero, nombre, descripcion, activo) VALUES 
(1, 'Acción', 'Películas u obras con escenas emocionantes y ritmo rápido.', true),
(2, 'Comedia', 'Funciones diseñadas para hacer reír.', true),
(3, 'Drama', 'Historias serias y emocionales.', true),
(4, 'Ciencia Ficción', 'Historias futuristas o tecnológicas.', true),
(5, 'Infantil', 'Aptas para todo público, especialmente niños.', true),
(6, 'Musical', 'Funciones donde la música y el canto predominan.', true);

/* Inserción de funciones */
INSERT INTO funcion (id_funcion, titulo, director, duracion_min, fecha, hora, precio, asientos_disponibles, activo) VALUES 
(1, 'Avengers: Endgame', 'Anthony y Joe Russo', 181, '2025-04-18', '19:00:00', 3500, 100, true),
(2, 'El Rey León (musical)', 'Julie Taymor', 120, '2025-04-19', '17:00:00', 4000, 80, true),
(3, 'La La Land', 'Damien Chazelle', 128, '2025-04-20', '20:00:00', 3200, 75, true),
(4, 'Toy Story', 'John Lasseter', 81, '2025-04-21', '15:00:00', 2500, 100, true),
(5, 'Matrix', 'The Wachowskis', 136, '2025-04-22', '21:00:00', 3000, 60, true);
