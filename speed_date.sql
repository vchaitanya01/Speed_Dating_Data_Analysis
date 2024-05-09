-- Fetch minimum and maximum income according to their career

select career,min(income) over(partition by career order by career) as Minimum_income,
max(income) over(partition by career order by career) as Minimum_income
from Tb01 where not career='?' and not career='??'

-- Fetch gender, income, career and count of individuals according to their respective career

select gender,income,career, count(*)  over(partition by career) as Number_of_people from Tb01 
where income is not null order by Number_of_people

-- Fetch the age, career and average income according to their respective age

select age,career,avg(income) over(partition by age) as Average_income from Tb01 where income is not null

/* Fetch the average income, sum of the intelligence, count the number of individuals, 
minimum age and maxixmum age according to their career */

select career, avg(income) over(partition by career) Average_income,
sum(intelligence) over(partition by career) Total_intelligence,
count(*) over(partition by career) Number_of_people,
min(age) over(partition by career) Minimum_age,
max(age) over(partition by career) Maximum_age
from Tb01 where not career='?' and not career='??';

--find the rank  for like and sincerity

select [like],sincerity,
rank() over(order by [like]) as like_Rank,
rank() over(order by sincerity) as sincerity_Rank from Tb01
where [like] is not null and sincerity is not null

--find the dense rank  for like and sincerity

select [like],sincerity,
dense_rank() over(order by [like]) like_Rank,
dense_rank() over(order by sincerity) as sincerity_Rank from Tb01
where [like] is not null and sincerity is not null

-- Fetch row number, rank, dense rank and percent rank for  ambitious

select ambitiousnes,
row_number() over(order by  ambitiousnes) as Row_number,
rank() over(order by  ambitiousnes) as Rank,
dense_rank() over(order by  ambitiousnes) as Dense_rank,
percent_rank() over(order by  ambitiousnes) as percent_rank
from Tb01 where not ambitiousnes is null;

-- Find the first and last value of age with respect to career

select  career,age,
first_value(age) over(order by age) as First_value,
last_value(age) over(order by age) as last_value
from Tb01 where not age is null

-- Find the lead and lag values of age with respect to career

select  career,age,
lead(age) over(order by age) as lead_value,
lag(age) over(order by age) as lag_value
from Tb01 where not age is null 

-- Find the first value, last value, lead and lag of meeting with respect to career

select  career,mettings,
first_value(mettings) over(order by mettings) as First_value,
last_value(mettings) over(order by mettings) as last_value,
lead(mettings) over(order by mettings) as lead_value,
lag(mettings) over(order by mettings) as lag_value
from Tb01 where not mettings is null


