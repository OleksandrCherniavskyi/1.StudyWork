-- Create a table first registration car for region

CREATE DATABASE sql_Project1;
USE sql_Project1;
СREATE TABLE first_registration 
    (region_id INT,
	Name TEXT,
    Q1_2010 INT, Q2_2010 INT, Q3_2010 INT, Q4_2010 INT,
    Q1_2011 INT, Q2_2011 INT, Q3_2011 INT, Q4_2011 INT, 
    Q1_2012 INT, Q2_2012 INT, Q3_2012 INT, Q4_2012 INT,
    Q1_2013 INT, Q2_2013 INT, Q3_2013 INT, Q4_2013 INT, 
    Q1_2014 INT, Q2_2014 INT, Q3_2014 INT, Q4_2014 INT,
    Q1_2015 INT, Q2_2015 INT, Q3_2015 INT, Q4_2015 INT,
    Q1_2016 INT, Q2_2016 INT, Q3_2016 INT, Q4_2016 INT,
    Q1_2017 INT, Q2_2017 INT, Q3_2017 INT, Q4_2017 INT,
	Q1_2018 INT, Q2_2018 INT, Q3_2018 INT, Q4_2018 INT,
    Q1_2019 INT, Q2_2019 INT, Q3_2019 INT, Q4_2019 INT,
    Q1_2020 INT, Q2_2020 INT, Q3_2020 INT, Q4_2020 INT,
    Q1_2021 INT, Q2_2021 INT, Q3_2021 INT, Q4_2021 INT
    );

-- Create a table population for region
    
USE sql_Project1;
CREATE TABLE population
	(region_id INT,
 	Name TEXT,
 	Y_2010 INT, Y_2011 INT, Y_2012 INT, Y_2013 INT, Y_2014 INT, Y_2015 INT, Y_2016 INT, Y_2017 INT, Y_2018 INT, Y_2019 INT, Y_2020 INT, Y_2021 INT)

-- update ID column 
  
USE sql_Project1;
UPDATE population
SET region_id = region_id * 0.00001
    
USE sql_Project1;
UPDATE first_registration 
SET region_id = region_id * 0.00001

-- delete redundant column 
    
USE sql_Project1;
DELETE FROM first_registration
WhERE region_id = 0

USE sql_Project1;
DELETE FROM population
WhERE region_id = 0


-- 1. TABLE FOR MAP

USE sql_Project1;
SELECT 	region_id,
 		name,
 		Q1_2010 + Q2_2010 + Q3_2010 + Q4_2010 AS Qty_2010,
        Q1_2011 + Q2_2011 + Q3_2011 + Q4_2011 AS Qty_2011,
        Q1_2012 + Q2_2012 + Q3_2012 + Q4_2012 AS Qty_2012,
        Q1_2013 + Q2_2013 + Q3_2013 + Q4_2013 AS Qty_2013,
        Q1_2014 + Q2_2014 + Q3_2014 + Q4_2014 AS Qty_2014,
        Q1_2015 + Q2_2015 + Q3_2015 + Q4_2015 AS Qty_2015,
        Q1_2016 + Q2_2016 + Q3_2016 + Q4_2016 AS Qty_2016,
        Q1_2017 + Q2_2017 + Q3_2017 + Q4_2017 AS Qty_2017,
        Q1_2018 + Q2_2018 + Q3_2018 + Q4_2018 AS Qty_2018,
        Q1_2019 + Q2_2019 + Q3_2019 + Q4_2019 AS Qty_2019,
        Q1_2020 + Q2_2020 + Q3_2020 + Q4_2020 AS Qty_2020
FROM first_registration


-- create temporary table 

USE sql_Project1;
CREATE TABLE first_registration_per_year AS
SELECT 	region_id,
 		name,
 		Q1_2010 + Q2_2010 + Q3_2010 + Q4_2010 AS Qty_2010,
        Q1_2011 + Q2_2011 + Q3_2011 + Q4_2011 AS Qty_2011,
        Q1_2012 + Q2_2012 + Q3_2012 + Q4_2012 AS Qty_2012,
        Q1_2013 + Q2_2013 + Q3_2013 + Q4_2013 AS Qty_2013,
        Q1_2014 + Q2_2014 + Q3_2014 + Q4_2014 AS Qty_2014,
        Q1_2015 + Q2_2015 + Q3_2015 + Q4_2015 AS Qty_2015,
        Q1_2016 + Q2_2016 + Q3_2016 + Q4_2016 AS Qty_2016,
        Q1_2017 + Q2_2017 + Q3_2017 + Q4_2017 AS Qty_2017,
        Q1_2018 + Q2_2018 + Q3_2018 + Q4_2018 AS Qty_2018,
        Q1_2019 + Q2_2019 + Q3_2019 + Q4_2019 AS Qty_2019,
        Q1_2020 + Q2_2020 + Q3_2020 + Q4_2020 AS Qty_2020
FROM first_registration

-- 2. TABLE FOR LINE

USE sql_Project1;
SELECT
    p.region_id,
    p.Name,
	(Qty_2010/Y_2010)*100 AS car_for_people2010,
    (Qty_2011/Y_2011)*100 AS car_for_people2011,
    (Qty_2012/Y_2012)*100 AS car_for_people2012,
    (Qty_2013/Y_2013)*100 AS car_for_people2013,
    (Qty_2014/Y_2014)*100 AS car_for_people2014,
    (Qty_2015/Y_2015)*100 AS car_for_people2015,
    (Qty_2016/Y_2016)*100 AS car_for_people2016,
    (Qty_2017/Y_2017)*100 AS car_for_people2017,
    (Qty_2018/Y_2018)*100 AS car_for_people2018,
    (Qty_2019/Y_2019)*100 AS car_for_people2019,
    (Qty_2020/Y_2020)*100 AS car_for_people2020
FROM first_registration_per_year frpy
JOIN population p ON frpy.region_id = p.region_id

-- 3. TABLE FOR COLUMNS

USE sql_Project1;
SELECT
    p.region_id,
    p.Name,
	Qty_2010,Y_2010,
    Qty_2011,Y_2011,
    Qty_2012,Y_2012,
    Qty_2013,Y_2013,
    Qty_2014,Y_2014,
    Qty_2015,Y_2015,
    Qty_2016,Y_2016,
    Qty_2017,Y_2017,
    Qty_2018,Y_2018,
    Qty_2019,Y_2019,
    Qty_2020,Y_2020
FROM first_registration_per_year frpy
JOIN population p ON frpy.region_id = p.region_id

-- 4. TABLE PEEOPLE FOR ONE CAR PER QUARTAL

USE sql_Project1;
SELECT 
	p.region_id,
    p.Name,
    Y_2010/Q1_2010 AS Q1_10 , Y_2010/Q2_2010 AS Q2_10, Y_2010/Q3_2010 AS Q3_10, Y_2010/Q4_2010 AS Q4_10,
	Y_2011/Q1_2011 AS Q1_11 , Y_2011/Q2_2011 AS Q2_11, Y_2011/Q3_2011 AS Q3_11, Y_2011/Q4_2011 AS Q4_11,
	Y_2012/Q1_2012 AS Q1_12 , Y_2012/Q2_2012 AS Q2_12, Y_2012/Q3_2012 AS Q3_12, Y_2012/Q4_2012 AS Q4_12,
    Y_2013/Q1_2013 AS Q1_13 , Y_2013/Q2_2013 AS Q2_13, Y_2013/Q3_2013 AS Q3_13, Y_2013/Q4_2013 AS Q4_13,
    Y_2014/Q1_2014 AS Q1_14 , Y_2014/Q2_2014 AS Q2_14, Y_2014/Q3_2014 AS Q3_14, Y_2014/Q4_2014 AS Q4_14,
    Y_2015/Q1_2015 AS Q1_15 , Y_2015/Q2_2015 AS Q2_15, Y_2015/Q3_2015 AS Q3_15, Y_2015/Q4_2015 AS Q4_15,
    Y_2016/Q1_2016 AS Q1_16 , Y_2016/Q2_2016 AS Q2_16, Y_2016/Q3_2016 AS Q3_16, Y_2016/Q4_2016 AS Q4_16,
    Y_2017/Q1_2017 AS Q1_17 , Y_2017/Q2_2017 AS Q2_17, Y_2017/Q3_2017 AS Q3_17, Y_2017/Q4_2017 AS Q4_17,
    Y_2018/Q1_2018 AS Q1_18 , Y_2018/Q2_2018 AS Q2_18, Y_2018/Q3_2018 AS Q3_18, Y_2018/Q4_2018 AS Q4_18,
    Y_2019/Q1_2019 AS Q1_19 , Y_2019/Q2_2019 AS Q2_19, Y_2019/Q3_2019 AS Q3_19, Y_2019/Q4_2019 AS Q4_19,
    Y_2020/Q1_2020 AS Q1_20 , Y_2020/Q2_2020 AS Q2_20, Y_2020/Q3_2020 AS Q3_20, Y_2020/Q4_2020 AS Q4_20,
	Y_2020/Q1_2021 AS Q1_21 , Y_2020/Q2_2021 AS Q2_21, Y_2020/Q3_2021 AS Q3_21, Y_2020/Q4_2021 AS Q4_21
FROM first_registration fr
JOIN population p
	ON fr.region_id = p.region_id

