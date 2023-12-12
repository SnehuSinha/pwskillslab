use mavenmovies;

/* 1. Identify the primary keys and foreign keys in maven movies db. Discuss the differences */
-- Primary key is the unique, not null value which will help in fetching the whole data and in a particular table can be only one primary key;
-- whereas the Foreign key is the value which is referring the primary key of the other table and there can be multiple foreign keys in a table 
SELECT * FROM information_schema.key_column_usage;

/* 2. List all details of actors */
SELECT * FROM actor;
  
/* 3. List all customer information from DB. */
SELECT * FROM customer;

/* 4. List different countries. */
SELECT * FROM country;

/* 5. Display all active customers. */
SELECT first_name, last_name, email, active FROM customer
WHERE active = "1";
  
/* 6. List of all rental IDs for customer with ID 1. */
SELECT rental_id, rental_date, customer_id FROM rental
WHERE customer_id = "1";
  
/* 7. Display all the films whose rental duration is greater than 5 */
SELECT film_id, title, description, release_year , rental_duration FROM film
WHERE rental_duration > 5;

/* 8.  List the total number of films whose replacement cost is greater than $15 and less than $20. */
SELECT COUNT(*) FROM film
WHERE replacement_cost > 15 AND replacement_cost < 20;

/* 9. Display the count of unique first names of actors. */
SELECT COUNT(DISTINCT(first_name)) FROM actor;   

/* 10. Display the first 10 records from the customer table . */
SELECT * FROM customer
LIMIT 10;

/* 11.  Display the first 3 records from the customer table whose first name starts with ‘b’. */
SELECT * FROM customer
WHERE first_name LIKE "B%"
LIMIT 3;

/* 12. Display the names of the first 5 movies which are rated as ‘G’. */
SELECT film_id, title, rating FROM film
WHERE rating = "G"
LIMIT 5;

/* 13. Find all customers whose first name starts with "a". */
SELECT customer_id, first_name, last_name, email FROM customer
WHERE first_name LIKE "A%";

/*. 14. Find all customers whose first name ends with "a".*/
SELECT  customer_id, first_name, last_name, email FROM customer
WHERE last_name LIKE "%a";

/* 15. Display the list of first 4 cities which start and end with ‘a’  */
SELECT * FROM city
WHERE city LIKE "A%a";

/* 16. Find all customers whose first name have "NI" in any position. */
SELECT customer_id, first_name, last_name, email FROM customer
WHERE first_name LIKE "%NI%";

/* 17. Find all customers whose first name have "r" in the second position . */
SELECT customer_id, first_name, last_name, email FROM customer
WHERE first_name LIKE "_r%";

/* 18. Find all customers whose first name starts with "a" and are at least 5 characters in length. */
SELECT customer_id, first_name, last_name, email FROM customer
WHERE first_name LIKE "A____";

/* 19. Find all customers whose first name starts with "a" and ends with "o". */
SELECT * FROM customer
WHERE first_name LIKE "A%O";

/* 20. Get the films with pg and pg-13 rating using IN operator. */
SELECT film_id, title, rating FROM film
WHERE rating IN("PG","PG-13");

/* 21. Get the films with length between 50 to 100 using between operator. */
SELECT film_id, title, length FROM film
WHERE length BETWEEN 50 AND 100;

/* 22. Get the top 50 actors using limit operator. */
SELECT * FROM actor
LIMIT 50;

/* 23. Get the distinct film ids from inventory table. */
SELECT DISTINCT(film_id) FROM inventory;