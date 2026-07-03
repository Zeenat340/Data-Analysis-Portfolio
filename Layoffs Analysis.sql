select *
FROM layoffs;
-- duplicate the dataset

CREATE TABLE layoffs_raw3
LIKE layoffs;

-- check the new table
SELECT  *
FROM layoffs_raw3;

-- INSErt data into the table
INSERT layoffs_raw3
SELECT *
FROM layoffs;

-- remove duplicates from the table (to do this, create a row num column with window function to see the duplicates)

SELECT *,
ROW_Number() OVER(PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) AS row_num1
FROM layoffs_raw3;

-- to see the duplicates, lets use cte
WITH duplicate_cte1 AS
( 
SELECT *,
ROW_Number() OVER(PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) AS row_num1
FROM layoffs_raw3)
SELECT *
FROM duplicate_cte1
WHERE row_num1 > 1;

-- the above are the duplicates
select *
FROM layoffs_raw3
WHERE company like 'better%';

-- this is how to delete the duplicates, create another table since you cant delete from a cte. 

CREATE TABLE `layoffs_raw4` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE layoffs_raw4
ADD COLUMN row_num1 INT;


select *
from layoffs_raw4;

-- insert data into the new table
INSERT INTO layoffs_raw4
SELECT *,
ROW_Number() OVER(PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) AS row_num1
FROM layoffs_raw3;

select *
from layoffs_raw4
WHERE row_num1 > 1;

-- delete the duplicates
DELETE
FROM layoffs_raw4
WHERE row_num1 > 1;

-- check to see if it's truly deleted

select *
from layoffs_raw4;


-- standardize the data (finding things that are wrong with the dta and fixing it)

select country
FROM layoffs_raw4;

-- this si to remove the space between the country letters and others
SELECT company, TRIM(company)
FROM layoffs_raw4
order by 1;

UPDATE layoffs_raw4
SET company = TRIM(company);

SELECT location, TRIM(location)
FROM layoffs_raw4
order by 1;

UPDATE layoffs_raw4
SET location = TRIM(location);

SELECT industry, TRIM(industry)
FROM layoffs_raw4
order by 1;

UPDATE layoffs_raw4
SET industry = TRIM(industry);

-- lets check each columns to see if there are balnk values or null

SELECT distinct company
FROM layoffs_raw4
ORDER BY 1;

SELECT distinct location
FROM layoffs_raw4
ORDER BY 1;

select distinct country
FROM layoffs_raw4
ORDER BY 1;

SELECT distinct industry
FROM layoffs_raw4
ORDER BY 1;


-- only industry ahs blank values and some issues

SELECT industry
from layoffs_raw4
where industry LIKE 'crypto%';

UPDATE layoffs_raw4
SET industry = 'crypto'
WHERE industry LIKE 'Crypto%';

-- remove a period from the country letters

SELECT distinct COUNTRY, trim(TRAILING '.' FROM country)
FROM layoffs_raw2
ORDER BY 1;

update layoffs_raw4
SET country = trim(TRAILING '.' FROM country)
WHERE country LIKE 'United%';




