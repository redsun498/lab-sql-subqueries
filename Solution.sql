-- 1. Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.

SELECT 
COUNT(*) AS `Copies Hunchback Impossible`
FROM inventory
JOIN
(SELECT 
title,
film_id
FROM
film
WHERE  title = 'Hunchback Impossible') as film_filtered ON film_filtered.film_id=inventory.film_id;

-- 2. List all films whose length is longer than the average length of all the films in the Sakila database.

SELECT 
*
FROM film
WHERE length> (SELECT AVG(length) FROM film);

-- 3. Use a subquery to display all actors who appear in the film "Alone Trip".

SELECT 
Concat(first_name,' ',last_name) AS actors
FROM actor
JOIN film_actor ON film_actor.actor_id=actor.actor_id
WHERE film_id = (SELECT film_id FROM film WHERE title='Alone Trip');

