/*
1. In the table actor, which are the actors whose last names are not repeated? 
For example if you would sort the data in the table actor by last_name, you would see that 
there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
These three actors have the same last name. So we do not want to include this last name in our output. 
Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
*/
SELECT last_name FROM actor
GROUP BY last_name HAVING count(*) = 1; -- THESE ARE NAMES, WHICH APPEAR MORE THAN ONCE IN THE TABE

/*
2. Which last names appear more than once? 
We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
*/
SELECT last_name FROM actor
GROUP BY last_name HAVING count(*) > 1;

SELECT * FROM ACTOR;  -- THESE ARE NAMES, WHICH APPEAR ONLY ONCE IN THE TABLE
/*
3. Using the rental table, find out how many rentals were processed by each employee.
*/

SELECT staff_id, COUNT(*) AS "Operations per employee"
FROM rental
GROUP BY staff_id; -- staff 1:  8040 and staff 2:8004 operations

/*
4. Using the film table, find out how many films were released each year.
*/
SELECT release_year, COUNT(*) AS "Releases per year"
FROM film 
GROUP BY release_year; -- since every row is connected to id, I use * to count on IDs, all films released in 2006

/*
5. Using the film table, find out for each rating how many films were there.
*/

SELECT rating, COUNT(*) AS "Total Ratigs"
FROM film
GROUP BY rating
ORDER BY COUNT(*) DESC ; -- Total ratings per rating code

/*
6. What is the mean length of the film for each rating type. 
Round off the average lengths to two decimal places. 
*/

-- SELECT AVG (length) AS Mean FROM film; toc heck on the mean

SELECT rating, round(AVG (length), 2) AS MEAN 
FROM film 
GROUP BY rating;  -- Mean lenght with rounded decimals per rating class

/*
7. Which kind of movies (rating) have a mean duration of more than two hours?
*/

SELECT rating, round(AVG (length), 2) AS MEAN 
FROM film 
GROUP BY rating
HAVING MEAN > 120;  -- only one. that has a mean greater 2 h

/*
8. Rank films by length (filter out the rows that have nulls or 0s in length column). 
In your output, only select the columns title, length, and the rank.
*/

SELECT length, title, 
RANK() OVER(ORDER BY length DESC) AS "Rank"
FROM film
WHERE length IS NOT null OR length > 0; -- add rank function and order by lenght of film, there are no films that have an empty field in lentgh or 0 as lenght