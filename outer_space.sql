-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space


  CREATE TABLE galaxies 
  (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
  );

  CREATE TABLE celestial_bodies
  (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
  );

  CREATE TABLE moons 
  (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
  );

  CREATE TABLE planets
  (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  center_body_id INT  NOT NULL REFERENCES celestial_bodies,
  galaxy_id INT NOT NULL REFERENCES galaxies
  );

  CREATE TABLE planets_moons
  (
    id SERIAL PRIMARY KEY,
    planet_id INT NOT NULL REFERENCES planets,
    moon_id INT NOT NULL REFERENCES moons
  );


INSERT INTO celestial_bodies (name)
VALUES 
('The Sun'),
('Proxima Centauri'),
('Gliese 876');

INSERT INTO galaxies (name)
VALUES
('Milky Way');

INSERT INTO planets (name, orbital_period_in_years, center_body_id, galaxy_id)
VALUES 
('Earth', 1.00, 1, 1),
('Mars', 1.88, 1, 1),
('Venus', 0.62, 1, 1),
('Neptune', 164.8, 1, 1),
('Proxima Centauri b', 0.03, 2, 1),
('Gliese 876 b', 0.23, 3, 1);



INSERT INTO moons (name)
VALUES 
('The Moon'),
('Phobos'),
('Deimos'),
('Naiad'),
('Thalassa'),
('Despina'),
('Galatea'),
('Larissa'),
('S/2004 N 1'),
('Proteus'),
('Triton'),
('Nereid'),
('Halimede'),
('Sao'),
('Laomedeia'),
('Psamathe'),
('Neso');
