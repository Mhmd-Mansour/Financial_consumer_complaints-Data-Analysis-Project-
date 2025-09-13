Executive Summary

This project uses SQL to analyze financial consumer complaints submitted to the Consumer Financial Protection Bureau (CFPB) for Bank of America. The objective is to clean the raw data, identify key trends related to products and issues, and provide actionable insights that can help the business improve its customer service and reduce complaint volumes.
________________________________________

Business Problem

A bank needs to understand the nature of consumer complaints to improve its operations and enhance customer satisfaction. The analysis seeks to answer key questions, including:

1- What are the top products and issues that generate the most complaints?

2- What are the trends in complaint volume over time?

3- Are there any seasonal patterns in complaints?

4- Which states have the highest volume of complaints?

5- What can be learned from the complaints that receive untimely responses?
________________________________________

Results & Business Recommendations

The analysis was performed using SQL, with a focus on data cleaning, aggregation, and trend analysis. Key findings and their corresponding business recommendations are as follows:

1- Complaint Trends: The number of complaints shows clear seasonal patterns, with volumes peaking in summer months and dropping in winter.

Recommendation: Proactively allocate customer service resources during peak complaint seasons to manage the higher volume of inquiries and reduce response times.

<img width="638" height="353" alt="2" src="https://github.com/user-attachments/assets/a0171c88-313a-48ef-b18a-025b9a5f00ca" />


2- Top Products and Issues: The most complained-about products are Checking or savings account and Credit card or prepaid card. A common issue across products is Managing an account, which frequently appears in untimely responses.

Recommendation: Conduct a deeper investigation into the 'Managing an account' issue to identify specific pain points. Improving the customer experience in this area could significantly reduce overall complaints.

<img width="914" height="335" alt="1" src="https://github.com/user-attachments/assets/d9c58c13-3e67-4db7-888c-db6ea091aab5" />


3- Untimely Responses: The analysis of untimely responses revealed that they are most common for Checking or savings account products.

Recommendation: Investigate the operational reasons behind untimely responses, especially for the products that receive the most complaints. Improving response time could enhance customer satisfaction and prevent escalations.

<img width="893" height="334" alt="3" src="https://github.com/user-attachments/assets/595efb22-cb24-44bc-a11b-974ff6d6918b" />


________________________________________

Project Structure

Financial_consumer_complaints SQL.sql: The SQL script containing all the queries for data cleaning, analysis, and reporting.
________________________________________

How to Run the Project
Connect to your SQL database.

Date source: https://app.mavenanalytics.io/datasets

Import the consumer_complaints dataset.

Execute the queries in the Financial_consumer_complaints SQL.sql file.
