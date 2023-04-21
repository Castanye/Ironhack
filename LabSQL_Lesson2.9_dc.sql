USE sakila;
SHOW TABLES;

SELECT * FROM rental; 
SELECT * FROM inventory; 

#---1---
SELECT rental.rental_id AS "rental_id", rental.customer_id as "customer_id", 
CONCAT(SUBSTRING(rental.rental_date, 6, 2), '-', SUBSTRING(rental.rental_date, 1, 4))
 AS "rental_May", film.title as "R_film"
FROM film
JOIN inventory
ON film.film_id = inventory.film_id
JOIN rental 
ON rental.inventory_id = inventory.inventory_id
WHERE CONCAT(SUBSTRING(rental.rental_date, 6, 2), '-', SUBSTRING(rental.rental_date, 1, 4)) = "05-2005"
ORDER BY rental_date ASC;

DROP TABLE rentals_may;
CREATE TABLE rentals_may (
  rental_id INT,
  customer_id INT,
  rental_date TEXT,
  rented_film TEXT
);

INSERT INTO rentals_may (rental_id, customer_id, rental_date, rented_film)
SELECT rental.rental_id AS rental_id, rental.customer_id AS customer_id, 
       CONCAT(SUBSTRING(rental.rental_date, 6, 2), '-', SUBSTRING(rental.rental_date, 1, 4)) AS rental_date, 
       film.title AS rented_film
FROM film
JOIN inventory 
ON film.film_id = inventory.film_id
JOIN rental 
ON rental.inventory_id = inventory.inventory_id
WHERE CONCAT(SUBSTRING(rental.rental_date, 6, 2), '-', SUBSTRING(rental.rental_date, 1, 4)) = '05-2005'
ORDER BY rental_date ASC;

SELECT * FROM rentals_may;

DROP TABLE rentals_june;
CREATE TABLE rentals_june (
  rental_id INT,
  customer_id INT,
  rental_date TEXT,
  rented_film TEXT
  );

INSERT INTO rentals_june (rental_id, customer_id, rental_date, rented_film)
SELECT rental.rental_id AS rental_id, rental.customer_id AS customer_id, 
       CONCAT(SUBSTRING(rental.rental_date, 6, 2), '-', SUBSTRING(rental.rental_date, 1, 4)) AS rental_date, 
       film.title AS rented_film
FROM film
JOIN inventory 
ON film.film_id = inventory.film_id
JOIN rental 
ON rental.inventory_id = inventory.inventory_id
WHERE CONCAT(SUBSTRING(rental.rental_date, 6, 2), '-', SUBSTRING(rental.rental_date, 1, 4)) = '06-2005'
ORDER BY rental_date ASC;
  
SELECT * FROM rentals_june;

SELECT customer_id, count(rental_id)
FROM rentals_may
GROUP BY customer_id
ORDER BY customer_id ASC;


SELECT customer_id, count(rental_id)
FROM rentals_june
GROUP BY customer_id
ORDER BY customer_id ASC;




