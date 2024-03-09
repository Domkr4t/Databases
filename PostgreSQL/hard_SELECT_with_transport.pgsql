/*1 запрос*/

SELECT r.id AS "Номер поезда",
       r.departure_datetime AS "Дата отправления",
       SUM(CASE WHEN t.type_of_van = 2 THEN 1 ELSE 0 END) AS "Количество свободных купе",
       SUM(CASE WHEN t.type_of_van = 1 THEN 1 ELSE 0 END) AS "Количество свободных плац"
FROM race r
LEFT JOIN ticket t ON r.id = t.race_id
WHERE r.id = 2 AND r.departure_datetime = '2022-10-26 09:24:23' AND t.status = 1
GROUP BY r.id, r.departure_datetime;

/*2 запрос*/

SELECT c.name AS "Пункт отправления",
       COUNT(ro.id) AS "Количество поездов"
FROM root ro
JOIN race ra ON ro.id = ra.root_id
JOIN city c ON ro.departure_point = c.id
WHERE ra.departure_datetime = '2022-11-22 01:03:51'
GROUP BY c.name;

/*3 запрос*/

SELECT COUNT(*) AS "Общее количество вагонов",
       SUM(CASE WHEN t.type_of_van = 1 THEN 1 ELSE 0 END) AS "Плацкарт",
       SUM(CASE WHEN t.type_of_van = 2 THEN 1 ELSE 0 END) AS "Купе"
FROM race r
JOIN ticket t ON r.id = t.race_id
WHERE r.id = 2 AND r.departure_datetime = '2022-10-26 09:24:23'
GROUP BY t.type_of_van;

/*4 запрос*/

SELECT r.id AS "Номер поезда"
FROM race r
JOIN ticket t ON r.id = t.race_id
WHERE r.departure_datetime = '2022-10-26 09:24:23' AND t.type_of_van = 1
GROUP BY r.id
HAVING COUNT(t.type_of_van) < 10;

/*5 запрос*/

SELECT ro.departure_point AS "Пункт отправления",
       ro.arrival_point AS "Пункт прибытия",
       r.departure_datetime AS "Дата отправления",
       t.type_of_van AS "Тип вагона",
       AVG(t.cost) AS "Средняя стоимость билета"
FROM race r
JOIN root ro ON r.root_id = ro.id
JOIN ticket t ON r.id = t.race_id
WHERE ro.departure_point = 1 AND ro.arrival_point = 2 AND r.departure_datetime = '2023-08-19 13:55:26'
GROUP BY ro.departure_point, ro.arrival_point, r.departure_datetime, t.type_of_van;

/*6 запрос*/

SELECT r.id AS "Номер поезда",
       r.departure_datetime AS "Дата и время отправления",
       COUNT(CASE WHEN t.type_of_van = 1 THEN 1 ELSE 0 END) AS "Свободные нижние плацкарты",
       COUNT(CASE WHEN t.type_of_van = 2 THEN 1 ELSE 0 END) AS "Свободные нижние купе"
FROM race r
JOIN ticket t ON r.id = t.race_id
WHERE r.id = 5 AND t.site % 2 = 1 AND t.status = 1 AND r.departure_datetime = '2023-05-11 17:21:30'
GROUP BY r.id, r.departure_datetime, t.type_of_van;

/*7 запрос*/

SELECT i.city_id AS "Промежуточная станция",
       i.arrival_datetime AS "Дата прибытия",
       r.id AS "Номер поезда",
       MIN(t.cost) AS "Минимальная стоимость"
FROM intermediate_stations i
JOIN race r ON i.root_id = r.root_id
JOIN ticket t ON r.id = t.race_id
WHERE i.city_id = 2 AND i.arrival_datetime BETWEEN '2023-02-23 23:15:06' AND '2023-08-03 06:06:40'
GROUP BY i.city_id, i.arrival_datetime, r.id;

/*8 запрос*/

SELECT t.van_number AS "Номер вагона",
       t.type_of_van AS "Тип вагона",
       MAX(t.cost) AS "Максимальная стоимость билета",
       MIN(t.cost) AS "Минимальная стоимость билета"
FROM ticket t
JOIN race r ON t.race_id = r.id
WHERE r.id = 5
GROUP BY t.van_number, t.type_of_van, t.race_id, t.type_of_van
HAVING COUNT(t.status = 1) > 1;

/*9 запрос 1 вариант*/

SELECT DISTINCT van_number AS "Номер вагона",
       (CASE WHEN tick.site % 4 = 0 THEN (DIV(tick.site, 4)) ELSE (DIV(tick.site, 4) + 1) END) AS "Номер купе",
       race_id AS "Номер поезда",

       (SELECT COUNT(*)
        FROM ticket AS qupe_up
        WHERE (CASE WHEN tick.site % 4 = 0 THEN (DIV(tick.site, 4)) ELSE (DIV(tick.site, 4) + 1) END) = (CASE WHEN qupe_up.site % 4 = 0 THEN (DIV(qupe_up.site, 4)) ELSE (DIV(qupe_up.site, 4) + 1) END) AND
              qupe_up.van_number = tick.van_number AND
              qupe_up.site % 2 = 0 AND
              qupe_up.status = 1) AS "Количество верхних мест",

       (SELECT COUNT(*)
        FROM ticket AS qupe_down
        WHERE (CASE WHEN tick.site % 4 = 0 THEN (DIV(tick.site, 4)) ELSE (DIV(tick.site, 4) + 1) END) = (CASE WHEN qupe_down.site % 4 = 0 THEN (DIV(qupe_down.site, 4)) ELSE (DIV(qupe_down.site, 4) + 1) END) AND
              qupe_down.van_number = tick.van_number AND
              qupe_down.site % 2 = 1 AND
              qupe_down.status = 1) AS "Количество нижних мест"

FROM ticket AS tick
WHERE race_id = 5 AND van_number = 2 AND status = 1
GROUP BY van_number, race_id, status, tick.site;

/*9 запрос 2 вариант*/

CREATE FUNCTION number_qupe(site bigint) RETURNS INTEGER AS $$
BEGIN
    RETURN CASE WHEN site % 4 = 0 THEN (DIV(site, 4)) ELSE (DIV(site, 4) + 1) END;
END;
$$ LANGUAGE plpgsql;


SELECT DISTINCT van_number AS "Номер вагона",
       number_qupe(tick.site) AS "Номер купе",
       race_id AS "Номер поезда",

       (SELECT COUNT(*)
        FROM ticket AS qupe_up
        WHERE number_qupe(tick.site) = number_qupe(qupe_up.site) AND
              qupe_up.van_number = tick.van_number AND
              qupe_up.site % 2 = 0 AND
              qupe_up.status = 1 AND
              type_of_van = 2) AS "Количество верхних мест",

       (SELECT COUNT(*)
        FROM ticket AS qupe_down
        WHERE number_qupe(tick.site) = number_qupe(qupe_down.site) AND
              qupe_down.van_number = tick.van_number AND
              qupe_down.site % 2 = 1 AND
              qupe_down.status = 1 AND
              type_of_van = 2) AS "Количество нижних мест"

FROM ticket AS tick
WHERE race_id = 5 AND van_number = 2 AND status = 1 AND type_of_van = 2
GROUP BY van_number, race_id, status, tick.site;

INSERT INTO ticket (id, type_of_van, site, cost, status, race_id, van_number) VALUES (36, 2, 19, 370, 1, 5, 2);

SELECT * FROM ticket;
