CREATE TABLE IF NOT EXISTS `uber_cleaned_data.analytics` AS(
  SELECT
    f.VendorID,
    d.tpep_pickup_datetime,
    d.tpep_dropoff_datetime,
    pc.passenger_count,
    td.trip_distance,
    rc.rate_code_name,
    pl.pickup_latitude,
    pl.pickup_longitude,
    dl.dropoff_latitude,
    dl.dropoff_longitude,
    pt.payment_type_name,
    f.fare_amount,
    f.extra,
    f.mta_tax,
    f.tip_amount,
    f.tolls_amount,
    f.improvement_surcharge,
  FROM `uber_cleaned_data.fact_table` f
  JOIN `uber_cleaned_data.datetime_dim` d ON f.datetime_id = d.datetime_id
  JOIN `uber_cleaned_data.passenger_count_dim` pc ON f.passenger_count_id = pc.passenger_count_id
  JOIN `uber_cleaned_data.trip_distance_dim` td ON f.trip_distance_id = td.trip_distance_id
  JOIN `uber_cleaned_data.rate_code_dim` rc ON f.rate_code_id = rc.rate_code_id
  JOIN `uber_cleaned_data.pickup_location_dim` pl ON f.pickup_location_id = pl.pickup_location_id
  JOIN `uber_cleaned_data.dropoff_location_dim` dl ON f.dropoff_location_id = dl.dropoff_location_id
  JOIN `uber_cleaned_data.payment_type_dim` pt ON f.payment_type_id = pt.payment_type_id
)
