--Create new table "boston"
CREATE TABLE worcester 
AS SELECT * FROM COUNTIES_POLY
WHERE county = 'WORCESTER';
CREATE TABLE middlesex
AS SELECT * FROM COUNTIES_POLY
WHERE county = 'MIDDLESEX';
SELECT * FROM middlesex;
--Non- spatial query
--Based on values in attribute table
SELECT * FROM HOSPITALS_PT
WHERE bedcount > 100 AND town = 'Boston';

SELECT * FROM HOSPITALS_PT
WHERE town = 'Boston' OR town = 'Cambridge';

SELECT * FROM HOSPITALS_PT
WHERE name LIKE '%M%' AND town = 'Boston';

--Contain query
SELECT * FROM HOSPITALS_PT, worcester
WHERE st_contains(worcester.geom, HOSPITALS_PT.geom) = 1;

--Intersection query
SELECT * FROM HOSPITALS_PT, worcester
WHERE st_intersects(worcester.geom, HOSPITALS_PT.geom) = 1;

--Disjoint query
--Not intersect
SELECT * FROM HOSPITALS_PT, worcester
WHERE st_disjoint(worcester.geom, HOSPITALS_PT.geom) = 1;

--Touch query
SELECT * FROM worcester, middlesex
WHERE st_touches(middlesex.geom, worcester.geom) = 1;

--Overlay query
SELECT st_overlaps(middlesex.geom, worcester.geom)
FROM worcester, middlesex;

--Distance within query
--Used in Postgres
--Not run here
--SELECT * FROM HOSPITALS_NONACUTE_PT, HOSPITALS_PT
--WHERE st_dwithin(HOSPITALS_PT.geom, HOSPITALS_NONACUTE_PT.geom ,1000) = 1;