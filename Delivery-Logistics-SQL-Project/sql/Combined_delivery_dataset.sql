CREATE TABLE combined_delivery_data AS
SELECT
    -- Driver information
    d.driver_id,
    d.driver_name,
    d.gender,
    d.age,
    d.city AS driver_city,
    d.joining_date,
    d.rating AS driver_rating,

    -- Vehicle information
    v.vehicle_id,
    v.vehicle_type,
    v.vehicle_model,
    v.fuel_type,
    v.capacity,

    -- Delivery information
    e.delivery_id,
    e.customer_id,
    e.pickup_city,
    e.delivery_city,
    e.delivery_date,
    e.distance_km,
    e.delivery_time_minutes,
    e.delivery_status,

    -- Payment information
    p.payment_id,
    p.delivery_charge,
    p.driver_payment,
    p.company_commission,
    p.payment_method,

    -- Review information
    r.review_id,
    r.customer_id AS review_customer_id,
    r.rating AS customer_rating,
    r.review_date,
    r.feedback

FROM deliveries e

LEFT JOIN drivers d
    ON e.driver_id = d.driver_id

LEFT JOIN vehicles v
    ON e.vehicle_id = v.vehicle_id

LEFT JOIN delivery_payments p
    ON e.delivery_id = p.delivery_id

LEFT JOIN delivery_reviews r
    ON e.delivery_id = r.delivery_id;


select * from COMBINED_DELIVERY_DATA;