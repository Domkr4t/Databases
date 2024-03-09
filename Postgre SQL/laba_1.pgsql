CREATE TABLE departament(
    departament_id BIGINT PRIMARY KEY,
    name_departament CHARACTER(255)
);

CREATE TABLE enrollee(
    enrollee_id BIGINT PRIMARY KEY,
    lastname_enrollee CHARACTER(255),
    firstname_enrollee CHARACTER(255),
    middlename_enrollee CHARACTER(255)
);

CREATE TABLE subject(
    subject_id BIGINT PRIMARY KEY,
    name_subject CHARACTER(255)
);

CREATE TABLE achievement(
    achievement_id BIGINT PRIMARY KEY,
    name_achievement CHARACTER(255),
    bonus BIGINT
);

CREATE TABLE program(
    program_id BIGINT PRIMARY KEY,
    name_program CHARACTER(255),
    plan BIGINT,
    departament_id BIGINT REFERENCES departament (departament_id)
);

CREATE TABLE program_enrollee(
    program_enrollee_id BIGINT PRIMARY KEY,
    enrollee_id BIGINT REFERENCES enrollee (enrollee_id),
    program_id BIGINT REFERENCES program (program_id)
);

CREATE TABLE program_subject(
    program_subject_id BIGINT PRIMARY KEY,
    min_result BIGINT,
    subject_id BIGINT REFERENCES subject (subject_id),
    program_id BIGINT REFERENCES program (program_id)
);

CREATE TABLE enrollee_subject(
    enrollee_subject_id BIGINT PRIMARY KEY,
    result BIGINT,
    subject_id BIGINT REFERENCES subject (subject_id),
    enrollee_id BIGINT REFERENCES enrollee (enrollee_id)
);

CREATE TABLE enrollee_achievement(
    enrollee_achievement_id BIGINT PRIMARY KEY,
    achievement_id BIGINT REFERENCES achievement (achievement_id),
    enrollee_id BIGINT REFERENCES enrollee (enrollee_id)
);

INSERT INTO departament (departament_id, name_departament) VALUES
   (1, 'Факультет информатики и вычислительной техники'),
   (2, 'Факультет машиностроения'),
   (3, 'Факультет химии и химической технологии'),
   (4, 'Факультет биологии'),
   (5, 'Факультет истории');

INSERT INTO enrollee (enrollee_id, firstname_enrollee, lastname_enrollee, middlename_enrollee) VALUES
   (1, 'Иванович', 'Иван', 'Иванов'),
   (2, 'Петрович', 'Петр', 'Петров'),
   (3, 'Сидорович', 'Семён', 'Семёнович'),
   (4, 'Федорович', 'Фёдор', 'Фёдоров'),
   (5, 'Кузнецович', 'Кузьма', 'Кузнецов');

INSERT INTO subject (subject_id, name_subject) VALUES
   (1, 'Математика'),
   (2, 'Физика'),
   (3, 'Химия'),
   (4, 'Биология'),
   (5, 'История'),
   (6, 'Литература');

INSERT INTO achievement (achievement_id, name_achievement, bonus) VALUES
   (1, 'Медаль за отличие', 10),
   (2, 'Значок ГТО', 5),
   (3, 'Спортивная медаль', 3),
   (4, 'Художественное достижение', 2);

INSERT INTO program (program_id, name_program, plan, departament_id) VALUES
   (1, 'Компьютерные науки', 30, 1),
   (2, 'Машиностроение', 20, 2),
   (3, 'Химическое инженерное дело', 15, 3),
   (4, 'Биология', 25, 4),
   (5, 'История', 10, 5);

INSERT INTO program_enrollee (program_enrollee_id, enrollee_id, program_id) VALUES
   (1, 1, 1),
   (2, 2, 1),
   (3, 3, 2),
   (4, 4, 4),
   (5, 5, 5);

INSERT INTO program_subject (program_subject_id, min_result, subject_id, program_id) VALUES
   (1, 70, 1, 1),
   (2, 60, 2, 1),
   (3, 65, 3, 2),
   (4, 75, 4, 2),
   (5, 80, 1, 3),
   (6, 85, 2, 3),
   (7, 90, 5, 4),
   (8, 95, 6, 5),
   (9, 85, 4, 5);

INSERT INTO enrollee_subject (enrollee_subject_id, result, subject_id, enrollee_id) VALUES
   (1, 80, 1, 1),
   (2, 65, 2, 1),
   (3, 70, 1, 2),
   (4, 70, 2, 2),
   (5, 60, 3, 2),
   (6, 80, 1, 3),
   (7, 90, 2, 3),
   (8, 75, 4, 3),
   (9, 90, 5, 4),
   (10, 85, 6, 5),
   (11, 80, 4, 5),
   (12, 70, 1, 5);

INSERT INTO enrollee_achievement (enrollee_achievement_id, achievement_id, enrollee_id) VALUES
   (1, 1, 1),
   (2, 2, 2),
   (3, 3, 3),
   (4, 4, 4),
   (5, 1, 5);


--Запрос 1
SELECT
    firstname_enrollee,
    lastname_enrollee,
    middlename_enrollee
FROM
    enrollee
JOIN
    program_enrollee ON enrollee.enrollee_id = program_enrollee.enrollee_id
WHERE
    program_enrollee.program_id = 1;

--Запрос 2
SELECT DISTINCT
    p.name_program
FROM
    program p
JOIN
    program_subject ps ON p.program_id = ps.program_id
JOIN
    enrollee_subject es ON ps.subject_id = es.subject_id
WHERE
    es.result >= ps.min_result AND
    ps.subject_id = (SELECT subject_id FROM subject WHERE name_subject = 'Математика');

--Запрос 3
SELECT
    s.name_subject,
    COUNT(*) as Количество_студентов,
    MIN(es.result),
    MAX(es.result),
    ROUND(AVG(es.result), 2)
FROM
    enrollee_subject es
JOIN
    subject s ON es.subject_id = s.subject_id
GROUP BY
    s.name_subject;

--Запрос 4
SELECT p.name_program, s.name_subject, MIN(ps.min_result) AS минимальный_балл
FROM program_subject ps
JOIN program p ON ps.program_id = p.program_id
JOIN subject s ON ps.subject_id = s.subject_id
WHERE (SELECT MIN(ps1.min_result) FROM program_subject ps1
JOIN program p1 on p1.program_id = ps1.program_id
Where p1.name_program = p.name_program) > 70
GROUP BY p.name_program, s.name_subject;

--Запрос 5
SELECT
    p.name_program
FROM
    program p
WHERE
    p.plan = (SELECT MAX(plan) FROM program);

--Запрос 6
SELECT
    e.enrollee_id,
    e.firstname_enrollee,
    e.lastname_enrollee,
    e.middlename_enrollee,
    SUM(a.bonus) as total_bonus
FROM
    enrollee e
JOIN
    enrollee_achievement ea ON e.enrollee_id = ea.enrollee_id
JOIN
    achievement a ON ea.achievement_id = a.achievement_id
GROUP BY
    e.enrollee_id,
    e.firstname_enrollee,
    e.lastname_enrollee,
    e.middlename_enrollee;

--Запрос 7
SELECT
    p.name_program,
    COUNT(pe.enrollee_id) as number_of_applicants, SUM(a.bonus) as total_bonus
FROM
    program p
JOIN
    program_enrollee pe ON p.program_id = pe.program_id
JOIN
    enrollee_achievement ea ON pe.enrollee_id = ea.enrollee_id
JOIN
    achievement a ON ea.achievement_id = a.achievement_id
GROUP BY
    p.name_program;

--Запрос 8
SELECT
    p.name_program
FROM
    program p
JOIN
    program_subject ps1 ON p.program_id = ps1.program_id
JOIN
    program_subject ps2 ON p.program_id = ps2.program_id
JOIN
    subject s1 ON ps1.subject_id = s1.subject_id
JOIN
    subject s2 ON ps2.subject_id = s2.subject_id
WHERE
    s1.name_subject = 'Математика' AND
    s2.name_subject = 'Физика';

--Запрос 9
SELECT
    pe.enrollee_id, p.name_program,
    SUM(es.result) as total_score
FROM
    enrollee_subject es
JOIN
    program_enrollee pe ON es.enrollee_id = pe.enrollee_id
JOIN
    program_subject ps ON es.subject_id = ps.subject_id
JOIN
    program p ON ps.program_id = p.program_id
GROUP BY
    pe.enrollee_id, p.name_program;

--Запрос 10
SELECT DISTINCT
    e.enrollee_id,
    e.firstname_enrollee,
    e.lastname_enrollee,
    e.middlename_enrollee
FROM enrollee e
JOIN
    program_enrollee pe ON e.enrollee_id = pe.enrollee_id
JOIN
program_subject ps ON pe.program_id = ps.program_id
JOIN
    enrollee_subject es ON e.enrollee_id = es.enrollee_id AND
    ps.subject_id = es.subject_id
WHERE
    ps.min_result > es.result

--Запрос 11
CREATE TABLE enrollee_eg_scores AS
SELECT
    e.enrollee_id,
    SUM(es.result) as total_score
FROM
    enrollee_subject es
JOIN
    enrollee e ON es.enrollee_id = e.enrollee_id
GROUP BY
    e.enrollee_id;

table enrollee_eg_scores;

--Запрос 12
DELETE FROM
    enrollee_eg_scores
WHERE
    total_score <
(SELECT
    MIN(ps.min_result)
FROM
    program_subject ps
WHERE
    ps.program_id = 1);

table enrollee_eg_scores;

--Запрос 13
UPDATE
    enrollee_eg_scores
SET
    total_score = total_score + 10
WHERE
    total_score IN
(SELECT
    total_score
FROM
    enrollee_achievement ea
WHERE
    ea.achievement_id IN (1, 2) AND
    ea.enrollee_id = enrollee_eg_scores.enrollee_id);

table enrollee_eg_scores;

--Запрос 14
SELECT
    pe.enrollee_id,
    p.name_program,
    SUM(es.result) as total_score
FROM
    enrollee_subject es
JOIN
    program_enrollee pe ON es.enrollee_id = pe.enrollee_id
JOIN
    program_subject ps ON pe.program_id = ps.program_id
JOIN
    program p ON ps.program_id = p.program_id
GROUP BY
    pe.enrollee_id,
    p.name_program
ORDER BY
    total_score DESC;


--Запрос 15
WITH EnrolleeScores AS (
    SELECT
        pe.program_id,
        pe.enrollee_id,
        SUM(COALESCE(es.result, 0) + COALESCE(a.bonus, 0)) AS total_score
    FROM
        program_enrollee pe
        JOIN program_subject ps ON pe.program_id = ps.program_id
        LEFT JOIN enrollee_subject es ON pe.enrollee_id = es.enrollee_id AND ps.subject_id = es.subject_id
        LEFT JOIN enrollee_achievement ea ON pe.enrollee_id = ea.enrollee_id
        LEFT JOIN achievement a ON ea.achievement_id = a.achievement_id
    GROUP BY
        pe.program_id,
        pe.enrollee_id
)

SELECT
    e.*,
    es.total_score
FROM
    enrollee e
    JOIN EnrolleeScores es ON e.enrollee_id = es.enrollee_id
    JOIN program p ON es.program_id = p.program_id
WHERE
    p.program_id = 1
ORDER BY
    es.total_score DESC
LIMIT (SELECT plan FROM program WHERE program_id = 1);
