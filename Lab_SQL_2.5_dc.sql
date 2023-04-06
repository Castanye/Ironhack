##LABORATORIO 2.5

USE sakila;

SHOW tables;

#1. Select all the actors with the first name ‘Scarlett’.
SELECT first_name, last_name FROM actor
Where first_name = 'Scarlett';

#2. How many films (movies) are available for rent and how many films have been rented?
SELECT count(*) FROM film;  # 1000 peliculas en total
SELECT count(*) FROM rental;# 16044 Peliculas en Renta

SELECT * FROM rental;
#3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(rental_duration) as max_duration FROM film; #MAX = 7
SELECT MIN(rental_duration) as min_duration FROM film;#MIN = 3

#4. What's the average movie duration expressed in format (hours, minutes)?
SELECT (AVG(length/60)) as MIN FROM film; #NEcesitamos encontrar como poner los segundos. 

#5. How many distinct (different) actors' last names are there?
Select count(distinct(last_name)) From actor;   # Tenemos 121 apellidos deiferentes.

#6. Since how many days has the company been operating (check DATEDIFF() function)?
SELECT datediff(max(rental_date),min(rental_date)) as Days FROM rental; # 266 dias operando


#7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT*,
monthname(rental_date) as MES,
date_format(rental_date, '%W') as DIA 
FROM rental
limit 20;

#8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
set lc_time_names = "es_ES";
SELECT*,
monthname(rental_date) as MES,
date_format(rental_date, '%W') as DIA,
CASE
WHEN date_format(rental_date, '%W') = 'lunes' then 'dia laboral' 
WHEN date_format(rental_date, '%W') = 'martes' then 'dia laboral'
WHEN date_format(rental_date, '%W') = 'miercoles' then 'dia laboral'
WHEN date_format(rental_date, '%W') = 'jueves' then 'dia laboral'
WHEN date_format(rental_date, '%W') = 'viernes' then 'dia laboral'
WHEN date_format(rental_date, '%W') = 'sabado' then 'fin de semana'
WHEN date_format(rental_date, '%W') = 'domingo' then 'fin de semana'
END AS 'Tipo de Día'
From rental;

SHOW DATABASES;
SHOW TABLES;
SELECT* FROM rental;

#9. How many rentals were in the last month of activity?
select date(max(rental_date))- INTERVAL 30 DAY, date(max(rental_date))from rental;  #Conocemos las fechas 
SELECT * FROM rental
WHERE rental_date BETWEEN 060115 AND 060214; 


