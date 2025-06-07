WITH customers AS (
SELECT
customer_id,
gender,
age
FROM

{{source('default','customers')}} 

),

events_by_customer AS (

SELECT
customer_id,
COUNT(event) AS nb_event_id,
SUM(time) AS tot_time

FROM 
{{ source('default','events')}}
GROUP BY

customer_id

)

SELECT

c.customer_id,
gender,
age,
nb_event_id,
tot_time

FROM customers c LEFT JOIN events_by_customer e 
ON c.customer_id = e.customer_id