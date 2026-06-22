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