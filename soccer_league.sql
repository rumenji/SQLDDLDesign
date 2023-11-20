DROP DATABASE IF EXISTS league;

CREATE DATABASE league;

\c league

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    team_name VARCHAR(20) NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    player_name TEXT NOT NULL,
    team_id INTEGER NOT NULL REFERENCES teams
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER  NOT NULL REFERENCES players,
    match_id INTEGER  NOT NULL REFERENCES matches,
    goal_time INTEGER NOT NULL
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    team_1_id INTEGER  NOT NULL REFERENCES teams,
    team_2_id INTEGER  NOT NULL REFERENCES teams,
    referee_id INTEGER  NOT NULL REFERENCES referees,
    season_id INTEGER NOT NULL REFERENCES season
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    ref_name VARCHAR(20) NOT NULL
);

CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

