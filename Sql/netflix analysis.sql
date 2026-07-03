SELECT *
FROM netflix_titles;

-- How many unique countries does Netflix have content from?
-- Are there any duplicate titles in this data?

-- answer
SELECT COUNT(DISTINCT country)
FROM netflix_titles;

SELECT DISTINCT title
FROM netflix_titles;

SELECT COUNT(DISTINCT title)
FROM netflix_titles;


-- where clause
-- How many titles are only Movies?
-- What TV shows was added specifically in 2020?
-- Which titles are only from Nigeria?
-- What shows are rated specifically TV-MA?

-- How many titles are only Movies?
SELECT *
FROM netflix_titles
WHERE type = 'Movie';

SELECT COUNT(*) total_movies
FROM netflix_titles
WHERE type = 'Movie';

-- What TV shows was added specifically in 2021?

SELECT title
From netflix_titles
WHERE type = 'TV show'
AND date_added LIKE '%2021%';


SELECT title
From netflix_titles
WHERE type = 'TV show'
AND date_added LIKE '%2021%';

SELECT title
From netflix_titles
WHERE type = 'TV show'
AND release_year LIKE '2020';

-- Which titles are only from Nigeria?

SELECT title
FROM netflix_titles
WHERE country = 'Nigeria';

 SELECT title
FROM netflix_titles
WHERE country LIKE 'United %';

-- What shows are rated specifically TV-MA?

SELECT title
FROM netflix_titles
WHERE rating = 'TV-MA';

SELECT *
FROM netflix_titles
WHERE rating = 'TV-MA';

-- What movies were added in 2019?

SELECT title
FROM netflix_titles
WHERE type = 'MOVIE' 
AND release_year ='2019';

SELECT title
FROM netflix_titles
WHERE type = 'MOVIE' 
AND release_year > '2019'
AND country = 'Nigeria';

SELECT *
FROM netflix_titles;

-- What Movies from the United States are rated TV-MA?

Select title
FROM netflix_titles
WHERE type = 'Movie'
AND country = 'United States'
AND rating = 'TV-MA';

Select title
FROM netflix_titles
WHERE type = 'Movie'
AND country = 'United States'
AND rating = 'PG-13';

 -- What TV Shows is from Nigeria or Ghana?
 
 Select title
 FROM netflix_titles
 WHERE type = 'TV Shows' 
 AND country = 'Nigeria' OR 'Ghana';
 
 Select title, duration, country, rating
 FROM netflix_titles
 where (duration > '60 min' AND country = 'United Kingdom')
 OR country = 'United States';
 
 select title
 FROM netflix_titles
 where type = 'TV Show' AND date_added LIKE '%2021';
 
  select title
 FROM netflix_titles
 where type = 'TV Show' AND date_added LIKE '%2021' or '%2020';
 
 select title
 FROM netflix_titles
 where type = 'Movie' AND date_added LIKE '2020';
 
 Select title
 From netflix_titles
 where duration > '60 min';
 
  Select title, country, director, duration
 From netflix_titles
 where duration > '60 min';
 
 -- ORDERY BY
 
 select *
 FROM netflix_titles;
 
 -- For each type of content (Movie vs TV Show), how many release years are recorded, what is the average duration, and what is the highest show ID?
 select COUNT(release_year), AVG(duration), MAX(show_id), type
 From netflix_titles
 GROUP BY type;
 
 SELECT *
 FROM netflix_titles
 ORDER BY duration ASC, release_year DESC;
 
 -- What are the most recently released titles?
 
 select title
 FROM netflix_titles
 ORDER BY release_year ASC;
 
 -- how many are they?
 select COUNT(title)
 FROM netflix_titles
 ORDER BY release_year ASC;
 
 -- Which countries have more than 100 titles on Netflix, and who has the most?"
 
 SELECT COUNT(title), country
 FROM netflix_titles
 GROUP BY country;
 
 SELECT COUNT(country) AS total, country
 FROM netflix_titles
 GROUP BY country
 having total < 20;
 
 SELECT *
 FROM netflix_titles
 ORDER BY release_year ASC
 LIMIT 3;
 
 SELECT DISTINCT release_year, title
FROM netflix_titles
ORDER BY release_year ASC
LIMIT 5;

-- GROUP BY
-- How many titles does each country have?

Select country, COUNT(title)
FROM Netflix_titles
group by country;

-- How many titles fall under each rating?

select rating, count(*)
FROM netflix_titles
GROUP BY rating;

select rating, count(title)
FROM netflix_titles
GROUP BY rating;

-- How many Movies vs TV Shows are on Netflix?
 
SELECT type, COUNT(*) AS total
FROM netflix_titles
GROUP BY type;

SELECT type, COUNT(type) total
FROM netflix_titles
GROUP BY type;
 
-- HAVING
-- Which countries have more than 50 titles?
select country, COUNT(title) total
from netflix_titles
GROUP BY country
Having total > 50;

-- Which countries have less than 50 titles?
select country, COUNT(title) total
from netflix_titles
GROUP BY country
Having total < 50;

-- Which ratings have less than 100 titles?
SELECT rating, COUNT(*) total
FROM netflix_titles
GROUP BY rating
HAVING total < 100;

-- Which directors have more than 3 titles?
select director, count(*) total
FROM netflix_titles
GROUP BY director
HAVING total > 3;

 -- order by
 -- What are the 10 most recently released titles?
 
SELECT *
FROM netflix_titles
ORDER BY release_year desc LIMIT 10;

SELECT title, release_year
FROM netflix_titles
ORDER BY release_year desc LIMIT 10;

 -- Which country has the most titles? (combine with GROUP BY)
 SELECT COUNT(*) total, country
 FROM netflix_titles
 GROUP BY country
 ORDER BY total desc;
 
 SELECT COUNT(*) total, country
 FROM netflix_titles
 GROUP BY country
 ORDER BY total desc
 LIMIT 1;
 
-- Show all titles alphabetically from A to Z
select title
FROM netflix_titles
ORDER BY title;

-- LIMIT
 -- What are the top 5 countries with the most content?
SELECT country, COUNT(*) total
FROM netflix_titles
GROUP BY country
ORDER BY total DESC
LIMIT 5;

-- Show only the 4th and 5th most recent titles
SELECT title, release_year
FROM netflix_titles
order by release_year desc
LIMIT 3,2;

-- What is the single oldest title on Netflix?
select title, release_year
FROM netflix_titles
order by release_year asc
LIMIT 1;

SELECT title, release_year, country
FROM netflix_titles
ORDER BY release_year ASC
LIMIT 5;

-- UNION
SELECT *
FROM netflix_titles;

SELECT director, country
FROM netflix_titles
UNION
SELECT type, title
FROM netflix_titles
LIMIT 15;

SELECT release_year, title
FROM netflix_titles
UNION distinct
SELECT type, country
FROM netflix_titles;

SELECT release_year, title
FROM netflix_titles
UNION all
SELECT type, country
FROM netflix_titles;


-- Show all titles from Nigeria and Ghana in one list
SELECT country, title
FROM netflix_titles	
WHERE country = 'Nigeria'
UNION
SELECT country, title
FROM netflix_titles
WHERE country = 'ghana';

-- Show all Movies released after 2015 and TV Shows added in 2020 in one list
SELECT title, release_year, type
FROM Netflix_titles
WHERE type = 'Movie' and release_year > 2015
UNION 
Select title, release_year, type
FROM netflix_titles
WHERE type = 'TV Show' AND date_added LIKE '%2020%';

-- Show titles from the United States and United Kingdom combined
SELECT title, country
FROM netflix_titles
WHERE country = 'United States'
UNION
Select title, country
FROM netflix_titles
WHERE country = 'United Kingdom'
ORDER BY title, country;

 SELECT title, country
FROM netflix_titles
WHERE country = 'United States'
UNION
Select title, country
FROM netflix_titles
WHERE country = 'United Kingdom';

-- string functions

select length ('DIRECTOR');

select title, length (title)
FROM netflix_titles;

select title, length (title)
FROM netflix_titles
ORDER BY 2;

-- Which Netflix title has the longest name?
select title, length (title)
FROM netflix_titles
ORDER BY length(title) DESC;

select title, length (title)
FROM netflix_titles
ORDER BY length(title) DESC
LIMIT 1;

SELECT title, UPPER(title)
FROM netflix_titles;

SELECT TRIM(title)
FROM netflix_titles;

-- substring
-- Show the first 3 characters of every title
select title, SUBSTR(title, 1, 3)
From netflix_titles;

-- Show the first 4 characters of every country
select country, SUBSTR(country, 1, 4)
FROM netflix_titles;

-- Extract only the year from the date_added column (hint: the year is the last 4 characters)
select date_added, RIGHT(date_added, 4)
FROM netflix_titles;

-- CONCAT
-- Combine title and country into one column like "Jaws - United States"
SELECT title, country,
CONCAT(title, ' ', country)
FROM netflix_titles;

-- Combine title and release_year like "Jaws (1975)"
SELECT title, release_year,
CONCAT(title, ' ', release_year)
FROM netflix_titles;

-- Combine type and rating like "Movie | TV-MA"
SELECT type, rating,
CONCAT(type, ' ', rating)
FROM netflix_titles;

-- replace
-- Replace "Movie" with "Film" in the type column

select type, country,title,
REPLACE (type, 'Movie', 'FILM') new_type
FROM netflix_titles
LIMIT 20;

-- Replace "United States" with "USA" in the country column
SELECT country,
REPLACE(country,'United States', 'USA')
From netflix_titles;

-- Replace "TV Show" with "Series" in the type column
select type, country,title,
REPLACE (type, 'TV Show', 'Series') new_type
FROM netflix_titles
LIMIT 20;

SELECT release_year,
LOCATE ('2021', release_year)
FROM netflix_titles;

-- locate
-- At what position does the letter "a" appear in each title?
SELECT title,
LOCATE ('a', title)
FROM netflix_titles;

-- Which titles contain the word "Love" and at what position does it appear?
SELECT title,
LOCATE ('Love', title)
FROM netflix_titles;

-- Which titles do NOT contain the word "The"? (hint: LOCATE returns 0 when not found)
SELECT TITLE,
LOCATE ('The' , title)
FROM netflix_titles
ORDER BY LOCATE ('The' , title) ASC;

-- Which titles do NOT contain the word "The"? (hint: LOCATE returns 0 when not found)
SELECT TITLE,
LOCATE ('The' , title)
FROM netflix_titles
WHERE LOCATE ('The' , title) = 0;

-- at what position does the word "United" appear in the country column?
Select country,
LOCATE('United', country)
FROM netflix_titles
WHERE LOCATE('United', country) > 0 ;

-- Which directors have a space in their name and at what position is it?
SELECT director,
locate(' ', director)
FROM netflix_titles
WHERE locate(' ', director) > 0;

-- case statements
SELECT title,
release_year, 
CASE
 WHEN type = 'MOVIE' THEN 'Film'
 END
 FROM netflix_titles;

-- Label each title as "Old" if released before 2000 and "New" if released after
SELECT title,
CASE
 WHEN release_year < 2000 THEN 'OLD'
 WHEN release_year > 2000 THEN 'New'
 ELSE 'Unknown'
 END age_category
 FROM netflix_titles;

-- Label ratings as "Kids" for G and TV-G, "Family" for PG and TV-PG, and "Mature" for TV-MA
SELECT title, rating,
CASE
  WHEN rating = 'TV-6' OR rating = '6' THEN 'Kids'
  WHEN rating = 'TV-MA' THEN 'Mature'
  WHEN rating = 'PG' OR rating ='TV-PG' THEN 'Family'
  ELSE 'unknown'
 END rating_category
FROM netflix_titles;

-- Label each title as "Short" if duration is less than 90 min, "Medium" if between 90-120, and "Long" if more than 120
SELECT title, duration,
CASE
  WHEN duration < '90 min' THEN 'SHORT'
  WHEN duration > '90 min' OR duration < '120 min' THEN 'Medium'
  WHEN duration > '120 min' THEN 'Long'
   ELSE 'unknown'
END duration_category
FROM netflix_titles;

-- Label countries as "Top Producer" if they have more than 500 titles and "Small Producer" if less
SELECT country, COUNT(title) total,
CASE
 WHEN COUNT(title) > 500 THEN 'Top Producer'
 ELSE 'small producer'
 END producer_category
 FROM netflix_titles
 GROUP BY country
 ORDER BY total DESC;
 
 -- subqueries
 -- Find all titles released in the same year as the oldest title
 SELECT MIN(release_year)
 FROM netflix_titles;
 
SELECT title
FROM netflix_titles
WHERE release_year = 1975;

SELECT title
FROM netflix_titles
WHERE release_year = (SELECT MIN(release_year)
 FROM netflix_titles);
  
  -- Find all titles from the country that has the most movies and TV shows on Netflix
SELECT COUNT(title), country
FROM netflix_titles
WHERE type = 'Movie' OR 'TV shows'
GROUP BY country;


-- Find titles with a rating that appears more than 30 times
 SELECT rating
 FROM netflix_titles
GROUP BY rating
HAVING COUNT(rating) > 30;

SELECT title
FROM netflix_titles
WHERE rating = 'TV-MA';

SELECT title, rating
FROM netflix_titles
WHERE rating = (SELECT rating
 FROM netflix_titles
GROUP BY rating
HAVING COUNT(rating) > 30);

 -- Find all titles from the country that has the most titles on Netflix"
 SELECT country, count(title)
 from netflix_titles
 GROUP BY country
 Order by COUNT(title) desc
 ;
 
 SELECT title, country
 From netflix_titles
 WHERE country = 'United States';
 
 SELECT title, country
 From netflix_titles
 WHERE country = (SELECT COUNT(title), country
 from netflix_titles
 GROUP BY country);
 
 
-- Find titles whose release year is greater than the average release year.
 SELECT AVG(release_year)
 FROm netflix_titles;
 
 SELECT title
 FROM netflix_titles
 WHERE release_year > 2015;
 
 SELECT title, release_year
 FROM netflix_titles
 WHERE release_year > (SELECT AVG(release_year)
 FROm netflix_titles);


 
