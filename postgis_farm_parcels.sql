CREATE TABLE farm_parcels AS
SELECT p.owner, p.taxbill_ad, p.taxbill_cs, ST_Multi(ST_UNION(p.geom))
FROM parcels_ilmenard p
WHERE farm_acres > 0
GROUP BY p.owner, p.taxbill_ad, p.taxbill_cs;