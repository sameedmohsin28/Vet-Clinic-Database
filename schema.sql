/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id INT NOT NULL    GENERATED ALWAYS AS IDENTITY,
  name       TEXT,
  date_of_birth      DATE,
  escape_attempts    INT,
  neutered   BOOLEAN,
  weight_kg  DECIMAL(5, 2)
);


ALTER TABLE animals
ADD COLUMN species TEXT;


CREATE TABLE owners (
id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
full_name TEXT,
age INT
);

CREATE TABLE species (
id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
name TEXT
);

ALTER TABLE animals
DROP COLUMN species;
ALTER TABLE animals
ADD COLUMN species_id INT CONSTRAINT species REFERENCES species(id),
ADD COLUMN owner_id INT CONSTRAINT owners REFERENCES owners(id);


CREATE TABLE vets(
id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
name TEXT,
age INT,
date_of_graduation DATE
);

CREATE TABLE specializations (
vets INT REFERENCES vets(id),
species INT REFERENCES species(id),
PRIMARY KEY (vets, species)
);

CREATE TABLE visits (
animals INT REFERENCES animals(id),
vets INT REFERENCES vets(id),
visit_date DATE,
PRIMARY KEY (animals, vets)
);

DROP TABLE visits;

CREATE TABLE IF NOT EXISTS visits(
  animals INT REFERENCES animals(id),
  vets INT REFERENCES vets(id),
  visit_date TIMESTAMP NOT NULL,
  PRIMARY KEY (animals, vets, visit_date)
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX idx_visits_animal_id ON visits(animals);
CREATE INDEX idx_visits_vet_id_animal_id ON visits(vets, animals);
