# 1. Need full data of the tables?
select * from spinny;

# 2. What are the values of the prices, make, emi, kms?
select count(Make), sum(Price), avg(EMI_per_Month), avg(KMS_Driven) from spinny;

# 3. How many unique values are there is make?
select distinct(Make) from spinny;

# 4. How many fuel types are there?
select distinct(FuelType) from spinny;

# 5. Calculate Average EMI per year?
select avg(EMI_Per_Month)*12 as EMI_Per_Year from spinny;

# 6. What is the average price of fuel type?
select FuelType, avg(Price) as Avg_price_car from spinny
where FuelType in ('petrol', 'diesel', 'petrol+cng')
group by FuelType;

# 7. What is the average price of cars grouped by transmission type (Manual vs Automatic)?
select Transmission, avg(Price) as Avg_Price_car_by_Transmission from spinny
where Transmission in ('manual', 'automatic')
group by Transmission;

# 8. What is the average emi per month of cars grouped by transmission type (Manual vs Automatic)?
select Transmission, avg(EMI_per_Month) as Avg_Emi_Per_Month from spinny
where Transmission in ('manual', 'automatic')
group by Transmission;

# 9. What is the average kms driven of cars grouped by transmission type (Manual vs Automatic)?
select Transmission, avg(KMS_Driven) as Avg_KMS_Driven from spinny
where Transmission in ('manual', 'automatic')
group by Transmission;

# 10. What is the average kms driven, avg price, avg emi per month of cars grouped by transmission type (Manual vs Automatic)?
select Transmission, avg(Price) as Avg_Price_car_by_Transmission, 
avg(EMI_per_Month) as Avg_EMI_Per_Month, avg(KMS_Driven) as Avg_KMS_Driven from spinny
where Transmission in ('manual', 'automatic')
group by Transmission;

# 11. Which car make has the highest number of listings?
select Make, COUNT(*) as total_make from spinny
group by Make
order by total_make desc;

# 12. Which car make and model has the highest number of listings?
select Make, COUNT(*) as total_make, Model, count(*) as total_models from spinny
group by Make, Model
order by total_make desc;

# 13. Which car model has the highest average price among automatic transmissions?
select Model, format(avg(price),2) as avg_price_per_model from spinny
where Transmission in ('automatic')
group by Model;

# 14. Find out how many cars have been driven less than 30,000 KMS and are priced below ₹5 lakhs?
select Model, count(*) as total_count from spinny
where KMS_Driven<30000 and Price<500000
group by Model
order by total_count desc;

#15. What is the average KMS driven for each fuel type?
select FuelType, format(avg(KMS_Driven),0) as Avg_KMS_Driven from spinny
group by FuelType
order by Avg_KMS_Driven desc;

# 16. How many petrol and diesel cars are listed?
select FuelType, count(*) as count_of_fuel_type from spinny
group by FuelType;

# 17. What is the average price and total count of cars by location and fuel type?
select Location, format(avg(Price),2) as Avg_Price, count(Model) as Total_Models
from spinny where FuelType in ('petrol', 'diesel')
group by Location
order by Avg_Price desc;

# 18. Find the top 5 most expensive cars in the dataset.
select distinct(Make), Variant, Price from spinny
order by price desc limit 5;

# 19. Which year model cars are highest?
select Year, count(*) as total_count from spinny
group by Year
order by total_count desc;

# 20. Which cars in Hyderabad have an EMI less than ₹6,000?
select Location, Model from spinny
where EMI_per_Month<6000;

# 21. How many cars are available from each brand that offer manual transmission?
select Make, count(Make) as count_of_manual_transmission from spinny
where Transmission in ('manual')
group by Make;

# 22. Which fuel type has the highest average EMI?
select FuelType, format(avg(EMI_per_Month),2) as avg_emi_month from spinny
group by FuelType;

# 23. Rank car models by the number of listings in descending order?
select Make, Model, rank() over(order by Price) from spinny;

# 24. Find how many unique car variants are available for each make?
select Make, count(distinct Variant) as variant from spinny
group by Make;

# 25. Find all cars listed with KMS_Driven greater than 1 Lakh.
select Model from spinny
where KMS_Driven>100000;



