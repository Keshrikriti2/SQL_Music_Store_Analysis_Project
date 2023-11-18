/*	Question Set 1 - Easy */

/* Q1: Who is the senior most employee based on job title? */
SELECT * FROM employee
ORDER BY levels DESC LIMIT 1

/* Q2: Which countries have the most Invoices? */
SELECT COUNT(*) AS number_of_invoice, billing_country
FROM invoice GROUP BY billing_country ORDER BY number_of_invoice DESC 

/* Q3: What are top 3 values of total invoice? */
SELECT * FROM invoice
ORDER BY total DESC LIMIT 3

/* Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals. 
Return both the city name & sum of all invoice totals */
SELECT billing_city, SUM(total) AS sum_of_invoice_totals
FROM invoice
GROUP BY billing_city 
ORDER BY sum_of_invoice_totals DESC LIMIT 1

/* Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money.*/
SELECT SUM(i.total) AS invoice_total, c.first_name,c.last_name 
FROM customer c 
JOIN invoice i ON c.customer_id=i.customer_id
GROUP BY c. customer_id
ORDER BY invoice_total DESC LIMIT 1

/* Question Set 2 - Moderate */

/* Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A. */
SELECT DISTINCT email,first_name, last_name
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoiceline ON invoice.invoice_id = invoiceline.invoice_id
WHERE track_id IN(
	SELECT track_id FROM track
	JOIN genre ON track.genre_id = genre.genre_id
	WHERE genre.name LIKE 'Rock'
)
ORDER BY email;

/* Q2: Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands. */
SELECT ar.artist_id,ar.name,COUNT(ar.artist_id) AS number_of_songs
FROM track t
JOIN album album ON t.album_id=album.album_id
JOIN artist ar ON ar.artist_id=album.artist_id
JOIN genre g ON g.genre_id=t.genre_id
WHERE g.name LIKE 'Rock'
GROUP BY ar.artist_id
ORDER BY number_of_songs LIMIT 10

/* Q3: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */
SELECT name,miliseconds
FROM track
WHERE miliseconds > (
	SELECT AVG(miliseconds) AS avg_track_length
	FROM track )
ORDER BY miliseconds DESC;




























































