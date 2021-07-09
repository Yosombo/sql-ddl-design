DROP DATABASE IF EXISTS craigslist;
CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    region VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(15) UNIQUE NOT NULL,
    phone BIGINT DEFAULT NULL,
    email TEXT NOT NULL
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    category VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE users_regions (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users,
    region_id INTEGER NOT NULL REFERENCES regions
);
CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    post_description TEXT,
    user_id INTEGER NOT NULL REFERENCES users ON DELETE CASCADE,
    location TEXT,
    region INTEGER NOT NULL REFERENCES regions
);

CREATE TABLE categories_posts(
    id SERIAL PRIMARY KEY,
    category_id INTEGER NOT NULL REFERENCES categories ON DELETE CASCADE,
    post_id INTEGER NOT NULL REFERENCES posts
);

INSERT INTO regions (region)
VALUES
('San Francisco'),
('Seatle'),
('New York');

INSERT INTO users ( name, email)
VALUES
('David Lee',  'david1973@gmail.com'), -- sf
('Nikko', 'nik@yahoo.com'), -- sf
('Starbucks', 'starbucks@sb.com'); -- seatle


INSERT INTO categories (category)
VALUES
('Housing'),
('jobs'),
('sale'),
('services');

INSERT INTO users ( name, email, phone)
VALUES
('John Wick', 'jowi73@gmail.com', 8008019977), -- ny
('natasha baron', 'natasha@yahoo.com', 212722332), -- ny
('Stephen Curry', 'step33@warriors.com', 4151014949); -- sf

INSERT INTO users_regions (user_id, region_id)
VALUES
(1,1),
(2,1),
(3,2),
(4, 3),
(5, 3),
(6,1);

INSERT  INTO posts(title, post_description, user_id, location, region)
VALUES
('2 bed  2 bath', 'Available: Unit 2223, 2 bed, 2 bath for $3465,
NEMA has San Francisco lifestyle in its DNA. It is an authentic product of its time and place—a pioneer in a city that loves to be a cultural pioneer.', 1, 'san francisco', 1),
('1 bed  1 bath', 'Available: Unit 1124, 1 bed, 1 bath for $2100,
NEMA has San Francisco lifestyle in its DNA. It is an authentic product of its time and place—a pioneer in a city that loves to be a cultural pioneer.', 1, 'san francisco', 1),
('Small Kids Bicycle - $35 (burlingame)', 'Rides well. Some wear. 20” tires with coaster brake.', 2, 'burlingame', 1),
('NOW HIRING BIKINI BARISTA', 'NOW hiring bikini baristas at our TUKWILA LADYBUG location !! Great opportunity for great pay and tips!! Here’s your chance to make some money!!! Starting wage very high best in the industry and will work with your schedule! ALL shifts available!! Please email experience/pics and Availability to starbucks@sb.com
', 3,'Tukwila', 2),
('VIRTUAL PERSONAL TRAINING - MASTER TRAINER', 'I offer constant fitness assessments to track your progress and will design a program specifically to meet your goals, no cookie cutter workouts. Each workout will be recorded to ensure progress. I will push you to achieve your goals in a safe manner and PROMISE you will feel great and look your best. Your goals will become my goals!', 4, 'bronx', 3),
('VINTAGE 1954 SOLID BAMBOO MCM FICKS &REED LOUNGER CLUB CHAIR - $275', 'CASH ONLY , PICK UP ONLY , ANY SCAMS WILL BE REPORTED IMMEDIATELY.', 5, '', 3),
('$1,149,000 / 3br - 1120ft2 - Sausalito Floating Home (Houseboat) for sale by Owner (sausalito)', 'Gorgeous houseboat just off the Liberty Dock in Sausalito is now available. Principals only pls.
', 6, 'sausalito', 1);
