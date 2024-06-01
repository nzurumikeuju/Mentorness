SELECT * FROM hotel_db.hotel;
#****************************************************************
#QUES 1: What is the total number of reservations in the dataset?
SELECT count(Booking_ID) AS Total_Reservation 
FROM hotel_db.hotel;


#****************************************************************
#QUES2: Which meal plan is the most popular among guests?
SELECT type_of_meal_plan AS Most_Popular_meal_plan, COUNT(type_of_meal_plan) AS Orders
FROM hotel_db.hotel
GROUP BY type_of_meal_plan
ORDER BY COUNT(type_of_meal_plan) DESC
LIMIT 1;


#*****************************************************************
#QUES 3: What is the average price per room for reservations involving children? 
SELECT AVG(avg_price_per_room) AS AVG_children_Room_Price
FROM hotel_db.hotel
WHERE no_of_children  > 0;


#********************************************************************************************
#QUES 4: How many reservations were made for the year 2018?
SELECT COUNT(*) AS Reservations_in_2018
FROM hotel_db.hotel
WHERE YEAR(arrival_date) = "2018";


#*****************************************************************
#QUES 5.What is the most commonly booked room type?
SELECT room_type_reserved AS Most_booked_room_type, COUNT(room_type_reserved) AS Bookings
FROM hotel_db.hotel
GROUP BY room_type_reserved
ORDER BY COUNT(room_type_reserved) DESC
LIMIT 1;


#*****************************************************************
#QUES 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)
SELECT COUNT(*)
FROM hotel_db.hotel
WHERE no_of_weekend_nights > 0;


#*****************************************************************
#QUES 7. What is the highest and lowest lead time for reservations? 
SELECT MAX(lead_time) AS Highest_Lead_Time,  MIN(lead_time) AS Lowest_Lead_Time
FROM hotel_db.hotel;


#*****************************************************************
#QUES 8. What is the most common market segment type for reservations? 
SELECT market_segment_type AS Most_common_market_segment, COUNT(market_segment_type) AS Bookings
FROM hotel_db.hotel
GROUP BY market_segment_type
ORDER BY COUNT(market_segment_type) DESC
LIMIT 1;


#*****************************************************************
#QUES 9. How many reservations have a booking status of "Confirmed"? 
SELECT COUNT(*)
FROM hotel_db.hotel
WHERE booking_status = "Confirmed";


#*****************************************************************
#QUES 10.What is the total number of adults and children across all reservations
SELECT  SUM(no_of_adults) as Total_Adults, SUM(no_of_children) AS Total_Children
FROM hotel_db.hotel;


#*****************************************************************
#QUES 11. What is the average number of weekend nights for reservations involving children? 
SELECT AVG(no_of_weekend_nights) 
FROM hotel_db.hotel
WHERE no_of_children > 0;


#*****************************************************************
#12. How many reservations were made in each month of the year? 
SELECT MONTHNAME(arrival_date) AS Month, COUNT(Booking_ID) 
FROM hotel_db.hotel
GROUP BY MONTHNAME(arrival_date)
ORDER BY MONTH(arrival_date) ASC;


#***********************************************************************************************************
#QUES 13 What is the average number of nights (both weekend and weekday) spent by guests for each room type? 
SELECT room_type_reserved, 
       AVG(no_of_weekend_nights + no_of_week_nights) as Avg_Total_Nights
FROM hotel_db.hotel
GROUP BY room_type_reserved
ORDER BY Avg_Total_Nights DESC;


#*********************************************************************************************
#QUES 14. For reservations involving children, what is the most 
#common room type, and what is the average price for that room type? 
SELECT room_type_reserved,
	COUNT(room_type_reserved) AS Reservations, 
	ROUND(AVG(avg_price_per_room),2) AS Average_Price
FROM hotel_db.hotel 
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY Reservations DESC
LIMIT 1;


#**************************************************************************************
#QUES 15. Find the market segment type that generates the highest average price per room. 
SELECT market_segment_type, ROUND(AVG(avg_price_per_room),2) AS Avg_Price
FROM hotel_db.hotel
GROUP BY market_segment_type
ORDER BY Avg_Price DESC
LIMIT 1;