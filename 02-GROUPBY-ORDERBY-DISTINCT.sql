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

-- order of execution by SQL statement
SELECT origin, COUNT(*)  -- 4
FROM flight_delays       -- 1
WHERE depdelay > 100     -- 2
GROUP BY origin          -- 3
ORDER BY origin          -- 5
LIMIT 5;                 -- 6

-- SQL JOINS
SELECT t.tophit, t.play, p.artist, p.song
FROM tutorial.toplist t
JOIN tutorial.playlist p
ON t.tophit = p.song
;

SELECT t.tophit, t.play, p.artist, p.song
FROM tutorial.toplist t
LEFT JOIN tutorial.playlist p
ON t.tophit = p.song
;

SELECT t.tophit, t.play, p.artist, p.song
FROM tutorial.toplist t
RIGHT JOIN tutorial.playlist p
ON t.tophit = p.song
;

SELECT t.tophit, t.play, p.artist, p.song
FROM tutorial.toplist t
FULL JOIN tutorial.playlist p
ON t.tophit = p.song
;

-- How many plays does each artist have in total?
SELECT p.artist,
SUM(t.play)
FROM playlist p
FULL JOIN toplist t
ON p.song = t.tophit
GROUP BY artist;

-- Print the top 5 ABBA songs ordered by number of plays!
SELECT
  p.artist,
  p.song,
  t.play
FROM playlist p
FULL JOIN toplist t
  ON p.song = t.tophit
WHERE p.artist = 'ABBA'
ORDER BY t.play DESC;