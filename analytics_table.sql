create or replace table uber-data-analysis-0.uber_data_analysis.analytics_table as (
select 
f.VendorId,
d.tpep_pickup_datetime,
d.tpep_dropoff_datetime,
p.passenger_count,
t.trip_distance,
r.rate_code_name,
pick.pickup_latitude,
pick.pickup_longitude,
drp.dropoff_latitude,
drp.dropoff_longitude,
pay.payment_name,
f.fare_amount,
f.extra,
f.mta_tax,
f.tip_amount,
f.tolls_amount,
f.improvement_surcharge,
f.total_amount

from 

uber-data-analysis-0.uber_data_analysis.fact_table f 
join uber-data-analysis-0.uber_data_analysis.datetime_dim d on f.datetime_Id = d.datetime_Id
join uber-data-analysis-0.uber_data_analysis.passenger_count_dim p on p.passenger_count_Id = f.passenger_count_Id 
join uber-data-analysis-0.uber_data_analysis.trip_distance_dim t on t.trip_distance_Id = f.trip_distance_Id
join uber-data-analysis-0.uber_data_analysis.rate_code_dim r on r.rate_code_Id = f.rate_code_Id
join uber-data-analysis-0.uber_data_analysis.pickup_location_dim pick on pick.pickup_location_Id = f.pickup_location_Id
join uber-data-analysis-0.uber_data_analysis.drop_location_dim drp on drp.drop_location_Id = f.drop_location_Id
join uber-data-analysis-0.uber_data_analysis.payment_type_dim pay on pay.payment_Id = f.payment_Id);
