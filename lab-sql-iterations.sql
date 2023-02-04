use sakila;

-- Q1
select sum(amount), store_id from payment p
join staff s on p.staff_id = p.staff_id
group by store_id;

-- Q2
DELIMITER //
create procedure amount_() -- in x int,
begin
select sum(amount), store_id from payment p
join staff s on p.staff_id = p.staff_id
group by store_id;
end //
DELIMITER ;
call amount_();

-- Q3
DELIMITER //
create procedure amount_id(in param1 int) -- in x int,
begin
select sum(amount), store_id from payment p
join staff s on p.staff_id = p.staff_id
group by store_id
having store_id = param1;
end //
DELIMITER ;
call amount_id(1);

-- Q4
DELIMITER //
create procedure amount_id2(in param1 int) -- in x int,
begin
declare total_sales_value float default 0.0;
select sum(amount) into total_sales_value from payment p
join staff s on p.staff_id = p.staff_id
group by store_id
having store_id = param1;
select total_sales_value;
end //
DELIMITER ;
call amount_id2(2);

-- Q5
DELIMITER //
create procedure amount_id_flag(in param1 int) -- in x int,
begin
declare total_sales_value float default 0.0;
declare flag varchar(20) default "";
select sum(amount) into total_sales_value from payment p
join staff s on p.staff_id = p.staff_id
group by store_id
having store_id = param1;

case
    when total_sales_value > 30000 then
      set flag = 'green_flag';
    else
    set flag = 'red_flag';
  end case;

select total_sales_value,flag;

end //
DELIMITER ;
call amount_id_flag(1);








