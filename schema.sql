/* Database schema to keep the structure of entire database. */

vet_clinic=# CREATE TABLE animals (
vet_clinic(# id INT NOT NULL    GENERATED ALWAYS AS IDENTITY,
vet_clinic(# name       TEXT,
vet_clinic(# date_of_birth      DATE,
vet_clinic(# escape_attempts    INT,
vet_clinic(# neutered   BOOLEAN,
vet_clinic(# weight_kg  DECIMAL(5, 2)
vet_clinic(# )
vet_clinic-# ;
