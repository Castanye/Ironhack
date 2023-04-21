USE sakila;

#----1----
SELECT * FROM film;
SELECT RANK() OVER(order by film.length DESC) AS "rank" , title, film.length FROM film
WHERE film.length <> 0 AND film.length IS NOT NULL;

#-----2----
SELECT * FROM film;
SELECT RANK() OVER (PARTITION BY rating ORDER BY film.length DESC) AS "rank", rating, title, film.length FROM film
WHERE film.length <> 0 AND film.length IS NOT NULL;
 
#----3----
SELECT * FROM category;
SELECT * FROM film_category;
SELECT category.name AS category_name, COUNT(film_category.film_id) AS film_id
FROM category
JOIN film_category
ON category.category_id=film_category.category_id
GROUP BY category_name;

#----4---
SELECT * FROM actor;
SELECT * FROM film_actor;
SELECT actor.first_name AS first_name, actor.last_name AS last_name, COUNT(film_actor.film_id) AS "number_of_appearance"
FROM actor
JOIN film_actor
ON actor.actor_id=film_actor.actor_id
GROUP BY actor.first_name, actor.last_name
ORDER BY COUNT(film_actor.film_id) DESC;

#---5----
SELECT * FROM customer; 
SELECT * FROM rental; 
SELECT customer.first_name AS first_name, customer.last_name AS last_name, COUNT(rental.customer_id) AS "number of rentals"
FROM customer
JOIN rental
ON customer.customer_id=rental.customer_id
GROUP BY customer.first_name, customer.last_name
ORDER BY COUNT(rental.customer_id) DESC;
