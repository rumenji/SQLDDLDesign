DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE region (
    id = SERIAL PRIMARY KEY,
    region_name = TEXT NOT NULL
);

CREATE TABLE users (
    id = SERIAL PRIMARY KEY,
    user_name = VARCHAR(15) NOT NULL UNIQUE,
    user_pass = VARCHAR(20) NOT NULL,
    pref_reg = INTEGER REFERENCES region
);

CREATE TABLE posts (
    id = SERIAL PRIMARY KEY,
    title = TEXT NOT NULL,
    content = TEXT,
    user_id = INTEGER NOT NULL REFERENCES users,
    region_id = INTEGER NOT NULL REFERENCES region,
    category = INTEGER NOT NULL REFERENCES categories
);

CREATE TABLE categories (
    id = SERIAL PRIMARY KEY,
    cat_name = VARCHAR(20)
);

