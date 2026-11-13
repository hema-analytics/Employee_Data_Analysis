CREATE DATABASE employee_analysis;
USE employee_analysis;
show tables;
select * from employee;
rename table employee_data_cleaned to employee;

# display total number of employees
select count(*) as Total_Employees
from employee;

# Display all departments
select distinct Department
from employee;

# Find avg salary
select round(avg(SalaryINR),2) as Average_Salary
from employee;

# find highest and lowest salary
select 
max(SalaryINR) as Highest_Salary,
min(SalaryINR) AS Lowest_Salary
from employee;

# employee count in each department
select Department,count(*) as Total_Employees
from employee
group by Department;

# avg salary in each department
select Department,round(AVG(SalaryINR),2) AS Average_Salary
from employee
group by Department;

# Highest Salary in each department
select Department,max(SalaryINR) AS Highest_Salary
from employee
group by Department;

# Departments with more than 50 employees
select Department,count(*) as Total_Employees
from employee
group by Department
having count(*)>50;

# Department-Wise average experience
select Department,round(avg(ExperienceYears),2) as Average_Experience
from employee
group by Department;

# top 10 highest paid
select EmployeeID,EmployeeName,Department,SalaryINR
from employee
order by SalaryINR DESC
LIMIT 10;

SHOW tables;

# employee distribution by location
select Location,count(*) as Total_Employees
from employee
group by Location
order by Total_Employees desc;

# Attrition analysis
select attrition,count(*) as Employee_count
from employee
group by attrition;

# Department wise attrition
select department,count(*) as total_employees,
sum(case when attrition = 'Yes' then 1 else 0 end) as employees_left,
round(sum(case when attrition = 'yes' then 1 else 0 end)*100.0/count(*),2) as attrition_rate
from employee
group by department
order by attrition_rate desc;

# overtime analysis
select overtime,count(*) as employee_count
from employee
group by overtime;

# department wise performance
select department,round(avg(PerformanceRating),2)as avg_rating,
count(*) as total_employees
from employee
group by department
order by avg_rating desc;

# Salary ranking using window functions
# rank employees based on salary within each department
select employeename,department,salaryinr,
dense_rank() over(
partition by department 
order by salaryinr desc
) as salary_rank
from employee;

