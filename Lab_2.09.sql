USE sakila;

-- 1.  How many distinct (different) actors' last names are there?
SELECT count(distinct last_name) from actor;

-- 2.  Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *,
case when dayname(rental_date) in ('Saturday', 'Sunday') then 'weekend'
else 'workday'
end as day_type
from rental;

-- 3.  Get all films with ARMAGEDDON in the title.
SELECT *  
from film 
where title like '%ARMAGEDDON%'; 

-- 4.  Get 10 the longest films.
SELECT title, length FROM film 
order by length DESC
LIMIT 10; 

-- 5.  How many films include Behind the Scenes content?
SELECT count(*)
FROM film
where special_features like '%behind the scenes%';

-- 6.  Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating, round(avg(length),2)
FROM film
GROUP BY rating
HAVING round(avg(length),2)>120;

-- 7.  Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
SELECT title, length,
(case when length is not null or 0 then
rank() over (order by length) else null end) length_rank
FROM film;