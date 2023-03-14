USE sakila;
#1-List the number of films per category.
SELECT COUNT(*) num_of_films, category_id FROM film_category
GROUP By category_id;


#2-Display the first and the last names, as well as the address, of each staff member.
SELECT staff.first_name, staff.last_name, address.address
FROM address
INNER JOIN staff on address.address_id = staff.address_id;

#3-Display the total amount rung up by each staff member in August 2005.
SELECT SUM(amount) total_amount, staff.first_name, staff.last_name
FROM staff
INNER JOIN payment ON staff.staff_id = payment.staff_id
WHERE payment_date >= '2005-08-01' AND payment.payment_date < '2005-09-01'
GROUP BY staff.staff_id;

#4-List all films and the number of actors who are listed for each film.
SELECT film.title, COUNT(actor_id) num_of_actors FROM film
INNER JOIN film_actor ON film.film_id = film_actor.film_id
GROUP BY film.title;

#5-Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
SELECT SUM(amount) AS 'total_amount', customer.last_name
FROM payment
INNER JOIN customer ON payment.customer_id = customer.customer_id
GROUP BY customer.last_name
ORDER BY customer.last_name ASC;