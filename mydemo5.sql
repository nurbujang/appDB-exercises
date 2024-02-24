show databases;
use lab5;
show tables;
describe car;
describe person;
show create table car;
show create table person;


describe person;
insert into person (name, age, sex, isStudent) values ("John", 23, "M", true);
select * from person;


insert into person (name, age) value ("Molly", 24);
select * from person;


insert into person (name, sex, isStudent) values ("Ray", "M", 1);
select * from person;



update person 
set age=age+1;
select * from person;
update person set age=18 where age=null;

update person set age = 
case when age is null then 18
else age + 1
end;
select * from person;



select * from car;
update car set make="Ford Motor Company"
where  make="Ford";
select * from car;




select * from car order by mileage;
delete from car where mileage > 150000 
and colour="Silver"
or  colour="Green";
select * from car;

select * from car order by mileage;
delete from car where mileage > 150000 
and (colour="Silver" or  colour="Green");
select * from car;






show databases;
use lab5p2;
show tables;
describe bus;
describe driver;
show create table bus;
show create table driver;

select * from bus;
select * from driver;
delete from bus where reg="191-G-123";



select max(age) from driver;
select name from driver 
where age= (select max(age) from driver);




select min(age) from driver;
select * from driver
where age= (select min(age) from driver);

select min(age) from driver;
select busreg from driver 
where age= 32;

select min(age) from driver;
select busreg from driver 
where age= (select min(age) from driver);

select * from bus where reg="12-G-1323";
select * from bus where reg=(
select busreg from driver 
where age= (select min(age) from driver)
);

insert into driver (licenceNo, name, age, busReg) values ("X1", "Jim", 32, "162-D-9999");

select * from bus;
insert into bus (reg) values ("162-D-9999");
select * from bus;
insert into driver (licenceNo, name, age, busReg) values ("X1", "Jim", 32, "162-D-9999");
select * from driver;

select * from bus where reg=(
select busreg from driver 
where age= (select min(age) from driver)
);

select busreg from driver 
where age= (select min(age) from driver);

select * from bus where reg IN (
select busreg from driver 
where age= (select min(age) from driver)
);


insert into driver (licenceNo, name, age, busReg) values ("X2", "Jon", 32, "162-D-3433");
select * from driver;

select * from bus where reg=(
select busreg from driver 
where age= (select min(age) from driver)
);

select busreg from driver 
where age= (select min(age) from driver);

select * from bus where reg IN (
select busreg from driver 
where age= (select min(age) from driver)
);





select * from bus;
select * from driver;

select reg from bus where fuel="Diesel";
select licenceno from driver where busreg in("161-D-1323", "191-G-123", "162-D-9999");

select licenceno from driver where busreg in (select reg from bus where fuel="Diesel");

select d.licenceno from driver d 
inner join bus b
on d.busreg = b.reg
where b.fuel="Diesel";
