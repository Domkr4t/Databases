/*Создание и заполнение таблиц*/
CREATE TABLE districts (
    district_code BIGINT PRIMARY KEY,
    district_name VARCHAR(30)
);

INSERT INTO districts (district_code, district_name) VALUES (1, 'Щербинка');
INSERT INTO districts (district_code, district_name) VALUES (2, 'Бутово');
INSERT INTO districts (district_code, district_name) VALUES (3, 'Новогиреево');
INSERT INTO districts (district_code, district_name) VALUES (4, 'Алтуфьево');
INSERT INTO districts (district_code, district_name) VALUES (5, 'Троицк');
INSERT INTO districts (district_code, district_name) VALUES (6, 'Некрасовка');
INSERT INTO districts (district_code, district_name) VALUES (7, 'Строгино');
INSERT INTO districts (district_code, district_name) VALUES (8, 'Митино');
INSERT INTO districts (district_code, district_name) VALUES (9, 'Лефортово');
INSERT INTO districts (district_code, district_name) VALUES (10, 'Измайлово');
INSERT INTO districts (district_code, district_name) VALUES (11, 'Ховрино');
INSERT INTO districts (district_code, district_name) VALUES (12, 'Солнцево');
INSERT INTO districts (district_code, district_name) VALUES (13, 'Отрадное');
INSERT INTO districts (district_code, district_name) VALUES (14, 'Раменки');
INSERT INTO districts (district_code, district_name) VALUES (15, 'Марьино');

CREATE TABLE real_estate_objects (
    object_code BIGINT PRIMARY KEY,
    district_code BIGINT REFERENCES districts (district_code),
    address VARCHAR(100),
    floor BIGINT,
    room_count BIGINT,
    type_id BIGINT,
    status BIGINT,
    price DOUBLE PRECISION,
    description TEXT,
    area DOUBLE PRECISION,
    listing_date TIMESTAMP,
    CHECK (type_id IN (1, 2))
);

INSERT INTO real_estate_objects (object_code, district_code, address, floor, room_count, type_id, status, price, description, area, listing_date) VALUES (1, 1, 'Полевая Улица, 21', 1, 3, 1, 1, 21489349.51, null, 50, '2023-10-06 03:32:51');
INSERT INTO real_estate_objects (object_code, district_code, address, floor, room_count, type_id, status, price, description, area, listing_date) VALUES (2, 2, 'Октябрьская Улица, 34', 5, 4, 2, 0, 24162144.5, null, 55, '2022-05-14 07:17:40');
INSERT INTO real_estate_objects (object_code, district_code, address, floor, room_count, type_id, status, price, description, area, listing_date) VALUES (3, 3, 'Нагорный Переулок, 6', 15, 4, 1, 1, 66631751.48, null, 93, '2023-07-10 09:35:20');
INSERT INTO real_estate_objects (object_code, district_code, address, floor, room_count, type_id, status, price, description, area, listing_date) VALUES (4, 4, 'Заречная Улица, 12', 1, 2, 1, 1, 26761563.71, null, 89, '2023-07-05 20:45:45');
INSERT INTO real_estate_objects (object_code, district_code, address, floor, room_count, type_id, status, price, description, area, listing_date) VALUES (5, 5, 'Дачная Улица, 22', 3, 2, 2, 1, 56375150.58, null, 75, '2023-05-30 12:31:00');
INSERT INTO real_estate_objects (object_code, district_code, address, floor, room_count, type_id, status, price, description, area, listing_date) VALUES (6, 6, 'Мусы Гареева Улица, 30', 18, 4, 2, 1, 15143432.67, null, 85, '2023-05-30 13:23:18');
INSERT INTO real_estate_objects (object_code, district_code, address, floor, room_count, type_id, status, price, description, area, listing_date) VALUES (7, 7, 'Таежная Улица, 24', 20, 4, 2, 0, 16307515.72, null, 78, '2023-06-12 19:51:34');
INSERT INTO real_estate_objects (object_code, district_code, address, floor, room_count, type_id, status, price, description, area, listing_date) VALUES (8, 8, 'Советская Улица, 10', 3, 3, 2, 0, 29583151.45, null, 98, '2023-09-07 10:50:33');
INSERT INTO real_estate_objects (object_code, district_code, address, floor, room_count, type_id, status, price, description, area, listing_date) VALUES (9, 9, 'Уютная Улица, 7', 8, 3, 1, 1, 24224915.24, null, 82, '2023-03-03 23:04:31');
INSERT INTO real_estate_objects (object_code, district_code, address, floor, room_count, type_id, status, price, description, area, listing_date) VALUES (10, 10, 'Садовая Улица, 14', 12, 4, 1, 0, 29855188.91, null, 55, '2023-05-03 12:21:58');
INSERT INTO real_estate_objects (object_code, district_code, address, floor, room_count, type_id, status, price, description, area, listing_date) VALUES (11, 11, 'Инженерная Улица, 17', 5, 4, 1, 0, 26001543.48, null, 80, '2023-03-04 19:11:16');
INSERT INTO real_estate_objects (object_code, district_code, address, floor, room_count, type_id, status, price, description, area, listing_date) VALUES (12, 12, 'Березовская Улица, 28', 7, 1, 2, 0, 18295632.74, null, 72, '2023-09-07 00:03:10');
INSERT INTO real_estate_objects (object_code, district_code, address, floor, room_count, type_id, status, price, description, area, listing_date) VALUES (13, 13, 'Молодежная Улица, 13', 14, 1, 1, 1, 26916843.89, null, 81, '2023-02-07 11:53:28');
INSERT INTO real_estate_objects (object_code, district_code, address, floor, room_count, type_id, status, price, description, area, listing_date) VALUES (14, 14, 'Речная Улица, 12', 17, 1, 2, 1, 55467962.4, null, 92, '2023-01-09 05:26:57');
INSERT INTO real_estate_objects (object_code, district_code, address, floor, room_count, type_id, status, price, description, area, listing_date) VALUES (15, 15, 'Озерная Улица, 32', 10, 2, 1, 1, 176395583.53, null, 66, '2023-03-31 06:26:38');
INSERT INTO real_estate_objects (object_code, district_code, address, floor, room_count, type_id, status, price, description, area, listing_date) VALUES (16, 15, 'Озерная Улица, 31', 10, 2, 1, 1, 1763911583.53, null, 66, '2023-08-31 10:26:38');
INSERT INTO real_estate_objects (object_code, district_code, address, floor, room_count, type_id, status, price, description, area, listing_date) VALUES (17, 11, 'Инженерная Улица, 12', 4, 1, 1, 0, 26001543.48, null, 80, '2023-08-04 19:20:56');
INSERT INTO real_estate_objects (object_code, district_code, address, floor, room_count, type_id, status, price, description, area, listing_date) VALUES (18, 11, 'Инженерная Улица, 12', 8, 2, 1, 0, 2101543.48, null, 80, '2023-03-04 13:29:13');
INSERT INTO real_estate_objects (object_code, district_code, address, floor, room_count, type_id, status, price, description, area, listing_date) VALUES (19, 11, 'Инженерная Улица, 13', 1, 3, 1, 0, 2151542.48, null, 50, '2023-02-19 07:48:13');
INSERT INTO real_estate_objects (object_code, district_code, address, floor, room_count, type_id, status, price, description, area, listing_date) VALUES (20, 11, 'Инженерная Улица, 13', 4, 2, 1, 0, 6101543.48, null, 67, '2023-03-04 09:15:54');
INSERT INTO real_estate_objects (object_code, district_code, address, floor, room_count, type_id, status, price, description, area, listing_date) VALUES (21, 11, 'Инженерная Улица, 13', 5, 3, 1, 0, 3631543.48, null, 78, '2023-07-28 11:30:54');
INSERT INTO real_estate_objects (object_code, district_code, address, floor, room_count, type_id, status, price, description, area, listing_date) VALUES (22, 10, 'Садовая Улица, 28', 6, 2, 1, 0, 21555188.91, null, 55, '2022-11-10 19:01:11');
INSERT INTO real_estate_objects (object_code, district_code, address, floor, room_count, type_id, status, price, description, area, listing_date) VALUES (23, 10, 'Садовая Улица, 34', 9, 4, 1, 0, 51514388.91, null, 61, '2022-12-28 09:56:23');
INSERT INTO real_estate_objects (object_code, district_code, address, floor, room_count, type_id, status, price, description, area, listing_date) VALUES (24, 10, 'Садовая Улица, 35', 9, 4, 1, 0, 51514388.91, null, 61, '2022-05-23 08:12:23');

CREATE TABLE assessment_criteria (
    criteria_code BIGINT PRIMARY KEY,
    criteria_name VARCHAR(30)
);

INSERT INTO assessment_criteria (criteria_code, criteria_name) VALUES (1, 'Местоположение');
INSERT INTO assessment_criteria (criteria_code, criteria_name) VALUES (2, 'Площадь');
INSERT INTO assessment_criteria (criteria_code, criteria_name) VALUES (3, 'Планировка,');
INSERT INTO assessment_criteria (criteria_code, criteria_name) VALUES (4, 'Состояние отделки');
INSERT INTO assessment_criteria (criteria_code, criteria_name) VALUES (5, 'Тип дома');
INSERT INTO assessment_criteria (criteria_code, criteria_name) VALUES (6, 'Этажность');
INSERT INTO assessment_criteria (criteria_code, criteria_name) VALUES (7, 'Экология');
INSERT INTO assessment_criteria (criteria_code, criteria_name) VALUES (8, 'Уровень шума');
INSERT INTO assessment_criteria (criteria_code, criteria_name) VALUES (9, 'Вид из окна');


CREATE TABLE assessments (
    assessment_code BIGINT PRIMARY KEY,
    object_code BIGINT REFERENCES real_estate_objects (object_code),
    assessment_date TIMESTAMP,
    criteria_code BIGINT REFERENCES assessment_criteria (criteria_code),
    rating DOUBLE PRECISION
);

INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (1, 5, '2023-07-31 19:10:31', 3, 1.09);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (2, 9, '2023-01-20 12:19:01', 8, 2.18);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (3, 8, '2023-05-20 02:15:25', 5, 2.69);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (4, 12, '2023-08-19 09:08:47', 7, 1.15);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (5, 15, '2023-09-08 17:33:43', 7, 4.7);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (6, 11, '2023-03-15 17:48:35', 5, 4.25);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (7, 4, '2023-05-11 03:07:23', 6, 4.49);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (8, 9, '2023-09-10 11:04:38', 8, 1.01);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (9, 7, '2023-02-05 16:43:45', 7, 4.23);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (10, 15, '2023-02-26 10:18:38', 9, 2.66);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (11, 12, '2023-05-13 12:44:50', 9, 2.06);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (12, 10, '2023-01-04 04:00:49', 2, 1.23);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (13, 10, '2023-04-22 16:04:48', 5, 3.7);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (14, 3, '2023-04-28 09:22:24', 5, 2.15);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (15, 11, '2023-07-05 21:41:17', 5, 3.43);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (16, 13, '2023-04-12 09:23:08', 4, 1.73);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (17, 2, '2023-08-11 06:20:18', 2, 3.21);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (18, 14, '2023-09-09 03:35:49', 1, 3.95);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (19, 3, '2023-07-12 23:04:46', 1, 3.49);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (20, 7, '2023-06-18 18:05:25', 7, 4.66);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (21, 12, '2023-09-09 19:14:32', 8, 3.48);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (22, 4, '2023-07-29 19:50:56', 6, 1.61);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (23, 6, '2023-05-10 03:42:28', 9, 1.07);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (24, 12, '2023-04-12 19:31:36', 2, 2.72);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (25, 9, '2023-02-21 09:20:45', 4, 2.55);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (26, 1, '2023-01-04 15:16:50', 2, 1.25);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (27, 5, '2023-10-10 10:13:08', 3, 4.9);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (28, 14, '2023-05-10 00:17:21', 4, 3.08);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (29, 6, '2023-02-13 06:50:46', 4, 4.48);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (30, 4, '2023-06-02 07:23:20', 9, 4.93);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (31, 3, '2023-08-24 09:01:12', 1, 4);
INSERT INTO assessments (assessment_code, object_code, assessment_date, criteria_code, rating) VALUES (32, 3, '2023-08-24 09:01:12', 1, 5);

CREATE TABLE realtors (
    realtor_code BIGINT PRIMARY KEY,
    last_name VARCHAR(30),
    first_name VARCHAR(30),
    middle_name VARCHAR(30),
    contact_phone VARCHAR(30)
);

INSERT INTO realtors (realtor_code, last_name, first_name, middle_name, contact_phone) VALUES (1, 'Панкратов', 'Илья', 'Алексеевич', '+7 (603) 118-0126');
INSERT INTO realtors (realtor_code, last_name, first_name, middle_name, contact_phone) VALUES (2, 'Иванов', 'Иван', 'Иванович', '+7 (457) 431-3282');
INSERT INTO realtors (realtor_code, last_name, first_name, middle_name, contact_phone) VALUES (3, 'Глебов', 'Глеб', 'Глебович', '+7 (583) 960-8371');
INSERT INTO realtors (realtor_code, last_name, first_name, middle_name, contact_phone) VALUES (4, 'Александров', 'Александр', 'Александрович', '+7 (181) 744-9445');
INSERT INTO realtors (realtor_code, last_name, first_name, middle_name, contact_phone) VALUES (5, 'Алексеев', 'Алексей', 'Алексеевич', '+7 (730) 142-5514');
INSERT INTO realtors (realtor_code, last_name, first_name, middle_name, contact_phone) VALUES (6, 'Романов', 'Роман', 'Романович', '+7 (943) 165-9049');
INSERT INTO realtors (realtor_code, last_name, first_name, middle_name, contact_phone) VALUES (7, 'Ильев', 'Илья', 'Ильич', '+7 (802) 879-1352');
INSERT INTO realtors (realtor_code, last_name, first_name, middle_name, contact_phone) VALUES (8, 'Данилов', 'Даниил', 'Даниилович', '+7 (684) 245-8321');
INSERT INTO realtors (realtor_code, last_name, first_name, middle_name, contact_phone) VALUES (9, 'Максимов', 'Максим', 'Максимович', '+7 (518) 585-9587');
INSERT INTO realtors (realtor_code, last_name, first_name, middle_name, contact_phone) VALUES (10, 'Сергеев', 'Сергей', 'Сергеевич', '+7 (799) 580-0988');
INSERT INTO realtors (realtor_code, last_name, first_name, middle_name, contact_phone) VALUES (11, 'Олегов', 'Олег', 'Олегович', '+7 (394) 352-1975');
INSERT INTO realtors (realtor_code, last_name, first_name, middle_name, contact_phone) VALUES (12, 'Антонов', 'Антон', 'Антонович', '+7 (669) 672-0407');
INSERT INTO realtors (realtor_code, last_name, first_name, middle_name, contact_phone) VALUES (13, 'Борисов', 'Борис', 'Борисович', '+7 (478) 619-2851');
INSERT INTO realtors (realtor_code, last_name, first_name, middle_name, contact_phone) VALUES (14, 'Николаев', 'Николай', 'Николаевич', '+7 (578) 755-8297');
INSERT INTO realtors (realtor_code, last_name, first_name, middle_name, contact_phone) VALUES (15, 'Артемов', 'Артем', 'Артемович', '+7 (993) 637-8526');

CREATE TABLE sales (
    sale_code BIGINT PRIMARY KEY,
    object_code BIGINT REFERENCES real_estate_objects (object_code),
    sale_date TIMESTAMP,
    realtor_code BIGINT REFERENCES realtors (realtor_code),
    price DOUBLE precision
);

INSERT INTO sales (sale_code, object_code, sale_date, realtor_code, price) VALUES (1, 1, '2023-09-08 08:24:22', 8, 21489349.51);
INSERT INTO sales (sale_code, object_code, sale_date, realtor_code, price) VALUES (2, 1, '2023-02-14 16:14:08', 14, 21489349.51);
INSERT INTO sales (sale_code, object_code, sale_date, realtor_code, price) VALUES (3, 3, '2023-05-10 16:47:41', 5, 66631751.48);
INSERT INTO sales (sale_code, object_code, sale_date, realtor_code, price) VALUES (4, 2, '2023-08-17 13:05:30', 2, 24162144.5);
INSERT INTO sales (sale_code, object_code, sale_date, realtor_code, price) VALUES (5, 8, '2023-06-13 20:35:16', 8, 29583151.45);
INSERT INTO sales (sale_code, object_code, sale_date, realtor_code, price) VALUES (6, 5, '2023-08-27 15:13:31', 8, 56375150.58);
INSERT INTO sales (sale_code, object_code, sale_date, realtor_code, price) VALUES (7, 8, '2023-05-12 08:51:38', 13, 29583151.45);
INSERT INTO sales (sale_code, object_code, sale_date, realtor_code, price) VALUES (8, 6, '2023-04-15 21:12:13', 2, 15143432.67);
INSERT INTO sales (sale_code, object_code, sale_date, realtor_code, price) VALUES (9, 11, '2023-07-26 08:50:25', 10, 26001543.48);
INSERT INTO sales (sale_code, object_code, sale_date, realtor_code, price) VALUES (10, 13, '2023-06-01 05:52:16', 10, 26916843.89);
INSERT INTO sales (sale_code, object_code, sale_date, realtor_code, price) VALUES (11, 11, '2023-06-28 22:36:53', 11, 26001543.48);
INSERT INTO sales (sale_code, object_code, sale_date, realtor_code, price) VALUES (12, 13, '2023-09-25 05:03:42', 14, 26916843.89);
INSERT INTO sales (sale_code, object_code, sale_date, realtor_code, price) VALUES (13, 14, '2023-07-13 17:36:34', 1, 55467962.4);
INSERT INTO sales (sale_code, object_code, sale_date, realtor_code, price) VALUES (14, 10, '2023-04-24 05:33:18', 3, 29855188.91);
INSERT INTO sales (sale_code, object_code, sale_date, realtor_code, price) VALUES (15, 2, '2023-07-15 23:08:22', 1, 24162144.5);
INSERT INTO sales (sale_code, object_code, sale_date, realtor_code, price) VALUES (16, 2, '2022-10-17 14:00:00', 1, 25162234.5);
INSERT INTO sales (sale_code, object_code, sale_date, realtor_code, price) VALUES (17, 2, '2022-11-17 15:41:12', 1, 31562334.5);
INSERT INTO sales (sale_code, object_code, sale_date, realtor_code, price) VALUES (18, 24, '2022-11-17 15:41:12', 1, 31562334.5);
INSERT INTO sales (sale_code, object_code, sale_date, realtor_code, price) VALUES (19, 2, '2023-11-17 15:41:12', 1, 31562334.5);

/*Выполнение запросов*/

/*1 Запрос*/
SELECT
    ro.address AS "Адрес",
    d.district_name AS "Район"
FROM
    real_estate_objects ro
JOIN
    districts d ON ro.district_code = d.district_code
WHERE
    ro.price / ro.area < (SELECT AVG(price / area) FROM real_estate_objects WHERE district_code = d.district_code);

/*2 Запрос*/
SELECT
    d.district_name AS "Район"
FROM
    districts d
JOIN
    real_estate_objects ro ON d.district_code = ro.district_code
WHERE
    ro.status = 0
GROUP BY
    d.district_name
HAVING
    COUNT(ro.object_code) > 5;

/*3 Запрос*/
SELECT
    ro.address AS "Адрес",
    d.district_name AS "Район"
FROM
    real_estate_objects ro
JOIN
    districts d ON ro.district_code = d.district_code
JOIN
    assessments a ON ro.object_code = a.object_code
GROUP BY
    ro.address, d.district_name
HAVING
    AVG(a.rating) > 3.5;

/*4 Запрос*/
SELECT
    EXTRACT(YEAR FROM listing_date) AS "Год"
FROM
    real_estate_objects
GROUP BY
    "Год"
HAVING
    COUNT(object_code) BETWEEN 2 AND 4;

/*5 Запрос*/
SELECT
    r.last_name AS "Фамилия",
    r.first_name AS "Имя",
    r.middle_name AS "Отчество"
FROM
    realtors r
WHERE
    r.realtor_code NOT IN (
    SELECT s.realtor_code
    FROM sales s
    WHERE EXTRACT(YEAR FROM s.sale_date) = EXTRACT(YEAR FROM NOW())
);

/*6 Запрос*/
SELECT
    CONCAT(r.last_name, ' ', LEFT(r.first_name, 1), '.', LEFT(r.middle_name, 1), '.') AS "ФИО"
FROM
    realtors r
JOIN
    (
        SELECT s.realtor_code, COUNT(DISTINCT ro.district_code) AS num_districts
        FROM sales s
        JOIN real_estate_objects ro ON s.object_code = ro.object_code
        GROUP BY s.realtor_code
        HAVING COUNT(DISTINCT ro.district_code) > 2
    ) AS realtors_with_districts ON r.realtor_code = realtors_with_districts.realtor_code;

/*7 Запрос*/
SELECT
    d.district_name AS "Район"
FROM
    districts d
JOIN
    real_estate_objects ro ON d.district_code = ro.district_code
GROUP BY
    d.district_name
HAVING
    AVG(ro.area) > 80;

/*8 Запрос*/
SELECT
    CONCAT(r.first_name, ' ', LEFT(r.middle_name, 1), '.', LEFT(r.last_name, 1), '.') AS "ФИО",
    EXTRACT(YEAR FROM s.sale_date) AS "Год"
FROM
    realtors r
JOIN
    sales s ON r.realtor_code = s.realtor_code
WHERE
    r.last_name = 'Данилов' AND
    r.first_name = 'Даниил' AND
    r.middle_name = 'Даниилович'
GROUP BY
    "ФИО", "Год"
HAVING
    COUNT(s.object_code) > 2;

/*9 Запрос*/
SELECT
    CONCAT(r.first_name, ' ', LEFT(r.middle_name, 1), '.', LEFT(r.last_name, 1), '.') AS "ФИО",
    CONCAT(ROUND((SUM(s.price * 0.15))::numeric, 2), ' руб.') AS "Премия"
FROM
    sales AS s
JOIN
    realtors AS r ON s.realtor_code = r.realtor_code
WHERE
    EXTRACT(YEAR FROM s.sale_date) = EXTRACT(YEAR FROM CURRENT_DATE) AND
    EXTRACT(MONTH FROM s.sale_date) = 09
GROUP BY
    "ФИО"
HAVING
    ROUND((SUM(s.price * 0.15))::numeric, 2) > 40000;

/*10 Запрос*/
SELECT
    'Однокомнатных квартир' AS "Вид квартиры", COUNT(*) AS "Количество объектов недвижимости"
FROM
    real_estate_objects
WHERE
    district_code = 11 AND
    room_count = 1

UNION ALL

SELECT
    'Двухкомнатных квартир' AS "Вид квартиры", COUNT(*) AS "Количество объектов недвижимости"
FROM
    real_estate_objects
WHERE
    district_code = 11 AND
    room_count = 2

UNION ALL

SELECT
    'Больше двух комнат' AS "Вид квартиры", COUNT(*) AS "Количество объектов недвижимости"
FROM
    real_estate_objects
WHERE
    district_code = 11 AND
    room_count > 2;


/*11 Запрос*/
SELECT
    DISTINCT c.criteria_name AS "Критерий",
    CONCAT(ROUND(AVG(a.rating)::numeric, 2), ' из 5') AS "Оценка",
    CASE
        WHEN AVG(a.rating) >= 4.5 THEN 'превосходно'
        WHEN AVG(a.rating) >= 4 THEN 'очень хорошо'
        WHEN AVG(a.rating) >= 3.5 THEN 'хорошо'
        WHEN AVG(a.rating) >= 3 THEN 'удовлетворительно'
        ELSE 'неудовлетворительно'
    END AS "Текст"
FROM
    assessments a
JOIN
    assessment_criteria c ON a.criteria_code = c.criteria_code
WHERE
    a.object_code = 3
GROUP BY
    c.criteria_name;

/*12 Запрос*/
CREATE TABLE real_estate_structure (
    structure_id BIGINT PRIMARY KEY,
    real_estate_object_id BIGINT REFERENCES real_estate_objects (object_code),
    room_type SMALLINT CHECK (room_type IN (1, 2, 3, 4)),
    area NUMERIC CHECK (area > 0)
);

INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (1, 8, 3, 9);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (2, 14, 3, 16);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (3, 1, 3, 22);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (4, 13, 4, 20);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (5, 20, 4, 15);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (6, 1, 4, 24);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (7, 6, 2, 19);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (8, 3, 1, 17);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (9, 11, 3, 4);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (10, 16, 4, 24);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (11, 17, 4, 26);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (12, 10, 2, 4);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (13, 23, 2, 14);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (14, 11, 2, 15);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (15, 6, 2, 23);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (16, 18, 1, 11);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (17, 13, 1, 13);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (18, 1, 4, 17);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (19, 8, 1, 24);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (20, 3, 3, 5);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (21, 9, 2, 1);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (22, 1, 1, 5);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (23, 14, 4, 29);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (24, 15, 1, 9);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (25, 18, 1, 24);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (26, 23, 3, 8);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (27, 10, 4, 11);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (28, 2, 3, 26);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (29, 9, 1, 15);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (30, 2, 4, 8);
INSERT INTO real_estate_structure (structure_id, real_estate_object_id, room_type, area) VALUES (31, 2, 1, 21);

/*13 Запрос*/
SELECT
    CASE
        WHEN room_type = 1 THEN 'Кухня'
        WHEN room_type = 2 THEN 'Зал'
        WHEN room_type = 3 THEN 'Спальня'
        WHEN room_type = 4 THEN 'Санузел'
    END AS "Тип комнаты",
    CONCAT(area, ' кв.м.') AS "Площадь комнаты"
FROM
    real_estate_structure
WHERE
    real_estate_object_id = 2;

/*14 Запрос*/
SELECT
    CASE
        WHEN room_type = 1 THEN 'Кухня'
        WHEN room_type = 2 THEN 'Зал'
        WHEN room_type = 3 THEN 'Спальня'
        WHEN room_type = 4 THEN 'Санузел'
    END AS "Тип комнаты",
    CONCAT(str.area, ' кв.м.') AS "Площадь комнаты",
    CONCAT(obj.area, ' кв.м.') AS "Общая площадь",
    CONCAT(ROUND(((str.area / obj.area) * 100)::numeric, 2), '%') AS "Процент от общей площади"
FROM
    real_estate_structure str
JOIN
    real_estate_objects obj ON str.real_estate_object_id = obj.object_code
WHERE
    real_estate_object_id = 2
GROUP BY
    room_type, obj.area, str.area;

/*15 Запрос*/
SELECT
    d.district_name AS "Район",
    COUNT(s.real_estate_object_id) AS "Количество объектов"
FROM
    real_estate_structure AS s
JOIN
    real_estate_objects AS r ON s.real_estate_object_id = r.object_code
JOIN
    districts AS d ON r.district_code = d.district_code
GROUP BY
    d.district_name
HAVING
    SUM(s.area) > 40;

/*16 Запрос*/
SELECT
    reo.address AS "Адрес квартиры",
    reo.listing_date AS "Дата размещения объявления",
    s.sale_date AS "Дата продажи"
FROM
    sales AS s
INNER JOIN
    real_estate_objects AS reo
ON
    s.object_code = reo.object_code
WHERE
    s.sale_date <= (reo.listing_date + INTERVAL '4 months');

/*17 Запрос*/
SELECT
    reo.address AS "Адрес",
    d.district_name AS "Район",
    CASE
        WHEN reo.status = 0 THEN 'в продаже'
        WHEN reo.status = 1 THEN 'продано'
    END AS "Статус"
FROM
    real_estate_objects AS reo
JOIN
    districts d ON reo.district_code = d.district_code
WHERE
    reo.listing_date >= (CURRENT_DATE - INTERVAL '4 months') AND
    reo.price / reo.area < (
        SELECT AVG(price / area)
        FROM real_estate_objects r
        WHERE r.district_code = reo.district_code
    );

/*18 Запрос*/
WITH SalesData AS (
    SELECT
        d.district_name AS district_name,
        EXTRACT(YEAR FROM s.sale_date) AS sale_year,
        COUNT(*) AS sales_count
    FROM
        sales s
    JOIN
        real_estate_objects r ON s.object_code = r.object_code
    JOIN
        districts d ON r.district_code = d.district_code
    GROUP BY
        d.district_name, EXTRACT(YEAR FROM s.sale_date)
)
SELECT
    district_name AS "Район",
    MAX(CASE WHEN sale_year = 2022 THEN sales_count ELSE 0 END)::float AS "2022",
    MAX(CASE WHEN sale_year = 2023 THEN sales_count ELSE 0 END)::float AS "2023",
    CONCAT
    (
        CASE
        WHEN
            MAX(CASE WHEN sale_year = 2022 THEN sales_count ELSE 0 END) = 0
        THEN
            MAX(CASE WHEN sale_year = 2023 THEN sales_count ELSE 0 END) * 100
        ELSE
            ROUND((((MAX(CASE WHEN sale_year = 2023 THEN sales_count ELSE 0 END)::float - MAX(CASE WHEN sale_year = 2022 THEN sales_count ELSE 0 END)::float) / MAX(CASE WHEN sale_year = 2022 THEN sales_count ELSE 0 END)::float) * 100)::numeric, 2)
        END
    , '%') AS "Изменение в процентах"
FROM
    SalesData
GROUP BY
    district_name
ORDER BY
    district_name;

/*19 Запрос*/
SELECT
    ro.type_id AS "Тип объекта недвижимости",
    COUNT(s.sale_code) AS "Количество продаж",
    CONCAT((COUNT(s.sale_code) * 100) / (SELECT COUNT(*) FROM sales WHERE DATE_PART('year', sale_date) = 2022), '%') AS "Процент от общего количества",
    ROUND(SUM(s.price)::numeric, 2) AS "Общая сумма"
FROM
    sales s
JOIN
    real_estate_objects ro ON s.object_code = ro.object_code
WHERE
    DATE_PART('year', s.sale_date) = 2022
GROUP BY
    ro.type_id;
