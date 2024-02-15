show databases;
use lab1;
show tables;

select * from person;
select * from person limit 3;
select * from person order by dob;
select min(dob) from person;

select month(dob) from person;
select max(month(dob)) from person;

select * from person where sex="F";
select age from person where sex="F";
select avg(age) from person where sex="F";
select round(avg(age)) from person where sex="F";

select monthname(dob) from person;
select count(monthname(dob)) from person;
select monthname(dob), count(*) from person group by monthname(dob);

select * from person where sex="M" and age>=20;
select age from person where sex="M" and age>=20;
select avg(age) from person where sex="M" and age>=20;

select name, dob from person;
select name, date_format(dob, "%a") from person;
select name, date_format(dob, "%a,") from person;
select name, date_format(dob, "%a, %b %D '%y") from person;

select * from car;
select max(mileage) from car;
select max(mileage) from car group by make;
select format(max(mileage),0) from car group by make;

select * from car;
select *, if(mileage>100000,"50%","") from car;
select *, if(mileage>100000,"50%","") as Discount from car;

select registration as reg, make, model, colour as color, mileage as km, enginesize from car;

select *, (case when enginesize <=1.0 then "Small" when enginesize between 1.1 and 1.3 then "Medium" when enginesize > 1.3 then "Large" end) as Size from car;
select *, 
case 
when enginesize <=1.0 then "Small" 
when enginesize between 1.1 and 1.3 then "Medium" 
when enginesize > 1.3 then "Large" 
end as Size 
from car;

select * from person;
describe person;

delimiter //
create function st(a int(11), iss tinyint(1)) 
returns varchar(10)
deterministic
begin
if iss and a < 23 then
	return "Ordinary";
elseif iss and a >= 23 then
	return "Mature";
else
	return "";
end if;
end
//

select st(16,1)//
delimiter ;
select st(16,0);
select st(36,1);

select *, st(age, isstudent) from person;
select *, st(age, isstudent) as "Student Type" from person;







delimiter //
create procedure comp(c varchar(1), a int(11))
deterministic
begin
if (c = "<") then
	select * from person;
else
	select * from car;
end if;
end
//

call comp("<",3)//

call comp("g",3)//

drop procedure comp//

create procedure comp(c varchar(1), a int(11))
deterministic
begin
if (c = "<") then
	select * from person where age < a;
else
	select * from car;
end if;
end
//

call comp("g",3)//

call comp("<",39)//

drop procedure comp//

create procedure comp(c varchar(1), a int(11))
deterministic
begin
if (c = "<") then
	select * from person where age < a;
elseif (c= ">") then
	select * from person where age > a;
end if;
end
//

call comp(">",24)//

drop procedure comp//

create procedure comp(c varchar(1), a int(11))
deterministic
begin
if (c = "<") then
	select * from person where age < a;
elseif (c= ">") then
	select * from person where age > a;
else
	select * from person where age = a;
end if;
end
//

delimiter ;
call comp("=",14);

call comp("=",24);

call comp("<",24);

call comp("=",12);

call comp(">",127);

select * from person where age < 24;
select * from person where age > 24;
select * from person where age = 24;