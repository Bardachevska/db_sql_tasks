-- Запрос на выборку всех фильмов
SELECT title, duration, category
FROM films;

-- Запрос на фильмы, арендованные определённым клиентом
SELECT f.title, r.rental_date
FROM rentals r
JOIN films f ON r.film_id = f.id
WHERE r.client_id = (SELECT id FROM clients WHERE name = 'Alice Cooper');

-- Запрос на популярные фильмы
SELECT f.title, COUNT(r.id) AS rental_count
FROM films f
LEFT JOIN rentals r ON f.id = r.film_id
GROUP BY f.id
ORDER BY rental_count DESC
LIMIT 5;

-- Запрос на добавление нового клиента
INSERT INTO clients (name, address, city)
VALUES ('Alice Cooper', '123 Main St', 'San Francisco');

-- Запрос на обновление адреса клиента
UPDATE clients
SET address = '456 Elm St'
WHERE name = 'Alice Cooper';

-- Запрос на удаление клиента
DELETE FROM clients
WHERE name = 'Alice Cooper';

