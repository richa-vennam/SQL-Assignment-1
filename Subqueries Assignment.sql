#1 Display all customer details who have made more than 5 payments#
SELECT *
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING COUNT(payment_id) > 5 
    );
#2 names of actors who acted in more than 10 films
SELECT first_name, last_name 
FROM actor
WHERE actor_id IN (
    select actor_id
    FROM film_actor
    GROUP BY actor_id
    HAVING COUNT(film_id) > 10
);


#"Find the names of customers who never made a payment."
SELECT first_name,last_name,c.customer_id
FROM customer c
WHERE NOT EXISTS(
    SELECT 1
    #Select 1 is used beacuse we only need to check whether a row exits
    FROM payment p
    WHERE p.customer_id = c.customer_id
);

#4
SELECT title,rental_rate
FROM film
WHERE rental_rate > (
    SELECT AVG(rental_rate)
    FROM film
);

#5 titles of film that were never rented 
SELECT title
FROM film
WHERE film_id NOT IN (
    SELECT DISTINCT i.film_id
    FROM inventory i, rental r
    WHERE i.inventory_id = r.inventory_id
);

#6 customers who rented films in the same monthas customer with id 5
select c.first_name,c.last_name 
from customer c
WHERE c.customer_id IN (SELECT r.customer_id 
                        from rental r
						WHERE (year(r.rental_date),month(r.rental_date) )
												IN 
                        (select year(r5.rental_date),month(r5.rental_date)
                        from rental r5));

#7
SELECT DISTINCT s.staff_id, s.first_name, s.last_name
FROM staff s
INNER JOIN payment p
    ON s.staff_id = p.staff_id
WHERE p.amount >
(
    SELECT AVG(amount)
    FROM payment
);

#8 Show the title and rental duration of films whose rental duration is greater than the average
SELECT title, rental_duration
FROM film
WHERE rental_duration > (
    SELECT AVG(rental_duration)
    FROM film
);

#9 Find all customers who have the same address as the customer with ID 1.
SELECT *
FROM customer
WHERE address_id = (
    SELECT address_id
    FROM customer
    WHERE customer_id = 1
);

#10 List all payments that are greater than the average of all payments.
SELECT *
FROM payment
WHERE amount > (
    SELECT AVG(amount)
    FROM payment
);

