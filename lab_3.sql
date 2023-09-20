SELECT *
FROM cities
WHERE name LIKE '%ськ';

SELECT *
FROM cities
WHERE name LIKE '%донец%';

SELECT CONCAT(name, ' (', region, ')') AS new_name
FROM cities
WHERE population > 100000
ORDER BY new_name;

SELECT *, population/40000000*100 AS percent_of_total
FROM cities
ORDER BY population DESC
LIMIT 10;

SELECT CONCAT(name, ', ', (population / 40000000 * 100), '%') AS name_and_percentage
FROM cities
WHERE (population / 40000000 * 100) >= 0.1
ORDER BY (population / 40000000 * 100) DESC;
