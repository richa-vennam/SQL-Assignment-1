#-------------Assignment2--------------------------
USE sakila;
#1 List all customers along with the films they have rented-------------------
#Joined the customer, rental, inventory, and film tables using INNER JOIN
SELECT c.first_name,c.last_name,f.title FROM customer c
JOIN rental r
  ON c.customer_id = r.customer_id
JOIN inventory i
  ON r.inventory_id = i.inventory_id
JOIN film f
  ON i.film_id = f.film_id;

#2----list all customers with their total rental count including those who havent rented any ------------
#oined the customer and rental tables using LEFT JOIN.
SELECT c.customer_id,c.first_name,c.last_name,
       COUNT(r.rental_id) AS rental_count
FROM customer c
LEFT JOIN rental r
  ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;


#-------Display all films along with their categories-----------
#Joined the film, film_category, and category tables using LEFT JOIN.
SELECT f.title,c.name AS category
FROM film f
LEFT JOIN film_category fc
  ON f.film_id = fc.film_id
LEFT JOIN category c
  ON fc.category_id = c.category_id
ORDER BY f.title;

#4-----Display all customer and staff emails using FULL OUTER JOIN-----------
#I joined the customer and staff tables using LEFT JOIN and RIGHT JOIN with UNION to show all records from both tables, including those that match and those that don't.
SELECT c.first_name,c.last_name,c.email
FROM customer c
LEFT JOIN staff s
  ON c.email = s.email
UNION
SELECT s.first_name,s.last_name,s.email
FROM customer c
RIGHT JOIN staff s
  ON c.email = s.email;
  
#5----------Find all actors who acted in ACADEMY DINOSAUR-----------------
SELECT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa
  ON a.actor_id = fa.actor_id
JOIN film f
  ON fa.film_id = f.film_id
WHERE f.title = 'ACADEMY DINOSAUR';

#6------Display all stores with the total number of staff members---------
SELECT st.store_id,
       COUNT(sf.staff_id) AS total_staff
FROM store st
LEFT JOIN staff sf
  ON st.store_id = sf.store_id
GROUP BY st.store_id;

#7-------------Customers who rented films more than 5 times-------------------
SELECT c.first_name,c.last_name,c.customer_id,COUNT(r.rental_id) AS total_rentals
FROM customer c
JOIN rental r
  ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(r.rental_id) > 5;


