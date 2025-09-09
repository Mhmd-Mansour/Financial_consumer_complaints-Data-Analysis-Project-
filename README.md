Executive Summary
This project uses SQL to analyze financial consumer complaints submitted to the Consumer Financial Protection Bureau (CFPB) for Bank of America. The objective is to clean the raw data, identify key trends related to products and issues, and provide actionable insights that can help the business improve its customer service and reduce complaint volumes.

Business Problem
A bank needs to understand the nature of consumer complaints to improve its operations and enhance customer satisfaction. The analysis seeks to answer key questions, including:

What are the top products and issues that generate the most complaints?

What are the trends in complaint volume over time?

Are there any seasonal patterns in complaints?

Which states have the highest volume of complaints?

What can be learned from the complaints that receive untimely responses?

Results & Business Recommendations
The analysis was performed using SQL, with a focus on data cleaning, aggregation, and trend analysis. Key findings and their corresponding business recommendations are as follows:

Complaint Trends: The number of complaints shows clear seasonal patterns, with volumes peaking in summer months and dropping in winter.

Recommendation: Proactively allocate customer service resources during peak complaint seasons to manage the higher volume of inquiries and reduce response times.

Top Products and Issues: The most complained-about products are Checking or savings account and Credit card or prepaid card. A common issue across products is Managing an account, which frequently appears in untimely responses.

Recommendation: Conduct a deeper investigation into the 'Managing an account' issue to identify specific pain points. Improving the customer experience in this area could significantly reduce overall complaints.

Untimely Responses: The analysis of untimely responses revealed that they are most common for Checking or savings account products.

Recommendation: Investigate the operational reasons behind untimely responses, especially for the products that receive the most complaints. Improving response time could enhance customer satisfaction and prevent escalations.

Project Structure
Financial_consumer_complaints SQL.sql: The SQL script containing all the queries for data cleaning, analysis, and reporting.

How to Run the Project
Connect to your SQL database.

Import the consumer_complaints dataset.

Execute the queries in the Financial_consumer_complaints SQL.sql file.
