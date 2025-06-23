                                                                          /* TABLE CREATION */
CREATE DATABASE IF NOT EXISTS climate_change_combined;

USE climate_change_combined;

CREATE TABLE australia /* creation of australia table */
(
Record_ID VARCHAR(255),
Date DATE,
Country VARCHAR(255),
City VARCHAR(255),
Temperature VARCHAR(255),
Humidity VARCHAR(255),
Precipitation VARCHAR(255),
Air_Quality_Index VARCHAR(255),
Extreme_Weather_Events VARCHAR(255),
Climate_Classification VARCHAR(255),
Climate_Zone VARCHAR(255),
Biome_Type VARCHAR(255),
Heat_Index VARCHAR(255),
Wind_Speed VARCHAR(255),
Wind_Direction VARCHAR(255),
Season VARCHAR(255),
Population_Exposure VARCHAR(255),
Economic_Impact_Estimate VARCHAR(255),
Infrastructure_Vulnerability_Score VARCHAR(255)
); 
-- end of creation of first table

SELECT * FROM australia;

LOAD DATA LOCAL INFILE 'C:/Users/gigam/Documents/excel files for data analysis/climate change dataset/split/australia_climate_data.csv' INTO TABLE australia
FIELDS TERMINATED BY ','
IGNORE 1 LINES; -- load data from excel file into australia table 

SHOW VARIABLES LIKE "local_infile";
/* check for local infile value and enable it */
SET GLOBAL local_infile = 1;

-- --------------------------------------------------------------------------------------------------

CREATE TABLE brazil /* creation of brazil table */
(
Record_ID VARCHAR(255),
Date DATE,
Country VARCHAR(255),
City VARCHAR(255),
Temperature VARCHAR(255),
Humidity VARCHAR(255),
Precipitation VARCHAR(255),
Air_Quality_Index VARCHAR(255),
Extreme_Weather_Events VARCHAR(255),
Climate_Classification VARCHAR(255),
Climate_Zone VARCHAR(255),
Biome_Type VARCHAR(255),
Heat_Index VARCHAR(255),
Wind_Speed VARCHAR(255),
Wind_Direction VARCHAR(255),
Season VARCHAR(255),
Population_Exposure VARCHAR(255),
Economic_Impact_Estimate VARCHAR(255),
Infrastructure_Vulnerability_Score VARCHAR(255)
); 
-- end of creation of second table

SELECT * FROM brazil;

LOAD DATA LOCAL INFILE 'C:/Users/gigam/Documents/excel files for data analysis/climate change dataset/split/brazil_climate_data.csv' INTO TABLE brazil
FIELDS TERMINATED BY ','
IGNORE 1 LINES; -- load data from excel file into brazil table

-- --------------------------------------------------------------------------------------------------

CREATE TABLE canada /* creation of canada table */
(
Record_ID VARCHAR(255),
Date DATE,
Country VARCHAR(255),
City VARCHAR(255),
Temperature VARCHAR(255),
Humidity VARCHAR(255),
Precipitation VARCHAR(255),
Air_Quality_Index VARCHAR(255),
Extreme_Weather_Events VARCHAR(255),
Climate_Classification VARCHAR(255),
Climate_Zone VARCHAR(255),
Biome_Type VARCHAR(255),
Heat_Index VARCHAR(255),
Wind_Speed VARCHAR(255),
Wind_Direction VARCHAR(255),
Season VARCHAR(255),
Population_Exposure VARCHAR(255),
Economic_Impact_Estimate VARCHAR(255),
Infrastructure_Vulnerability_Score VARCHAR(255)
); 
-- end of creation of third table

SELECT * FROM canada;

LOAD DATA LOCAL INFILE 'C:/Users/gigam/Documents/excel files for data analysis/climate change dataset/split/canada_climate_data.csv' INTO TABLE canada
FIELDS TERMINATED BY ','
IGNORE 1 LINES; -- load data from excel file into canada table

-- --------------------------------------------------------------------------------------------------

CREATE TABLE germany /* creation of germany table */
(
Record_ID VARCHAR(255),
Date DATE,
Country VARCHAR(255),
City VARCHAR(255),
Temperature VARCHAR(255),
Humidity VARCHAR(255),
Precipitation VARCHAR(255),
Air_Quality_Index VARCHAR(255),
Extreme_Weather_Events VARCHAR(255),
Climate_Classification VARCHAR(255),
Climate_Zone VARCHAR(255),
Biome_Type VARCHAR(255),
Heat_Index VARCHAR(255),
Wind_Speed VARCHAR(255),
Wind_Direction VARCHAR(255),
Season VARCHAR(255),
Population_Exposure VARCHAR(255),
Economic_Impact_Estimate VARCHAR(255),
Infrastructure_Vulnerability_Score VARCHAR(255)
); 
-- end of creation of fourth table

SELECT * FROM germany;

LOAD DATA LOCAL INFILE 'C:/Users/gigam/Documents/excel files for data analysis/climate change dataset/split/germany_climate_data.csv' INTO TABLE germany
FIELDS TERMINATED BY ','
IGNORE 1 LINES; -- load data from excel file into germany table

-- --------------------------------------------------------------------------------------------------

CREATE TABLE india /* creation of india table */
(
Record_ID VARCHAR(255),
Date DATE,
Country VARCHAR(255),
City VARCHAR(255),
Temperature VARCHAR(255),
Humidity VARCHAR(255),
Precipitation VARCHAR(255),
Air_Quality_Index VARCHAR(255),
Extreme_Weather_Events VARCHAR(255),
Climate_Classification VARCHAR(255),
Climate_Zone VARCHAR(255),
Biome_Type VARCHAR(255),
Heat_Index VARCHAR(255),
Wind_Speed VARCHAR(255),
Wind_Direction VARCHAR(255),
Season VARCHAR(255),
Population_Exposure VARCHAR(255),
Economic_Impact_Estimate VARCHAR(255),
Infrastructure_Vulnerability_Score VARCHAR(255)
); 
-- end of creation of fifth table

SELECT * FROM india;

LOAD DATA LOCAL INFILE 'C:/Users/gigam/Documents/excel files for data analysis/climate change dataset/split/india_climate_data.csv' INTO TABLE india
FIELDS TERMINATED BY ','
IGNORE 1 LINES; -- load data from excel file into india table

-- --------------------------------------------------------------------------------------------------

CREATE TABLE south_africa /* creation of south_africa table */
(
Record_ID VARCHAR(255),
Date DATE,
Country VARCHAR(255),
City VARCHAR(255),
Temperature VARCHAR(255),
Humidity VARCHAR(255),
Precipitation VARCHAR(255),
Air_Quality_Index VARCHAR(255),
Extreme_Weather_Events VARCHAR(255),
Climate_Classification VARCHAR(255),
Climate_Zone VARCHAR(255),
Biome_Type VARCHAR(255),
Heat_Index VARCHAR(255),
Wind_Speed VARCHAR(255),
Wind_Direction VARCHAR(255),
Season VARCHAR(255),
Population_Exposure VARCHAR(255),
Economic_Impact_Estimate VARCHAR(255),
Infrastructure_Vulnerability_Score VARCHAR(255)
); 
-- end of creation of sixth table

SELECT * FROM south_africa;

LOAD DATA LOCAL INFILE 'C:/Users/gigam/Documents/excel files for data analysis/climate change dataset/split/south_africa_climate_data.csv' INTO TABLE south_africa
FIELDS TERMINATED BY ','
IGNORE 1 LINES; -- load data from excel file into south africa table

-- --------------------------------------------------------------------------------------------------

CREATE TABLE usa /* creation of usa table */
(
Record_ID VARCHAR(255),
Date DATE,
Country VARCHAR(255),
City VARCHAR(255),
Temperature VARCHAR(255),
Humidity VARCHAR(255),
Precipitation VARCHAR(255),
Air_Quality_Index VARCHAR(255),
Extreme_Weather_Events VARCHAR(255),
Climate_Classification VARCHAR(255),
Climate_Zone VARCHAR(255),
Biome_Type VARCHAR(255),
Heat_Index VARCHAR(255),
Wind_Speed VARCHAR(255),
Wind_Direction VARCHAR(255),
Season VARCHAR(255),
Population_Exposure VARCHAR(255),
Economic_Impact_Estimate VARCHAR(255),
Infrastructure_Vulnerability_Score VARCHAR(255)
); 
-- end of creation of seventh table

SELECT * FROM usa;

LOAD DATA LOCAL INFILE 'C:/Users/gigam/Documents/excel files for data analysis/climate change dataset/split/usa_climate_data.csv' INTO TABLE usa
FIELDS TERMINATED BY ','
IGNORE 1 LINES; -- load data from excel file into usa table

-- --------------------------------------------------------------------------------------------------

-- union all data tables
CREATE TABLE climate_change_data AS
SELECT * FROM australia
UNION
SELECT * FROM brazil
UNION
SELECT * FROM canada
UNION
SELECT * FROM germany
UNION
SELECT * FROM india
UNION
SELECT * FROM south_africa
UNION
SELECT * FROM usa;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                          /* DATA CLEANING */
SELECT * FROM climate_change_data;

-- check for duplicate values
SELECT Record_ID
  FROM climate_change_data
 GROUP BY Record_ID
HAVING COUNT(*) > 1; 

-- check country spelling  
SELECT DISTINCT(Country)
  FROM climate_change_data;

-- updated to correct spelling
UPDATE climate_change_data SET Country = 'India' WHERE Country = 'Inda';

-- check for null values
SELECT * 
  FROM climate_change_data
 WHERE Record_ID IS NULL OR Record_ID = ''
    OR 'Date' IS NULL OR 'Date' = ''
    OR Country IS NULL OR Country = ''
    OR City IS NULL OR City = ''
    OR Temperature IS NULL OR Temperature = ''
    OR Humidity IS NULL OR Humidity = ''
    OR Precipitation IS NULL OR Precipitation = ''
    OR Air_Quality_Index IS NULL OR Air_Quality_Index = ''
    OR Extreme_Weather_Events IS NULL OR Extreme_Weather_Events = ''
    OR Climate_Classification IS NULL OR Climate_Classification = ''
    OR Climate_Zone IS NULL OR Climate_Zone = ''
    OR Biome_Type IS NULL OR Biome_Type = ''
    OR Heat_Index IS NULL OR Heat_Index = ''
    OR Wind_Speed IS NULL OR Wind_Speed = ''
    OR Wind_Direction IS NULL OR Wind_Direction = ''
    OR Season IS NULL OR Season = ''
    OR Population_Exposure IS NULL OR Population_Exposure = ''
    OR Economic_Impact_Estimate IS NULL OR Economic_Impact_Estimate = ''
    OR Infrastructure_Vulnerability_Score IS NULL OR Infrastructure_Vulnerability_Score = '';
    
-- replace empty values with correct entries
UPDATE climate_change_data SET Population_Exposure = 5275135 WHERE Record_ID = 'aus_1338';
UPDATE climate_change_data SET City = 'Toronto' WHERE Record_ID = 'cnd_227';

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                          /* ANALYSIS */
-- monthly temperature trends
SELECT MONTHNAME(DATE) AS Month_Name,
	   AVG(Temperature) AS Average_Temperature
  FROM climate_change_data
 GROUP BY Month_Name;
 
 -- average temperature by country
SELECT Country, AVG(Temperature) AS Average_Temperature
  FROM climate_change_data
 GROUP BY Country
 ORDER BY Average_Temperature DESC;
  
-- extreme weather events over time
SELECT MONTHNAME(DATE) AS Month_Name,
       COUNT(*) AS Event_Count
  FROM climate_change_data
 WHERE Extreme_Weather_Events <> 'None'
 GROUP BY Month_Name;
 
-- country wise extreme weather events
SELECT Country,
       COUNT(*) AS Event_Count
  FROM climate_change_data
 WHERE Extreme_Weather_Events <> 'None'
 GROUP BY Country;
 
-- relationship between temperature and extreme weather events
SELECT CASE WHEN temperature < 10 THEN 'Very Cold(<10°C)'
            WHEN temperature BETWEEN 10 AND 15 THEN 'Cold(10-15°C)'
            WHEN temperature BETWEEN 15 AND 20 THEN 'Moderate(15-20°C)'
            WHEN temperature BETWEEN 25 AND 30 THEN 'Warm(10-15°C)'
            END AS Temperature_Range,
            Extreme_weather_Events,
            COUNT(*) AS Event_Count
  FROM climate_change_data
 WHERE Extreme_Weather_Events <> 'None'
 GROUP BY Temperature_Range, Extreme_weather_Events
 ORDER BY Temperature_Range, Event_Count;
   
-- which cities are experiencing extreme weather events this week and what are their economic and population impacts?
SELECT Country,
       City,
       Extreme_Weather_Events,
       Count(*) AS Event_Type,
       ROUND(AVG(Temperature), 1) AS Average_Temperature,
       SUM(Population_Exposure) AS Total_Population_Exposure,
       SUM(Economic_Impact_Estimate) AS Total_Economic_Impact,
       ROUND(AVG(Infrastructure_Vulnerability_Score), 0) AS Average_Infrastructure_Vulnerability
  FROM climate_change_data
 WHERE DATE BETWEEN '2025-03-03' AND '2025-03-07'
   AND Extreme_Weather_Events != 'None'
 GROUP BY Country, City, Extreme_Weather_Events
 ORDER BY Total_Economic_Impact DESC;
 
-- what are the top 5 cities with the highest air quality concerns and their associate risks?
SELECT country,
       City,
       ROUND(avg(Air_Quality_Index), 0) AS Average_AQI,
       COUNT(*) AS Days_Above_200_AQI,
       SUM(Population_Exposure) AS Total_Population_Exposure,
       ROUND(AVG(Temperature), 1) AS Average_Temperature
  FROM climate_change_data
 WHERE Date BETWEEN '2025-03-03' AND '2025-03-07'
 GROUP BY Country, City
HAVING AVG(Air_Quality_Index) > 100
 ORDER BY Average_AQI
 LIMIT 5;
 
-- which biome types are most at risk from extreme weather events this week?
SELECT Biome_Type,
       COUNT(*) AS Total_Records,
       COUNT(DISTINCT CONCAT(Country, City)) AS Locations_Affected,
       COUNT(CASE WHEN Extreme_Weather_Events != 'None' THEN 1 END) AS Extreme_Weather_Count,
       GROUP_CONCAT(DISTINCT ' ', Extreme_Weather_Events) AS Event_Types,
       ROUND(AVG(Temperature), 1) AS Average_Temperature,
       SUM(Economic_Impact_Estimate) AS Total_Economic_Impact_Estimate,
       ROUND(AVG(Infrastructure_Vulnerability_Score), 0) AS Average_Vulnerability
  FROM climate_change_data
 WHERE Date BETWEEN '2025-03-03' AND '2025-03-07'
 GROUP BY Biome_Type;
 
 

