-- exactly how many flights are in our table
SELECT COUNT(*) 
FROM flight_delays;

-- the sum of the airtimes of these flights
SELECT SUM(airtimes)
FROM flight_delays;

-- the average arrival and departure delays
SELECT AVG(depdelay) depardelay, AVG(arrdelay) arrivdelay
FROM flight_delays;

-- the maximum distance of any of these flights
SELECT MAX(distance) max_d
FROM flight_delays;

-- the minimum distance of any of these flights
SELECT MIN(distance) max_d
FROM flight_delays;

-- GROUP BY
SELECT origin, AVG(depdelay)
FROM flight_delays
GROUP BY origin;

-- total monthly airtime
SELECT
  month,
  SUM(airtime)
FROM flight_delays
GROUP BY month;

-- calculate the average departure delay by airport, use only those flights
-- that flew more than 2000 miles (distance column)
SELECT
  AVG(depdelay),
  origin
FROM flight_delays
WHERE distance > 2000
GROUP BY origin;

-- which airport was the busiest?
SELECT
  COUNT(*) busiest,
  origin
FROM flight_delays
GROUP BY origin
ORDER BY busiest DESC;

-- How many different airport in the table?
SELECT DISTINCT origin
FROM flight_delays;

-- or using GROUP BY
SELECT origin
FROM flight_delays
GROUP BY origin;

-- list top 5 planes (tailnum column) by the number of landings,
-- at PHX or SEA airport on Sundays
SELECT
  COUNT(*),
  tailnum
FROM flight_delays
WHERE dayofweek = 7
  AND dest IN ('PHX', 'SEA')
GROUP BY tailnum
ORDER BY count DESC
LIMIT 5;