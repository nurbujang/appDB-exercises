show databases;
use school;
show tables;
describe subject;
describe teacher;

select * from subject;
select name from subject where onleavingcert=1;
select name from subject where onleavingcert!=0;
select name from subject where onleavingcert=True;

select * from teacher;
select name, experience from teacher where level="L";

select * from subject;
select * from subject where teacher not like "Mr.%";
select * from subject where teacher like "Ms.%" or teacher like "Fr.%";

select * from teacher;
select * from teacher where month(dob)=1, month(dob)=2, month(dob)=3 and level="J";
select * from teacher where (month(dob)=1 or month(dob)=2 or month(dob)=3) and level="J";
select * from teacher where month(dob) between 1 and 3 and level="J";

select distinct month(dob) from teacher;
select distinct monthname(dob) from teacher;

select * from teacher;
select * from teacher order by experience, level;

select * from subject;
select * from subject where name like "__l%" or name like "___l%" order by name; 

select * from teacher;
select * from teacher where experience in (10,15,20,25,30,35,40,45,50,55,60) order by dob desc;
