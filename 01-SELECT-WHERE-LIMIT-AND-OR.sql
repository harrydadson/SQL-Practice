CREATE TABLE tutorial.zoo (
    animal varchar(10),
    uniq_id integer PRIMARY KEY,
    water_need integer
);

INSERT INTO tutorial.zoo (animal,uniq_id,water_need) VALUES
    ('elephant',1001,500),
    ('elephant',1002,600),
    ('elephant',1003,550),
    ('tiger',1004,300),
    ('tiger',1005,320),
    ('tiger',1006,330),
    ('tiger',1007,290),
    ('tiger',1008,310),
    ('zebra',1009,200),
    ('zebra',1010,220),
    ('zebra',1011,240),
    ('zebra',1012,230),
    ('zebra',1013,220),
    ('zebra',1014,100),
    ('zebra',1015,80),
    ('lion',1016,420),
    ('lion',1017,600),
    ('lion',1018,500),
    ('lion',1019,390),
    ('kangaroo',1020,410),
    ('kangaroo',1021,430),
    ('kangaroo',1022,410);

SELECT * 
FROM tutorial.zoo
LIMIT 5;

SELECT * 
FROM tutorial.zoo
WHERE animal != 'elephant'; -- or <>

SELECT * 
FROM tutorial.zoo
WHERE water_need < 300;

SELECT * 
FROM tutorial.zoo
WHERE animal
LIKE '%e%'
AND animal != 'tiger';

SELECT * 
FROM tutorial.zoo
WHERE uniq_id IN (1001, 1008, 1012, 1015, 1018);

