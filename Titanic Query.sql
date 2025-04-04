create database learn2;
use learn2;
select * from titanic;

-- how many total records
select count(*) from titanic;

-- find the count of distinct names in the dataset
select distinct(name) from titanic;
select count(distinct(name)) from titanic;

-- sort passengers by fare in descending order and find top five
select * from titanic order by fare desc limit 5;

-- find the 2nd highest Fare 
select * from titanic order by fare desc limit 1 offset 1;
select * from titanic order by fare desc limit 1, 1;
SELECT distinct(fare) from titanic order by fare desc limit 1 offset 1;
-- OFFSET (give me one row after leaving 3 rows)

-- Give me one row after leaving 3 rows
select * from titanic order by fare desc limit 1 offset 3;

-- OPERATORS

select 5+5; -- addition 
select 10-5; -- subtract
select 10*2; -- multiply
select 12/6; -- divide
Select 11%2; -- module operator (remainder)
select 5&3; -- Bitwise Operator
select 5|2; -- OR 
select 5^3; -- Exor Operator
select 5=5; -- Equality Operator
select 5 != 5;
select 5<>5; -- Not Equal
select 10<3; -- 
select 5 and 6; -- Logical Operators 

-- find the sum of passenger fare and an additional tax of 5

select * from titanic;
select name, fare, (fare + 5) as fare_with_tax from titanic;

-- give a discount of 5 to passengers
select name, fare, (fare - 5) as fare_with_disc from titanic; 

-- double the fare of 1st class passengers
select * from titanic where pclass = 1;
select name, fare, fare*2 from titanic where pclass =1;

-- find the no. of female passemngers
select * from titanic where sex = 'female';
select count(distinct(name)) from titanic where sex = "female";

-- find the female passengers who are from pclass 1
select count(distinct(name)) from titanic where sex = "female" and pclass = 1;

-- find the no. of female passengers who are not from pclass 3
select count(distinct(name)) from titanic where sex = "female" and pclass != 2;

-- find the passengers who are male and older than 30
select * from titanic;
select count(distinct(name)) from titanic where sex = "male" and age > 30;

-- find the no. of passengers who are between age 20 and 40
select * from titanic where age between 20 and 40;
select count(distinct(name)) from titanic where age between 20 and 40;

-- ALL OPERATOR

-- find passengers whose fare is greater than all recorded fares for 3rd Pclass
select * from titanic where fare > (select max(fare) from titanic where pclass = 3);

select * from titanic where fare > all (select (fare) from titanic where pclass = 3);

select (fare) from titanic where pclass = 3;

-- find passengers who are not in 1st class 
select * from titanic where not pclass = 1;

-- find passengers who are either female or from 1st class
select * from titanic where sex = "female" or pclass = 1;

-- find passengers whose age is not recorded
select * from titanic where age is null;

-- find passengers who are on titanic and have a non null age
select * from titanic where age is not null;
select * from titanic where exists (select age from titanic where age is not null);

-- find the passenger whose name starts with "c" 
select * from titanic;
select * from titanic where name like 'c%'; -- % any charachter starts with C 

-- exact results
select * from titanic where name like 'Cann, Mr. Ernest Charles';

-- find the passengers whose name doesn't start with C
select * from titanic where name not like 'C';

-- REGXP - regular expression -- used for matchiung text with a pattern
-- find the passengers whose name starts with A or begin
select * from titanic where name regexp  '^[AB]'; -- ^ start of string 

-- find the passengers which contains Dr in it
select * from titanic where name regexp 'Dr\.'; -- \. either start or end

-- find the name that ends with 'aina'
select * from titanic where name regexp  'aina$'; -- $ matches the end of string

-- find the names with double vowels 
select * from titanic where name regexp  '^[aeiou]{2}'; -- {occurance}

-- add the survival status with the name 
select * from titanic;

select name, survived, concat(name, '>> survived ', survived) as summary
from titanic; 

-- convert the name to uppercase 
select * from titanic;
select upper(name) from titanic;

-- convert the name to lower case 
SELECT lower(NAME) from titanic;

-- replace mr. with sir in the name 
SELECT NAME, replace(NAME, 'Mr.' , 'Sir') from titanic;

-- find passengers in 1 or 2 class
select * from titanic where pclass in (1, 2);