DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    disease TEXT NOT NULL
);

CREATE TABLE doctors_patients
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE
);

CREATE TABLE patients_diseases
(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
    disease_id INTEGER REFERENCES diseases ON DELETE CASCADE
);

INSERT INTO doctors (first_name, last_name )
VALUES
('Anthony', 'Fauci'),
('Virginia', 'Apgar'),
('Christian', 'Barnard');

INSERT INTO patients (first_name, last_name )
VALUES
('Kim', 'Liam'),
('Karim', 'Ahtam'),
('Chris', 'Bosh'),
('David','Banting');

INSERT INTO diseases (disease)
VALUES
('Heart disease'),
('Cancer'),
('Diabetes');

INSERT INTO doctors_patients( doctor_id, patient_id)
VALUES
(1,4),
(1,2),
(2, 1),
(3,3),
(3,2);

INSERT INTO patients_diseases(patient_id, disease_id)
VALUES
(1,2),
(2,1),
(2, 3),
(3,3),
(4,1);
