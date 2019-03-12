SELECT farm_parcels2.owner, count(silos_ilmenard.geom) AS silo_count 
FROM farm_parcels2 JOIN silos_ilmenard 
ON ST_Contains(farm_parcels2.geom, silos_ilmenard.geom) 
GROUP BY farm_parcels2.owner
ORDER BY silo_count DESC;
