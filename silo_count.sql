CREATE TABLE farm_silo_count
AS
SELECT f.owner, f.taxbill_ad, f.taxbill_cs, f.geom, count(silos_ilmenard.geom) AS silo_count, avg(silos_ilmenard.diameter) AS silo_avg_di 
FROM farm_parcels2 f JOIN silos_ilmenard 
ON ST_Contains(f.geom, silos_ilmenard.geom) 
GROUP BY f.owner, f.taxbill_ad, f.taxbill_cs, f.geom
ORDER BY silo_count DESC;
