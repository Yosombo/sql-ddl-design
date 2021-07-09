DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    player_number INTEGER NOT NULL
);

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE teams_players (
    id SERIAL  PRIMARY KEY,
    team_id INTEGER REFERENCES teams ON DELETE CASCADE,
    player_id INTEGER REFERENCES players ON DELETE CASCADE
);

CREATE TABLE matches (
    id SERIAL  PRIMARY KEY,
    team_1 INTEGER REFERENCES teams ON DELETE CASCADE,
    team_2 INTEGER REFERENCES teams ON DELETE CASCADE,
    date DATE
);

CREATE TABLE matches_referees (
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES matches,
    referee_id INTEGER REFERENCES referees
);
CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    goal INTEGER
);

CREATE TABLE matches_goals (
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES matches,
    goal_id INTEGER REFERENCES goals
);

CREATE TABLE results (
    team_id INTEGER NOT NULL REFERENCES teams,
    match_id INTEGER NOT NULL REFERENCES matches,
    result TEXT
);

CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);