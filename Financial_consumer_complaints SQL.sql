																				
                                                                                #### Preparing and Cleaning Data section ####

# give overview of the table:
select*
from consumer_complaints
;

# chick for Null and Empty in first column: 
SELECT `Complaint ID`, COUNT(*)
FROM consumer_complaints
GROUP BY `Complaint ID`
;

# chick for Null and Empty in second column: 
SELECT `Submitted via`, COUNT(*)
FROM consumer_complaints
GROUP BY `Submitted via`
;

# chick for Null and Empty in third column: 
SELECT `Date submitted`, COUNT(*)
FROM consumer_complaints
GROUP BY `Date submitted`
;

# chick for Null and Empty in forth column: 
SELECT `Date received`, COUNT(*)
FROM consumer_complaints
GROUP BY `Date received`
;

# chick for Null and Empty in fifth column: 
SELECT `State`, COUNT(*)
FROM consumer_complaints
GROUP BY `State`
;

# chick for Null and Empty in sixth column: 
SELECT `Product`, COUNT(*)
FROM consumer_complaints
GROUP BY `Product`
;

# chick for Null and Empty in siventh column:                          ######## there is an empty row #######
SELECT `Sub-product`, COUNT(*)
FROM consumer_complaints
GROUP BY `Sub-product`
;

# chick for Null and Empty in eighth column:                         
SELECT `Issue`, COUNT(*)
FROM consumer_complaints
GROUP BY `Issue`
;

# chick for Null and Empty in nighnth column:                         ######## there is an empty row #######
SELECT `Sub-issue`, COUNT(*)
FROM consumer_complaints
GROUP BY `Sub-issue`
;

# chick for Null and Empty in tenth column:                            ######## there is an empty row ######
SELECT `Company public response`, COUNT(*)
FROM consumer_complaints
GROUP BY `Company public response`
;

# chick for Null and Empty in eleventh column:                         
SELECT `Company response to consumer`, COUNT(*)
FROM consumer_complaints
GROUP BY `Company response to consumer`
;

# chick for Null and Empty in twilveth column:                         ######## there is an empty row #######
SELECT `Timely response?`, COUNT(*)
FROM consumer_complaints
GROUP BY `Timely response?`
;

SELECT `Sub-product`, `Sub-issue`, `Company public response`, `Timely response?`
FROM consumer_complaints
;

#-----------------------------------------------------------------------------------------------------------------#

### there are not NULL cells 
### there are missing data in 4 columns (Sub-product), (Sub-issue), (Company public response), (Timely response?)

### note ###
# in (Company response to consumer) column, mention (in progress), so i will complete columns (Timely response?) and (Company public response) with (in Progress).
# in (Sub-product) column and (Sub-issue) i will replace the empty cell with (Not applicable) columns, becouse i think there is not sub-issue or sub-product.

#--------------------------------------------------------------------------------------------------------------------------------------------------------#

select *
from consumer_complaints
;

## all empty cells have  'In progress' in (`Company response to consumer`) column
select `Company public response`, `Company response to consumer`, `Timely response?`
from consumer_complaints
where `Company response to consumer` = 'In progress'
;

## The count of (<> 'In progress') and (= 'In progress') = 62516 
SELECT COUNT(*)
FROM consumer_complaints
WHERE `Company response to consumer` <> 'In progress'
;
SELECT COUNT(*)
FROM consumer_complaints
WHERE `Company response to consumer` = 'In progress'
;
#-----------------------------------------------------------------------------------------------------------#
# First replace `Company public response`, `Timely response?` with ('In progress')

select
case 
when `Company public response` = ''
 then 'In progress'
else `Company public response`
end as `Company public response`,
case
when  `Timely response?` = ''
 then 'In progress'
else `Timely response?`
end as `Timely response?`
from consumer_complaints;				


-- Update Company public response
update consumer_complaints
set `Company public response` = 'In progress'
where `Company public response` = '';

-- Update Timely response?
update consumer_complaints
set `Timely response?` = 'In progress'
where `Timely response?` = '';

select *
from consumer_complaints
where `Company public response` = ''
and `Timely response?` = ''
;
#----------------------------------------------------------------------------------------------
# Second replace (Sub-product) column empty cells with (Not applicable)  
select *
from consumer_complaints
;

## Sub-product = to Product ('Checking or savings account')
select Product, `Sub-product`
from consumer_complaints
where `Sub-product` = ''
;

Update consumer_complaints
set `Sub-product` = 'Not applicable'
where `Sub-product` = ''
;
#------------------------------------------------------------------------------------------------------------------
# Third Issue and Sub-issue, update Sub-issue with (Not applicable)

select Issue, `Sub-issue`, count(`Sub-issue`), count(Issue)
from consumer_complaints
where `Sub-issue` = ''
group by Issue
order by count(`Sub-issue`) desc
;

update consumer_complaints
set `Sub-issue` = 'Not applicable'
where `Sub-issue` = '';


#--------------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------



																								## Data Analysis Section ##
                                                                                                
## Questions:
## 1- Do consumer complaints show any seasonal patterns?
## 2- Which products present the most complaints?
## 3- What are its most common issues?
## 4- How are complaints typically resolved?
## 5- Can you learn anything from the complaints with untimely responses?

#--------------------------------------------------------------------------------------------------------

## Question Number 1 

# --- 1- Do consumer complaints show any seasonal patterns?
### Monthly 
### The data suggests a possible seasonal pattern, with a higher number of complaints in the summer months (July, August, May, and June)
### and a lower number of complaints during the winter months (November, December, January, and February).

SELECT MONTHNAME(STR_TO_DATE(`Date submitted`, '%Y-%m-%d')) AS complaint_month, COUNT(*) AS complaint_month_count
FROM consumer_complaints
GROUP BY complaint_month
ORDER BY complaint_month_count DESC;

### Yearly
### the number of complaints has been generally rising but with some fluctuations, such as the drop from 2022 to 2023:
# 1- '2022', '12953'
# 2- '2021', '11149'
# 3- '2023', '9131'
SELECT year(`Date submitted`) AS complaint_year, COUNT(*) AS complaint_year_count
FROM consumer_complaints
GROUP BY complaint_year
ORDER BY complaint_year_count DESC;

###### Percentage of increase yearly ########
# in 2023, the complaints decresee 29.51 percente compare to 2022


WITH YearlyComplaints AS (
    SELECT YEAR(`Date submitted`) AS complaint_year, COUNT(*) AS complaint_count
    FROM consumer_complaints
    GROUP BY complaint_year
)
SELECT complaint_year, complaint_count,
    ROUND((complaint_count - LAG(complaint_count) OVER (ORDER BY complaint_year)) / LAG(complaint_count) 
    OVER (ORDER BY complaint_year) * 100, 2) AS percentage_increase
FROM YearlyComplaints
ORDER BY complaint_year;



#----------------------------------------------------------------------------------------------------------------
## Question Number 2

## 2- Which products present the most complaints? 

## the most products recived complaints are:
# 1-'Checking or savings account', '24814'
# 2- 'Credit card or prepaid card', '16197'
# 3- 'Credit reporting, credit repair services, or other personal consumer reports', '7710'
select `Product`, count(*) as complaint_count
from consumer_complaints
group by Product
order by complaint_count desc
;
# --------------------------------------------------------------------------------------------------------------------
## Question Number 3

## 3-What are its most common issues?

## the most product common issue is: 
# 1- 'Checking or savings account', 'Managing an account', '15109'
# 2- 'Credit card or prepaid card', 'Problem with a purchase shown on your statement', '4415'
# 3- 'Credit reporting, credit repair services, or other personal consumer reports', 'Incorrect information on your report', '4145'
select product, Issue, count(*) as issue_count
from consumer_complaints
group by product, Issue
order by issue_count desc
;
#---------------------------------------------------------------------------------------------------------------------------------
## Question Number 4

## 4- How are complaints typically resolved?

## The most ways complaints resoved are by:
# 1- 'Closed with explanation', '41044'
# 2- 'Closed with monetary relief', '14697'
# 3- 'Closed with non-monetary relief', '5273'

select `Company response to consumer`, count(*) as resolution_count
from consumer_complaints
group by `Company response to consumer`
order by resolution_count desc
;
#------------------------------------------------------------------------------------------------------------------
## Question Number 5

## 5- Can you learn anything from the complaints with untimely responses?

# * Volume of Untimely Complaints by Product
	### the top three untimely responses complaints by products:
		# 1-'Checking or savings account', '867'
		# 2-'Credit card or prepaid card', '689'
		# 3-'Credit reporting, credit repair services, or other personal consumer reports', '475'

select `Product`, count(*) as untimely_count
from consumer_complaints
where `Timely response?` = 'No'
group by `Product`
order by untimely_count desc
;


# * Common Issues in Untimely Complaints
## the top three untimely repsonese complaints by products and issues:
#1-'Checking or savings account', 'Managing an account', '497'
#2-'Credit reporting, credit repair services, or other personal consumer reports', 'Incorrect information on your report', '296'
#3-'Credit card or prepaid card', 'Problem with a purchase shown on your statement', '197'

select `Product`, `Issue`, count(*) as issue_count
from consumer_complaints
where `Timely response?` = 'No'
group by `Product`, `Issue`
order by issue_count desc
;

# Resolution Types for Untimely Complaints
# the top 3 untimely complaints resolution are:
#1-'Closed with explanation', '1527'
#2-'Closed with monetary relief', '690'
#3-'Closed with non-monetary relief', '178'

select `Company response to consumer`, count(*) as count 
from consumer_complaints
where `Timely response?` = 'No'
group by `Company response to consumer`
order by count desc
;

