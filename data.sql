/* Populate database with sample data. */

INSERT INTO animals VALUES (1, 'Agumon', TO_DATE('2023-05-24', 'YYYY-MM-DD'), 0, false, 10.23);
INSERT INTO animals VALUES (2, 'Gabumon', TO_DATE('2018-11-15', 'YYYY-MM-DD'), 2, true, 8);
INSERT INTO animals VALUES (3, 'Pikachu', TO_DATE('2021-01-07', 'YYYY-MM-DD'), 1, false, 15.04);
INSERT INTO animals VALUES (4, 'Devimon', TO_DATE('2017-05-12', 'YYYY-MM-DD'), 5, true, 11);


INSERT INTO animals VALUES (5, 'Charmander', TO_DATE('2020-02-08', 'YYYY-MM-DD'), 0, false, 11);
INSERT INTO animals VALUES (6, 'Plantmon', TO_DATE('2021-11-15', 'YYYY-MM-DD'), 2, true, -5.7);
INSERT INTO animals VALUES (7, 'Squirtle', TO_DATE('1993-04-02', 'YYYY-MM-DD'), 3, false, -12.13);
INSERT INTO animals VALUES (8, 'Angemon', TO_DATE('2005-06-12', 'YYYY-MM-DD'), 1, true, -45);
INSERT INTO animals VALUES (9, 'Boarmon', TO_DATE('2005-06-07', 'YYYY-MM-DD'), 7, true, 20.4);
INSERT INTO animals VALUES (10, 'Blossom', TO_DATE('1998-10-13', 'YYYY-MM-DD'), 3, true, 17);
INSERT INTO animals VALUES (11, 'Ditto', TO_DATE('2022-05-14', 'YYYY-MM-DD'), 4, true, 22);


INSERT INTO owners (full_name, age)
VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES
('Pokemon'),
('Digimon');

BEGIN;
UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon';
UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE species_id IS NULL;
COMMIT;

BEGIN;
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE NAME IN ('Gabumon', 'Pikachu');
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE NAME IN ('Devimon', 'Plantmon');
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE NAME IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE NAME IN ('Angemon', 'Boarmon');
COMMIT;


INSERT INTO vets (name, age, date_of_graduation)
VALUES
('Willaim Tatcher', 45, TO_DATE('2000-04-23', 'YYYY-MM-DD')),
('Maisy Smith', 26, TO_DATE('2019-01-17', 'YYYY-MM-DD')),
('Stephanie Mendez', 64, TO_DATE('1981-05-04', 'YYYY-MM-DD')),
('Jack Harkness', 38, TO_DATE('2008-06-08', 'YYYY-MM-DD'));

INSERT INTO specializations (vets, species)
VALUES
((SELECT id FROM vets WHERE name = 'William Tatcher'), (SELECT id FROM species WHERE name = 'Pokemon')),
((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Digimon')),
((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Pokemon')),
((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM species WHERE name = 'Digimon'));

INSERT INTO visits (animals, vets, visit_date)
VALUES
((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), TO_DATE('2020-05-24', 'YYYY-MM-DD')),
((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), TO_DATE('2020-07-22', 'YYYY-MM-DD')),
((SELECT id FROM animals WHERE name = 'Gabumon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), TO_DATE('2021-02-02', 'YYYY-MM-DD')),
((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), TO_DATE('2020-01-05', 'YYYY-MM-DD')),
((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), TO_DATE('2020-03-08', 'YYYY-MM-DD')),
((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), TO_DATE('2020-05-14', 'YYYY-MM-DD')),
((SELECT id FROM animals WHERE name = 'Devimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), TO_DATE('2021-05-04', 'YYYY-MM-DD')),
((SELECT id FROM animals WHERE name = 'Charmander'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), TO_DATE('2021-02-24', 'YYYY-MM-DD')),
((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), TO_DATE('2018-12-21', 'YYYY-MM-DD')),
((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), TO_DATE('2020-08-10', 'YYYY-MM-DD')),
((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), TO_DATE('2021-04-07', 'YYYY-MM-DD')),
((SELECT id FROM animals WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), TO_DATE('2019-09-29', 'YYYY-MM-DD')),
((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), TO_DATE('2020-10-03', 'YYYY-MM-DD')),
((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), TO_DATE('2020-11-04', 'YYYY-MM-DD')),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), TO_DATE('2019-01-24', 'YYYY-MM-DD')),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), TO_DATE('2019-05-15', 'YYYY-MM-DD')),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), TO_DATE('2020-02-27', 'YYYY-MM-DD')),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), TO_DATE('2020-08-03', 'YYYY-MM-DD')),
((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), TO_DATE('2020-05-24', 'YYYY-MM-DD')),
((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'William Tatcher'), TO_DATE('2021-01-11', 'YYYY-MM-DD'));


INSERT INTO visits (animals, vets, visit_date) 
	SELECT * FROM (SELECT id FROM animals) animal_ids, 
	(SELECT id FROM vets) vets_ids, 
	generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;


INSERT INTO visits (animals, vets, visit_date) 
	SELECT * FROM (SELECT id FROM animals) animal_ids, 
	(SELECT id FROM vets) vets_ids, 
	generate_series('2021-01-02'::timestamp, '2180-01-01', '4 hours') visit_timestamp;


insert into owners (full_name, email)
	select 'owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';