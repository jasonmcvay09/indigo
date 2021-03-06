CREATE TABLE menard_farm_capacity_estimates
AS
SELECT f.owner, f.taxbill_ad ||' '|| f.taxbill_cs AS address, f.geom, 
COUNT(s.geom) AS silo_count,
SUM(s.low_bushel) AS low_bushel_sum,
SUM(s.high_bushe) AS high_bushel_sum,
SUM(s.median_bus) AS med_bushel_sum
FROM farm_parcels2 f JOIN silo_bushels s 
ON ST_Contains(f.geom, s.geom) 
GROUP BY f.owner, f.taxbill_ad, f.taxbill_cs, f.geom
ORDER BY med_bushel_sum DESC;
