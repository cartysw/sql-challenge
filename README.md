Hello!

This is a repository for the Module 9 SQL Challenge for the U of M Data Analytics Bootcamp Course.

The goals were to perform some data modeling, data engineering, and data analysis. More specifically, we needed to:

  - Create an ERD to plan out the project
  - Use that ERD to create a Schema

Here's a picture of the ERD:
![sql_challenge_ERD](https://github.com/user-attachments/assets/c7173706-ce61-410a-9f88-99d620230247)


Finally, we had to create a script for the exploratory data analysis mentioned above. The requirements were to:

  - List basic categorical info for all employees in the company
  - List the first name, last name, and the hire date for employees that were hired in 1986
  - List the manager of each department in the company and some basic identity info about them
  - List basic categorical info for each employee while also looking up their respective department numbers
  - List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
  - Look up every employee working in the Sales department, and show basic categorical info
  - Look up every employee working in the Sales or Development department, and show basic categorical info
  - List a count of how common each employee's last name is (basically how many employees share each last name)



Program Execution Instructions:

  - Download the schema, query, and data files
  - Load pgAdmin 4 (this is what was used to develop this project)
  - Create database for use with this project
  - Open a query tool, load the schema file into it, and run it
  - Load the data files into the tables that the schema file created, in the order that they were created
  - Open a new query tool in the database, load the query script, and execute the individual sections of it at your discretion



I hope the analysis provided here proves to be insightful and helpful!



The ERD diagram was created using the Quick Database Diagrams website. The schema file was generated using the export function of the program. All credits for the usage of that website/program, including the function to export the diagram into a schema file and format said file belong to the designers of it. Check out the website here: https://app.quickdatabasediagrams.com



Some additional references were used during the development of this project:

Had issues with table names conflicting with references, so I got help from XPert Learning Assistant through the bootcamp course. This is the prompt I used:
im working with postgres sql and i keep getting this error: ERROR: relation "employees" does not exist LINE 1: SELECT * FROM Employees;

Referenced this for the AND and OR operators syntax:
https://www.w3schools.com/sql/sql_and.asp

Referenced this for JOIN function syntax:
https://www.geeksforgeeks.org/sql-join-set-1-inner-left-right-and-full-joins/
