DROP DATABASE IF EXISTS trailerflix;

CREATE DATABASE Trailerflix;

USE Trailerflix;

DROP TABLE IF EXISTS categoria;

CREATE TABLE `categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS genero;

CREATE TABLE `genero` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS contenido;

CREATE TABLE `contenido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `id_categoria` int DEFAULT NULL,
  `id_genero` int DEFAULT NULL,
  `resumen` varchar(800) DEFAULT NULL,
  `temporadas` int DEFAULT NULL,
  `trailer` varchar(100) DEFAULT NULL,
  `duracion` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_categoria_idx` (`id_categoria`),
  KEY `fk_genero_idx` (`id_genero`),
  CONSTRAINT `fk_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`),
  CONSTRAINT `fk_genero` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS tag;

CREATE TABLE `tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS actor;

CREATE TABLE `actor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_apellido` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_apellido_UNIQUE` (`nombre_apellido`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS contenidotag;

CREATE TABLE `contenidotag` (
  `id_contenido` int NOT NULL,
  `id_tag` int NOT NULL,
  PRIMARY KEY (`id_contenido`,`id_tag`),
  KEY `fk_tag_idx` (`id_tag`),
  CONSTRAINT `fk_contenidoTag` FOREIGN KEY (`id_contenido`) REFERENCES `contenido` (`id`),
  CONSTRAINT `fk_tagContenido` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS contenidoactor;

CREATE TABLE `contenidoactor` (
  `id_contenido` int NOT NULL,
  `id_actor` int NOT NULL,
  PRIMARY KEY (`id_contenido`,`id_actor`),
  KEY `fk_actor_idx` (`id_actor`),
  CONSTRAINT `fk_actorContenido` FOREIGN KEY (`id_actor`) REFERENCES `actor` (`id`),
  CONSTRAINT `fk_contenidoActor` FOREIGN KEY (`id_contenido`) REFERENCES `contenido` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;