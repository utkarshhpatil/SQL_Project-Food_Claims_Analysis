# Analysis insights

Original data contains 2000 Rows and 8 Columns in the database of food_claims_2212. After validation, 2000 rows remain as it is (Due to claim_id column contains 2000 unique values). I found following description for each column:

claim_id : There were total 2000 rows, each Row is unique and no missing values, as expected

time_to_close: There are total 256 different type of number of days to close the the claim. time needed to close claim - Minimum time 76 days, Median time = 179 days, Maximum time = 518 days. All values were positive and No missing value observed.

claim_amount: Data type was varchar.It should be float or numeric. It is in currency symbol. It contains Minimum amount = 1637.94, Median amount = 24821.08, Maximum amount = 76106.8 All values rounded to 2 decimal and no missing values observed.

amount_paid: Data type was varchar. It Should be float or numeric. There were total 36 rows of missing values. All missing values removed and replaced with overall median amount paid, that was 20105.70. Brazil currency not observed in column. It contains - Minimum amount = 1516.72, Median amount = 20105.70, Maximum amount = 52498.75

location: There are only four locations RECIFE, SAO LUIS, FORTALEZA, AND NATAL as expected. No missing values observed.

individuals_on_claim: Number of individuals on claim ranges from 1 person to 15 persons. No missing values observed.

linked_cases: There were 26 rows of missing values. I replaced it with False. There are 481 TRUE rows which means that 481 number of claims are linked to other cases.

cause : It shows five types of category 'meat', ' Meat', 'unknown', 'vegetable', 'VEGETABLES'. As we need only 3 categories in lower cases, hence I removed white space from ' Meat', removed 'S' letter from 'VEGETABLES' and made both to lower case.


>>Observations of the variable location across categories

  According to the bar graph, Recife has the highest number of observations, with 885 cases, compared to the other three locations. Sao Luis has the second highest number of observations, with 517 cases.

  Recife's observations are more than three times higher than Natal, which has 287 observations, and more than 2.5 times higher than Fortaleza, which has 311 observations. Observations of Sao Luis are approximately double those of Natal and 1.5 times more than Fortaleza's observations.

  Based on the graph, we can conclude that the Head of the legal team needs to pay more attention to Recife and Sao Luis locations. These locations have a higher number of claims, and it may require more time to close these claims.
  
>>Analysis of the distribution of time to close for all claims:

  To understand the time it takes to close a claim, we can examine the distribution of days. By looking at the histogram and table visualization, we can gather insights regarding the minimum, maximum, mean, and median time to close claims across different locations.

  The histogram reveals that the peak of the distribution falls within the range of 170 to 200 days. Days above 350 are considered outliers. The distribution appears to be right-skewed, indicating that there are relatively fewer claims taking longer to close.

  Notably, Natal has the shortest minimum time to close among the locations, with only 361 days. The mean and median time to close, across all locations, are approximately 185 and 179 days, respectively. The minimum and maximum time to close claims are 76 and 518 days, respectively.

  Interestingly, Natal has a relatively low number of claims but a higher mean time to close, while Sao Luis has a high number of claims but a relatively low mean time to close. On the other hand, Recife has the highest number of claims but the lowest median time to close.

  Overall, it can be observed that claims typically require around 175 to 188 days to be closed, based on the distribution. However, it's important to note that there is no clear relationship between the number of claims and the time it takes to close them.
  
>>Analysis of the relationship between time to close and location:

  To understand how the time to close claims varies across different locations, we can examine the percentile distribution. The percentile distribution provides insights into the first quartile, third quartile, median, and interquartile range for each location.

  From the percentile distribution, it can be observed that the first quartile, third quartile, median, and interquartile range are approximately the same for all locations. This suggests that the distribution of time to close claims is similar across locations. The average time to close claims is also approximately the same for all locations.

  Around 75 percent of the time to close claims, across all locations, falls below 210 days. The majority of the data lies below 300 days for all locations. Any data points above 300 days are considered outliers.

  Interestingly, despite differences in the number of claims among locations (with Recife and Sao Luis having a high number of claims), the values depicted in the percentile distribution are relatively similar for all locations. This suggests that the time to close claims does not significantly vary based on location.

  Overall, the analysis indicates that the time to close claims is consistent across different locations, with the majority of claims being resolved within 210 days and the presence of outliers beyond 300 days.


