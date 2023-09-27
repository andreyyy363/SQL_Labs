SELECT UPPER(name) AS upper_city_name
FROM cities
ORDER BY name
LIMIT 5 OFFSET 5;

SELECT name, CHAR_LENGTH(name) as row_length
FROM cities
WHERE CHAR_LENGTH(name) NOT IN (8, 9, 10);

SELECT SUM(population) AS population_in_c_s
FROM cities
WHERE region IN ('C', 'S');

SELECT AVG(population) AS average_population
FROM cities
WHERE region = 'W';

SELECT COUNT(name) AS number_of_cities_in_e
FROM cities
WHERE region = 'E';