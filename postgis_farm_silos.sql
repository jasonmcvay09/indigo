CREATE TABLE farm_silos
AS
SELECT pt.*, py.*
FROM silos_ilmenard pt
JOIN farm_parcels py
ON ST_Intersects(pt.geom, py.st_multi);