-- set 'eda' as schema
SET SCHEMA 'eda';

-- Look at the  house data
SELECT * FROM king_county_house_details kchd ;

-- count no. of rows in the table

SELECT COUNT(*) FROM king_county_house_details; -- 21420

-- Look at the  house sales data
SELECT * FROM king_county_house_sales kchs ;
SELECT COUNT(*) FROM king_county_house_sales ; -- 21597

-- get column name and the associated data type of each table
 SELECT 
    column_name,
    data_type
FROM information_schema.columns
WHERE table_name IN ('king_county_house_details', 'king_county_house_sales'); 


-- I will join the two tables using the 'id' column

SELECT 
    COALESCE(kchs.id, kchd.id) AS joined_id,
    kchs.date,
    kchs.price,
    kchs.house_id,
    kchd.bedrooms,
    kchd.bathrooms,
    kchd.sqft_living,
    kchd.sqft_lot,
    kchd.floors,
    kchd.waterfront,
    kchd.view,
    kchd.condition,
    kchd.grade,
    kchd.sqft_above,
    kchd.sqft_basement,
    kchd.yr_built,
    kchd.yr_renovated,
    kchd.zipcode,
    kchd.lat,
    kchd.long,
    kchd.sqft_living15,
    kchd.sqft_lot15
FROM kchs
FULL OUTER JOIN kchd ON kchs.id = kchd.id
ORDER BY COALESCE(kchs.id, kchd.id);
