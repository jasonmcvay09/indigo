CREATE TABLE farm_silo_count_min_max_med
AS
SELECT f.owner, f.taxbill_ad, f.taxbill_cs, f.geom, 
COUNT(s.geom) AS silo_count, 
ROUND(AVG(s.diameter)::numeric,1) AS silo_avg_di,
SUM(s.low_bushel) AS low_bushel_sum,
SUM(s.high_bushe) AS high_bushel_sum,
SUM(s.median_bus) as med_bushel_sum
FROM farm_parcels2 f JOIN silo_bushels s 
ON ST_Contains(f.geom, s.geom) 
GROUP BY f.owner, f.taxbill_ad, f.taxbill_cs, f.geom
ORDER BY med_bushel_sum DESC;
