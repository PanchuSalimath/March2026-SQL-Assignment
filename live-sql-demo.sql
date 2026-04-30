-- CREATE TABLE airlines (
--     airline_id INT PRIMARY KEY,
--     airline_name VARCHAR(50),
--     country VARCHAR(50)
-- );

-- CREATE TABLE flights (
--     flight_id INT PRIMARY KEY,
--     flight_no VARCHAR(10),
--     airline_id INT,
--     destination VARCHAR(50),
--     FOREIGN KEY (airline_id) REFERENCES airlines(airline_id)
-- );

-- INSERT INTO airlines VALUES
-- (1, 'Air India', 'India'),
-- (2, 'IndiGo', 'India'),
-- (3, 'Emirates', 'UAE'),
-- (4, 'SpiceJet', 'India'),
-- (5, 'GoAir', 'India');

-- INSERT INTO flights VALUES
-- (101, 'AI101', 1, 'Delhi'),
-- (102, 'AI102', 1, 'Mumbai'),
-- (103, '6E201', 2, 'Bangalore'),
-- (104, 'EK501', 3, 'Dubai'),
-- (105, '6E202', 2, 'Chennai'),
-- (106, 'SG301', 4, 'Hyderabad'),
-- (107, NULL, NULL, 'Kolkata');  -- orphan row (NULL FK)

---------------------------------------------------------------------------------------------------------------------------------

-- SELECT a.airline_name, f.flight_no, f.destination
-- FROM airlines a
-- INNER JOIN flights f
-- ON a.airline_id = f.airline_id;

---------------------------------------------------------------------------------------------------------------------------------

-- select * from flights
-- select * from airlines

---------------------------------------------------------------------------------------------------------------------------------

-- SELECT a.airline_name, f.flight_no, f.destination
-- FROM airlines a
-- LEFT JOIN flights f
-- ON a.airline_id = f.airline_id

---------------------------------------------------------------------------------------------------------------------------------

-- SELECT a.airline_name, f.flight_no, f.destination
-- FROM airlines a
-- RiGHT JOIN flights f
-- ON a.airline_id = f.airline_id

---------------------------------------------------------------------------------------------------------------------------------

SELECT a.airline_name, f.flight_no, f.destination
FROM airline a
full outer join flight f
ON a.airline_id = f.airline_id;