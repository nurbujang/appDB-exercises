show databases;
use hospital;
show tables;

describe doctor_table;
describe patient_table;

show create table doctor_table;
show create table patient_table;

select * from doctor_table;
select * from patient_table;



select name from doctor_table;
select substr("Dr. Jones",5);
select substr(name,5) from doctor_table;



select pt.*, dt.*
from patient_table pt
inner join doctor_table dt
on pt.doctorID = dt.doctorID;

select pt.*, dt.name, dt.phone
from patient_table pt
inner join doctor_table dt
on pt.doctorID = dt.doctorID;




select dt.name, dt.phone, pt.ppsn, pt.first_name, pt.surname
from doctor_table dt
inner join patient_table pt
on dt.doctorID = pt.doctorID
where dt.name = "Dr. Jones"
order by pt.surname;




select pt.*, dt.*
from doctor_table dt
inner join patient_table pt
on dt.doctorID = pt.doctorID;

select dt.name
from doctor_table dt
inner join patient_table pt
on dt.doctorID = pt.doctorID;

select distinct(dt.name) 
from doctor_table dt
inner join patient_table pt
on dt.doctorID = pt.doctorID;




select ppsn, surname from patient_table where doctorID is null;




select pt.ppsn, pt.first_name, pt.surname where first_name="Alan", last_name="Mulligan";




select ppsn, first_name, surname, doctorid
from patient_table
where first_name="Alan" and surname="Mulligan";

select pt.ppsn, pt.first_name, pt.surname, dt.name, dt.phone
from patient_table pt
inner join doctor_table dt
on pt.doctorID = dt.doctorID
where first_name="Alan" and surname="Mulligan";

select ppsn, first_name, surname, name, phone
from patient_table
inner join doctor_table
on patient_table.doctorID = doctor_table.doctorID
where first_name="Alan" and surname="Mulligan";




select dt.*, pt.surname
from doctor_table dt
inner join patient_table pt
on dt.doctorID = pt.doctorID
order by dt.name,pt.surname;

select dt.*, pt.surname
from doctor_table dt
left join patient_table pt
on dt.doctorID = pt.doctorID
order by dt.name,pt.surname;

select dt.*, pt.surname
from doctor_table dt
left join patient_table pt
on pt.doctorID = dt.doctorID
order by dt.name,pt.surname;





select pt.ppsn, pt.first_name, pt.surname, dt.name, dt.phone
from patient_table pt
inner join doctor_table dt
on pt.doctorID = dt.doctorID;

select * from patient_table;

select pt.ppsn, pt.first_name, pt.surname, dt.name, dt.phone
from patient_table pt
left join doctor_table dt
on pt.doctorID = dt.doctorID;



