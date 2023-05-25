/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals
WHERE name LIKE '%mon';

SELECT * FROM animals
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name FROM animals
WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth FROM animals
WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals
WHERE weight_kg > 10.5;

SELECT * FROM animals
WHERE neutered = true;

SELECT * FROM animals
WHERE name NOT IN ('Gabumon');

SELECT * FROM animals
WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species = '';
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT savepoint_delete_after_2022_01_01;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO savepoint_delete_after_2022_01_01;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;

SELECT COUNT(escape_attempts) FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, SUM(escape_attempts) AS sum_of_escape_attempts FROM animals
GROUP BY neutered
ORDER BY sum_of_escape_attempts DESC
LIMIT 1;

SELECT neutered, MIN(weight_kg) AS minimum_weight, MAX(weight_kg) AS maximum_weight FROM animals
GROUP BY neutered;

SELECT neutered, AVG(escape_attempts) as average_escape_attempts FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '1999-12-31'
GROUP BY neutered;
