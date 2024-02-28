show databases;
use bus;
show tables;

describe bus;
describe driver;

show create table bus;
show create table driver;



select * from driver;
insert into driver (name) value ("Mary");
select * from driver;

insert into driver (name, licenceno) values ("Bob", "RN2423");
select * from driver;

insert into driver (name, licenceno, busreg) values ("Sean", "FF88345", "191-G-123");
select * from driver;




select * from bus;
insert into bus values ("12-G-1323", 34, "Diesel");
select * from bus;

insert into bus values ("171-G-885", 84, "Petrol");
select * from bus;

insert into bus values ("191-D-45890", 120, "Ethanol");
select * from bus;



select * from driver;
update driver set licenceno = concat("T-", licenceno) 
where licenceno like "%F%" or licenceno like "%R%";
select * from driver;



delete from driver where name="Alan";
select * from driver;




delete from bus where reg="161-D-1323";
select * from bus;
select * from driver;



use bus2;
show tables;

describe bus;
describe driver;

show create table bus;
show create table driver;

select * from bus;
select * from driver;
delete from bus where reg="161-d-1323";
select * from bus;
select * from driver;




use employees2;
show tables;

describe dept;
describe employees;
describe salaries;

show create table dept;
show create table employees;
show create table salaries;

select * from dept;
select * from employees;
select * from salaries;



select avg(year(birth_date)) from employees;
select floor(avg(year(birth_date))) from employees;
select emp_no, first_name, last_name from employees
where year(birth_date) = (select floor(avg(year(birth_date))) from employees);




describe dept;
show create table dept;
show create table employees;
show create table salaries;

select e.emp_no, e.first_name, e.last_name, d.name
from employees e
inner join salaries s
	on e.emp_no = s.emp_no
inner join dept d
	on s.dept_no = d.dept_no;
    
select distinct e.emp_no, e.first_name, e.last_name, d.name
from employees e
inner join salaries s
	on e.emp_no = s.emp_no
inner join dept d
	on s.dept_no = d.dept_no;
    
select * from salaries where emp_no=10100;
select * from dept where dept_no = "S403";
select * from employees where emp_no=10100;

select * from employees where emp_no=10034;
select * from salaries where emp_no=10034;
select * from dept where dept_no = "rd332";

    
