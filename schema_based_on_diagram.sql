-- create patients table
CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  date_of_birth DATE NOT NULL
);

-- create medical_histories table
CREATE TABLE medical_histories (
  id SERIAL PRIMARY KEY,
  admitted_at TIMESTAMP NOT NULL,
  status TEXT NOT NULL,
  patient_id INTEGER NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES patients (id)
);

-- create treatments table
CREATE TABLE treatments (
  id SERIAL PRIMARY KEY,
  type TEXT NOT NULL,
  name TEXT NOT NULL
);
