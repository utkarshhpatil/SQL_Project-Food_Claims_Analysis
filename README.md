# SQL_Project-Food_Claims_Analysis
The analysis of the dataset involves extracting valuable insights and uncovering patterns and trends related to various factors, including claim closure times, claim amounts, locations, individuals, causes, and linked cases. This comprehensive examination encompasses multiple aspects of the data to ensure a thorough understanding.

The analysis begins by addressing duplicate entries, eliminating any redundant data and enhancing data accuracy. By identifying and resolving duplicate entries, the integrity of the dataset is preserved, providing reliable results.

Data completeness is another crucial aspect considered in the analysis. Evaluating the completeness of the dataset helps identify any missing values or gaps that might affect the interpretation of the results. By handling missing data appropriately, the analysis ensures a comprehensive and reliable assessment.

Data types are reviewed and adjusted as necessary to facilitate accurate analysis and interpretation. Ensuring that each data type is appropriately assigned enhances the effectiveness of subsequent calculations and statistical analyses.

Statistical analysis plays a pivotal role in extracting meaningful insights from the dataset. By performing statistical calculations, such as measures of central tendency, dispersion, and distribution analysis, the analysis provides a deeper understanding of the distribution and characteristics of claim closure times, claim amounts, and amounts paid. These statistical insights offer valuable information about the dataset and its underlying patterns.

Column cleansing is undertaken to ensure consistency and uniformity within the dataset. This process involves standardizing data formats, correcting inconsistencies, and transforming data to a consistent representation. By performing column cleansing, the analysis improves the accuracy and reliability of subsequent analyses and interpretations.

In addition to these aspects, the analysis also explores the dataset from an exploratory perspective. This involves visualizing the data, identifying outliers or anomalies, and uncovering potential relationships or associations between different variables. These exploratory insights contribute to a more comprehensive understanding of the dataset and can uncover valuable patterns or trends that might otherwise go unnoticed.

Overall, this analysis of the dataset incorporates various techniques and considerations to derive meaningful insights, revealing patterns and trends related to claim closure times, claim amounts, locations, individuals, causes, and linked cases.



The analysis begins by creating a project database and a table named "food_claims_2212" using the CREATE DATABASE and CREATE TABLE statements. The table includes columns such as claim_id, time_to_close, claim_amount, amount_paid, location, individuals_on_claim, linked_cases, and cause.

Next, the data from the 'food_claims_2212.csv' file is imported into the table using the COPY command with appropriate delimiters and headers specified.

To ensure the successful data import, a SELECT statement is executed to retrieve all the data from the "food_claims_2212" table.

Furthermore, the analysis includes column cleansing to ensure data accuracy and consistency. This involves handling any inconsistencies or errors within the columns.

The analysis of each column in the "food_claims_2212" dataset involves examining different aspects of the data to gain insights and ensure data quality.

 
To identify duplicate entries, a SELECT statement is executed to group the data by claim_id, time_to_close, claim_amount, amount_paid, location, individuals_on_claim, linked_cases, and cause. The HAVING clause is used to filter out groups with a count greater than 1, indicating duplicate entries
  
To assess the uniqueness of claim_id values, a SELECT statement with the COUNT and DISTINCT functions is used to count the number of distinct claim_id values in the dataset.

To check for missing values in the time_to_close column, a SELECT statement is executed to count the number of non-null values in the column.

For the time_to_close column, the SELECT statement calculates the minimum, maximum, and average values using the MIN, MAX, and AVG functions, respectively. Additionally, the PERCENTILE_DISC function with a parameter of 0.5 is used to calculate the median.

To examine the claim_amount column, a SELECT statement is executed to count the number of non-null values in the column, providing insights into the completeness of the data.

Furthermore, a separate SELECT statement is used to identify any null or 'NA' values in the claim_amount column. This step ensures that missing or invalid data in the column is identified and accounted for in subsequent analyses.

In the analysis of the  claim_amount column.

First, a SELECT statement is used to count the number of non-null values in the claim_amount column, providing an understanding of the total count of claim amounts available.

Next, another SELECT statement is executed to identify any null or 'NA' values in the claim_amount column. This step helps to identify missing or invalid values in the dataset.

To address an issue with the data type of the claim_amount column, further steps are taken. Initially, a SELECT statement is used to calculate the minimum and maximum values of the claim_amount column. However, incorrect results may be obtained due to the incorrect data type.

To rectify this issue, updates are made to the table. First, the 'R$' symbol is removed from the claim_amount values using the TRIM function. Then, the data type of the claim_amount column is altered to numeric using the ALTER TABLE statement.

In order to remove the default constraint temporarily, an ALTER COLUMN statement is used to drop the default value. Subsequently, the data type of the claim_amount column is altered to numeric using the ALTER TABLE statement again.

Finally, the default value of the claim_amount column is set back to NULL using the ALTER COLUMN statement.

In the analysis of the amount_paid column.

First, a SELECT statement is used to identify any null or 'NA' values in the amount_paid column. This step helps to identify missing or invalid values in the dataset.

To address the data type issue in the amount_paid column, further steps are taken. Initially, a SELECT statement is used to calculate the minimum, maximum, average, and median values of the amount_paid column. Casting is applied to convert the amount_paid values to the numeric data type.

To handle the null values in the amount_paid column, an UPDATE statement is used to replace the null values with the calculated median value.

Next, the data type of the amount_paid column is altered to numeric using the ALTER TABLE statement. To remove the default constraint temporarily, an ALTER COLUMN statement is used to drop the default value. Then, the data type of the amount_paid column is altered to numeric using the ALTER TABLE statement again.

Finally, the default value of the amount_paid column is set back to NULL using the ALTER COLUMN statement.

These steps ensure the data integrity and accuracy of the amount_paid column by addressing data type issues, handling null values, and filling them with the median value.

The analysis of the  the location column.

To start, a SELECT statement is used to identify the unique locations present in the dataset. This step helps to understand the different locations associated with the food claims.

Additionally, a COUNT statement is used to determine the number of times each location appears in the dataset. This information provides insights into the frequency of occurrences for each location.

These queries help analyze the location column by identifying unique locations and determining the distribution of claims across different locations.

The analysis of the individuals_on_claim column.

First, a COUNT statement is used to identify the number of records that have a value in the individuals_on_claim column. This helps to check for any null values present in the dataset.

Next, a MIN and MAX statement is used to determine the minimum and maximum values in the individuals_on_claim column. This provides insights into the range of individuals associated with each claim.

These queries help analyze the individuals_on_claim column by checking for null values and understanding the range of individuals involved in each claim.

The analysis of the  cause column.

First, a query is used to identify the unique causes present in the dataset. This helps understand the different categories or reasons for the claims.

Next, a query is used to count the occurrences of each cause and calculate the length of each cause. This provides insights into the frequency and length of the causes in the dataset.

Afterwards, an update statement is executed to trim leading and trailing white spaces from the cause column and capitalize the first letter of each cause.

Lastly, a query is used to verify the uniqueness of the cause column after the updates have been applied.

These queries help analyze the cause column by identifying unique causes, examining their frequency and length, and performing data cleansing to standardize the cause values.

After analyzing each column in the "food_claims_2212" dataset, we have gained valuable insights and made several observations. Now we will find insights from dataset.

1) Among the available locations in the dataset, we identified the category with the highest number of observations by counting the claims associated with each location. The query results revealed that there are a total of four locations in the dataset. Among them, the location "Recife" has the highest number of observations, specifically 885 claims. This finding suggests that Recife is the category within the "location" variable that appears most frequently in the dataset.

2) By analyzing the dataset, we examined the distribution of the "time_to_close" variable for all claims, grouped by location. The results showed that the time to close claims varied across locations. The minimum time to close a claim was 76 days, while the maximum time recorded was 518 days. The median time to close claims, which represents the midpoint of the distribution, was found to be 179 days. This indicates that half of the claims were closed within 179 days or less. On average, claims took approximately 186 days to be closed. These insights provide an understanding of the overall distribution and duration of claim closure times for different locations in the dataset.

3) The provided query calculates various percentile statistics for the "time_to_close" column, grouped by the "location" column in the table. The results resemble a box plot analysis and provide insights into the distribution of claim closure times within each location.

   Among the analyzed locations, FORTALEZA has the lowest 25th percentile value, indicating that a significant number of claims in this location are closed relatively quickly compared to other locations. The median value, which represents the middle value of the distribution, is around 179-180 for all locations, indicating that half of the claims in each location are closed within this time range.

   The 75th percentile value is highest for RECIFE, suggesting that a larger proportion of claims in this location take longer to close compared to other locations. The Interquartile Range (IQR), which represents the range between the 25th and 75th percentiles, indicates the spread of claim closure times within each location. The IQR values range from 44 to 49 across the locations, indicating moderate variability in claim closure times.

   Lastly, the upper outlier values represent extreme claim closure times. SAO LUIS has the highest upper outlier value, indicating that some claims in this location take significantly longer to close compared to others. These statistics provide valuable insights into the distribution and variability of claim closure times across different locations in the dataset.

4) The query calculates the total claimed amount, total paid amount, and balanced amount for each location in the dataset. The results provide insights into the financial aspects of the claims in different locations.

   RECIFE stands out with the highest total claimed amount and total paid amount, suggesting a high volume of claims and a significant number of claims being settled in this location. It indicates that RECIFE has a substantial claims activity compared to other locations.

   FORTALEZA and NATAL have comparable total claimed and paid amounts, indicating a similar level of claims activity in these locations.

   SAO LUIS, on the other hand, has a lower total claimed and paid amount compared to the other locations, indicating relatively fewer claims and settlements in this area.

   The "balanced amount" represents the outstanding claims that still need to be settled. It is calculated by subtracting the total paid amount from the total claimed amount. This value gives an indication of the pending financial liabilities for each location.

   Overall, RECIFE emerges as the location with the highest claims activity and settlement, based on the total claimed and paid amounts. The results provide valuable insights into the financial aspects of the claims dataset, highlighting variations in claims activity and outstanding liabilities across different locations.
   
5) The query performs an analysis of individuals claims using bins, grouping the claims based on the number of individuals involved in each claim. The bins are created with a lower and upper range, with a step size of 3.

   The results provide insights into the distribution of claims across different ranges of individuals involved. The highest number of claims is observed in the range of 7 to 9 individuals, indicating that a significant number of claims involve a medium-sized group of individuals. This range is followed by the range of 4 to 6 individuals, suggesting another common group size for claims.

   On the other hand, the lowest number of claims is observed in the range of 13 to 15 individuals, indicating that claims involving a larger number of individuals are less frequent in the dataset.

   By analyzing the distribution of claims across these bins, it provides an understanding of the typical group sizes involved in the claims, helping to identify patterns and trends related to the number of individuals associated with each claim.

6) The query calculates the number of cases and the percentage distribution of linked cases in the "food_claims_2212" table. It groups the cases based on the values in the "linked_cases" column.

   The results show that the majority of cases, 1493 in total, have the value "FALSE" for the "linked_cases" column. This accounts for approximately 74.65% of the total cases.

   There are 481 cases with the value "TRUE" for the "linked_cases" column, representing around 24.05% of the total cases.

   Additionally, there are 26 cases with the value "NA" for the "linked_cases" column, making up approximately 1.30% of the total cases.

   This analysis provides insights into the distribution of linked cases within the dataset, allowing for a better understanding of the prevalence and frequency of linked cases compared to non-linked cases.
   
7)  The query calculates the count of cases for each location, considering only the cases where the "linked_cases" column has a value of 'FALSE'. It filters the data based on this condition and groups the cases by location.

    The results show that among the locations examined, Recife has the highest number of cases with a total of 656 cases. This accounts for the majority of cases where the "linked_cases" column is 'FALSE'. Recife has a significant presence of such cases.

    Sao Luis follows with 381 cases, indicating a substantial number of cases in that location. It is the second highest location in terms of case count.

    Fortaleza, another location in the dataset, has 237 cases, positioning it as the third highest location with respect to the count of cases where "linked_cases" is 'FALSE'.

    Natal completes the list with 219 cases, making it the fourth highest location in terms of case count among cases where "linked_cases" is 'FALSE'.

    This analysis provides insights into the distribution of cases across different locations, considering only cases where the "linked_cases" column has a value of 'FALSE'. It helps identify locations with a higher concentration of independent cases that are not linked to other cases.
   
8) The query counts the number of claims for each cause where the "linked_cases" column is 'TRUE'. It filters the data based on this condition and groups the claims by cause.

   The results show that among the claims with identified causes, the majority of cases fall under the category of "Unknown" with a count of 197 claims. This indicates a lack of specific cause information or incomplete recording in the dataset. Further investigation is needed to better understand the reasons behind these "Unknown" causes.

   Following that, "Vegetable" causes are the second most common with 166 claims. This suggests issues related to vegetable-based food items, such as contamination or quality concerns.

   The third most prevalent cause is "Meat" with 118 claims. This indicates problems associated with meat products, such as spoilage, contamination, or improper handling.

   It is important to note that these results are based on the claims where the "linked_cases" column is 'TRUE'. It provides insights into the distribution of causes within this subset of cases.


