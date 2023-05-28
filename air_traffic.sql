-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

-- CREATE TABLE tickets
-- (
--   id SERIAL PRIMARY KEY,
--   first_name TEXT NOT NULL,
--   last_name TEXT NOT NULL,
--   seat TEXT NOT NULL,
--   departure TIMESTAMP NOT NULL,
--   arrival TIMESTAMP NOT NULL,
--   airline TEXT NOT NULL,
--   from_city TEXT NOT NULL,
--   from_country TEXT NOT NULL,
--   to_city TEXT NOT NULL,
--   to_country TEXT NOT NULL
-- );


CREATE TABLE passanger
(
id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL);

CREATE TABLE airlines(
id SERIAL PRIMARY KEY,
airline TEXT NOT NULL);

CREATE TABLE airports(
id SERIAL PRIMARY KEY,
city TEXT NOT NULL,
country TEXT NOT NULL);

CREATE TABLE flights (
id SERIAL PRIMARY KEY,
departure TIMESTAMP NOT NULL,
arrival TIMESTAMP NOT NULL,
airline_id INT NOT NULL REFERENCES airlines,
from_airport_id INT NOT NULL REFERENCES airports,
to_airport_id INT NOT NULL REFERENCES airports);

CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  passanger_id INT NOT NULL REFERENCES passanger,
  seat TEXT NOT NULL, 
  flight_id INT NOT NULL REFERENCES flights);







INSERT INTO passanger
  (first_name, last_name)
  VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');
  
  -- seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
-- VALUES
--   Jennifer '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
--   ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
--   ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
--   ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
--   ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
--   ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
--   ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
--   ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
--   ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
--   ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');


   
   INSERT INTO airports (city, country)
   VALUES 
   ('Washington DC', 'United States'),
   ('Seattle', 'United States'),
   ('Tokyo', 'Japan'),
   ('London', 'United Kingdom'),
   ('Los Angeles', 'United States'),
   ('Las Vegas', 'United States'),
   ('Mexico City', 'Mexico'),
   ('Paris', 'France'),
   ('Casablanca', 'Morocco'),
   ('Dubai', 'UAE'),
   ('Beijing', 'China'),
   ('New York', 'United States'),
   ('Charlotte', 'United States'),
   ('Cedar Rapids', 'United States'),
   ('Chicago', 'United States'),
   ('New Orleans', 'United States'),
   ('Sao Paolo', 'Brazil'),
   ('Santiago', 'Chile');

INSERT INTO airlines (airline)
VALUES
('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('American Airlines'),
('Avianca Brasil');


INSERT INTO flights (departure, arrival, airline_id, from_airport_id, to_airport_id)
   VALUES 
   ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 2),
   ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 4),
   ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 6),
   ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 7),
   ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 8, 9),
   ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 10, 11),
   ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 12, 13),
   ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 14, 15),
   ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 13, 16),
   ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 17, 18);
   

INSERT INTO tickets (passanger_id, seat, flight_id)
   VALUES
   (1, '33B', 1),
   (2, '8A', 2),
   (3, '12F', 3),
   (1, '20A', 4),
   (4, '23D', 5),
   (2, '18C', 6),
   (5, '9E', 7),
   (6, '1A', 8),
   (5, '32B', 9),
   (7, '10D', 10);



