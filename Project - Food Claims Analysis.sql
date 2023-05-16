CREATE DATABASE project;

CREATE TABLE food_claims_2212(
							claim_id  			 INT 		 PRIMARY KEY,
							time_to_close 		 INT 		 NOT NULL,
							claim_amount 		 VARCHAR(50) DEFAULT NULL,
							amount_paid 		 VARCHAR(50) DEFAULT NULL,
							location 			 VARCHAR(20) DEFAULT NULL,
							individuals_on_claim INT 		 DEFAULT NULL,
							linked_cases 		 VARCHAR(15) DEFAULT NULL,
							cause 				 VARCHAR(20));
							

COPY food_claims_2212
FROM 'F:\Exercises\food_claims_2212.csv'
DELIMITER ','
CSV HEADER;

SELECT * 
  FROM food_claims_2212;-- Checked for all data.

/*Analysis of each column*/

 SELECT claim_id,time_to_close,claim_amount,amount_paid,location,individuals_on_claim,linked_cases,cause, COUNT(*)
   FROM foods_claims_2212
  GROUP BY claim_id,time_to_close,claim_amount,amount_paid,location,individuals_on_claim,linked_cases,cause
 HAVING COUNT(*) > 1; -- Checked for duplicate entries.

--Claim id. 
SELECT COUNT(DISTINCT claim_id) AS unique_id 
  FROM food_claims_2212; --Checked for unique values.

--time to close (no of days)
SELECT COUNT(time_to_close) AS time_to_close 
  FROM food_claims_2212; --Checked for missing values.

SELECT MIN(time_to_close), MAX(time_to_close), AVG(time_to_close),
	   PERCENTILE_DISC(0.5) WITHIN GROUP(ORDER BY time_to_close) AS median -- Statistical analysis done.
  FROM food_claims_2212;

--Claim amount.
SELECT COUNT(claim_amount) AS number_of_claim_amount 
  FROM food_claims_2212; -- Checked for missing values.

SELECT claim_amount 
  FROM food_claims_2212
 WHERE claim_amount IS NULL
 	OR claim_amount = 'NA'; -- Checked for null values.

SELECT MIN(claim_amount) AS min_claim_amount, 
	   MAX(claim_amount) AS max_claim_amount
  FROM food_claims_2212; --Checked for Min & Max value but shows wrong value due to data type. As for numerical value data type should be numeric.


UPDATE food_claims_2212
   SET claim_amount = TRIM(claim_amount, 'R$ '); -- Removed 'R$' by trimming 

 ALTER TABLE food_claims_2212
ALTER COLUMN claim_amount TYPE numeric USING claim_amount::numeric; -- Changed data type to numeric
/* As above query gives error due to default constraint, which needs to be removed temporarily*/

ALTER TABLE food_claims_2212
ALTER COLUMN claim_amount DROP DEFAULT;-- Remove the default value temporarily.

ALTER TABLE food_claims_2212
ALTER COLUMN claim_amount TYPE numeric USING claim_amount::numeric;-- Alter the data type of the claim_amount column.

ALTER TABLE food_claims_2212
ALTER COLUMN claim_amount SET DEFAULT NULL;-- -- Reapplied the default value

--Amount paid. 
SELECT amount_paid 
  FROM food_claims_2212 
 WHERE amount_paid = 'NA' 
    OR amount_paid IS NULL; -- Checked for null values.

SELECT MIN(amount_paid::numeric) AS min_amount_paid, 
	   MAX(amount_paid::numeric) AS max_amount_paid,
	   AVG(amount_paid::numeric) AS avg_amount_paid, -- Casting used as datat type is Varchar
	   PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY amount_paid::numeric) AS disc_median,
       PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY amount_paid::numeric) AS cont_median --Statistical calculations carried out to fill null values with median.
	   FROM food_claims_2212
	   WHERE amount_paid <> 'NA'; --Excluded null from query


UPDATE food_claims_2212
   SET amount_paid = 20105.70
 WHERE amount_paid = 'NA'; -- Updated null values with median amount_paid

 ALTER TABLE  food_claims_2212
ALTER COLUMN amount_paid TYPE numeric USING amount_paid::numeric; -- Changed data type to numeric
/* As above query gives error due to default constraint, which needs to be removed temporarily*/

ALTER TABLE food_claims_2212
ALTER COLUMN amount_paid DROP DEFAULT;-- Removed the default value temporarily

ALTER TABLE  food_claims_2212
ALTER COLUMN amount_paid TYPE numeric USING amount_paid::numeric; -- Alter the data type of the amount_paid column

ALTER TABLE food_claims_2212
ALTER COLUMN amount_paid SET DEFAULT NULL;-- Reapplied the default value.

--Location

SELECT DISTINCT location  
  FROM food_claims_2212; --Checked for unique locations

SELECT COUNT(location) AS number_of_time_locations_appear
  FROM food_claims_2212; --Checked for number of time_locations_appear locations

--individuals on claim

SELECT COUNT (individuals_on_claim) 
  FROM food_claims_2212; -- Checked for null values
  
SELECT MIN(individuals_on_claim) AS min_individuals_on_claim, MAX(individuals_on_claim) AS max_individuals_on_claim 
  FROM food_claims_2212; -- Min & Max value checked for range.

--Cause
SELECT DISTINCT cause 
  FROM food_claims_2212; --Checked for unique cause


SELECT cause, COUNT(cause), 
	   LENGTH(cause) -- Length of each cause checked.
  FROM food_claims_2212 
 GROUP BY cause;
 

UPDATE food_claims_2212
   SET cause = TRIM(INITCAP(cause), 's '); -- Column updated to remove white spaces and to make all lower cases


SELECT DISTINCT cause 
  FROM food_claims_2212; -- After updating, checked for unique column

/*Column Analysis done in above query*/

  
--Category of the variable location which has the most observations
  SELECT location, 
	     COUNT(claim_id) AS number_of_claims -- No of locations calculated by using group by clause
	FROM food_claims_2212
GROUP BY location -- Grouping the results by location
ORDER BY number_of_claims DESC; -- Ordering the results in descending order of the count of claims
/*There are total four locations in this data.
Location Recife has most of number observation i.e. 885.*/


--Distribution of time to close for all claims
  SELECT location, 
		 MIN(time_to_close) AS min_time_to_close,
		 MAX(time_to_close) AS max_time_to_close,
		 PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY time_to_close) AS median_time_to_close,-- -- Calculates the median value
		 ROUND(AVG(time_to_close),2) AS mean_time_to_close,--Calculates the average & rounded to two decimal
	 	 COUNT(time_to_close) 		 AS no_of_claims -- Counts the number of claims
	FROM food_claims_2212
GROUP BY location;
/*The time to close claims ranges from a minimum of 76 days to a maximum of 518 days.
The median time to close claims is 179 days, which means half of the claims were closed within 179 days or less.
On average, claims were closed in approximately 186 days.*/


--Calculate various percentile statistics for the time_to_close column grouped by the location column in the table.
SELECT location,
	   PERCENTILE_DISC(0.25) WITHIN GROUP(ORDER BY time_to_close)-
	   		1.5*(PERCENTILE_DISC(0.75) WITHIN GROUP(ORDER BY time_to_close)-
	   PERCENTILE_DISC(0.25) WITHIN GROUP(ORDER BY time_to_close)) AS bottom_outlier,
	   PERCENTILE_DISC(0.25) WITHIN GROUP(ORDER BY time_to_close) AS "25th percentile",
	   PERCENTILE_DISC(0.5)  WITHIN GROUP(ORDER BY time_to_close) AS median,
	   PERCENTILE_DISC(0.75) WITHIN GROUP(ORDER BY time_to_close) AS "75th percentile",
	   (PERCENTILE_DISC(0.75) WITHIN GROUP(ORDER BY time_to_close)-
	   		PERCENTILE_DISC(0.25) WITHIN GROUP(ORDER BY time_to_close)) AS IQR,
		PERCENTILE_DISC(0.75) WITHIN GROUP(ORDER BY time_to_close)+
	   		1.5*(PERCENTILE_DISC(0.75) WITHIN GROUP(ORDER BY time_to_close)-
	   PERCENTILE_DISC(0.25) WITHIN GROUP(ORDER BY time_to_close)) AS upper_outlier
 FROM food_claims_2212
GROUP BY location;
/*The query provides a box plot-like analysis for the "time_to_close" column, grouped by the "location" column. 
It calculates various statistics to understand the distribution of claim closure times within each location.
FORTALEZA has the lowest 25th percentile value, indicating that a significant number of claims in this location are closed relatively quickly compared to other locations.
The median value for all locations is around 179-180, suggesting that half of the claims in each location are closed within this time range.
The 75th percentile value is highest for RECIFE, indicating that a larger proportion of claims in this location take longer to close compared to other locations.
The IQR (Interquartile Range) represents the range between the 25th and 75th percentiles and indicates the spread of claim closure times within each location. The IQR values range from 44 to 49 across the locations, reflecting moderate variability in claim closure times.
The upper outlier values suggest the presence of extreme claim closure times. SAO LUIS has the highest upper outlier value, indicating that some claims in this location take significantly longer to close compared to others.*/




--Total claimed amount, total paid amount, and the balanced amount for each location
  SELECT COALESCE(location, 'Total Amount') AS location, 
  		 SUM(claim_amount) AS total_claim_amount,
		 SUM(amount_paid) AS total_paid_amount,
		 SUM(claim_amount) - SUM(amount_paid) AS balanced_amount
    FROM food_claims_2212
GROUP BY ROLLUP(location)
ORDER BY location;-- Total claimed amount, total paid amount and balanced amount by location wise.

/*RECIFE has the highest total claimed amount and total paid amount, suggesting it has the highest volume of claims and a significant number of claims have been settled.
FORTALEZA and NATAL have comparable total claimed and paid amounts, indicating a similar level of claims activity.
SAO LUIS has a lower total claimed and paid amount compared to the other locations.


Overall, RECIFE appears to have the most significant claims activity, 
both in terms of the total claimed amount and the total paid amount. 
The balanced amount indicates the outstanding claims that still need to be settled.*/


--Analysis of individuals claims using bins.
WITH bins AS (SELECT GENERATE_SERIES(0,18, 3)+1 AS lower,-- Lower bin series
	   				 GENERATE_SERIES(3,21,3)    AS upper)-- Upper bin series
   
    SELECT lower, upper, 
   		   COUNT(individuals_on_claim) AS no_of_individuals_claim 
      FROM food_claims_2212 AS f
INNER JOIN bins AS b
           ON f.individuals_on_claim >= lower     -- individuals on claim should be between upper and lower series
		      AND f.individuals_on_claim <= upper
  GROUP BY lower, upper
  ORDER BY lower;
 /*It provides an overview of how many claims fall within each range.
 The highest number of claims is observed in the range of 7 to 9 individuals, 
 followed by the range of 4 to 6 individuals. 
 The lowest number of claims is observed in the range of 13 to 15 individuals.*/
  
  
 -- Calculates the number of cases and the percentage distribution of linked cases
   SELECT linked_cases, 
		  COUNT(claim_id) AS no_of_cases,
		  CONCAT(
			  ROUND(
			  		(COUNT(claim_id)/
									(SELECT COUNT(claim_id)::NUMERIC
						  		       FROM food_claims_2212))*100,
			  		2),
			 ' %') AS percetage_distribution
	 FROM food_claims_2212
 GROUP BY linked_cases;
/*Among the cases in the "food_claims_2212" table, the majority of cases have the value "FALSE" for the "linked_cases" column, with a count of 1493 cases, accounting for approximately 74.65% of the total cases.
There are 481 cases with the value "TRUE" for the "linked_cases" column, representing around 24.05% of the total cases.
Only 26 cases have the value "NA" for the "linked_cases" column, making up approximately 1.30% of the total cases. */
 
--Count of cases for each location, considering only the cases where the linked_cases column has a value of 'FALSE'
   SELECT location,
		  COUNT(claim_id) AS no_of_cases,
		  CONCAT(
			  ROUND(
			  		(COUNT(claim_id)/
									(SELECT COUNT(claim_id)::NUMERIC
						  		       FROM food_claims_2212))*100,
			  		2),
			 ' %') AS percetage_distribution
	 FROM food_claims_2212
	 WHERE linked_cases = 'FALSE'
 GROUP BY location
 ORDER BY no_of_cases DESC;
/* Among the locations examined, Recife stands out with the highest number of cases, totaling 656. 
It is followed by Sao Luis, which has 381 cases, demonstrating a significant presence of such cases in the area. 
Fortaleza, another location in the dataset, recorded 237 cases, positioning it as the third highest in terms of case count. 
Natal completes the list with 219 cases, securing its place as the fourth highest location.*/


-- Count the number of claims for each cause where linked_cases is 'TRUE'.
  SELECT cause, 
  		 COUNT(claim_id) AS no_of_claims
    FROM food_claims_2212
   WHERE linked_cases = 'TRUE' -- Filter for TRUE cases
GROUP BY cause
ORDER BY no_of_claims DESC;

/*Among the claims with identified causes, the majority falls under the category of "Unknown,"
accounting for 197 cases. 
This indicates a lack of specific cause information or incomplete recording in the dataset. 
Following that, "Vegetable" causes are the second most common, with 166 claims, 
suggesting issues related to vegetable-based food items. 
The third most prevalent cause is "Meat," with 118 claims indicating problems associated with meat products. 
These findings highlight the need for further investigation to better understand the underlying reasons behind the "Unknown" causes.*/

