Listar todos los libros disponibles
```sql
SELECT ISBN, titulo, dispo 
FROM libros 
WHERE dispo = 'DISPONIBLE';
```
Buscar libros por género
```sql
SELECT l.ISBN, l.titulo, l.dispo, g.nombre AS genero
FROM generoXlibro gx
INNER JOIN libros l ON gx.ISBN = l.ISBN
INNER JOIN genero g ON gx.idGen = g.idGen
WHERE g.nombre = 'Suspenso';
```
Obtener información de un libro por ISBN
```sql
SELECT ISBN, titulo, dispo 
FROM libros 
WHERE ISBN = '43242FDA';
```
Contar el número de libros en la biblioteca
```sql
SELECT COUNT(ISBN) AS total_libros 
FROM libros;
```
Listar todos los autores
```sql
SELECT idAutor, nombre
FROM autor;
```
Buscar autores por nombre
```sql
SELECT idAutor, nombre
FROM autor 
WHERE nombre LIKE '%felipe saens%';
```
Obtener todos los libros de un autor específico
```sql
SELECT l.ISBN, l.titulo 
FROM libros l
INNER JOIN libroAutor la ON l.ISBN = la.ISBN
INNER JOIN autor a ON la.idAutor = a.idAutor
WHERE a.nombre = 'felipe saens';
```
Listar todas las ediciones de un libro
```sql
SELECT e.idEditor, e.nombre AS editor, ed.idEditorial, ed.ISBN 
FROM edicionLibro ed
INNER JOIN editor e ON ed.idEditor = e.idEditor
WHERE ed.ISBN = '43242FDA';
```
Obtener la última edición de un libro
```sql
SELECT e.idEditor, e.nombre AS editor, ed.idEditorial, ed.ISBN 
FROM edicionLibro ed
INNER JOIN editor e ON ed.idEditor = e.idEditor
WHERE ed.ISBN = '43242FDA' 
ORDER BY ed.idEditorial DESC
LIMIT 1;
```
Contar cuántas ediciones hay de un libro específico
```sql
SELECT COUNT(idEditor) AS total_ediciones 
FROM edicionLibro 
WHERE ISBN = '43242FDA';
```
Listar todas las transacciones de préstamo
```sql
SELECT idTransaccion,fecha,idTipo
FROM transaccion
WHERE idTipo = 1;
```
Obtener los libros prestados actualmente
```sql
SELECT l.ISBN, l.titulo, t.idTipo AS IdtIpo
FROM libroTransaccion lt
INNER JOIN libros l on lt.ISBN = l.ISBN
INNER JOIN transaccion t on lt.idTransaccion = t.idTransaccion
WHERE idTipo = 1;
```
Contar el número de transacciones de un miembro específico
```sql
SELECT COUNT(idMiembro) AS total_transacciones
FROM libroTransaccion t
WHERE t.idMiembro = 1;
```
Listar todos los miembros de la biblioteca
```sql
SELECT idMiembro, nombre, direccion, telefono
FROM miembro;
```
Buscar un miembro por nombre:
```sql
SELECT idMiembro, nombre, direccion, telefono
FROM miembro 
WHERE nombre LIKE '%Daniel%';
```
Obtener las transacciones de un miembro específico
```sql
SELECT t.idTransaccion, t.ISBN, t.idMiembro 
FROM libroTransaccion t
INNER JOIN miembro m on m.idMiembro = t.idTransaccion
WHERE t.idMiembro = 1;
```
Listar todos los libros y sus autores
```sql
SELECT l.ISBN, l.titulo, a.nombre AS autor
FROM libros l
INNER JOIN libroAutor la ON l.ISBN = la.ISBN
INNER JOIN autor a ON la.idAutor = a.idAutor;
```
Obtener el historial de préstamos de un libro específico
```sql
SELECT t.idTransaccion, t.fecha, m.nombre AS miembro
FROM transaccion t
INNER JOIN libroTransaccion lt ON t.idTransaccion = lt.idTransaccion
INNER JOIN miembroLibro ml ON lt.ISBN = ml.ISBN
INNER JOIN miembro m ON ml.idMiembro = m.idMiembro
WHERE lt.ISBN = '43242FDA';
```
Contar cuántos libros han sido prestados en total
```sql
SELECT COUNT(idTransaccion) AS total_prestamos 
FROM libroTransaccion;
```
Listar todos los libros junto con su última edición y estado de disponibilidad
```sql
SELECT l.ISBN, l.titulo, l.dispo AS disponibilidad, e.nombre AS editor
FROM libros l
LEFT JOIN edicionLibro ed ON l.ISBN = ed.ISBN
LEFT JOIN editor e ON ed.idEditor = e.idEditor
ORDER BY ed.idEditorial DESC;
```