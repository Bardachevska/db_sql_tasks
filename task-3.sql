SELECT 
    c.name AS category_name, 
    COUNT(f.film_id) AS film_count
FROM 
    film_category fc
  JOIN 
    category c ON fc.category_id = c.category_id
  JOIN 
    film f ON fc.film_id = f.film_id
GROUP BY 
    c.name;

SELECT 
    c.name AS category_name, 
    AVG(f.length) AS avg_film_length
FROM 
    film_category fc
  JOIN 
    category c ON fc.category_id = c.category_id
  JOIN 
    film f ON fc.film_id = f.film_id
GROUP BY 
    c.name;

SELECT 
    MIN(f.length) AS min_film_length, 
    MAX(f.length) AS max_film_length
FROM 
    film f;

SELECT 
    COUNT(*) AS total_customers
FROM 
    customer;

SELECT 
    c.first_name || ' ' || c.last_name AS customer_name,
    SUM(p.amount) AS total_payments
FROM 
    customer c
  JOIN 
    payment p ON c.customer_id = p.customer_id
GROUP BY 
    c.first_name, c.last_name;

SELECT 
    c.first_name || ' ' || c.last_name AS customer_name,
    SUM(p.amount) AS total_payments
FROM 
    customer c
  JOIN 
    payment p ON c.customer_id = p.customer_id
GROUP BY 
    c.first_name, c.last_name
ORDER BY 
    total_payments DESC
LIMIT 5;

SELECT 
    c.first_name || ' ' || c.last_name AS customer_name,
    COUNT(r.rental_id) AS total_rentals
FROM 
    customer c
  JOIN 
    rental r ON c.customer_id = r.customer_id
GROUP BY 
    c.first_name, c.last_name;

SELECT 
    AVG(EXTRACT(YEAR FROM CURRENT_DATE) - f.release_year) AS average_film_age
FROM 
    film f;

SELECT f.title, COUNT(*) AS rented_films_count
FROM rental r
  JOIN inventory i ON r.inventory_id = i.inventory_id
  JOIN film f ON i.film_id = f.film_id
WHERE rental_period && tsrange('2005-05-30', '2005-06-01')
GROUP BY f.title;

SELECT 
    DATE_TRUNC('month', payment_date) AS month, 
    SUM(amount) AS total_payment
FROM payment
GROUP BY month
ORDER BY month;

SELECT 
    customer_id, 
    MAX(amount) AS max_payment
FROM payment
GROUP BY customer_id
ORDER BY max_payment DESC;

SELECT 
    c.first_name, 
    c.last_name, 
    AVG(p.amount) AS average_payment
FROM payment p
  JOIN customer c ON p.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY average_payment DESC;

SELECT rating, COUNT(*) AS film_count
FROM film
GROUP BY rating;

SELECT s.store_id, AVG(p.amount) AS average_payment
FROM payment p
JOIN staff s ON p.staff_id = s.staff_id
GROUP BY s.store_id;
