
-- Find each driver's total completed-delivery revenue and compare it with the average completed-delivery revenue of all drivers.--

WITH driver_revenue AS (
    SELECT e.driver_id,
           SUM(p.delivery_charge) AS total_revenue
    FROM delivery_payments p
    JOIN deliveries e
        ON p.delivery_id = e.delivery_id
    WHERE e.delivery_status = 'Completed'
      AND e.driver_id IS NOT NULL
      AND p.delivery_charge IS NOT NULL
    GROUP BY e.driver_id
),
avg_driver_revenue AS (
    SELECT AVG(total_revenue) AS average_revenue
    FROM driver_revenue
)
SELECT driver_id,
       total_revenue,
       average_revenue,
       total_revenue - average_revenue AS revenue_difference,
       CASE
           WHEN total_revenue > average_revenue THEN 'Above Average'
           WHEN total_revenue < average_revenue THEN 'Below Average'
           ELSE 'Equal Average'
       END AS performance_status
FROM driver_revenue
CROSS JOIN avg_driver_revenue
ORDER BY total_revenue DESC;



-- Find each driver's total completed deliveries and compare their performance with the average number of completed deliveries across all drivers. --

WITH completed_deliveries AS (
    SELECT driver_id,
           COUNT(delivery_status) AS total_completed_deliveries
    FROM deliveries
    WHERE delivery_status = 'Completed'
      AND driver_id IS NOT NULL
    GROUP BY driver_id
),
avg_completed_deliveries AS (
    SELECT AVG(total_completed_deliveries) AS avg_completed
    FROM completed_deliveries
)
SELECT driver_id,
       total_completed_deliveries,
       avg_completed,
       total_completed_deliveries - avg_completed AS delivery_difference,
       CASE
           WHEN total_completed_deliveries > avg_completed
               THEN 'Above Average'
           WHEN total_completed_deliveries < avg_completed
               THEN 'Below Average'
           ELSE 'Equal Average'
       END AS performance_status
FROM completed_deliveries
CROSS JOIN avg_completed_deliveries
ORDER BY total_completed_deliveries DESC;



-- . Find drivers whose total completed-delivery revenue is higher than the average revenue of their own city.--

WITH driver_revenue AS (
    SELECT d.driver_id,
           d.city,
           SUM(p.delivery_charge) AS total_revenue
    FROM delivery_payments p
    JOIN deliveries e
        ON p.delivery_id = e.delivery_id
    JOIN drivers d
        ON d.driver_id = e.driver_id
    WHERE e.delivery_status = 'Completed'
      AND d.driver_id IS NOT NULL
      AND p.delivery_charge IS NOT NULL
    GROUP BY d.driver_id, d.city
),
average_revenue AS (
    SELECT city,
           AVG(total_revenue) AS city_average_revenue
    FROM driver_revenue
    GROUP BY city
)
SELECT d.driver_id,
       d.city,
       d.total_revenue,
       a.city_average_revenue,
       d.total_revenue - a.city_average_revenue AS revenue_difference,
       CASE
           WHEN d.total_revenue > a.city_average_revenue
               THEN 'Above Average'
           WHEN d.total_revenue < a.city_average_revenue
               THEN 'Below Average'
           ELSE 'Equal Average'
       END AS performance_status
FROM driver_revenue d
JOIN average_revenue a
    ON d.city = a.city
WHERE d.total_revenue > a.city_average_revenue
ORDER BY d.city, d.total_revenue DESC;



-- Find each driver's fastest and slowest delivery time among completed deliveries -- 

SELECT d.driver_id,
       d.city,
       MIN(e.delivery_time_minutes) AS fastest_delivery,
       MAX(e.delivery_time_minutes) AS slowest_delivery,
        MAX(e.delivery_time_minutes)- MIN(e.delivery_time_minutes) as delivery_time_range
FROM deliveries e
JOIN drivers d
    ON e.driver_id = d.driver_id
WHERE e.delivery_status = 'Completed'
  AND d.driver_id IS NOT NULL
  AND d.city IS NOT NULL
  AND e.delivery_time_minutes IS NOT NULL
GROUP BY d.driver_id, d.city;



-- Find each driver's completed-delivery count and calculate what percentage of all completed deliveries were handled by that driver.  --

with completed_deliveries as (
    select d.driver_id, count(e.delivery_status) as count_of_completed_deliveries 
    from deliveries e
    join DRIVERS d 
    on e.driver_id = d.driver_id 
    where e.delivery_status = 'Completed'
    group by d.driver_id
),

total_completed_deliveries as (
    select sum(count_of_completed_deliveries) as total_completed
    from completed_deliveries
)
select driver_id, count_of_completed_deliveries , total_completed, round(count_of_completed_deliveries / total_completed * 100,2) as delivery_percentage
from completed_deliveries
CROSS JOIN total_completed_deliveries
ORDER BY delivery_percentage DESC;



-- -- Find each driver's percentage contribution to the company's total completed-delivery revenue. -- --

with Total_Drivers_Revenue as (
    select e.driver_id, sum(p.delivery_charge) as Tota_revenue 
    from DELIVERY_PAYMENTS p
    join deliveries e
    on p.delivery_id = e.delivery_id 
    where e.delivery_status = 'Completed'
    and e.driver_id is not NULL
    and p.delivery_charge is not null 
    group by e.driver_id
),
Total_Company_Revenue AS (
    SELECT SUM(p.delivery_charge) AS company_total_revenue
    FROM delivery_payments p
    JOIN deliveries e
        ON p.delivery_id = e.delivery_id
    WHERE e.delivery_status = 'Completed'
      AND p.delivery_charge IS NOT NULL
)
select driver_id, Tota_revenue,  Company_total_revenue, Round(Tota_revenue /Company_total_revenue * 100, 2) as revenue_percentage
from Total_Drivers_Revenue
CROSS join Total_Company_Revenue
order by Tota_revenue desc;


-- Find each driver's monthly completed-delivery revenue and compare it with the previous month's revenue using LAG(). --

WITH monthly_revenue AS (
    SELECT e.driver_id,
           TO_CHAR(e.delivery_date, 'YYYY-MM') AS delivery_month,
           SUM(p.delivery_charge) AS monthly_revenue
    FROM delivery_payments p
    JOIN deliveries e
        ON p.delivery_id = e.delivery_id
    WHERE e.delivery_status = 'Completed'
      AND e.driver_id IS NOT NULL
      AND p.delivery_charge IS NOT NULL
    GROUP BY e.driver_id,
             TO_CHAR(e.delivery_date, 'YYYY-MM')
),
previous_month_revenue AS (
    SELECT driver_id,
           delivery_month,
           monthly_revenue,
           LAG(monthly_revenue) OVER (
               PARTITION BY driver_id
               ORDER BY delivery_month
           ) AS previous_month_revenue
    FROM monthly_revenue
)
SELECT driver_id,
       delivery_month,
       monthly_revenue,
       previous_month_revenue,
       monthly_revenue - previous_month_revenue AS revenue_change
FROM previous_month_revenue
ORDER BY driver_id, delivery_month;


-- Find the top 2 revenue-generating months for each driver using RANK(). --

WITH monthly_revenue AS (
    SELECT e.driver_id,
           TO_CHAR(e.delivery_date, 'YYYY-MM') AS delivery_month,
           SUM(p.delivery_charge) AS monthly_revenue
    FROM delivery_payments p
    JOIN deliveries e
        ON p.delivery_id = e.delivery_id
    WHERE e.delivery_status = 'Completed'
      AND e.driver_id IS NOT NULL
      AND p.delivery_charge IS NOT NULL
    GROUP BY e.driver_id,
             TO_CHAR(e.delivery_date, 'YYYY-MM')
),
ranks AS (
    SELECT driver_id,
           delivery_month,
           monthly_revenue,
           RANK() OVER (
               PARTITION BY driver_id
               ORDER BY monthly_revenue DESC
           ) AS rank_id
    FROM monthly_revenue
)
SELECT driver_id,
       delivery_month,
       monthly_revenue,
       rank_id
FROM ranks
WHERE rank_id <= 2
ORDER BY driver_id, rank_id;



--- Identify drivers whose completed-delivery revenue increased for two consecutive available months using LAG(). --
WITH month_revenue AS (
    SELECT e.driver_id,
           TO_CHAR(e.delivery_date, 'YYYY-MM') AS delivery_month,
           SUM(p.delivery_charge) AS monthly_revenue
    FROM delivery_payments p
    JOIN deliveries e
        ON p.delivery_id = e.delivery_id
    WHERE e.delivery_status = 'Completed'
      AND e.driver_id IS NOT NULL
      AND p.delivery_charge IS NOT NULL
    GROUP BY e.driver_id,
             TO_CHAR(e.delivery_date, 'YYYY-MM')
),
revenue_comparison AS (
    SELECT driver_id,
           delivery_month,
           monthly_revenue,
           LAG(monthly_revenue, 1) OVER (
               PARTITION BY driver_id
               ORDER BY delivery_month
           ) AS prev_month_revenue,
           LAG(monthly_revenue, 2) OVER (
               PARTITION BY driver_id
               ORDER BY delivery_month
           ) AS prev_2_month_revenue
    FROM month_revenue
)
SELECT driver_id,
       delivery_month,
       monthly_revenue,
       prev_month_revenue,
       prev_2_month_revenue
FROM revenue_comparison
WHERE monthly_revenue > prev_month_revenue
  AND prev_month_revenue > prev_2_month_revenue
ORDER BY driver_id, delivery_month;

