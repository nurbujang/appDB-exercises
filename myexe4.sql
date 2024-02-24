show databases;
use garage;
show tables;
describe manufacturer;
describe vehicle;


show create table manufacturer;
show create table vehicle;




select * from manufacturer;
select manu_code, manu_name, substr(manu_details,1,10) from manufacturer;
select manu_code, manu_name, concat(substr(manu_details,1,20), "...") from manufacturer;



select length(manu_name) from manufacturer;
select avg(length(manu_name)) from manufacturer;
select format(avg(length(manu_name)),0) from manufacturer;
select format(avg(length(manu_name)),0) length from manufacturer;




select * from vehicle;
select *, if(fuel="petrol", 1.45, 1.30) as Cost from vehicle;




select v.reg, v.manu_code, m.manu_name from vehicle v
inner join manufacturer m 
on v.manu_code=m.manu_code;

select v.reg, v.manu_code, m.manu_name from vehicle v
left join manufacturer m 
on v.manu_code=m.manu_code;




select m.manu_code, m.manu_name, v.reg from manufacturer m 
inner join vehicle v
on v.manu_code=m.manu_code;




select m.manu_code, m.manu_name, v.reg from manufacturer m 
left join vehicle v
on m.manu_code=v.manu_code;





select * from vehicle where mileage < 30000;
select * from vehicle where price < 16000;
select * from vehicle where price < 10000;

select reg, manu_code, mileage, price from vehicle
where price < 10000;

select * from manufacturer;
select * from vehicle;

select v.reg, v.manu_code, m.manu_name, v.mileage, v.price from vehicle v
inner join manufacturer m
on v.manu_code=m.manu_code
where price < 10000
order by v.price;

delimiter //
create procedure price_less_than(p decimal(8,2))
deterministic
begin
select v.reg, v.manu_code, m.manu_name, v.mileage, v.price from vehicle v
inner join manufacturer m
on v.manu_code=m.manu_code
where v.price < p
order by v.price;
end
//
delimiter ;

call price_less_than(10000);
call price_less_than(8000);
call price_less_than(800000);