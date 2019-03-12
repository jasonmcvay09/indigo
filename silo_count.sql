SELECT farm_parcels2.owner, farm_parcels2.taxbill_ad, farm_parcels2.taxbill_cs, farm_parcels2.geom, count(silos_ilmenard.geom) AS silo_count, avg(silos_ilmenard.diameter) AS silo_avg_di 
FROM farm_parcels2 JOIN silos_ilmenard 
ON ST_Contains(farm_parcels2.geom, silos_ilmenard.geom) 
GROUP BY farm_parcels2.owner, farm_parcels2.taxbill_ad, farm_parcels2.taxbill_cs, farm_parcels2.geom
ORDER BY silo_count DESC;
