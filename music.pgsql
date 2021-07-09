-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  album_name TEXT NOT NULL
);

CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  producer_name TEXT NOT NULL
);


CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album INTEGER NOT NULL REFERENCES albums
);

CREATE TABLE productions (
  song_id INTEGER NOT NULL REFERENCES songs,
  artist_id INTEGER NOT NULL REFERENCES artists,
  artist2_id INTEGER REFERENCES artists DEFAULT NULL,
  producer_id INTEGER NOT NULL REFERENCES producers,
  producer2_id INTEGER REFERENCES producers DEFAULT NULL
);

INSERT INTO artists (artist_name)
VALUES
('Hanson'),
('Queen'),
('Mariah Cary'),
('Boyz II Men'),
('Lady Gaga'),
('Bradley Cooper'),
('Nickelback'),
('Jay Z'),
('Alicia Keys'),
('Katy Perry'),
('Juicy J'),
('Maroon 5'),
('Christina Aguilera'),
('Avril Lavigne'),
('Destiny''s Child');

INSERT INTO albums (album_name)
VALUES
('Middle of Nowhere'),
('A Night at the Opera'),
('Daydream'),
('A Star Is Born'),
('Silver Side Up'),
('The Blueprint 3'),
('Prism'),
('Hands All Over'),
('Let Go'),
('The Writing''s on the Wall');

INSERT INTO producers (producer_name)
VALUES
('Dust Brothers'),
('Stephen Lironi'),
('Roy Thomas Baker'),
('Walter Afanasieff'),
('Benjamin Rice'),
('Rick Parashar'),
('Al Shux'),
('Cirkut'),
('Max Martin'),
('Shellback'),
('Benny Blanco'),
('The Matrix'),
('Darkchild');

INSERT INTO songs (title, duration_in_seconds, release_date, album)
VALUES
('MMMBop', 238, '04-15-1997', 1),
('Bohemian Rhapsody', 355, '10-31-1975', 2),
('One Sweet Day', 282, '11-14-1995', 3),
('Shallow', 216, '09-27-2018', 4),
('How You Remind Me', 223, '08-21-2001', 5),
('New York State of Mind', 276, '10-20-2009', 6),
('Dark Horse', 215, '12-17-2013', 7),
('Moves Like Jagger', 201, '06-21-2011', 8),
('Complicated', 244, '05-14-2002', 9),
('Say My Name', 240, '11-07-1999', 10);

INSERT INTO productions (song_id, artist_id, producer_id, producer2_id)
VALUES
(1,1,1,2);

INSERT INTO productions (song_id, artist_id, producer_id)
VALUES
(2,2,3),
(5,7,6),
(9,14,12),
(10,15, 13);
INSERT INTO productions (song_id, artist_id, artist2_id, producer_id)
VALUES
(3,3,4,4),
(4,5,6,5),
(6,8,9,7),
(7,10,11,8);

INSERT INTO productions (song_id, artist_id, artist2_id, producer_id, producer2_id)
VALUES
(8,12,13,10,11);