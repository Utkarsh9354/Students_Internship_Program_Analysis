CREATE DATABASE skill_dev_db;

USE skill_dev_db;

SELECT * FROM students_data;

DESCRIBE students_data;

DROP TABLE students_data;

ALTER TABLE students_data
		MODIFY COLUMN name VARCHAR(50),
		MODIFY COLUMN email VARCHAR(256) NOT NULL,
        MODIFY COLUMN college VARCHAR(256) NOT NULL,
		MODIFY COLUMN year VARCHAR(50) NOT NULL,
		MODIFY COLUMN department VARCHAR(50),
		MODIFY COLUMN courses VARCHAR(256);

-- 1)	What are the top 5 most popular internship courses among students? 
 
			SELECT courses, COUNT(*) AS Numberofstudents
			FROM students_data
			GROUP BY courses
			ORDER BY Numberofstudents DESC
			LIMIT 5;
            
            
-- 2)	What is the total number of students from each department?

			SELECT department, COUNT(*) AS Numberofstudents
			FROM students_data
			GROUP BY department;
            
            
-- 3)	What is the distribution of students by year
		-- ('First', 'Second', 'Third', 'Fourth', 'Graduation')  and department?
        
			SELECT year, department, COUNT(*) AS number_of_students
			FROM students_data
			WHERE year IN ('First', 'Second', 'Third', 'Fourth', 'Graduation')
			GROUP BY year, department
			ORDER BY year, department;
            
            
-- 4)	Which internship course is most popular among first-year students?

			SELECT courses, COUNT(*) AS Numberofstudents
			FROM students_data
			WHERE year = 'First'
			GROUP BY courses
			ORDER BY Numberofstudents DESC
			LIMIT 1; 
            
            
-- 5)	Which department has the highest enrollment for internship courses? 

			SELECT department, COUNT(*) AS Numberofstudents
			FROM students_data
			GROUP BY department
			ORDER BY Numberofstudents DESC
			LIMIT 1;
            
            
-- 6) 	What is the distribution of students across different academic years
	--  (First, Second, Third, Fourth, Graduation) for each internship course? 
    
			SELECT courses, year, COUNT(*) AS Numberofstudents
			FROM students_data
			WHERE year IN ('First', 'Second', 'Third', 'Fourth', 'Graduation')
			GROUP BY courses, year
			ORDER BY courses, year;


 -- 7)  What is the average enrollment for internship courses across different departments?
		
			SELECT department, AVG(Numberofstudents) AS average_enrollment
			FROM (
				SELECT department, courses, COUNT(*) AS Numberofstudents
				FROM students_data
				GROUP BY department, courses
			) AS department_course_counts
			GROUP BY department
			ORDER BY average_enrollment DESC;
            
            
 -- 8) Which internship courses have the highest enrollment among graduate students?
		
			SELECT courses, COUNT(*) AS Numberofstudents
			FROM students_data
			WHERE year = 'Graduation'
			GROUP BY courses
			ORDER BY Numberofstudents DESC
			LIMIT 1;
 
 
-- 	9)	What percentage of students who have graduated enroll in internship courses?

			SELECT year,
				(COUNT(*) / (SELECT COUNT(*) FROM students_data) * 100) AS enrollment_percentage
			FROM students_data
			WHERE year = 'Graduation'
			GROUP BY year;
            

 -- 10)  How many students have enrolled in internship courses related to emerging technologies
		--  like Cyber Security, IoT, or Robotics? 
        
			SELECT courses, COUNT(*) AS Numberofstudents
			FROM students_data
			WHERE courses IN ('CyberSecurity', 'IOT', 'Robotics')
			GROUP BY courses;

        
 -- 11) What are the top three internship courses preferred by MBA students?
 
			SELECT courses, COUNT(*) AS Numberofstudents
			FROM students_data
			WHERE department = 'MBA'
			GROUP BY courses
			ORDER BY Numberofstudents DESC
			LIMIT 3;
            
            
 -- 12) Which college has the highest enrollment in "Artificial Intelligence"?
 
			SELECT college, courses, COUNT(*) AS Numberofstudents
			FROM students_data
			WHERE courses = 'Artificial Intelligence'
			GROUP BY college,courses
			ORDER BY Numberofstudents DESC
			LIMIT 1;
            
            
--  13)	Which course is the most popular among students?

			SELECT courses, COUNT(*) AS Numberofstudents
			FROM students_data
			GROUP BY courses
			ORDER BY Numberofstudents DESC
			LIMIT 1;
        
		
--  14) Which college year has the highest enrollment?

			SELECT year, COUNT(*) AS Numberofstudents
			FROM students_data
			GROUP BY year
			ORDER BY Numberofstudents DESC
			LIMIT 1;
            
            
--  15) How many graduated students have enrolled in "Artificial Intelligence"?

			SELECT year, courses ,COUNT(*) AS Numberofstudents
			FROM students_data
			WHERE year = 'Graduation' 
			AND 
			courses = 'Artificial Intelligence'
			GROUP BY year,courses;
            
            
--  16) "Which students have selected 'others' as their internship course and 'others' as their department, 
		-- and what are their corresponding email addresses?"
        
			SELECT Name, Email, courses AS Selected_course, department AS Selected_department
			FROM students_data
			WHERE courses = 'others' OR department = 'others';
            