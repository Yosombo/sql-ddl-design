-- from the terminal run:
-- psql < air_traffic.sql
DROP DATABASE IF EXISTS air_traffic;
CREATE DATABASE air_traffic;
\c air_traffic 

CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  city_name TEXT NOT NULL
);

CREATE TABLE countries (
  id SERIAL PRIMARY KEY,
  country_name TEXT NOT NULL
);
CREATE TABLE cities_countries (
  id SERIAL PRIMARY KEY,
  city_id INTEGER NOT NULL REFERENCES cities,
  country_id INTEGER NOT NULL REFERENCES countries
);

CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  passenger INTEGER NOT NULL REFERENCES passengers,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline INTEGER NOT NULL REFERENCES airlines,
  location_from INTEGER NOT NULL REFERENCES cities_countries,
  locatoin_to INTEGER NOT NULL REFERENCES cities_countries
);

INSERT INTO passengers (first_name,last_name)
VALUES
('Jennifer', 'Finch'),
('Thadeus', 'Gathercoal'),
('Sonja', 'Sonja'),
('Waneta', 'Skeleton'),
('Berkie', 'Wycliff'),
('Alvin', 'Leathes'),
('Cory', 'Squibbes');

INSERT INTO airlines (airline_name)
VALUES
('United'),
('Delta'),
('Avianca Brasil'),
('American Airlines'),
('Air China'),
('TUI Fly Belgium'),
('British Airways');

INSERT INTO cities (city_name)
VALUES
('Washington DC'),
('Tokyo'),
('Seattle'),
('London'),
('Los Angeles'),
('Las Vegas'),
('Mexico City'),
('Paris'),
('Casablanca'),
('Dubai'),
('Beijing'),
('New York'),
('Charlotte'),
('Cedar Rapids'),
('Chicago'),
('New Orleans'),
('Sao Paolo'),
('Santiago');

INSERT INTO countries (country_name)
VALUES
('United States'),
('Japan'),
('Mexico'),
('France'),
('Morocco'),
('UAE'),
('China'),
('Brazil'),
('Chile'),
('United Kingdom');

INSERT INTO cities_countries (city_id, country_id)
VALUES
(1,1),
(2,2),
(3,1),
(4,10),
(5,1),
(6,10),
(7, 3),
(8,4),
(9,5),
(10,6),
(11,7),
(12,1),
(13,1),
(14,1),
(15,1),
(16,1),
(17,8),
(18, 9);

INSERT INTO tickets (
    passenger,
    seat,
    departure,
    arrival,
    airline,
    location_from,
    locatoin_to
  )
VALUES (
    1,
    '33B',
    '2018-04-08 09:00:00',
    '2018-04-08 12:00:00',
    1,
    1,
    3
  ),
  (
    2,
    '8A',
    '2018-12-19 12:45:00',
    '2018-12-19 16:15:00',
    7,
    2,
    4
  ),
  (
    3,
    '12F',
    '2018-01-02 07:00:00',
    '2018-01-02 08:03:00',
    2,
    5,
    6
  ),
  (
    1,
    '20A',
    '2018-04-15 16:50:00',
    '2018-04-15 21:00:00',
    2,
    3,
    7
  ),
  (
    4,
    '23D',
    '2018-08-01 18:30:00',
    '2018-08-01 21:50:00',
    6,
    8,
    9
  ),
  (
    2,
    '18C',
    '2018-10-31 01:15:00',
    '2018-10-31 12:55:00',
    5,
    10,
    11
  ),
  (
    5,
    '9E',
    '2019-02-06 06:00:00',
    '2019-02-06 07:47:00',
    1,
    12,
    13
  ),
  (
    6,
    '1A',
    '2018-12-22 14:42:00',
    '2018-12-22 15:56:00',
    4,
    14,
    15
  ),
  (
    5,
    '32B',
    '2019-02-06 16:28:00',
    '2019-02-06 19:18:00',
    4,
    13,
    16
  ),
  (
    7,
    '10D',
    '2019-01-20 19:30:00',
    '2019-01-20 22:45:00',
    3,
    17,
    18
  );