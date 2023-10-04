SELECT region, SUM(population) AS population_in_region
FROM cities
GROUP BY region;

SELECT region, SUM(population) AS population_in_region
FROM cities
GROUP BY region
HAVING COUNT(name) >= 10;

SELECT name, population
FROM cities
WHERE (SELECT area_quantity
        FROM regions
        WHERE uuid = region) >= 5
LIMIT 5 OFFSET 10;

SELECT name, (SELECT SUM(population)
               FROM cities
               WHERE region = regions.uuid AND population > 300000) AS population_in_region
FROM regions;

SELECT name, population, region
FROM cities
WHERE region IN (SELECT uuid
                  FROM regions
                  WHERE area_quantity <= 5)  AND population NOT IN (150000, 500000);
