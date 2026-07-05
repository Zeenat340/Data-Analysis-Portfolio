# SQL Projects

## Netflix Titles Analysis
- **Tool:** MySQL
- **Dataset:** Netflix Titles (Kaggle)
- **Skills demonstrated:** SELECT, WHERE, GROUP BY, HAVING, ORDER BY, 
  JOINs, Subqueries, CTEs, Window Functions, Stored Procedures

### Key Queries and Insights
- Identified that the United States dominates Netflix content production
- TV-MA is the most common rating showing Netflix targets adult audiences
- Used window functions to rank content by country and release year
- Used CTEs and subqueries for complex multi-step analysis

## Layoffs Data Cleaning
- **Tool:** MySQL
- **Dataset:** Layoffs Dataset (Alex the Analyst GitHub)
- **Skills demonstrated:** Data cleaning, removing duplicates, 
  standardizing data, handling NULL values, CTEs

### Cleaning Steps
- Removed duplicate rows using ROW_NUMBER window function
- Standardized inconsistent text values in industry and country columns
- Converted date column from text to proper DATE format
- Handled NULL values by populating from matching company records
- Removed rows where both total_laid_off and percentage_laid_off were NULL
