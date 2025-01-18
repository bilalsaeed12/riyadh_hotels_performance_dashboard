SELECT * FROM riyadh_hotels

-----Total Bookings
SELECT COUNT(checkIn)
FROM Riyadh_Hotels

-----Total Revenue
SELECT SUM(price)
FROM riyadh_hotels

-----Average Rating
SELECT AVG(rating)
FROM hotels_record

-----Add Total stay duration per booking
ALTER TABLE riyadh_hotels
ADD Duration AS CAST(DATEDIFF(day, checkin, checkout) AS FLOAT)

-----Average stay duration
SELECT AVG(Duration)
FROM riyadh_hotels

----Total Reviews by Hotel
SELECT hotel_name, count as total_reviews
FROM hotels_record
ORDER BY total_reviews desc


-----Top 5 hotel by reviews
SELECT TOP 5 hotel_name,count
FROM hotels_record
ORDER BY count desc

----Average price by rating
SELECT rating, AVG(price) FROM hotels_record INNER JOIN riyadh_hotels
ON hotels_record.hotel_id = riyadh_hotels.hotel_id
GROUP BY rating

----Distribution of bookings by sources
SELECT source,count(*),
count(*)*100/(SELECT COUNT(*) FROM riyadh_hotels) as percentage
FROM riyadh_hotels
GROUP BY source
ORDER BY COUNT(*) desc

----Total Bookings by stay duration
SELECT Duration, COUNT(Duration)
FROM riyadh_hotels
GROUP BY Duration
ORDER BY Duration


---Add month column to count monthly revenue
ALTER TABLE riyadh_hotels
ADD Month as MONTH(checkIn)

-------Revenue based on month
SELECT Month,SUM(Price) as total_revenue
FROM riyadh_hotels
GROUP BY Month

-----Hotels distribution with rating less than 4.0 and vice versa
SELECT 
SUM(CASE WHEN rating < 4.0 THEN 1 ELSE 0 END),
SUM(CASE WHEN rating >= 4.0 THEN 1 ELSE 0 END)
FROM hotels_record

