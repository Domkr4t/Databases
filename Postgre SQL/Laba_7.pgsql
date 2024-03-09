-- Задание 1
CREATE TABLE workday (
    workday_id SERIAL PRIMARY KEY,
    employee_code INT,
    entry_exit_datetime TIMESTAMP,
    card_reader_value INT,
    FOREIGN KEY (employee_code) REFERENCES realtors(realtor_code)
);


INSERT INTO workday (employee_code, entry_exit_datetime, card_reader_value) VALUES
-- Данные для сотрудника 1
(1, '2023-11-06 09:00:00', 1),
(1, '2023-11-06 13:00:00', 2),
(1, '2023-11-06 13:30:00', 1),
(1, '2023-11-06 18:00:00', 2),
(1, '2023-11-07 09:05:00', 1),
(1, '2023-11-07 13:00:00', 2),
(1, '2023-11-07 13:30:00', 1),
(1, '2023-11-07 18:30:00', 2),
(1, '2023-11-08 09:10:00', 1),
(1, '2023-11-08 18:45:00', 2),
(1, '2023-11-09 09:00:00', 1),
(1, '2023-11-09 18:30:00', 2),
(1, '2023-11-10 09:20:00', 1),
(1, '2023-11-10 18:45:00', 2),
(1, '2023-11-11 09:05:00', 1),
(1, '2023-11-11 18:30:00', 2),
(1, '2023-11-12 09:00:00', 1),
(1, '2023-11-12 18:30:00', 2),

-- Данные для сотрудника 2
(2, '2023-11-06 09:10:00', 1),
(2, '2023-11-06 13:00:00', 2),
(2, '2023-11-06 13:30:00', 1),
(2, '2023-11-06 18:00:00', 2),
(2, '2023-11-07 09:15:00', 1),
(2, '2023-11-07 18:45:00', 2),
(2, '2023-11-08 09:20:00', 1),
(2, '2023-11-08 18:00:00', 2),
(2, '2023-11-09 09:25:00', 1),
(2, '2023-11-09 13:00:00', 2),
(2, '2023-11-09 13:30:00', 1),
(2, '2023-11-09 18:30:00', 2),
(2, '2023-11-10 09:30:00', 1),
(2, '2023-11-10 13:15:00', 2),
(2, '2023-11-10 13:30:00', 1),
(2, '2023-11-10 18:45:00', 2),
(2, '2023-11-11 09:35:00', 1),
(2, '2023-11-11 13:10:00', 2),
(2, '2023-11-11 13:30:00', 1),
(2, '2023-11-11 18:30:00', 2),
(2, '2023-11-12 09:40:00', 1),
(2, '2023-11-12 13:20:00', 2),
(2, '2023-11-12 13:30:00', 1),
(2, '2023-11-12 18:30:00', 2),
(2, '2023-11-13 09:45:00', 1),
(2, '2023-11-13 13:00:00', 2),
(2, '2023-11-13 13:30:00', 1),
(2, '2023-11-13 18:45:00', 2),

-- Данные для сотрудника 3
(3, '2023-11-06 09:00:14', 1),
(3, '2023-11-06 13:00:00', 2),
(3, '2023-11-06 13:30:00', 1),
(3, '2023-11-06 19:30:10', 2),
(3, '2023-11-07 09:10:00', 1),
(3, '2023-11-07 13:15:00', 2),
(3, '2023-11-07 13:30:00', 1),
(3, '2023-11-07 18:00:00', 2),
(3, '2023-11-08 09:20:00', 1),
(3, '2023-11-08 13:00:00', 2),
(3, '2023-11-08 13:20:00', 1),
(3, '2023-11-08 18:30:00', 2),
(3, '2023-11-09 09:30:00', 1),
(3, '2023-11-09 13:15:00', 2),
(3, '2023-11-09 13:30:00', 1),
(3, '2023-11-09 18:45:00', 2),
(3, '2023-11-10 09:40:00', 1),
(3, '2023-11-10 13:15:00', 2),
(3, '2023-11-10 13:25:00', 1),
(3, '2023-11-10 18:00:00', 2),
(3, '2023-11-11 09:00:14', 1),
(3, '2023-11-11 13:00:00', 2),
(3, '2023-11-11 13:30:00', 1),
(3, '2023-11-11 19:30:10', 2),
(3, '2023-11-12 09:10:00', 1),
(3, '2023-11-12 13:20:00', 2),
(3, '2023-11-12 13:30:00', 1),
(3, '2023-11-12 18:30:00', 2),
(3, '2023-11-13 09:15:00', 1),
(3, '2023-11-13 13:15:00', 2),
(3, '2023-11-13 13:30:00', 1),
(3, '2023-11-13 18:45:00', 2);

-- Задание 2
CREATE OR REPLACE FUNCTION CalculateWorkHoursStatus(
    IN p_employee_code INT
)
RETURNS TEXT AS $$
DECLARE
    total_hours_worked INT;
    status TEXT;
BEGIN
    SELECT EXTRACT(EPOCH FROM SUM(
        LEAST(
            GREATEST(entry_exit_datetime, '2023-11-06 09:00:00'),
            LEAST(entry_exit_datetime, '2023-11-13 18:00:00')
        )
        - GREATEST(entry_exit_datetime, '2023-11-06 09:00:00')
        - CASE WHEN entry_exit_datetime BETWEEN '2023-11-06 13:00:00' AND '2023-11-13 14:00:00' THEN '01:00:00'::interval ELSE '00:00:00'::interval END
    ))/(-3600)
    INTO total_hours_worked
    FROM workday
    WHERE employee_code = p_employee_code
    AND entry_exit_datetime BETWEEN '2023-11-06 00:00:00' AND '2023-11-13 23:59:59';

    IF total_hours_worked < 40 THEN
        status := 'Меньше нормы';
    ELSIF total_hours_worked = 40 THEN
        status := 'Норма';
    ELSE
        status := 'Больше нормы';
    END IF;

    RETURN status;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM CalculateWorkHoursStatus(1);

-- Задание 3
CREATE OR REPLACE FUNCTION CalculateLunchHours(
    IN p_employee_code INT
)
RETURNS NUMERIC AS $$
DECLARE
    total_lunch_hours NUMERIC;
BEGIN
    SELECT EXTRACT(EPOCH FROM SUM(
        CASE
            WHEN entry_exit_datetime BETWEEN '2023-11-06 13:00:00' AND '2023-11-06 13:30:00' THEN '2023-11-06 13:30:00' - entry_exit_datetime
            WHEN entry_exit_datetime BETWEEN '2023-11-07 13:00:00' AND '2023-11-07 13:30:00' THEN '2023-11-07 13:30:00' - entry_exit_datetime
            WHEN entry_exit_datetime BETWEEN '2023-11-08 13:00:00' AND '2023-11-08 13:30:00' THEN '2023-11-08 13:30:00' - entry_exit_datetime
            WHEN entry_exit_datetime BETWEEN '2023-11-09 13:00:00' AND '2023-11-09 13:30:00' THEN '2023-11-09 13:30:00' - entry_exit_datetime
            WHEN entry_exit_datetime BETWEEN '2023-11-10 13:00:00' AND '2023-11-10 13:30:00' THEN '2023-11-10 13:30:00' - entry_exit_datetime
            WHEN entry_exit_datetime BETWEEN '2023-11-11 13:00:00' AND '2023-11-11 13:30:00' THEN '2023-11-11 13:30:00' - entry_exit_datetime
            WHEN entry_exit_datetime BETWEEN '2023-11-12 13:00:00' AND '2023-11-12 13:30:00' THEN '2023-11-12 13:30:00' - entry_exit_datetime
            WHEN entry_exit_datetime BETWEEN '2023-11-13 13:00:00' AND '2023-11-13 13:30:00' THEN '2023-11-13 13:30:00' - entry_exit_datetime
            ELSE INTERVAL '0 minutes'
        END
    )) / 3600
    INTO total_lunch_hours
    FROM workday
    WHERE employee_code = p_employee_code
        AND entry_exit_datetime BETWEEN '2023-11-06 00:00:00' AND '2023-11-13 23:59:59';

    RETURN ROUND(total_lunch_hours, 2);
END;
$$ LANGUAGE plpgsql;

SELECT CalculateLunchHours(1) AS "Часов_обеда_сотрудника_1",
       CalculateLunchHours(2) AS "Часов_обеда_сотрудника_2",
       CalculateLunchHours(3) AS "Часов_обеда_сотрудника_3";

-- Задание 4
CREATE OR REPLACE FUNCTION CalculateLateMinutes(
    IN p_employee_code INT
)
RETURNS NUMERIC AS $$
DECLARE
    total_late_minutes NUMERIC;
BEGIN
     SELECT EXTRACT(EPOCH FROM SUM(
        CASE
            WHEN entry_exit_datetime BETWEEN '2023-11-06 09:00:00' AND '2023-11-06 10:00:00' THEN entry_exit_datetime - '2023-11-06 09:00:00'
            WHEN entry_exit_datetime BETWEEN '2023-11-07 09:00:00' AND '2023-11-07 10:00:00' THEN entry_exit_datetime - '2023-11-07 09:00:00'
            WHEN entry_exit_datetime BETWEEN '2023-11-08 09:00:00' AND '2023-11-08 10:00:00' THEN entry_exit_datetime - '2023-11-08 09:00:00'
            WHEN entry_exit_datetime BETWEEN '2023-11-09 09:00:00' AND '2023-11-09 10:00:00' THEN entry_exit_datetime - '2023-11-09 09:00:00'
            WHEN entry_exit_datetime BETWEEN '2023-11-10 09:00:00' AND '2023-11-10 10:00:00' THEN entry_exit_datetime - '2023-11-10 09:00:00'
            WHEN entry_exit_datetime BETWEEN '2023-11-11 09:00:00' AND '2023-11-11 10:00:00' THEN entry_exit_datetime - '2023-11-11 09:00:00'
            WHEN entry_exit_datetime BETWEEN '2023-11-12 09:00:00' AND '2023-11-12 10:00:00' THEN entry_exit_datetime - '2023-11-12 09:00:00'
            WHEN entry_exit_datetime BETWEEN '2023-11-13 09:00:00' AND '2023-11-13 10:00:00' THEN entry_exit_datetime - '2023-11-13 09:00:00'
            ELSE INTERVAL '0 minutes'
        END
    )) / 60
    INTO total_late_minutes
    FROM workday
    WHERE employee_code = p_employee_code
    AND entry_exit_datetime BETWEEN '2023-11-06 00:00:00' AND '2023-11-13 23:59:59';

    RETURN ROUND(total_late_minutes, 2);
END;
$$ LANGUAGE plpgsql;


SELECT CalculateLateMinutes(1) AS "Минут_опоздания_сотрудника_1",
       CalculateLateMinutes(2) AS "Минут_опоздания_сотрудника_2",
       CalculateLateMinutes(3) AS "Минут_опоздания_сотрудника_3";

-- Задание 5
CREATE OR REPLACE FUNCTION CalculateSalary(
    IN p_employee_code INT
)
RETURNS TEXT AS $$
DECLARE
    total_late_minutes NUMERIC;
    total_salary NUMERIC;
BEGIN
     SELECT EXTRACT(EPOCH FROM SUM(
        CASE
            WHEN entry_exit_datetime BETWEEN '2023-11-06 09:00:00' AND '2023-11-06 10:00:00' THEN entry_exit_datetime - '2023-11-06 09:00:00'
            WHEN entry_exit_datetime BETWEEN '2023-11-07 09:00:00' AND '2023-11-07 10:00:00' THEN entry_exit_datetime - '2023-11-07 09:00:00'
            WHEN entry_exit_datetime BETWEEN '2023-11-08 09:00:00' AND '2023-11-08 10:00:00' THEN entry_exit_datetime - '2023-11-08 09:00:00'
            WHEN entry_exit_datetime BETWEEN '2023-11-09 09:00:00' AND '2023-11-09 10:00:00' THEN entry_exit_datetime - '2023-11-09 09:00:00'
            WHEN entry_exit_datetime BETWEEN '2023-11-10 09:00:00' AND '2023-11-10 10:00:00' THEN entry_exit_datetime - '2023-11-10 09:00:00'
            WHEN entry_exit_datetime BETWEEN '2023-11-11 09:00:00' AND '2023-11-11 10:00:00' THEN entry_exit_datetime - '2023-11-11 09:00:00'
            WHEN entry_exit_datetime BETWEEN '2023-11-12 09:00:00' AND '2023-11-12 10:00:00' THEN entry_exit_datetime - '2023-11-12 09:00:00'
            WHEN entry_exit_datetime BETWEEN '2023-11-13 09:00:00' AND '2023-11-13 10:00:00' THEN entry_exit_datetime - '2023-11-13 09:00:00'
            ELSE INTERVAL '0 minutes'
        END
    )) / 60
    INTO total_late_minutes
    FROM workday
    WHERE employee_code = p_employee_code
    AND entry_exit_datetime BETWEEN '2023-11-06 00:00:00' AND '2023-11-13 23:59:59';

    total_salary := 30000 + 30000 * (1 - ((total_late_minutes / 10) * 0.05));

    RETURN CONCAT(ROUND(total_salary, 2), ' руб.');
END;
$$ LANGUAGE plpgsql;

SELECT CalculateSalary(1) AS "Оклад_сотрудника_1",
       CalculateSalary(2) AS "Оклад_сотрудника_2",
       CalculateSalary(3) AS "Окладсотрудника_3";

-- Задание 6
SELECT
    generate_series('2023-11-13 09:00:00'::timestamp, '2023-11-13 18:59:59'::timestamp, '1 hour'::interval) AS "Интервал",
    COUNT(DISTINCT employee_code) AS "Количество_работников"
FROM (
    SELECT
        employee_code,
        entry_exit_datetime,
        LEAD(entry_exit_datetime) OVER (PARTITION BY employee_code ORDER BY entry_exit_datetime) AS next_entry_exit_datetime
    FROM workday
    WHERE entry_exit_datetime BETWEEN '2023-11-13 09:00:00' AND '2023-11-13 18:59:59'
) AS work_periods
WHERE
    (next_entry_exit_datetime IS NULL OR next_entry_exit_datetime::date > entry_exit_datetime::date)
    AND entry_exit_datetime::time >= '2023-11-13 09:00:00'::time
    AND entry_exit_datetime::time < '2023-11-13 18:59:59'::time
GROUP BY "Интервал"
ORDER BY "Интервал";

-- CREATE OR REPLACE FUNCTION CalculateWorkedEmployeesByHourRange()
-- RETURNS TABLE (
--  hour_range TIMESTAMP,
--  employees_count INT
-- ) AS $$
-- BEGIN
--  RETURN QUERY
--  SELECT
--      generate_series('2023-11-13 09:00:00'::timestamp, '2023-11-13 18:59:59'::timestamp, '1 hour'::interval) AS "Интервал",
--      COUNT(DISTINCT employee_code) AS "Количество_работников"
--  FROM (
--      SELECT
--          employee_code,
--          entry_exit_datetime,
--          LEAD(entry_exit_datetime) OVER (PARTITION BY employee_code ORDER BY entry_exit_datetime) AS next_entry_exit_datetime
--      FROM workday
--      WHERE entry_exit_datetime BETWEEN '2023-11-13 09:00:00' AND '2023-11-13 18:59:59'
--  ) AS work_periods
--  WHERE
--      (next_entry_exit_datetime IS NULL OR next_entry_exit_datetime::date > entry_exit_datetime::date)
--      AND entry_exit_datetime::time >= '2023-11-13 09:00:00'::time
--      AND entry_exit_datetime::time < '2023-11-13 18:59:59'::time
--  GROUP BY "Интервал"
--  ORDER BY "Интервал";
-- END; $$ LANGUAGE plpgsql;


-- SELECT * FROM CalculateWorkedEmployeesByHourRange();
