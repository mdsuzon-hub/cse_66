-- ============================================================
-- TASK 1: SQL JOINs
-- List all students with courses and instructors in Spring2024
-- ============================================================
SELECT
    s.StudentID,
    s.Name        AS StudentName,
    c.CourseName,
    i.Name        AS InstructorName
FROM Student s
JOIN Enrollment e  ON s.StudentID   = e.StudentID   AND e.Semester = 'Spring2024'
JOIN Course     c  ON e.CourseID    = c.CourseID
JOIN Teaches    t  ON c.CourseID    = t.CourseID     AND t.Semester = 'Spring2024'
JOIN Instructor i  ON t.InstructorID = i.InstructorID
ORDER BY s.StudentID;

-- ============================================================
-- TASK 2: Aggregation with Condition
-- Average grade per course, only students enrolled after 2020
-- ============================================================
SELECT
    c.CourseID,
    c.CourseName,
    ROUND(AVG(e.Grade), 2) AS AverageGrade
FROM Enrollment e
JOIN Course  c ON e.CourseID  = c.CourseID
JOIN Student s ON e.StudentID = s.StudentID
WHERE s.EnrollmentYear > 2020
GROUP BY c.CourseID, c.CourseName
ORDER BY c.CourseID;

-- ============================================================
-- TASK 3: User-Defined Function — calculateGPA
-- ============================================================
DROP FUNCTION IF EXISTS calculateGPA;

DELIMITER $$
CREATE FUNCTION calculateGPA(student_id INT)
RETURNS DECIMAL(4,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE gpa DECIMAL(4,2);
    SELECT ROUND(AVG(Grade), 2) INTO gpa
    FROM Enrollment
    WHERE StudentID = student_id;
    RETURN IFNULL(gpa, 0.00);
END$$
DELIMITER ;

-- Test the function
SELECT StudentID, Name, calculateGPA(StudentID) AS GPA
FROM Student
ORDER BY StudentID;

-- ============================================================
-- TASK 4: Conditional Output using CASE WHEN
-- ============================================================
SELECT
    s.StudentID,
    s.Name,
    calculateGPA(s.StudentID) AS GPA,
    CASE
        WHEN calculateGPA(s.StudentID) > 3.5                                       THEN 'Excellent'
        WHEN calculateGPA(s.StudentID) >= 3.0 AND calculateGPA(s.StudentID) <= 3.5 THEN 'Good'
        WHEN calculateGPA(s.StudentID) >= 2.0 AND calculateGPA(s.StudentID) < 3.0  THEN 'Average'
        ELSE 'Poor'
    END AS PerformanceCategory
FROM Student s
ORDER BY s.StudentID;

-- ============================================================
-- TASK 5: Stored Procedure with Cursor and Loop
-- ============================================================
DROP PROCEDURE IF EXISTS GetDepartmentGPA;

DELIMITER $$
CREATE PROCEDURE GetDepartmentGPA(IN dept_name VARCHAR(100))
BEGIN
    DECLARE done      INT DEFAULT FALSE;
    DECLARE stu_id    INT;
    DECLARE stu_name  VARCHAR(100);
    DECLARE stu_gpa   DECIMAL(4,2);

    DECLARE cur CURSOR FOR
        SELECT StudentID, Name
        FROM Student
        WHERE Department = dept_name;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO stu_id, stu_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SET stu_gpa = calculateGPA(stu_id);
        SELECT stu_id AS StudentID, stu_name AS Name, stu_gpa AS GPA;
    END LOOP;

    CLOSE cur;
END$$
DELIMITER ;

-- Execute the procedure for CSE department
CALL GetDepartmentGPA('CSE');

-- ============================================================
-- BONUS TASK: Students who never enrolled in any course
-- ============================================================
-- Add
INSERT INTO Student VALUES
(21, 'রাহিম উদ্দিন', 'CSE', 2026),
(22, 'শিলা আক্তার', 'EEE', 2026),
(23, 'তানভীর হাসান', 'BBA', 2026);

SELECT s.StudentID, s.Name, s.Department
FROM Student s
LEFT JOIN Enrollment e ON s.StudentID = e.StudentID
WHERE e.StudentID IS NULL;