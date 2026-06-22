CREATE DATABASE IF NOT EXISTS p23137_erg3_university;
USE p23137_erg3_university;

CREATE TABLE users (
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    salt VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    department VARCHAR(100)
);

CREATE TABLE professors (
    username VARCHAR(50) PRIMARY KEY,
    specialization VARCHAR(100),
    FOREIGN KEY (username) REFERENCES users(username) ON DELETE CASCADE
);

CREATE TABLE students (
    username VARCHAR(50) PRIMARY KEY,
    registration_number INT NOT NULL UNIQUE,
    FOREIGN KEY (username) REFERENCES users(username) ON DELETE CASCADE
);

CREATE TABLE secretaries (
    username VARCHAR(50) PRIMARY KEY,
    office VARCHAR(50),
    FOREIGN KEY (username) REFERENCES users(username) ON DELETE CASCADE
);

CREATE TABLE courses (
    courseCode VARCHAR(20) PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    semester INT NOT NULL, -- Νέο πεδίο: Εξάμηνο
    credits INT NOT NULL,
    professor_username VARCHAR(50), 
    FOREIGN KEY (professor_username) REFERENCES professors(username) ON DELETE SET NULL
);

CREATE TABLE grades (
    student_username VARCHAR(50),
    courseCode VARCHAR(20),
    grade DECIMAL(4,2), -- Π.χ. 8.50
    FOREIGN KEY (student_username) REFERENCES students(username) ON DELETE CASCADE,
    FOREIGN KEY (courseCode) REFERENCES courses(courseCode) ON DELETE CASCADE,
    PRIMARY KEY (student_username, courseCode)
);

INSERT INTO users (username, password, salt, role, name, surname, department) VALUES 
('bab', SHA2(CONCAT('1234', 'randomSalt1'), 256), 'randomSalt1', 'SECRETARY', 'Babis', 'Augos', 'Administration'),
('profnick', SHA2(CONCAT('1234', 'randomSalt2'), 256), 'randomSalt2', 'PROFESSOR', 'George', 'Nick', 'Mathematics'),
('profmaria', SHA2(CONCAT('1234', 'randomSalt3'), 256), 'randomSalt3', 'PROFESSOR', 'Maria', 'Pappa', 'Informatics'),
('studgiannis', SHA2(CONCAT('1234', 'randomSalt4'), 256), 'randomSalt4', 'STUDENT', 'Giannis', 'Papadopoulos', 'Informatics');

INSERT INTO secretaries (username, office) VALUES ('bab', 'Room 101');
INSERT INTO professors (username, specialization) VALUES 
('profnick', 'Algebra'),
('profmaria', 'Databases');
INSERT INTO students (username, registration_number) VALUES ('studgiannis', 1001);

INSERT INTO courses (courseCode, title, semester, credits, professor_username) VALUES 
('MATH101', 'Algebra I', 1, 5, 'profnick'),
('CS101', 'Intro to Programming', 1, 6, NULL),
('DB201', 'Databases', 3, 5, 'profmaria');

INSERT INTO grades (student_username, courseCode, grade) VALUES ('studgiannis', 'DB201', 8.5);

INSERT INTO courses (courseCode, title, semester, credits, professor_username) 
VALUES ('CS102', 'Αντικειμενοστρεφής Προγραμματισμός', 2, 6, NULL);

INSERT INTO courses (courseCode, title, semester, credits, professor_username) 
VALUES ('MULT601', 'Συστήματα Πολυμέσων', 6, 5, NULL);