
⠀⠀⠀⠀⣀⡀                      mdsuz@DESKTOP-Q7062GA
⠀⠀⠀⠀⣿⠙⣦⠀⠀⠀⠀⠀⠀⣀⣤⡶⠛⠁
⠀⠀⠀⠀⢻⠀⠈⠳⠀⠀⣀⣴⡾⠛⠁⣠⠂⢠⠇          Windows 11 Home Single Language (25H2) x86_64
⠀⠀⠀⠀⠈⢀⣀⠤⢤⡶⠟⠁⢀⣴⣟⠀⠀⣾           11th Gen Intel(R) Core(TM) i5-1135G7 (8) @ 4.20 GHz
⠀⠀⠀⠠⠞⠉⢁⠀⠉⠀⢀⣠⣾⣿⣏⠀⢠⡇          󰚗 X513EPN (1.0)
⠀⠀⡰⠋⠀⢰⠃⠀⠀⠉⠛⠿⠿⠏⠁⠀⣸⠁           11.62 GiB / 15.70 GiB (74%)
⠀⠀⣄⠀⠀⠏⣤⣤⣀⡀⠀⠀⠀⠀⠀⠾⢯⣀           314.02 GiB / 475.97 GiB (66%) - NTFS
⠀⠀⣻⠃⠀⣰⡿⠛⠁⠀⠀⠀⢤⣀⡀⠀⠺⣿⡟⠛⠁        21.58 GiB / 400.39 GiB (5%) - NTFS
⠀⡠⠋⡤⠠⠋⠀⠀⢀⠐⠁⠀⠈⣙⢯⡃⠀⢈⡻⣦         355.47 GiB / 531.11 GiB (67%) - NTFS
⢰⣷⠇⠀⠀⠀⢀⡠⠃⠀⠀⠀⠀⠈⠻⢯⡄⠀⢻⣿⣷
⠀⠉⠲⣶⣶⢾⣉⣐⡚⠋⠀⠀⠀⠀⠀⠘⠀⠀⡎⣿⣿⡇      ● ● ● ● ● ● ● ●
⠀⠀⠀⠀⠀⣸⣿⣿⣿⣷⡄⠀⠀⢠⣿⣴⠀⠀⣿⣿⣿⣧
⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⠇⠀⢠⠟⣿⠏⢀⣾⠟⢸⣿⡇
⠀⠀⢠⣿⣿⣿⣿⠟⠘⠁⢠⠜⢉⣐⡥⠞⠋⢁⣴⣿⣿⠃
⠀⠀⣾⢻⣿⣿⠃⠀⠀⡀⢀⡄⠁⠀⠀⢠⡾ᵇʸ ᵗⁿᵏᵃ⠁
⠀⠀⠃⢸⣿⡇⠀⢠⣾⡇⢸⡇⠀⠀⠀⡞
⠀⠀⠀⠈⢿⡇⡰⠋⠈⠙⠂⠙⠢
⠀⠀⠀⠀⠈⢧
PS C:\Users\mdsuz\OneDrive\Desktop\DIU\Database Management System\Theory\Assignment> & "C:\xampp\mysql\bin\mysql.exe" -u root -p
Enter password: 
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 88
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> show databases;
+---------------------+
| Database            |
+---------------------+
| esp32_weather       |
| hall_meal_system    |
| information_schema  |
| mysql               |
| performance_schema  |
| phpmyadmin          |
| routine_db          |
| routinecompanion_db |
| smart_travel        |
| sportsbigdb         |
| sportsdb            |
| test                |
| test_db             |
| university_db       |
+---------------------+
14 rows in set (0.001 sec)

MariaDB [(none)]> DROP DATABASE IF EXISTS university_db;
Query OK, 5 rows affected (0.032 sec)

MariaDB [(none)]> CREATE DATABASE university_db;
Query OK, 1 row affected (0.001 sec)

MariaDB [(none)]> USE university_db;
Database changed
MariaDB [university_db]> CREATE TABLE Student (
    ->     StudentID     INT PRIMARY KEY,
    ->     Name          VARCHAR(100),
    ->     Department    VARCHAR(100),
    ->     EnrollmentYear INT
    -> );
Query OK, 0 rows affected (0.013 sec)

MariaDB [university_db]> 
MariaDB [university_db]> CREATE TABLE Course (
    ->     CourseID    INT PRIMARY KEY,
    ->     CourseName  VARCHAR(100),
    ->     Department  VARCHAR(100),
    ->     Credits     INT
    -> );
Query OK, 0 rows affected (0.006 sec)

MariaDB [university_db]> 
MariaDB [university_db]> CREATE TABLE Enrollment (
    ->     StudentID  INT,
    ->     CourseID   INT,
    ->     Semester   VARCHAR(10),
    ->     Grade      FLOAT,
    ->     PRIMARY KEY (StudentID, CourseID, Semester),
    ->     FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    ->     FOREIGN KEY (CourseID)  REFERENCES Course(CourseID)
    -> );
Query OK, 0 rows affected (0.024 sec)

MariaDB [university_db]> 
MariaDB [university_db]> CREATE TABLE Instructor (
    ->     InstructorID INT PRIMARY KEY,
    ->     Name         VARCHAR(100),
    ->     Department   VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.008 sec)

MariaDB [university_db]> 
MariaDB [university_db]> CREATE TABLE Teaches (
    ->     InstructorID INT,
    ->     CourseID     INT,
    ->     Semester     VARCHAR(10),
    ->     PRIMARY KEY (InstructorID, CourseID, Semester),
    ->     FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID),
    ->     FOREIGN KEY (CourseID)     REFERENCES Course(CourseID)
    -> );
Query OK, 0 rows affected (0.028 sec)

MariaDB [university_db]> INSERT INTO Student VALUES
    -> (1,  'আলিস রহমান',        'CSE', 2019),
    -> (2,  'বাবু হোসেন',        'EEE', 2020),
    -> (3,  'কারলা আক্তার',      'CSE', 2021),
    -> (4,  'দাউদ ইসলাম',        'BBA', 2021),
    -> (5,  'ইভা বেগম',          'CSE', 2022),
    -> (6,  'ফাহিম উদ্দিন',       'EEE', 2022),
    -> (7,  'গীতা শর্মা',        'BBA', 2021),
    -> (8,  'হাসান রেজা',        'CSE', 2023),
    -> (9,  'ইরিন সুলতানা',      'EEE', 2020),
    -> (10, 'জালাল মিয়া',        'BBA', 2023),
    -> (11, 'কামরুল হুদা',       'CSE', 2019),
    -> (12, 'লিমা খাতুন',        'EEE', 2022),
    -> (13, 'মাহবুব আলম',        'BBA', 2021),
    -> (14, 'নাদিয়া ফারুক',      'CSE', 2022),
    -> (15, 'ওমর ফারুক',         'EEE', 2023),
    -> (16, 'পূজা রায়',          'BBA', 2020),
    -> (17, 'কামার জামান',       'CSE', 2021),
    -> (18, 'রিনা চৌধুরী',       'EEE', 2023),
    -> (19, 'সাজিব মোল্লা',      'BBA', 2022),
    -> (20, 'তানিয়া আবেদিন',     'CSE', 2020);
Query OK, 20 rows affected (0.006 sec)
Records: 20  Duplicates: 0  Warnings: 0

MariaDB [university_db]> INSERT INTO Course VALUES
    -> (101, 'Data Structures',        'CSE', 3),
    -> (102, 'Algorithms',             'CSE', 3),
    -> (103, 'Circuit Analysis',       'EEE', 3),
    -> (104, 'Signals & Systems',      'EEE', 3),
    -> (105, 'Marketing Management',   'BBA', 3),
    -> (106, 'Financial Accounting',   'BBA', 3),
    -> (107, 'Database Systems',       'CSE', 3),
    -> (108, 'Operating Systems',      'CSE', 3),
    -> (109, 'Digital Electronics',    'EEE', 3),
    -> (110, 'Business Statistics',    'BBA', 3),
    -> (111, 'Machine Learning',       'CSE', 3),
    -> (112, 'Computer Networks',      'CSE', 3),
    -> (113, 'Power Systems',          'EEE', 3),
    -> (114, 'Managerial Economics',   'BBA', 3),
    -> (115, 'Software Engineering',   'CSE', 3),
    -> (116, 'Microprocessors',        'EEE', 3),
    -> (117, 'Human Resource Mgmt',    'BBA', 3),
    -> (118, 'Artificial Intelligence','CSE', 3),
    -> (119, 'Control Systems',        'EEE', 3),
    -> (120, 'Business Communication', 'BBA', 3);
Query OK, 20 rows affected (0.004 sec)
Records: 20  Duplicates: 0  Warnings: 0

MariaDB [university_db]> INSERT INTO Instructor VALUES
    -> (201, 'Dr. Arifur Rahman',   'CSE'),
    -> (202, 'Dr. Bilkis Jahan',    'EEE'),
    -> (203, 'Dr. Chand Ali',       'BBA'),
    -> (204, 'Prof. Delwar Hossain','CSE'),
    -> (205, 'Prof. Esrat Jahan',   'EEE'),
    -> (206, 'Dr. Farhana Begum',   'BBA'),
    -> (207, 'Dr. Golam Kibria',    'CSE'),
    -> (208, 'Prof. Hasina Parvin', 'EEE'),
    -> (209, 'Dr. Imran Hasan',     'BBA'),
    -> (210, 'Dr. Jasim Uddin',     'CSE'),
    -> (211, 'Prof. Khaleda Akter', 'EEE'),
    -> (212, 'Dr. Liton Miah',      'BBA'),
    -> (213, 'Dr. Motiur Rahman',   'CSE'),
    -> (214, 'Prof. Nasrin Islam',  'EEE'),
    -> (215, 'Dr. Ohidul Islam',    'BBA'),
    -> (216, 'Dr. Parvin Sultana',  'CSE'),
    -> (217, 'Prof. Rafiq Ahmed',   'EEE'),
    -> (218, 'Dr. Salma Khatun',    'BBA'),
    -> (219, 'Dr. Toufiq Hasan',    'CSE'),
    -> (220, 'Prof. Ulfat Ara',     'EEE');
Query OK, 20 rows affected (0.005 sec)
Records: 20  Duplicates: 0  Warnings: 0

MariaDB [university_db]> INSERT INTO Teaches VALUES
    -> (201, 101, 'Spring2024'),
    -> (201, 107, 'Fall2023'),
    -> (202, 103, 'Spring2024'),
    -> (202, 109, 'Fall2023'),
    -> (203, 105, 'Spring2024'),
    -> (203, 106, 'Fall2023'),
    -> (204, 102, 'Spring2024'),
    -> (204, 108, 'Fall2023'),
    -> (205, 104, 'Spring2024'),
    -> (205, 113, 'Fall2023'),
    -> (206, 110, 'Spring2024'),
    -> (206, 114, 'Fall2023'),
    -> (207, 111, 'Spring2024'),
    -> (207, 115, 'Fall2023'),
    -> (208, 116, 'Spring2024'),
    -> (208, 119, 'Fall2023'),
    -> (209, 117, 'Spring2024'),
    -> (209, 120, 'Fall2023'),
    -> (210, 112, 'Spring2024'),
    -> (210, 118, 'Spring2024');
Query OK, 20 rows affected (0.008 sec)
Records: 20  Duplicates: 0  Warnings: 0

MariaDB [university_db]> INSERT INTO Enrollment VALUES
    -> (1,  101, 'Spring2024', 3.7),
    -> (2,  103, 'Spring2024', 3.2),
    -> (3,  101, 'Spring2024', 3.9),
    -> (4,  105, 'Spring2024', 2.8),
    -> (5,  101, 'Spring2024', 3.5),
    -> (6,  103, 'Spring2024', 2.5),
    -> (7,  105, 'Spring2024', 3.1),
    -> (8,  107, 'Spring2024', 3.8),
    -> (9,  104, 'Spring2024', 3.0),
    -> (10, 110, 'Spring2024', 2.3),
    -> (11, 102, 'Spring2024', 1.8),
    -> (12, 104, 'Spring2024', 3.6),
    -> (13, 106, 'Spring2024', 2.9),
    -> (14, 111, 'Spring2024', 3.4),
    -> (15, 104, 'Spring2024', 2.7),
    -> (16, 110, 'Spring2024', 3.3),
    -> (17, 102, 'Spring2024', 3.6),
    -> (18, 116, 'Spring2024', 2.1),
    -> (19, 117, 'Spring2024', 3.0),
    -> (20, 112, 'Spring2024', 3.7);
Query OK, 20 rows affected (0.008 sec)
Records: 20  Duplicates: 0  Warnings: 0

MariaDB [university_db]> SELECT
    ->     s.StudentID,
    ->     s.Name        AS StudentName,
    ->     c.CourseName,
    ->     i.Name        AS InstructorName
    -> FROM Student s
    -> JOIN Enrollment e  ON s.StudentID   = e.StudentID   AND e.Semester = 'Spring2024'
    -> JOIN Course     c  ON e.CourseID    = c.CourseID
    -> JOIN Teaches    t  ON c.CourseID    = t.CourseID     AND t.Semester = 'Spring2024'
    -> JOIN Instructor i  ON t.InstructorID = i.InstructorID
    -> ORDER BY s.StudentID;
+-----------+---------------------------------------+----------------------+----------------------+
| StudentID | StudentName                           | CourseName           | InstructorName       |
+-----------+---------------------------------------+----------------------+----------------------+
|         1 | আলিস রহমান                            | Data Structures      | Dr. Arifur Rahman    |
|         2 | বাবু হোসেন                            | Circuit Analysis     | Dr. Bilkis Jahan     |
|         3 | কারলা আক্তার                          | Data Structures      | Dr. Arifur Rahman    |
|         4 | দাউদ ইসলাম                            | Marketing Management | Dr. Chand Ali        |
|         5 | ইভা বেগম                              | Data Structures      | Dr. Arifur Rahman    |
|         6 | ফাহিম উদ্দিন                          | Circuit Analysis     | Dr. Bilkis Jahan     |
|         7 | গীতা শর্মা                            | Marketing Management | Dr. Chand Ali        |
|         9 | ইরিন সুলতানা                          | Signals & Systems    | Prof. Esrat Jahan    |
|        10 | জালাল মিয়া                            | Business Statistics  | Dr. Farhana Begum    |
|        11 | কামরুল হুদা                           | Algorithms           | Prof. Delwar Hossain |
|        12 | লিমা খাতুন                            | Signals & Systems    | Prof. Esrat Jahan    |
|        14 | নাদিয়া ফারুক                          | Machine Learning     | Dr. Golam Kibria     |
|        15 | ওমর ফারুক                             | Signals & Systems    | Prof. Esrat Jahan    |
|        16 | পূজা রায়                              | Business Statistics  | Dr. Farhana Begum    |
|        17 | কামার জামান                           | Algorithms           | Prof. Delwar Hossain |
|        18 | রিনা চৌধুরী                           | Microprocessors      | Prof. Hasina Parvin  |
|        19 | সাজিব মোল্লা                          | Human Resource Mgmt  | Dr. Imran Hasan      |
|        20 | তানিয়া আবেদিন                         | Computer Networks    | Dr. Jasim Uddin      |
+-----------+---------------------------------------+----------------------+----------------------+
18 rows in set (0.001 sec)

MariaDB [university_db]> SELECT
    ->     c.CourseID,
    ->     c.CourseName,
    ->     ROUND(AVG(e.Grade), 2) AS AverageGrade
    -> FROM Enrollment e
    -> JOIN Course  c ON e.CourseID  = c.CourseID
    -> JOIN Student s ON e.StudentID = s.StudentID
    -> WHERE s.EnrollmentYear > 2020
    -> GROUP BY c.CourseID, c.CourseName
    -> ORDER BY c.CourseID;
+----------+----------------------+--------------+
| CourseID | CourseName           | AverageGrade |
+----------+----------------------+--------------+
|      101 | Data Structures      |         3.70 |
|      102 | Algorithms           |         3.60 |
|      103 | Circuit Analysis     |         2.50 |
|      104 | Signals & Systems    |         3.15 |
|      105 | Marketing Management |         2.95 |
|      106 | Financial Accounting |         2.90 |
|      107 | Database Systems     |         3.80 |
|      110 | Business Statistics  |         2.30 |
|      111 | Machine Learning     |         3.40 |
|      116 | Microprocessors      |         2.10 |
|      117 | Human Resource Mgmt  |         3.00 |
+----------+----------------------+--------------+
11 rows in set (0.001 sec)

MariaDB [university_db]> DROP FUNCTION IF EXISTS calculateGPA;
Query OK, 0 rows affected, 1 warning (0.002 sec)

MariaDB [university_db]> 
MariaDB [university_db]> DELIMITER $$
MariaDB [university_db]> CREATE FUNCTION calculateGPA(student_id INT)
    -> RETURNS DECIMAL(4,2)
    -> DETERMINISTIC
    -> READS SQL DATA
    -> BEGIN
    ->     DECLARE gpa DECIMAL(4,2);
    ->     SELECT ROUND(AVG(Grade), 2) INTO gpa
    ->     FROM Enrollment
    ->     WHERE StudentID = student_id;
    ->     RETURN IFNULL(gpa, 0.00);
    -> END$$
Query OK, 0 rows affected (0.005 sec)

MariaDB [university_db]> DELIMITER ;
MariaDB [university_db]> SELECT StudentID, Name, calculateGPA(StudentID) AS GPA
    -> FROM Student
    -> ORDER BY StudentID;
+-----------+---------------------------------------+------+
| StudentID | Name                                  | GPA  |
+-----------+---------------------------------------+------+
|         1 | আলিস রহমান                            | 3.70 |
|         2 | বাবু হোসেন                            | 3.20 |
|         3 | কারলা আক্তার                          | 3.90 |
|         4 | দাউদ ইসলাম                            | 2.80 |
|         5 | ইভা বেগম                              | 3.50 |
|         6 | ফাহিম উদ্দিন                          | 2.50 |
|         7 | গীতা শর্মা                            | 3.10 |
|         8 | হাসান রেজা                            | 3.80 |
|         9 | ইরিন সুলতানা                          | 3.00 |
|        10 | জালাল মিয়া                            | 2.30 |
|        11 | কামরুল হুদা                           | 1.80 |
|        12 | লিমা খাতুন                            | 3.60 |
|        13 | মাহবুব আলম                            | 2.90 |
|        14 | নাদিয়া ফারুক                          | 3.40 |
|        15 | ওমর ফারুক                             | 2.70 |
|        16 | পূজা রায়                              | 3.30 |
|        17 | কামার জামান                           | 3.60 |
|        18 | রিনা চৌধুরী                           | 2.10 |
|        19 | সাজিব মোল্লা                          | 3.00 |
|        20 | তানিয়া আবেদিন                         | 3.70 |
+-----------+---------------------------------------+------+
20 rows in set (0.002 sec)

MariaDB [university_db]> SELECT
    ->     s.StudentID,
    ->     s.Name,
    ->     calculateGPA(s.StudentID) AS GPA,
    ->     CASE
    ->         WHEN calculateGPA(s.StudentID) > 3.5                                       THEN 'Excellent'
    ->         WHEN calculateGPA(s.StudentID) >= 3.0 AND calculateGPA(s.StudentID) <= 3.5 THEN 'Good'
    ->         WHEN calculateGPA(s.StudentID) >= 2.0 AND calculateGPA(s.StudentID) < 3.0  THEN 'Average'
    ->         ELSE 'Poor'
    ->     END AS PerformanceCategory
    -> FROM Student s
    -> ORDER BY s.StudentID;
+-----------+---------------------------------------+------+---------------------+
| StudentID | Name                                  | GPA  | PerformanceCategory |
+-----------+---------------------------------------+------+---------------------+
|         1 | আলিস রহমান                            | 3.70 | Excellent           |
|         2 | বাবু হোসেন                            | 3.20 | Good                |
|         3 | কারলা আক্তার                          | 3.90 | Excellent           |
|         4 | দাউদ ইসলাম                            | 2.80 | Average             |
|         5 | ইভা বেগম                              | 3.50 | Good                |
|         6 | ফাহিম উদ্দিন                          | 2.50 | Average             |
|         7 | গীতা শর্মা                            | 3.10 | Good                |
|         8 | হাসান রেজা                            | 3.80 | Excellent           |
|         9 | ইরিন সুলতানা                          | 3.00 | Good                |
|        10 | জালাল মিয়া                            | 2.30 | Average             |
|        11 | কামরুল হুদা                           | 1.80 | Poor                |
|        12 | লিমা খাতুন                            | 3.60 | Excellent           |
|        13 | মাহবুব আলম                            | 2.90 | Average             |
|        14 | নাদিয়া ফারুক                          | 3.40 | Good                |
|        15 | ওমর ফারুক                             | 2.70 | Average             |
|        16 | পূজা রায়                              | 3.30 | Good                |
|        17 | কামার জামান                           | 3.60 | Excellent           |
|        18 | রিনা চৌধুরী                           | 2.10 | Average             |
|        19 | সাজিব মোল্লা                          | 3.00 | Good                |
|        20 | তানিয়া আবেদিন                         | 3.70 | Excellent           |
+-----------+---------------------------------------+------+---------------------+
20 rows in set (0.003 sec)

MariaDB [university_db]> DROP PROCEDURE IF EXISTS GetDepartmentGPA;
Query OK, 0 rows affected, 1 warning (0.001 sec)

MariaDB [university_db]> 
MariaDB [university_db]> DELIMITER $$
MariaDB [university_db]> CREATE PROCEDURE GetDepartmentGPA(IN dept_name VARCHAR(100))
    -> BEGIN
    ->     DECLARE done      INT DEFAULT FALSE;
    ->     DECLARE stu_id    INT;
    ->     DECLARE stu_name  VARCHAR(100);
    ->     DECLARE stu_gpa   DECIMAL(4,2);
    -> 
    ->     DECLARE cur CURSOR FOR
    ->         SELECT StudentID, Name
    ->         FROM Student
    ->         WHERE Department = dept_name;
    -> 
    ->     DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    -> 
    ->     OPEN cur;
    -> 
    ->     read_loop: LOOP
    ->         FETCH cur INTO stu_id, stu_name;
    ->         IF done THEN
    ->             LEAVE read_loop;
    ->         END IF;
    ->         SET stu_gpa = calculateGPA(stu_id);
    ->         SELECT stu_id AS StudentID, stu_name AS Name, stu_gpa AS GPA;
    ->     END LOOP;
    -> 
    ->     CLOSE cur;
    -> END$$
Query OK, 0 rows affected (0.007 sec)

MariaDB [university_db]> DELIMITER ;
MariaDB [university_db]> CALL GetDepartmentGPA('CSE');
+-----------+------------------------------+------+
| StudentID | Name                         | GPA  |
+-----------+------------------------------+------+
|         1 | আলিস রহমান                   | 3.70 |
+-----------+------------------------------+------+
1 row in set (0.001 sec)

+-----------+------------------------------------+------+
| StudentID | Name                               | GPA  |
+-----------+------------------------------------+------+
|         3 | কারলা আক্তার                       | 3.90 |
+-----------+------------------------------------+------+
1 row in set (0.007 sec)

+-----------+------------------------+------+
| StudentID | Name                   | GPA  |
+-----------+------------------------+------+
|         5 | ইভা বেগম               | 3.50 |
+-----------+------------------------+------+
1 row in set (0.009 sec)

+-----------+------------------------------+------+
| StudentID | Name                         | GPA  |
+-----------+------------------------------+------+
|         8 | হাসান রেজা                   | 3.80 |
+-----------+------------------------------+------+
1 row in set (0.010 sec)

+-----------+---------------------------------+------+
| StudentID | Name                            | GPA  |
+-----------+---------------------------------+------+
|        11 | কামরুল হুদা                     | 1.80 |
+-----------+---------------------------------+------+
1 row in set (0.011 sec)

+-----------+------------------------------------+------+
| StudentID | Name                               | GPA  |
+-----------+------------------------------------+------+
|        14 | নাদিয়া ফারুক                       | 3.40 |
+-----------+------------------------------------+------+
1 row in set (0.014 sec)

+-----------+---------------------------------+------+
| StudentID | Name                            | GPA  |
+-----------+---------------------------------+------+
|        17 | কামার জামান                     | 3.60 |
+-----------+---------------------------------+------+
1 row in set (0.017 sec)

+-----------+---------------------------------------+------+
| StudentID | Name                                  | GPA  |
+-----------+---------------------------------------+------+
|        20 | তানিয়া আবেদিন                         | 3.70 |
+-----------+---------------------------------------+------+
1 row in set (0.019 sec)

Query OK, 8 rows affected (0.022 sec)

MariaDB [university_db]> SELECT s.StudentID, s.Name, s.Department
    -> FROM Student s
    -> LEFT JOIN Enrollment e ON s.StudentID = e.StudentID
    -> WHERE e.StudentID IS NULL;
Empty set (0.003 sec)

MariaDB [university_db]> INSERT INTO Student VALUES
    -> (21, 'রাহিম উদ্দিন', 'CSE', 2026),
    -> (22, 'শিলা আক্তার', 'EEE', 2026),
    -> (23, 'তানভীর হাসান', 'BBA', 2026);
Query OK, 3 rows affected (0.005 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [university_db]> SELECT s.StudentID, s.Name, s.Department
    -> FROM Student s
    -> LEFT JOIN Enrollment e ON s.StudentID = e.StudentID
    -> WHERE e.StudentID IS NULL;
+-----------+------------------------------------+------------+
| StudentID | Name                               | Department |
+-----------+------------------------------------+------------+
|        21 | রাহিম উদ্দিন                       | CSE        |
|        22 | শিলা আক্তার                        | EEE        |
|        23 | তানভীর হাসান                       | BBA        |
+-----------+------------------------------------+------------+
3 rows in set (0.001 sec)

MariaDB [university_db]> 