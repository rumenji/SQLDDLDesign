-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO galaxies
  (name)
VALUES ('Milky Way');

CREATE TABLE orbits_around (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO orbits_around 
  (name)
VALUES ('The Sun'), ('Proxima Centauri'), ('Gliese 876');

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around_id INTEGER NOT NULL REFERENCES orbits_around,
  galaxy_id INTEGER NOT NULL REFERENCES galaxies
);

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around_id, galaxy_id)
VALUES
  ('Earth', 1.00, 1, 1),
  ('Mars', 1.88, 1, 1),
  ('Venus', 0.62, 1, 1),
  ('Neptune', 164.8, 1, 1),
  ('Proxima Centauri b', 0.03, 2, 1),
  ('Gliese 876 b', 0.23, 3, 1);

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  planet_id INTEGER NOT NULL REFERENCES planets
);

INSERT INTO moons 
  (name, planet_id)
VALUES
  ('The Moon', 1),('Phobos', 2), ('Deimos', 2), ('Naiad', 4),('Thalassa', 4), ('Despina',4), ('Galatea',4), ('Larissa', 4), ('S/2004 N 1',4), ('Proteus',4), ('Triton',4), ('Nereid',4), ('Halimede',4), ('Sao',4), ('Laomedeia',4), ('Psamathe',4), ('Neso',4);


