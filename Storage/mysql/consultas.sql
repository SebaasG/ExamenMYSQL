

# Introduce aquí las consultas.

SELECT ISBN,titulo,dispo from libros where dispo = "DISPONIBLE";


Buscar libros por género

# Introduce aquí las consultas.

SELECT l.ISBN,l.titulo,l.dispo, g.idGen 
FROM libros l
INNER JOIN  l.idGen
WHERE g.idGen = "Comedia" ;

Obtener información de un libro por ISBN


Contar el número de libros en la biblioteca

Listar todos los autores

Buscar autores por nombre

Obtener todos los libros de un autor específico

Listar todas las ediciones de un libro

Obtener la última edición de un libro

Contar cuántas ediciones hay de un libro específico

Listar todas las transacciones de préstamo

Obtener los libros prestados actualmente

Contar el número de transacciones de un miembro específico

Listar todos los miembros de la biblioteca

Buscar un miembro por nombre:

Obtener las transacciones de un miembro específico

Listar todos los libros y sus autores

Obtener el historial de préstamos de un libro específico

Contar cuántos libros han sido prestados en total

Listar todos los libros junto con su última edición y estado de disponibilidad
