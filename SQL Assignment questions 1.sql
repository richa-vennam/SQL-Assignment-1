-------SQL Practice Questions------

-- Question 1 all customes  whose names starts with J and are active--------

SELECT *FROM customer
WHERE first_name LIKE 'J%'
AND active = 1;

-- Question 2 Find all films where the title contains 'ACTION' or the description contains 'WAR'.------------
SELECT *FROM film
WHERE title LIKE '%ACTION%'
OR description LIKE '%WAR%';

----- Question 3: Customers whose last name is not SMITH and first name ends with 'a'------
select * from customer
where last_name<> 'SMITH'
AND first_name like '%A';

-- QUESTION 4 Get films with rental rate above 3.0 and a replacement cost that is not NULL-----

SELECT * FROM film
WHERE rental_rate > 3.0
AND replacement_cost IS NOT NULL;

-- QUESTION 5 Count active customers in each store---
SELECT store_id, COUNT(*)
FROM customer
WHERE active = 1
GROUP BY store_id;

-- QUESTION 6 Show distinct film ratings-------
SELECT DISTINCT rating
FROM film;

-- QUESTION 7 Find films for each rental duration where the average length is more than 100 minutes----
SELECT rental_duration, COUNT(*)
FROM film
GROUP BY rental_duration
HAVING AVG(length) > 100;

-- QUESTION 8 List payment dates and total amount paid per date,only where more than 100 payments were made.
SELECT DATE(Payment_date), SUM(amount)
FROM payment
GROUP BY DATE(payment_date)
HAVING COUNT(*) > 100;

-- QUESTION 9 Find customers whose email is NULL or ends with '.org'.
SELECT *FROM customer
WHERE email IS NULL
OR email LIKE '%.org';

-- QUESTION 10
-- List films rated PG or G,ordered by rental rate from highest to lowest.-----
SELECT *FROM film
WHERE rating = 'PG'
OR rating = 'G'
ORDER BY rental_rate DESC;

-- QUESTION 11
-- Count films for each length where the title starts with T and the count is more than 5----
SELECT length, COUNT(*)
FROM film
WHERE title LIKE 'T%'
GROUP BY length
HAVING COUNT(*) > 5;

-- QUESTION 12 List actors who have appeared in more than 10 films.-----
SELECT a.actor_id, a.first_name, a.last_name, COUNT(*) AS film_count
FROM actor a
JOIN film_actor fa
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING COUNT(*) > 10;

-- QUESTION 13 Find the top 5 films with the highest rental rates and longest lengths combined-----

SELECT *
FROM film
ORDER BY rental_rate DESC, length DESC
LIMIT 5;

-- QUESTION 14 Show all customers with their total rentals,ordered from most to least.-------
SELECT c.customer_id, c.first_name, c.last_name,
       COUNT(r.rental_id) AS total_rentals
FROM customer c
LEFT JOIN rental r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_rentals DESC;

-- QUESTION 15 List film titles that have never been rented-------

SELECT DISTINCT f.title
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL;






