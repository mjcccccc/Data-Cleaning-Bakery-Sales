/*
	DATA CLEANING PROJECT 

	Using the https://www.kaggle.com/datasets/hosubjeong/bakery-sales
	
	Date: Dec. 18, 2024
*/


/*
	DATABASE SET UP
*/

DROP DATABASE IF EXISTS Bakery_db;
CREATE DATABASE Bakery_db;

USE Bakery_db;

-- Import Data from bakery_sales.csv
SELECT * FROM  Bakery_Sales

/*
	DATA CLEANING
*/
-- Fetch the duplicated rows
WITH CTE AS (
    SELECT 
        *, 
        ROW_NUMBER() OVER (PARTITION BY datetime, day_of_week, total, place, angbutter, 
                                    plain_bread, jam, americano, croissant, caffe_latte, 
                                    tiramisu_croissant, cacao_deep, pain_au_chocolat, 
                                    almond_croissant, croque_monsieur, mad_garlic, milk_tea, 
                                    gateau_chocolat, pandoro, cheese_cake, lemon_ade, 
                                    orange_pound, wiener, vanila_latte, berry_ade, tiramisu, 
                                    merinque_cookies 
                            ORDER BY (SELECT NULL)) AS rn 
    FROM Bakery_Sales
)
SELECT *
FROM CTE
WHERE rn > 1;

-- 1. Deleting Duplicate Rows
WITH CTE AS (
    SELECT 
        *, 
        ROW_NUMBER() OVER (PARTITION BY datetime, day_of_week, total, place, angbutter, 
                                    plain_bread, jam, americano, croissant, caffe_latte, 
                                    tiramisu_croissant, cacao_deep, pain_au_chocolat, 
                                    almond_croissant, croque_monsieur, mad_garlic, milk_tea, 
                                    gateau_chocolat, pandoro, cheese_cake, lemon_ade, 
                                    orange_pound, wiener, vanila_latte, berry_ade, tiramisu, 
                                    merinque_cookies 
                            ORDER BY (SELECT NULL)) AS rn 
    FROM Bakery_Sales
)
DELETE FROM CTE WHERE rn > 1;  

-- Fetch null values in datetime, total
SELECT datetime, count(*) AS count
FROM Bakery_Sales
WHERE datetime IS NULL
GROUP BY datetime

SELECT datetime, day_of_week, count(*) AS count
FROM Bakery_Sales
WHERE day_of_week IS NULL
GROUP BY datetime, day_of_week

SELECT total, count(*) AS count
FROM Bakery_Sales
WHERE total IS NULL
GROUP BY total

-- 2. Deleting null values in datetime, total
DELETE 
FROM Bakery_Sales
WHERE datetime IS NULL

DELETE
FROM Bakery_Sales
WHERE total IS NULL

-- Handling missing values or NULL
SELECT 
	angbutter = COALESCE(angbutter, 0),
    plain_bread = COALESCE(plain_bread, 0),
	jam = COALESCE(jam, 0),
	americano = COALESCE(americano, 0),
	croissant = COALESCE(croissant, 0),
	caffe_latte = COALESCE(caffe_latte, 0),
    tiramisu_croissant = COALESCE(tiramisu_croissant, 0),
	cacao_deep = COALESCE(cacao_deep, 0),
	pain_au_chocolat = COALESCE(pain_au_chocolat, 0),
    almond_croissant = COALESCE(almond_croissant, 0),
	croque_monsieur = COALESCE(croque_monsieur, 0),
	mad_garlic = COALESCE(mad_garlic, 0),
	milk_tea = COALESCE(milk_tea, 0),
    gateau_chocolat = COALESCE(gateau_chocolat, 0),
	pandoro = COALESCE(pandoro, 0), 
	cheese_cake = COALESCE(cheese_cake, 0), 
	lemon_ade = COALESCE(lemon_ade, 0), 
    orange_pound = COALESCE(orange_pound, 0), 
	wiener = COALESCE(wiener, 0),
	vanila_latte = COALESCE(vanila_latte, 0),
	berry_ade = COALESCE(berry_ade, 0),
	tiramisu = COALESCE(tiramisu, 0),
    merinque_cookies = COALESCE(merinque_cookies, 0)
FROM  Bakery_Sales

-- 3. Updating Value for Null Values
UPDATE Bakery_Sales
SET 
	angbutter = COALESCE(angbutter, 0),
    plain_bread = COALESCE(plain_bread, 0),
	jam = COALESCE(jam, 0),
	americano = COALESCE(americano, 0),
	croissant = COALESCE(croissant, 0),
	caffe_latte = COALESCE(caffe_latte, 0),
    tiramisu_croissant = COALESCE(tiramisu_croissant, 0),
	cacao_deep = COALESCE(cacao_deep, 0),
	pain_au_chocolat = COALESCE(pain_au_chocolat, 0),
    almond_croissant = COALESCE(almond_croissant, 0),
	croque_monsieur = COALESCE(croque_monsieur, 0),
	mad_garlic = COALESCE(mad_garlic, 0),
	milk_tea = COALESCE(milk_tea, 0),
    gateau_chocolat = COALESCE(gateau_chocolat, 0),
	pandoro = COALESCE(pandoro, 0), 
	cheese_cake = COALESCE(cheese_cake, 0), 
	lemon_ade = COALESCE(lemon_ade, 0), 
    orange_pound = COALESCE(orange_pound, 0), 
	wiener = COALESCE(wiener, 0),
	vanila_latte = COALESCE(vanila_latte, 0),
	berry_ade = COALESCE(berry_ade, 0),
	tiramisu = COALESCE(tiramisu, 0),
    merinque_cookies = COALESCE(merinque_cookies, 0);

-- 4. Dropping a column
SELECT Place
FROM Bakery_Sales

ALTER TABLE Bakery_Sales
DROP COLUMN Place;

-- View the values of day_of_week
SELECT  day_of_week
FROM Bakery_Sales

SELECT 
	day_of_week =
		CASE WHEN day_of_week = 'Mon' THEN 'Monday'
			 WHEN day_of_week = 'Tues' THEN 'Tuesday'
			 WHEN day_of_week = 'Wed' THEN 'Wednesday'
			 WHEN day_of_week = 'Thur' THEN 'Thursday'
			 WHEN day_of_week = 'Fri' THEN 'Friday'
			 WHEN day_of_week = 'Sat' THEN 'Saturday'
			 WHEN day_of_week = 'Sun' THEN 'Sunday'
		END 
FROM Bakery_Sales

-- 5. Fixing the spelling of a column
UPDATE Bakery_Sales
SET day_of_week =
		CASE WHEN day_of_week = 'Mon' THEN 'Monday'
			 WHEN day_of_week = 'Tues' THEN 'Tuesday'
			 WHEN day_of_week = 'Wed' THEN 'Wednesday'
			 WHEN day_of_week = 'Thur' THEN 'Thursday'
			 WHEN day_of_week = 'Fri' THEN 'Friday'
			 WHEN day_of_week = 'Sat' THEN 'Saturday'
			 WHEN day_of_week = 'Sun' THEN 'Sunday'
		END 

-- 5. Spliting column
SELECT 
	COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Bakery_Sales';

SELECT 
	datetime, 
	CAST(datetime AS DATE) AS Date, 
	CAST(datetime AS TIME) AS TIME
FROM Bakery_Sales

-- Add Columns for Date and Time
ALTER TABLE Bakery_Sales
ADD date DATE,
	time TIME;

-- Adding values extracted from datetime column to date and time
UPDATE Bakery_Sales 
SET date = CAST(datetime AS DATE), 
	time = CAST(datetime AS TIME)

ALTER TABLE Bakery_Sales
DROP COLUMN datetime

SELECT * FROM  Bakery_Sales
