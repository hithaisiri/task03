CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    math_score INT NOT NULL,
    science_score INT NOT NULL,
    english_score INT NOT NULL
);
INSERT INTO Students (name, math_score, science_score, english_score) VALUES
('Alice', 85, 90, 88),
('Bob', 75, 80, 70),
('Charlie', 92, 88, 95),
('David', 60, 72, 65),
('Emma', 89, 91, 85),
('Frank', 78, 82, 79),
('Grace', 95, 98, 97),
('Hannah', 50, 55, 60),
('Ian', 84, 86, 83),
('Jack', 90, 85, 87);

SELECT student_id, name, 
       (math_score + science_score + english_score) AS total_score
FROM Students
ORDER BY total_score DESC
LIMIT 5;

SELECT AVG(math_score) AS avg_math_score, 
       AVG(science_score) AS avg_science_score, 
       AVG(english_score) AS avg_english_score
FROM Students
WHERE math_score > 70;

SELECT AVG(total_score) AS avg_total_score
FROM (
    SELECT (math_score + science_score + english_score) AS total_score
    FROM Students
) AS score_table
WHERE total_score BETWEEN 200 AND 250;

SELECT MAX(math_score) AS second_highest_math_score
FROM Students
WHERE math_score < (SELECT MAX(math_score) FROM Students);
