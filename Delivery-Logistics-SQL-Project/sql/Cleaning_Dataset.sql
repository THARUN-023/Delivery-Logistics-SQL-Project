select driver_id 
from DRIVERS
group by DRIVER_ID
HAVING count(*) > 1;

delete from DRIVERS
where ROWID in(
    select row_id from(
        select ROWID as row_id, row_number() over(partition by driver_id order by ROWID)as Rank_id
        from DRIVERS
    )
    where Rank_id >1
);
commit;

select * from drivers;

select driver_id, driver_name, gender, age, city, joining_date, rating
from DRIVERS
group by driver_id, driver_name, gender, age, city, joining_date, rating
HAVING count(*) > 1;

select * from DRIVERS
where gender is null;

update DRIVERS
set gender = 'Unknow'
where gender is null;

commit;

select * from drivers
where  age is null;

select * from drivers
where age < 0;

update drivers
set age = Null
where age < 0;

commit;

select * from DRIVERS
where rating < 0 or rating > 5;

update DRIVERS
set rating = Null
where rating < 0 or rating > 5;

select * from drivers
where gender is null or age is null or rating is null;

select * from drivers;

select vehicle_id,count(*)
from VEHICLES
group by vehicle_id 
HAVING count(*)>1;

select * from vehicles;

delete from VEHICLES
where ROWID in(
    select row_id from(
        select ROWID as row_id, ROW_NUMBER()over(partition by vehicle_id order by ROWID) as Rank_id
        from VEHICLES
    )
    where Rank_id>1
);

select * from VEHICLES;

select * from VEHICLES
where capacity <=0;

update VEHICLES
set capacity = Null
where capacity <=0;

SELECT vehicle_id, driver_id, vehicle_type,vehicle_model, fuel_type, capacity
from VEHICLES
where vehicle_id is null or driver_id is null or vehicle_model is null or fuel_type is null or capacity is null or vehicle_type is null;


select delivery_id, count(*)
from DELIVERIES
group by delivery_id
HAVING count(*)>1;

delete from DELIVERIES
where ROWID in(
    select row_id from(
        select ROWID as row_id, row_number()over(partition by delivery_id order by ROWID) as Rank_id
        from DELIVERIES
    )
    where Rank_id >1
);

select * from DELIVERIES
where driver_id is null;

select * from DELIVERIES
where distance_km < 0;

update DELIVERIES
set distance_km = Null
where distance_km < 0;

select * FROM DELIVERIES
where delivery_time_minutes is null;

select * from DELIVERIES
where delivery_status NOT IN('Completed','Cancelled','Delayed');

update DELIVERIES
set delivery_status = Null
where delivery_status NOT IN('Completed','Cancelled','Delayed');

select delivery_id, driver_id, vehicle_id, customer_id, pickup_city, delivery_date, distance_km, delivery_time_minutes, delivery_status
from DELIVERIES
where delivery_id is null or driver_id is null or vehicle_id is null or customer_id is null or pickup_city is null or delivery_date is null or distance_km is null or delivery_time_minutes is null or delivery_status is null;


delete from DELIVERY_PAYMENTS
where ROWID in(
    select row_id from(
        select ROWID as row_id, row_number()over(partition by payment_id order by ROWID) as Rank_id
        from DELIVERY_PAYMENTS
    )
    where Rank_id >1
);

select * from DELIVERY_PAYMENTS
where delivery_charge is null;

select * from DELIVERY_PAYMENTS
where  delivery_charge< 0;

UPDATE delivery_payments
SET delivery_charge = NULL
WHERE delivery_charge <= 0;

SELECT *
FROM delivery_payments
WHERE driver_payment > delivery_charge;

UPDATE delivery_payments
SET driver_payment = NULL
WHERE driver_payment > delivery_charge;

select * from DELIVERY_PAYMENTS
where company_commission < 0;

UPDATE delivery_payments
SET company_commission = NULL
WHERE company_commission < 0;

UPDATE delivery_payments
SET payment_method = NULL
WHERE payment_method NOT IN ('UPI', 'Card', 'Cash');

select * from DELIVERY_PAYMENTS
WHERE delivery_charge <> driver_payment + company_commission;

SELECT *
FROM delivery_payments
WHERE delivery_charge IS NOT NULL
  AND driver_payment IS NOT NULL
  AND company_commission IS NOT NULL
  AND delivery_charge <> driver_payment + company_commission;

delete from DELIVERY_REVIEWS
where ROWID in(
    select row_id from(
        select ROWID as row_id, row_number()over(partition by review_id order by ROWID) as Rank_id
        from DELIVERY_REVIEWS
    )
    where Rank_id >1
);


select * from DELIVERY_REVIEWS
where rating is null;

select * from DELIVERY_REVIEWS
where  rating < 1 or rating > 5;

UPDATE delivery_reviews
SET rating = NULL
WHERE rating < 1
   OR rating > 5;

select * from DELIVERY_REVIEWS
where feedback is null;

SELECT *
FROM delivery_reviews
WHERE delivery_id IS NULL
   OR customer_id IS NULL
   OR rating IS NULL
   OR review_date IS NULL;

SELECT e.*, d.*
FROM deliveries e
LEFT JOIN drivers d
    ON e.driver_id = d.driver_id
WHERE d.driver_id IS NULL;


SELECT e.*, v.*
FROM deliveries e
LEFT JOIN vehicles v
    ON e.vehicle_id = v.vehicle_id
WHERE e.vehicle_id IS NOT NULL
  AND v.vehicle_id IS NULL;


select p.*,e.* 
from DELIVERY_PAYMENTS p 
LEFT join DELIVERIES e 
on p.delivery_id = e.DELIVERY_ID
where e.delivery_id is not null;


select r.*, e.* from DELIVERY_REVIEWS r 
left join DELIVERIES e on r.DELIVERY_ID = e.DELIVERY_ID
where e.DELIVERY_ID is not null and e.DELIVERY_ID is null;

select v.*, d.* from vehicles v 
left join DRIVERS d  on v.DRIVER_ID = d.driver_id
where v.DRIVER_ID is not null and d.driver_id is null;

commit;

