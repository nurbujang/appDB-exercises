show databases;
use employees;
show tables;
describe employees;
select * from employees limit 5;
describe salaries;
select * from salaries limit 20;

show create table employees;
show create table salaries;

select * from employees limit 1;
select * from salaries limit 1;



select * from employees limit 10;
select emp_no, first_name, upper(last_name) from employees limit 10;
select emp_no, first_name, upper(last_name) as last_name from employees limit 10;


select * from employees order by length(last_name), last_name;
select * from employees order by length(last_name), last_name, length(first_name);
select * from employees order by length(last_name), last_name, length(first_name), first_name;


select * from employees limit 10;
select substr("Georgi",1,1);
select substr(first_name,1,1) from employees limit 10;
select *, substr(first_name,1,1), substr(last_name,1,1) from employees limit 10;
select concat("Georgi","Facello");
select concat("Georgi","Facello","@gmit.ie");
select concat(first_name,last_name,"@gmit.ie") from employees limit 10;
select *, concat(substr(first_name,1,1), substr(last_name,1,1)) as initials from employees limit 10;


select * from employees where gender="F";
select * from employees where gender="F" and year(birth_date) between 1950 and 1959;
select * from employees where gender="F" 
and year(birth_date) between 1950 and 1959
and hire_date >="1988-09-01" and hire_date <="1991-02-28";


select format(avg(salary),0) from salaries;
select format(avg(salary),2) from salaries;


select * from salaries;
select emp_no, format(avg(salary),2) from salaries group by emp_no;


select emp_no, format(max(salary),2) from salaries group by emp_no;


select emp_no, format(avg(salary),2) from salaries 
where emp_no=10001 or emp_no=10021 or emp_no=10033 or emp_no=10087
group by emp_no;

select emp_no, format(avg(salary),2) from salaries 
where emp_no in(10001,10021,10033,10087)
and salary > 80000
group by emp_no;


select emp_no, format(avg(salary),0) from salaries 
group by emp_no
having avg(salary) >90000;


select emp_no as ID, first_name as Name, last_name as Surname, gender as Gender
from employees limit 15;

select if(1, "Mr.", "Ms.");
select if(0, "Mr.", "Ms.");
select emp_no as ID, 
if(gender="M","Mr.", "Ms.") as Title,
first_name as Name, last_name as Surname, gender as Gender
from employees limit 15;

select emp_no as ID, 
if(gender="M","Mr.", "Ms.") Title,
first_name as Name, last_name as Surname, gender as Gender
from employees limit 15;

select emp_no as ID, 
if(gender="F","Ms.", "Mr.") Title,
first_name as Name, last_name as Surname, gender as Gender
from employees limit 15;

select emp_no as ID, 
if(gender!="M","Ms.", "Mr.") Title,
first_name as Name, last_name as Surname, gender as Gender
from employees limit 15;


select emp_no, max(salary),
case 
when max(salary) < 40000 then "30%"
when max(salary) < 60000 then "40%"
when max(salary) < 80000 then "50%"
else "60%"
end as "Tax Bracket"
from salaries 
group by emp_no;

select * from employees limit 1;
select * from salaries limit 1;
select datediff("1987-06-26","1986-06-26");
select *,
if(datediff(to_date,from_date)<365, "Under 1yr","Over 1yr") as Time
from salaries;





select * from employees limit 1;
select datediff("1986-06-26","1953-09-02");
select format(datediff("1986-06-26","1953-09-02")/365,1) age;

delimiter //

create function getAge(hd date,db date)
returns varchar(5)
deterministic
begin
	return format(datediff(hd,db)/365,1);
end
//

delimiter ;
select getAge("1986-06-26","1953-09-02");

select *, getAge(hire_date,birth_date) as Age
from employees;

describe employees;
show create table employees;

delimiter //
create function getage(d1 date,d2 date)
returns float(5,1)
deterministic
begin
	return round(dateddiff(d2,d1)/365,1);
end
//

delimiter ;
select getage(birth_date,hire_date) as Age
from employees;








select * from employees limit 10;
select * from employees where year(hire_date)=1990;
select * from employees where year(hire_date)=1990 and month(hire_date)=1;

delimiter //
create procedure hires(y integer, m integer)
deterministic
begin
	select * from employees
    where year(hire_date)=y 
    and month(hire_date)=m;
end
//

delimiter ;
call hires(1990,1);
call hires(1994,2);


select * from employees where year(hire_date)=1990 and month(hire_date)=1;
select * from employees where year(hire_date)=1990;

delimiter //
create procedure hires2(y integer,m integer)
deterministic
begin
	select * from employees
    where year(hire_date)=y 
    and month(hire_date)=m;
end
//

delimiter ;
call hires2(1990,1);
call hires2(1990,null);

drop procedure hires2;

delimiter //
create procedure hires2(y integer,m integer)
deterministic
begin
	if M IS NULL THEN
		select * from employees
		where year(hire_date)=y;
	end if;
    if M IS NOT NULL THEN
		select * from employees
		where year(hire_date)=y 
		and month(hire_date)=m;
	end if;
end
//

delimiter ;
call hires2(1990,1);
call hires2(1990,null);


drop procedure hires2;

delimiter //
create procedure hires2(y integer,m integer)
deterministic
begin
	if M IS NULL THEN
		select * from employees
		where year(hire_date)=y;
	else
    	select * from employees
		where year(hire_date)=y 
		and month(hire_date)=m;
	end if;
end
//

delimiter ;
call hires2(1990,1);
call hires2(1990,null);
call hires2(1994,null);
call hires2(1994,9);









