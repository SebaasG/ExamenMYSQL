insert into genero(nombre) values ("Accion"),("Suspenso"),("triller"),("Comedia");

insert into libros values ("43242FDA", "EL PRINCIPITO", "DISPONIBLE"),("4124242FDA", "NARNIA", "NO DISPONIBLE"),("GF23FDS4", "EL PRINCIPITO", "DISPONIBLE");

INSERT INTO autor values ("1234","felipe saens"), ("4321","roberto melano"), ("442342","gabito el bonito");

INSERT INTO libroAutor VALUES ("43242FDA","1234" ) ("4124242FDA", "4321" );

INSERT INTO generoXLibro VALUES (1,"43242FDA"), (2,"43242FDA"), (2, "4124242FDA");

INSERT INTO typeTransaccion (nombre) VALUES ("PRESTAMO"), ("DEVOLUCION");

INSERT INTO transaccion(fecha,idTipo) VALUES (NOW(), 1);

INSERT INTO libroTransaccion VALUES (1, "43242FDA");

INSERT INTO miembro(nombre, direccion, telefono) VALUES ("Sebastian", "calle3242", 231313112),("Daniel", "3434", 56545433);

INSERT INTO miembroLibro VALUES (1, "4124242FDA"), (2, "43242FDA"),(2, "GF23FDS4");

INSERT INTO admin(nombre, direccion, telefono) VALUES ("admin", "calle3242", 333333);

INSERT INTO publicacion(titulo, fecha) VALUES ("El mejor book",  Now()),("de los mejorees booksito",  Now());

INSERT INTO editorial VALUES ("34324KMGJF","CROMOSOMAS 2.0"),("35543GJF","EDITORIAL");

INSERT INTO publicacionLibro VALUES (1, "43242FDA"), (2, "34324KMGJF");

INSERT INTO editor VALUES ("1052382113", "MERLITO", "LA AMAZSONA"),("543382154", "el mas capito", "CATATUMBA");

INSERT INTO edicionLibro VALUES ("1052382113", "43242FDA", "34324KMGJF"), ("543382154", "4124242FDA", "35543GJF");

INSERT INTO editorialXlibro VALUES ("34324KMGJF","43242FDA" ),("35543GJF","4124242FDA" );