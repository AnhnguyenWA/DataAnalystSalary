## Data Analytic Jobs Salaries 2020-2023

The advent of big data and the growing importance of data-driven strategies across industries have made data analysis an increasingly critical function. Hence, this project aims to analyze and understand the salary trends for Data Analyst positions over the past few years, a period marked by significant economic and technological shifts.

## Source
For this project, the dataset was sourced from AI Jobs, a reputable online platform that aggregates job listings and salary information in the AI and data analytics sector. This source was selected for its comprehensive and up-to-date data, which is critical for ensuring the accuracy and relevance of the study's findings. The dataset encompasses a range of data points, including job titles, salary figures, locations, and other relevant information, providing a rich foundation for analysis.

## SQL
To begin the exploration of the "Data Analytic Jobs Salaries 2020-2023" dataset, the first step was importing the CSV file into a MySQL database. This process involved several key steps:

  -Creation of a Database and Table: A MySQL database named ds_salaries was created. Within this database, a table of salaries was defined with columns corresponding to the data fields in the CSV file, such as job_title, salary, location, year, etc.

  -Data Import: Using MySQL's LOAD DATA INFILE command, the CSV file was imported into the salaries table. This process required careful handling of data types and ensuring that the CSV's structure matched the table schema.

  -Data Verification: Post-import, a few simple SELECT queries were executed to verify the integrity and correctness of the imported data.

**Initial SQL Queries for Exploratory Analysis -**
With the data securely housed in the MySQL database, the exploratory analysis commenced. The initial queries focused on understanding the overall structure and distribution of the data. Examples include:

  -Counting the number of entries per year to assess data completeness.

  -Using GROUP BY with AVG() and MEDIAN() functions to analyze average and median salaries across different years.

**Focused Exploration on Data Analyst Salaries -**
The core of this project revolved around analyzing the salary trends specifically for Data Analyst roles. The following SQL queries were central to this analysis:

  -Filtering Data Analyst Positions: A query was constructed to filter out only those entries where job_title matched various iterations of "Data Analyst" roles. This was crucial for ensuring the analysis specifically targeted the intended job category.

  -Yearly Salary Trends for Data Analysts: This involved writing queries to calculate the average and median salaries for Data Analysts for each year from 2020 to 2023, providing insight into how salaries evolved over this period.

  -Regional Salary Comparisons: Additional queries were executed to compare salaries for Data Analysts across different locations, highlighting regional disparities or consistencies.

  -Correlating Experience with Salary: If data on experience levels were available, queries were used to analyze how salaries for Data Analyst positions correlated with different experience levels.

## Power BI
The next phase involved transitioning from SQL data exploration to visualizing the insights in Power BI. This was achieved by connecting Power BI to the MySQL database. To enhance interactivity and user engagement, slicers were utilized extensively in the Power BI dashboard. These slicers allowed for dynamic filtering of data across various dimensions such as year, job title, firm size, and region. The integration of slicers ensured that users could customize the data views to their specific interests or queries.

**Key Visualizations**
Several key visualizations were created to represent the data effectively:

  -Average Salary: This visualization presents a concise display of the average salary for a selected job title, year, country, and employment type. The number card dynamically updates to reflect the average salary based on the filters applied using slicers.

  -Jobs by Salary: This chart illustrates the distribution of job counts within specific salary ranges for selected fields. It allows users to see the number of jobs available in each salary bracket.

  -Total Jobs: The donut chart displays the total number of jobs for various job titles, with an emphasis on roles like Data Analyst. It provides a visual breakdown of job market distribution among different titles.

![Screenshot 2024-01-15 155621](https://github.com/AnhnguyenWA/DataAnalystSalary/assets/155875728/883b849f-f439-49de-a7d5-30a920412785)

