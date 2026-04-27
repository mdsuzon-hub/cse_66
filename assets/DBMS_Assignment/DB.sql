-- ============================================================
--  DATABASE ASSIGNMENT: University Course Management System
--  MySQL Script - All Tables, Sample Data, and Queries
-- ============================================================

-- Drop and recreate schema
DROP DATABASE IF EXISTS university_db;
CREATE DATABASE university_db;
USE university_db;

-- TABLE CREATION
CREATE TABLE Student (
    StudentID     INT PRIMARY KEY,
    Name          VARCHAR(100),
    Department    VARCHAR(100),
    EnrollmentYear INT
);

CREATE TABLE Course (
    CourseID    INT PRIMARY KEY,
    CourseName  VARCHAR(100),
    Department  VARCHAR(100),
    Credits     INT
);

CREATE TABLE Enrollment (
    StudentID  INT,
    CourseID   INT,
    Semester   VARCHAR(10),
    Grade      FLOAT,
    PRIMARY KEY (StudentID, CourseID, Semester),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID)  REFERENCES Course(CourseID)
);

CREATE TABLE Instructor (
    InstructorID INT PRIMARY KEY,
    Name         VARCHAR(100),
    Department   VARCHAR(100)
);

CREATE TABLE Teaches (
    InstructorID INT,
    CourseID     INT,
    Semester     VARCHAR(10),
    PRIMARY KEY (InstructorID, CourseID, Semester),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID),
    FOREIGN KEY (CourseID)     REFERENCES Course(CourseID)
);

-- SAMPLE DATA (20 rows per table)
-- Students
INSERT INTO Student VALUES
(1,  'আলিস রহমান',        'CSE', 2019),
(2,  'বাবু হোসেন',        'EEE', 2020),
(3,  'কারলা আক্তার',      'CSE', 2021),
(4,  'দাউদ ইসলাম',        'BBA', 2021),
(5,  'ইভা বেগম',          'CSE', 2022),
(6,  'ফাহিম উদ্দিন',       'EEE', 2022),
(7,  'গীতা শর্মা',        'BBA', 2021),
(8,  'হাসান রেজা',        'CSE', 2023),
(9,  'ইরিন সুলতানা',      'EEE', 2020),
(10, 'জালাল মিয়া',        'BBA', 2023),
(11, 'কামরুল হুদা',       'CSE', 2019),
(12, 'লিমা খাতুন',        'EEE', 2022),
(13, 'মাহবুব আলম',        'BBA', 2021),
(14, 'নাদিয়া ফারুক',      'CSE', 2022),
(15, 'ওমর ফারুক',         'EEE', 2023),
(16, 'পূজা রায়',          'BBA', 2020),
(17, 'কামার জামান',       'CSE', 2021),
(18, 'রিনা চৌধুরী',       'EEE', 2023),
(19, 'সাজিব মোল্লা',      'BBA', 2022),
(20, 'তানিয়া আবেদিন',     'CSE', 2020);

-- Courses
INSERT INTO Course VALUES
(101, 'Data Structures',        'CSE', 3),
(102, 'Algorithms',             'CSE', 3),
(103, 'Circuit Analysis',       'EEE', 3),
(104, 'Signals & Systems',      'EEE', 3),
(105, 'Marketing Management',   'BBA', 3),
(106, 'Financial Accounting',   'BBA', 3),
(107, 'Database Systems',       'CSE', 3),
(108, 'Operating Systems',      'CSE', 3),
(109, 'Digital Electronics',    'EEE', 3),
(110, 'Business Statistics',    'BBA', 3),
(111, 'Machine Learning',       'CSE', 3),
(112, 'Computer Networks',      'CSE', 3),
(113, 'Power Systems',          'EEE', 3),
(114, 'Managerial Economics',   'BBA', 3),
(115, 'Software Engineering',   'CSE', 3),
(116, 'Microprocessors',        'EEE', 3),
(117, 'Human Resource Mgmt',    'BBA', 3),
(118, 'Artificial Intelligence','CSE', 3),
(119, 'Control Systems',        'EEE', 3),
(120, 'Business Communication', 'BBA', 3);

-- Instructors
INSERT INTO Instructor VALUES
(201, 'Dr. Arifur Rahman',   'CSE'),
(202, 'Dr. Bilkis Jahan',    'EEE'),
(203, 'Dr. Chand Ali',       'BBA'),
(204, 'Prof. Delwar Hossain','CSE'),
(205, 'Prof. Esrat Jahan',   'EEE'),
(206, 'Dr. Farhana Begum',   'BBA'),
(207, 'Dr. Golam Kibria',    'CSE'),
(208, 'Prof. Hasina Parvin', 'EEE'),
(209, 'Dr. Imran Hasan',     'BBA'),
(210, 'Dr. Jasim Uddin',     'CSE'),
(211, 'Prof. Khaleda Akter', 'EEE'),
(212, 'Dr. Liton Miah',      'BBA'),
(213, 'Dr. Motiur Rahman',   'CSE'),
(214, 'Prof. Nasrin Islam',  'EEE'),
(215, 'Dr. Ohidul Islam',    'BBA'),
(216, 'Dr. Parvin Sultana',  'CSE'),
(217, 'Prof. Rafiq Ahmed',   'EEE'),
(218, 'Dr. Salma Khatun',    'BBA'),
(219, 'Dr. Toufiq Hasan',    'CSE'),
(220, 'Prof. Ulfat Ara',     'EEE');

-- Teaches
INSERT INTO Teaches VALUES
(201, 101, 'Spring2024'),
(201, 107, 'Fall2023'),
(202, 103, 'Spring2024'),
(202, 109, 'Fall2023'),
(203, 105, 'Spring2024'),
(203, 106, 'Fall2023'),
(204, 102, 'Spring2024'),
(204, 108, 'Fall2023'),
(205, 104, 'Spring2024'),
(205, 113, 'Fall2023'),
(206, 110, 'Spring2024'),
(206, 114, 'Fall2023'),
(207, 111, 'Spring2024'),
(207, 115, 'Fall2023'),
(208, 116, 'Spring2024'),
(208, 119, 'Fall2023'),
(209, 117, 'Spring2024'),
(209, 120, 'Fall2023'),
(210, 112, 'Spring2024'),
(210, 118, 'Spring2024');

-- Enrollments
INSERT INTO Enrollment VALUES
(1,  101, 'Spring2024', 3.7),
(2,  103, 'Spring2024', 3.2),
(3,  101, 'Spring2024', 3.9),
(4,  105, 'Spring2024', 2.8),
(5,  101, 'Spring2024', 3.5),
(6,  103, 'Spring2024', 2.5),
(7,  105, 'Spring2024', 3.1),
(8,  107, 'Spring2024', 3.8),
(9,  104, 'Spring2024', 3.0),
(10, 110, 'Spring2024', 2.3),
(11, 102, 'Spring2024', 1.8),
(12, 104, 'Spring2024', 3.6),
(13, 106, 'Spring2024', 2.9),
(14, 111, 'Spring2024', 3.4),
(15, 104, 'Spring2024', 2.7),
(16, 110, 'Spring2024', 3.3),
(17, 102, 'Spring2024', 3.6),
(18, 116, 'Spring2024', 2.1),
(19, 117, 'Spring2024', 3.0),
(20, 112, 'Spring2024', 3.7);