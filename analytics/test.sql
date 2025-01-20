SELECT 
  VendorID,
  sum(fare_amount)
FROM `uber_cleaned_data.fact_table`
GROUP BY VendorID

SELECT 
  p.payment_type_name,
  AVG(f.tip_amount) AS avg_tip_amount
FROM `uber_cleaned_data.fact_table` f
JOIN `uber_cleaned_data.payment_type_dim` p
ON f.payment_type_id = p.payment_type_id
GROUP BY p.payment_type_name

-- Find the top 10 pickup locations based on number of trips
-- Find the total number of trips by passenger count
-- Find the average fare amount by hour of the day