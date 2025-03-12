
create database bibliotecaCampus;
use bibliotecaCampus;


CREATE TABLE genero (
    idGen INT AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    PRIMARY KEY (idGen)
);

CREATE TABLE libros (
    ISBN VARCHAR(15) NOT NULL,
    titulo VARCHAR(150) NOT NULL,
    dispo VARCHAR(20) NOT NULL,
    PRIMARY KEY (ISBN)
);

CREATE TABLE autor (
    idAutor VARCHAR(15) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    PRIMARY KEY (idAutor)
);

CREATE TABLE libroAutor (
    ISBN VARCHAR(15) NOT NULL, 
    idAutor VARCHAR(15) NOT NULL,  
    PRIMARY KEY (ISBN, idAutor),
    FOREIGN KEY (ISBN) REFERENCES libros(ISBN),
    FOREIGN KEY (idAutor) REFERENCES autor(idAutor)
);


CREATE TABLE generoXlibro (
    idGen INT NOT NULL,  
    ISBN VARCHAR(15) NOT NULL,  
    PRIMARY KEY (idGen, ISBN),
    FOREIGN KEY (idGen) REFERENCES genero(idGen),
    FOREIGN KEY (ISBN) REFERENCES libros(ISBN)
);

CREATE TABLE typeTransaccion (
    idTipo INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    PRIMARY KEY (idTipo)
);


CREATE TABLE transaccion (
    idTransaccion INT AUTO_INCREMENT,
    fecha DATE NOT NULL,
    idTipo INT NOT NULL ,  
    PRIMARY KEY (idTransaccion),
    FOREIGN KEY (idTipo) REFERENCES typeTransaccion(idTipo)
);



CREATE TABLE libroTransaccion (
    idTransaccion INT NOT NULL,  
    ISBN VARCHAR(15) NOT NULL, 
    PRIMARY KEY (idTransaccion, ISBN),
    FOREIGN KEY (idTransaccion) REFERENCES transaccion(idTransaccion),
    FOREIGN KEY (ISBN) REFERENCES libros(ISBN)
);


CREATE TABLE miembro (
    idMiembro INT AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    direccion varchar(150),
    telefono int(11),
    PRIMARY KEY (idMiembro)
);

CREATE TABLE miembroLibro (
    idMiembro INT NOT NULL, 
    ISBN VARCHAR(30) NOT NULL,  
    PRIMARY KEY (idMiembro, ISBN),
    FOREIGN KEY (idMiembro) REFERENCES miembro(idMiembro),
    FOREIGN KEY (ISBN) REFERENCES libros(ISBN)
);

CREATE TABLE admin (
    idAdmin INT AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    direccion varchar(150),
    telefono int(11),
    PRIMARY KEY (idAdmin)
);

CREATE TABLE publicacion (
    idPublicacion INT AUTO_INCREMENT,
    titulo VARCHAR(45) NOT NULL,
    fecha DATE NOT NULL,
    PRIMARY KEY (idPublicacion)
);

CREATE TABLE editorial (
    Nit VARCHAR(20) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    PRIMARY KEY (Nit)
);

CREATE TABLE publicacionLibro (
    idPublicacion INT NOT NULL, 
    ISBN VARCHAR(15) NOT NULL,  
    NitEditorial VARCHAR(20) NOT NULL,
    PRIMARY KEY (idPublicacion, ISBN, NitEditorial),
    FOREIGN KEY (idPublicacion) REFERENCES publicacion(idPublicacion),
    FOREIGN KEY (ISBN) REFERENCES libros(ISBN),
    FOREIGN KEY (NitEditorial) REFERENCES editorial(Nit)
);

CREATE TABLE editor(
    idEditor VARCHAR(15),
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    PRIMARY KEY (idEditor)
);


CREATE TABLE edicionLibro (
    idEditor VARCHAR(15) NOT NULL, 
    ISBN VARCHAR(15) NOT NULL,
    idEditorial VARCHAR(20),
    PRIMARY KEY (idEditor, ISBN, idEditorial),
     FOREIGN KEY (idEditor) REFERENCES editor(idEditor),
    FOREIGN KEY (idEditorial) REFERENCES editorial(Nit),
    FOREIGN KEY (ISBN) REFERENCES libros(ISBN)
);


CREATE TABLE editorialXlibro (
    idEditorial VARCHAR(20) NOT NULL,  
    ISBN VARCHAR(15) NOT NULL,  
    PRIMARY KEY (idEditorial, ISBN),
    FOREIGN KEY (idEditorial) REFERENCES editorial(Nit),
    FOREIGN KEY (ISBN) REFERENCES libros(ISBN)
);



