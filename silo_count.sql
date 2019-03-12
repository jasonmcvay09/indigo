CREATE TABLE farm_silo_count2
AS
SELECT f.owner, f.taxbill_ad, f.taxbill_cs, f.geom, COUNT(silos_ilmenard.geom) AS silo_count, ROUND(AVG(silos_ilmenard.diameter)::numeric,1) AS silo_avg_di 
FROM farm_parcels2 f JOIN silos_ilmenard 
ON ST_Contains(f.geom, silos_ilmenard.geom) 
GROUP BY f.owner, f.taxbill_ad, f.taxbill_cs, f.geom
ORDER BY silo_count DESC;
