
create database bibliotecaCampus;
use bibliotecaCampus;


CREATE TABLE genero (
    idGen INT AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    PRIMARY KEY (idGen)
)ENGINE=INNODB;

CREATE TABLE libros (
    ISBN VARCHAR(15) NOT NULL,
    titulo VARCHAR(150) NOT NULL,
    dispo VARCHAR(20) NOT NULL,
    PRIMARY KEY (ISBN)
)ENGINE=INNODB;

CREATE TABLE autor (
    idAutor VARCHAR(15) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    PRIMARY KEY (idAutor)
)ENGINE=INNODB;

CREATE TABLE libroAutor (
    ISBN VARCHAR(15) NOT NULL, 
    idAutor VARCHAR(15) NOT NULL,  
    PRIMARY KEY (ISBN, idAutor),
    FOREIGN KEY (ISBN) REFERENCES libros(ISBN),
    FOREIGN KEY (idAutor) REFERENCES autor(idAutor)
)ENGINE=INNODB;


CREATE TABLE generoXlibro (
    idGen INT NOT NULL,  
    ISBN VARCHAR(15) NOT NULL,  
    PRIMARY KEY (idGen, ISBN),
    FOREIGN KEY (idGen) REFERENCES genero(idGen),
    FOREIGN KEY (ISBN) REFERENCES libros(ISBN)
)ENGINE=INNODB;

CREATE TABLE typeTransaccion (
    idTipo INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    PRIMARY KEY (idTipo)
)ENGINE=INNODB;


CREATE TABLE transaccion (
    idTransaccion INT AUTO_INCREMENT,
    fecha DATE NOT NULL,
    idTipo INT NOT NULL ,  
    PRIMARY KEY (idTransaccion),
    FOREIGN KEY (idTipo) REFERENCES typeTransaccion(idTipo)
)ENGINE=INNODB;

CREATE TABLE miembro (
    idMiembro INT AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    direccion varchar(150),
    telefono int(11),
    PRIMARY KEY (idMiembro)
)ENGINE=INNODB;

CREATE TABLE libroTransaccion (
    idTransaccion INT NOT NULL,  
    ISBN VARCHAR(15) NOT NULL, 
    idMiembro INT NOT NULL,
    PRIMARY KEY (idTransaccion, ISBN),
    FOREIGN KEY (idTransaccion) REFERENCES transaccion(idTransaccion),
    FOREIGN KEY (ISBN) REFERENCES libros(ISBN),
    FOREIGN KEY (idMiembro) REFERENCES miembro(idMiembro)
)ENGINE=INNODB;


CREATE TABLE miembroLibro (
    idMiembro INT NOT NULL, 
    ISBN VARCHAR(30) NOT NULL,  
    PRIMARY KEY (idMiembro, ISBN),
    FOREIGN KEY (idMiembro) REFERENCES miembro(idMiembro),
    FOREIGN KEY (ISBN) REFERENCES libros(ISBN)
)ENGINE=INNODB;

CREATE TABLE admin (
    idAdmin INT AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    direccion varchar(150),
    telefono int(11),
    PRIMARY KEY (idAdmin)
)ENGINE=INNODB;

CREATE TABLE publicacion (
    idPublicacion INT AUTO_INCREMENT,
    titulo VARCHAR(45) NOT NULL,
    fecha DATE NOT NULL,
    PRIMARY KEY (idPublicacion)
)ENGINE=INNODB;

CREATE TABLE editorial (
    Nit VARCHAR(20) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    PRIMARY KEY (Nit)
)ENGINE=INNODB;

CREATE TABLE publicacionLibro (
    idPublicacion INT NOT NULL, 
    ISBN VARCHAR(15) NOT NULL,  
    NitEditorial VARCHAR(20) NOT NULL,
    PRIMARY KEY (idPublicacion, ISBN, NitEditorial),
    FOREIGN KEY (idPublicacion) REFERENCES publicacion(idPublicacion),
    FOREIGN KEY (ISBN) REFERENCES libros(ISBN),
    FOREIGN KEY (NitEditorial) REFERENCES editorial(Nit)
)ENGINE=INNODB;

CREATE TABLE editor(
    idEditor VARCHAR(15),
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    PRIMARY KEY (idEditor)
)ENGINE=INNODB;


CREATE TABLE edicionLibro (
    idEditor VARCHAR(15) NOT NULL, 
    ISBN VARCHAR(15) NOT NULL,
    idEditorial VARCHAR(20),
    PRIMARY KEY (idEditor, ISBN, idEditorial),
     FOREIGN KEY (idEditor) REFERENCES editor(idEditor),
    FOREIGN KEY (idEditorial) REFERENCES editorial(Nit),
    FOREIGN KEY (ISBN) REFERENCES libros(ISBN)
)ENGINE=INNODB;


CREATE TABLE editorialXlibro (
    idEditorial VARCHAR(20) NOT NULL,  
    ISBN VARCHAR(15) NOT NULL,  
    PRIMARY KEY (idEditorial, ISBN),
    FOREIGN KEY (idEditorial) REFERENCES editorial(Nit),
    FOREIGN KEY (ISBN) REFERENCES libros(ISBN)
)ENGINE=INNODB;



