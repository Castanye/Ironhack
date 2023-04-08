use Sakila;
show tables;
SELECT* FROM staff;
# 1. Get release years.
SELECT release_year FROM FILM;
#Aqui obtenemos los años de lanzamiento de las peliculas

# 2.Get all films with ARMAGEDDON in the title.
SELECT title FROM FILM
WHERE title like '%ARMAGEDDON%';
#Obtenemos todas las peliculas que incluyan ARMAGEDDON dentro del nomnbre en cualquier parte.

#3. Get all films which title ends with APOLLO.
SELECT title FROM FILM
WHERE title like '%APOLLO';
#Obtenemos todas las peliclas que terminen con la palabra apollo

#4. Get 10 the longest films.
SELECT * FROM film
order by length DESC #Ordenamos por length de manera descendente
LIMIT 10; #Solo pedimos las 1o primeras filas

#5. How many films include Behind the Scenes content?
SELECT COUNT(title) FROM film
where special_features like '%Behind the Scenes%';
#Aqui obtenemos las peliculas que incluyen Behind_Scenes

#6.Drop column picture from staff.
ALTER TABLE staff
DROP COLUMN picture;
#Dropeamos la columna picture de la tabla de staff

#7.A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
#select * FROM customer
select * FROM staff;
insert into staff  #Aqui le decimos donde la vamos a agregar
values (3,'TAMMY','SANDERS', 5, null, 1, 1, 'Tammy', null,2012-04-07  ); #Le decimos que informacion queremos.
#_--------------------------------Me sale un error por la fecha---------------------------

#8. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER'; #Donde va a buscar los valroes
INSERT INTO rental (rental_date, inventory_id, customer_id, staff_id) #Aqui donde los vamos a meter
VALUES (NOW(), (SELECT inventory_id FROM inventory WHERE film_id = (SELECT film_id FROM film WHERE title = 'Academy Dinosaur') AND store_id = 1 LIMIT 1), 
(SELECT customer_id FROM customer WHERE first_name = 'CHARLOTTE' AND last_name = 'HUNTER'), 1);

#9. Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:
CREATE TABLE deleted_users AS #QUE es lo que queremos hacer
SELECT customer_id, email, NOW() FROM customer #que valores vamos a modificar
WHERE active = 0; # de donde los vamos a modificar

SELECT * FROM deleted_users; #Revisamos lo que tenemos en deleted users y verificamos si se elimino. 