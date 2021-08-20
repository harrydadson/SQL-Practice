/* SUBQUERY

SELECT the average departure by tail numbers from the table
and return the min and max values of these averages. */

SELECT MIN() min_val, MAX() max_val
FROM
    (SELECT tailnum, AVG(depdelay) avg_dd
    FROM flight_delays
    GROUP BY tailnum
    ORDER BY avg_dd) AS my_inner_query;

/* subquery requirements
1. subquery must be in parentheses
2. subquery must have alias */

/* 
1. Calculate the total of the distances flown by each plane… 
    (Note: do the grouping based on the tailnum column — and SUM 
    the values in the distance column 

2. then take only those planes for which this total distance is 
    greater than 1,000,000
    
3.  then calculate the average of the total distances flown by these planes!
*/

SELECT
  AVG(dist)
FROM 
  (SELECT
     tailnum,
     SUM(distance) AS dist
   FROM
     flight_delays
   GROUP BY
     tailnum) AS dist_by_plane
WHERE dist > 1000000;

/* CASE WHEN (conditional statements)
- How planes did depart on time
*/

-- Depart early
SELECT COUNT(*) early
FROM flight_delays
WHERE depdelay < 0;

-- Depart on-time
SELECT COUNT(*) on_time
FROM flight_delays
WHERE depdelay = 0;

-- Depart late
SELECT COUNT(*) late
FROM flight_delays
WHERE depdelay > 0;

-- OR more efficient way
SELECT
    CASE WHEN depdelay < 0 THEN 'early'
         WHEN depdelay > 0 THEN 'late'
         ELSE 'on_time'
    END AS is_it_late,
    COUNT(*)
FROM flight_delays
GROUP BY is_it_late;

/* HAVING - for filtering because where can't be used on aggregation */
SELECT dest, COUNT(*) nmbr
FROM flight_delays
GROUP BY dest
HAVING nmbr > 10000;

/* 
1. Calculate the total of the distances flown by each plane… 
    (Note: do the grouping based on the tailnum column — and SUM 
    the values in the distance column 

2. then take only those planes for which this total distance is 
    greater than 1,000,000
    
3.  then calculate the average of the total distances flown by these planes!
*/

SELECT
  AVG(dist)
FROM 
  (SELECT
     tailnum,
     SUM(distance) AS dist
   FROM
     flight_delays
   GROUP BY
     tailnum
   HAVING SUM(distance) > 1000000) AS dist_by_plane;