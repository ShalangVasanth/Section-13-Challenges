USE cinema_booking_system;

SELECT * FROM films;

SELECT name, length_min FROM films
WHERE length_min > 120;

SELECT * FROM screenings;

SELECT f.name, COUNT(s.film_id) AS showings FROM screenings s
JOIN films f ON f.id = s.film_id
GROUP BY film_id
ORDER BY showings DESC
LIMIT 1;

SELECT COUNT(*) AS no_bookings FROM bookings
WHERE screening_id IN
(SELECT id FROM screenings
WHERE film_id = 5);

SELECT c.first_name, c.last_name, COUNT(b.id) AS no_bookings FROM bookings b
JOIN customers c ON c.id  = b.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY no_bookings DESC
LIMIT 5;

SELECT * FROM films;
SELECT * FROM rooms;
SELECT * FROM screenings;

SELECT f.name, COUNT(r.name) AS no_screenings FROM films f
JOIN screenings s ON f.id = s.film_id
JOIN rooms r ON r.id = s.room_id
WHERE r.id = 1
GROUP BY f.name
ORDER BY no_screenings DESC
LIMIT 1;

SELECT COUNT(*) FROM customers;

SELECT * FROM bookings;

SELECT COUNT(DISTINCT (customer_id)) AS no_of_customers FROM bookings;