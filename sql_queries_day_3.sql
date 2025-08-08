#1. Find the average ride distance for each vehicle type:
create view uber.Ride_distance_for_each_type_of_vehicle as
select `Vehicle Type`, avg(`Ride Distance`) as avg_ride_distance
from uber.bookings
group by `Vehicle Type`;


#2. List the top 5 customers who booked the highest number of rides
create view uber.Top_Customers_With_Highest_Ride_Count as
SELECT `Customer ID`, total_rides
FROM (
    SELECT `Customer ID`, COUNT(`Booking ID`) AS total_rides
    FROM uber.bookings
    GROUP BY `Customer ID`
    ORDER BY total_rides DESC 
	LIMIT 5
) AS ride_counts;

#3. Find the maximum and minimum driver  ratings for Prime Sedan bookings
create view uber.max_min_driver_ratings as
select max(`Driver Ratings`), min(`Driver Ratings`)
from uber.bookings
where `Vehicle Type` = 'Prime Sedan';

#4. Retrieve all high-value rides (above ₹1000) along with the average ride distance and average customer rating for each vehicle type.
create view uber.vehicle_type_wise_distance_and_rating as
select `Vehicle Type`,
   avg(`Ride Distance`) as avg_distance,
   avg(`Customer Rating`) as avg_customer_rating
from uber.bookings
where `Booking Value` > 1000
group by `Vehicle Type`;


#5. Calculate the total booking value of rides completed successfully
create view uber.total_booking_value as
select sum(`Booking Value`) as total_booking_value
from uber.bookings
where `Booking Status` = 'Success';