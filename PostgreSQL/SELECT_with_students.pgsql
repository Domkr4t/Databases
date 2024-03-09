CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    discipline VARCHAR(100) NOT NULL,
    student_group VARCHAR(20) CHECK (student_group IN ('ЭФМО-01-23', 'ЭФМО-02-23')) NOT NULL,
    point NUMERIC(3, 2) CHECK (point BETWEEN 2.0 AND 5.0) NOT NULL
);


INSERT INTO students (full_name, discipline, student_group, point)
VALUES
    ('Панкратов Илья Алексеевич', 'Базы данных и анализ промышленных данных', 'ЭФМО-02-23', 4.5),
    ('Панкратов Илья Алексеевич', 'Архитектура индустриального программного обеспечения', 'ЭФМО-02-23', 3.8),
    ('Панкратов Илья Алексеевич', 'Математическое моделирование в индустриальном программировании', 'ЭФМО-02-23', 4.2),
    ('Панкратов Илья Алексеевич', 'Технологии индустриального программирования', 'ЭФМО-02-23', 3.5),
    ('Панкратов Илья Алексеевич', 'Технологии создания программного обеспечения', 'ЭФМО-02-23', 4.0),
    ('Панкратов Илья Алексеевич', 'Дизайн-визуализация информации', 'ЭФМО-02-23', 3.2),
    ('Панкратов Илья Алексеевич', 'Коммуникативные технологии в профессиональной сфере на иностранном языке', 'ЭФМО-02-23', 4.8),
    ('Панкратов Илья Алексеевич', 'Социология и педагогика высшей школы', 'ЭФМО-02-23', 4.4),

    ('Краснов Артём Игоревич', 'Базы данных и анализ промышленных данных', 'ЭФМО-01-23', 3.7),
    ('Краснов Артём Игоревич', 'Архитектура индустриального программного обеспечения', 'ЭФМО-01-23', 4.1),
    ('Краснов Артём Игоревич', 'Математическое моделирование в индустриальном программировании', 'ЭФМО-01-23', 3.5),
    ('Краснов Артём Игоревич', 'Технологии индустриального программирования', 'ЭФМО-01-23', 4.2),
    ('Краснов Артём Игоревич', 'Технологии создания программного обеспечения', 'ЭФМО-01-23', 3.9),
    ('Краснов Артём Игоревич', 'Дизайн-визуализация информации', 'ЭФМО-01-23', 3.0),
    ('Краснов Артём Игоревич', 'Коммуникативные технологии в профессиональной сфере на иностранном языке', 'ЭФМО-01-23', 4.5),
    ('Краснов Артём Игоревич', 'Социология и педагогика высшей школы', 'ЭФМО-01-23', 4.1),

    ('Беляева Кира Ильинична', 'Базы данных и анализ промышленных данных', 'ЭФМО-02-23', 4.0),
    ('Беляева Кира Ильинична', 'Архитектура индустриального программного обеспечения', 'ЭФМО-02-23', 3.8),
    ('Беляева Кира Ильинична', 'Математическое моделирование в индустриальном программировании', 'ЭФМО-02-23', 4.2),
    ('Беляева Кира Ильинична', 'Технологии индустриального программирования', 'ЭФМО-02-23', 3.5),
    ('Беляева Кира Ильинична', 'Технологии создания программного обеспечения', 'ЭФМО-02-23', 4.0),
    ('Беляева Кира Ильинична', 'Дизайн-визуализация информации', 'ЭФМО-02-23', 3.2),
    ('Беляева Кира Ильинична', 'Коммуникативные технологии в профессиональной сфере на иностранном языке', 'ЭФМО-02-23', 4.8),
    ('Беляева Кира Ильинична', 'Социология и педагогика высшей школы', 'ЭФМО-02-23', 4.4),

    ('Лаврентьев Роман Даниилович', 'Базы данных и анализ промышленных данных', 'ЭФМО-02-23', 3.7),
    ('Лаврентьев Роман Даниилович', 'Архитектура индустриального программного обеспечения', 'ЭФМО-02-23', 4.1),
    ('Лаврентьев Роман Даниилович', 'Математическое моделирование в индустриальном программировании', 'ЭФМО-02-23', 3.5),
    ('Лаврентьев Роман Даниилович', 'Технологии индустриального программирования', 'ЭФМО-02-23', 4.2),
    ('Лаврентьев Роман Даниилович', 'Технологии создания программного обеспечения', 'ЭФМО-02-23', 3.9),
    ('Лаврентьев Роман Даниилович', 'Дизайн-визуализация информации', 'ЭФМО-02-23', 3.0),
    ('Лаврентьев Роман Даниилович', 'Коммуникативные технологии в профессиональной сфере на иностранном языке', 'ЭФМО-02-23', 4.5),
    ('Лаврентьев Роман Даниилович', 'Социология и педагогика высшей школы', 'ЭФМО-02-23', 4.1),

    ('Горохова Дарья Никитична', 'Базы данных и анализ промышленных данных', 'ЭФМО-02-23', 4.3),
    ('Горохова Дарья Никитична', 'Архитектура индустриального программного обеспечения', 'ЭФМО-02-23', 3.9),
    ('Горохова Дарья Никитична', 'Математическое моделирование в индустриальном программировании', 'ЭФМО-02-23', 4.5),
    ('Горохова Дарья Никитична', 'Технологии индустриального программирования', 'ЭФМО-02-23', 3.8),
    ('Горохова Дарья Никитична', 'Технологии создания программного обеспечения', 'ЭФМО-02-23', 4.1),
    ('Горохова Дарья Никитична', 'Дизайн-визуализация информации', 'ЭФМО-02-23', 3.7),
    ('Горохова Дарья Никитична', 'Коммуникативные технологии в профессиональной сфере на иностранном языке', 'ЭФМО-02-23', 4.2),
    ('Горохова Дарья Никитична', 'Социология и педагогика высшей школы', 'ЭФМО-02-23', 4.0);


--Запрос 1
SELECT
    full_name,
    discipline,
    student_group,
    point,
    MAX(point) OVER (PARTITION BY student_group, discipline) - point AS point_difference
FROM
    students;

--Запрос 2
SELECT
    full_name,
    discipline,
    student_group,
    point,
    CONCAT(ROUND(((point / AVG(point) OVER (PARTITION BY student_group, discipline)) * 100), 2), ' %')
    AS percentage_to_average
FROM
    students;


--Запрос 3
SELECT
    full_name,
    discipline,
    student_group,
    point,
    MIN(point) OVER (PARTITION BY student_group) AS min_point_in_group
FROM
    students;


--Запрос 4
SELECT
    full_name,
    discipline,
    student_group,
    point,
    SUM(point) OVER (PARTITION BY student_group ORDER BY student_group) AS group_total_point
FROM
    students;


--Запрос 5
SELECT
    full_name,
    discipline,
    student_group,
    point,
    ROW_NUMBER() OVER (ORDER BY full_name DESC) AS reverse_alphabetical_order
FROM
    students;


--Запрос 6
WITH ranked_students AS (
    SELECT
        full_name,
        student_group,
        ROW_NUMBER() OVER(PARTITION BY student_group ORDER BY AVG(point) DESC) AS row_num,
        DENSE_RANK() OVER(PARTITION BY student_group ORDER BY full_name) AS rank
    FROM students
    GROUP BY full_name, student_group
)
SELECT
    full_name,
    student_group,
    row_num,
    MAX(rank) OVER(PARTITION BY student_group) AS student_count
FROM ranked_students
ORDER BY
    student_group,
    row_num;


--Запрос 7
SELECT
    full_name,
    ROUND((AVG(point)), 2) as avg_points,
    RANK() OVER(ORDER BY AVG(point) DESC) as rank
FROM
    students
GROUP BY
    full_name
ORDER BY
    full_name;


--Запрос 8
SELECT
    full_name,
    student_group
FROM
    students
GROUP BY
    full_name,
    student_group
ORDER BY
    student_group;

--Запрос 9
SELECT
    full_name,
    student_group,
    NTILE(2) OVER(PARTITION BY student_group ORDER BY AVG(point) DESC) as group_num
FROM
    students
GROUP BY
    full_name,
    student_group;


--Запрос 10
SELECT
    full_name,
    ROUND((AVG(point)), 2) as avg_points,
    ROUND((AVG(point) - LEAD(AVG(point), 3) OVER(ORDER BY AVG(point))), 2) as point_diff
FROM
    students
GROUP BY
    full_name
ORDER BY
    avg_points;


--Запрос 11
SELECT
    full_name,
    ROUND((AVG(point)), 2) as avg_points,
    ROUND(COALESCE(AVG(point) - LAG(AVG(point)) OVER(ORDER BY AVG(point) DESC), 0), 2) as point_diff
FROM
    students
GROUP BY
    full_name
ORDER BY
    avg_points DESC;


--Запрос 12
SELECT
  full_name,
  student_group,
  ROUND(AVG(point), 2) AS avg_points,
  ROUND(MAX(point) - MIN(point), 2) AS point_diff
FROM
  students
GROUP BY
  full_name, student_group
ORDER BY
  student_group, avg_points DESC;




--Запрос 13
SELECT
   full_name,
   discipline,
   student_group,
   point,
   RANK() OVER (PARTITION BY student_group ORDER BY point DESC) AS rank
FROM
   students
ORDER BY
   rank;


--Запрос 14
SELECT
  full_name,
  discipline,
  student_group,
  point,
  CONCAT(ROUND(((point * 100.0 / SUM(point) OVER (PARTITION BY student_group))), 2), ' %') AS percent
FROM
  students
ORDER BY
  student_group,
  percent DESC;
