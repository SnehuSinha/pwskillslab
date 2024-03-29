USE mavenmovies;

-- Basic Aggregate Functions:

/* Question 1:
Retrieve the total number of rentals made in the Sakila database. */
SELECT 
    COUNT(*)
FROM
    rental;

/* Question 2:
Find the average rental duration (in days) of movies rented from the Sakila database. */
SELECT 
    AVG(DAY(rental_Date))
FROM
    rental;


-- String Functions:

/* Question 3:
Display the first name and last name of customers in uppercase. */
SELECT 
    UPPER(first_name), UPPER(last_name)
FROM
    customer;

/* Question 4: 
Extract the month from the rental date and display it alongside the rental ID. */
SELECT 
    rental_id, MONTH(rental_date)
FROM
    rental;
    
    

-- GROUP BY:

/* Question 5:
Retrieve the count of rentals for each customer (display customer ID and the count of rentals). */
SELECT 
    customer_id, COUNT(rental_date)
FROM
    rental
GROUP BY customer_id;

/* Question 6: 
Find the total revenue generated by each store. */ -- DOUBT
SELECT 
    payment_id, SUM(amount)
FROM
    payment
GROUP BY payment_id;



-- Joins:

/* Display the title of the movie, customer s first name, and last name who rented it. */
SELECT 
    f.title, c.customer_id, c.first_name, c.last_name
FROM
    film AS f
        JOIN
    inventory AS i ON f.film_id = i.film_id
        JOIN
    rental AS r ON i.inventory_id = r.inventory_id
        JOIN
    customer AS c ON r.customer_id = c.customer_id;


/* Question 8:
Retrieve the names of all actors who have appeared in the film "Gone with the Wind". */
-- Hint: Use JOIN between the film actor, film, and actor tables.
SELECT 
    a.first_name, a.last_name
FROM
    film AS f
        JOIN
    film_actor AS fa ON f.film_id = fa.film_id
        JOIN
    actor AS a ON fa.actor_id = a.actor_id
    WHERE f.title = "Gone with the Wind";
    
    
    
-- GROUP BY:

/* Question 1:
Determine the total number of rentals for each category of movies.
Hint: JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY. */
SELECT 
    film_category.category_id, COUNT(rental.rental_id)
FROM
    film_category
        JOIN
    film ON film_category.film_id = film.film_id
        JOIN
    inventory ON film.film_id = inventory.film_id
        JOIN
    rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film_category.category_id;


/* Question 2:
Find the average rental rate of movies in each language.
Hint: JOIN film and language tables, then use AVG () and GROUP BY. */
SELECT 
    language.language_id, AVG(film.rental_rate) avg_rental_rate
FROM
    language
        JOIN
    film ON language.language_id = film.language_id
GROUP BY language.language_id;



-- Joins:

/* Question 3:
Retrieve the customer names along with the total amount they've spent on rentals.
Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY. */
SELECT 
    customer.first_name,
    customer.last_name,
    SUM(payment.amount),
    rental.rental_id
FROM
    customer
        JOIN
    payment ON customer.customer_id = payment.customer_id
        JOIN
    rental ON payment.customer_id = rental.customer_id
GROUP BY rental.rental_id;


/* Question 4:
List the titles of movies rented by each customer in a particular city (e.g., 'London').
Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY. */
SELECT 
    customer.first_name, customer.last_name, film.title, city.city
FROM
    film
        JOIN
    inventory ON film.film_id = inventory.film_id
        JOIN
    rental ON inventory.inventory_id = rental.inventory_id
        JOIN
    customer ON rental.customer_id = customer.customer_id
        JOIN
    address ON customer.address_id = address.address_id
        JOIN
    city ON address.city_id = city.city_id
ORDER BY city.city;



-- Advanced Joins and GROUP BY:

/* Question 5:
Display the top 5 rented movies along with the number of times they've been rented.
Hint: JOIN film, inventory, and rental tables, then use cOUNT() and GROUP BY, and limit the results. */
SELECT 
    film.title, COUNT(rental.rental_id) as rental_count
FROM
    film
        JOIN
    inventory ON film.film_id = inventory.film_id
        JOIN
    rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.title
ORDER BY rental_count desc
LIMIT 100;


/* Question 6:
Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY. */
SELECT 
    c.customer_id,c.first_name, c.last_name, i.store_id
FROM
    rental r
        JOIN
    inventory i ON r.inventory_id = i.inventory_id
        JOIN
    customer c ON i.store_id = c.store_id
GROUP BY c.customer_id,c.first_name, c.last_name, i.store_id;
