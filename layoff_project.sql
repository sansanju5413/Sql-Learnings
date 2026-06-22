/* =====================================================
   DATA CLEANING & EXPLORATORY DATA ANALYSIS
   GLOBAL LAYOFFS DATASET (SQL PROJECT)
   =====================================================

   Skills Demonstrated:
   • Data Cleaning
   • Duplicate Removal
   • Data Standardization
   • Null Handling
   • Exploratory Data Analysis
   • CTEs
   • Window Functions
   • Ranking Functions

===================================================== */

/* 1. IDENTIFY DUPLICATES */

WITH duplicate_cte AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY company,
                            location,
                            total_laid_off,
                            `date`,
                            percentage_laid_off,
                            industry,
                            stage,
                            funds_raised,
                            country
           ) AS row_num
    FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

/* 2. STANDARDIZE DATA */

/* Remove extra spaces */

UPDATE layoffs_staging2
SET company = TRIM(company);

/* Standardize Country Names */

UPDATE layoffs_staging2
SET country = 'UAE'
WHERE country LIKE 'United Arab Emirates%';

/* Convert Date Format */

UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

/* MONTHLY LAYOFF TREND */

WITH cte AS (
    SELECT SUBSTRING(`date`,1,7) AS month,
           SUM(total_laid_off) AS total_layoffs
    FROM layoffs_staging2
    GROUP BY month
)
SELECT month,
       total_layoffs,
       SUM(total_layoffs) OVER(
           ORDER BY month
       ) AS rolling_total
FROM cte;

/* TOP 5 COMPANIES WITH HIGHEST LAYOFFS EACH YEAR */

WITH cte AS (
    SELECT company,
           YEAR(`date`) AS year,
           SUM(total_laid_off) AS total_laid_off
    FROM layoffs_staging2
    GROUP BY company, YEAR(`date`)
),
company_ranking AS (
    SELECT *,
           DENSE_RANK() OVER(
               PARTITION BY year
               ORDER BY total_laid_off DESC
           ) AS ranking
    FROM cte
)
SELECT *
FROM company_ranking
WHERE ranking <= 5;

SELECT country,
SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
GROUP BY country
ORDER BY total_layoffs DESC;














