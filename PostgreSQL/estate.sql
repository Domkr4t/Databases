PGDMP         (            
    {            estate    15.4    15.4 @    W           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            X           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            Y           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            Z           1262    24746    estate    DATABASE     z   CREATE DATABASE estate WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE estate;
                postgres    false            �            1255    24747 (   calculateaverageratingsforobject(bigint)    FUNCTION     �  CREATE FUNCTION public.calculateaverageratingsforobject(object_id bigint) RETURNS TABLE(criteria_name character varying, average_rating double precision)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        ac.criteria_name,
        AVG(a.rating) AS average_rating
    FROM
        assessment_criteria ac
    LEFT JOIN
        assessments a ON ac.criteria_code = a.criteria_code
    WHERE
        a.object_code = object_id
    GROUP BY
        ac.criteria_name;
END;
$$;
 I   DROP FUNCTION public.calculateaverageratingsforobject(object_id bigint);
       public          postgres    false            �            1255    24748 B   calculateearnings(date, date, character varying, numeric, numeric)    FUNCTION     �  CREATE FUNCTION public.calculateearnings(start_date date, end_date date, realtor_last_name character varying, s numeric, r numeric) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
DECLARE
    total_sales DECIMAL(10, 2);
    earnings DECIMAL(10, 2);
BEGIN
    SELECT SUM(price) INTO total_sales
    FROM Sales s
    JOIN realtors r ON r.realtor_code = s.realtor_code
    WHERE sale_date >= start_date AND sale_date <= end_date AND r.last_name = realtor_last_name;

    earnings := total_sales * S + R;


    INSERT INTO earnings (year, month, payout)
    VALUES (EXTRACT(YEAR FROM start_date), EXTRACT(MONTH FROM start_date), earnings);

    RETURN earnings;
END;
$$;
 �   DROP FUNCTION public.calculateearnings(start_date date, end_date date, realtor_last_name character varying, s numeric, r numeric);
       public          postgres    false            �            1255    24837 C   calculateearnings1(date, date, character varying, numeric, numeric)    FUNCTION     �  CREATE FUNCTION public.calculateearnings1(start_date date, end_date date, realtor_last_name character varying, s numeric, r numeric) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
DECLARE
    total_sales DECIMAL(10, 2);
BEGIN

    SELECT SUM(price) INTO total_sales
    FROM Sales s
    JOIN realtors r ON r.realtor_code = s.realtor_code
    WHERE sale_date >= start_date AND sale_date <= end_date AND r.last_name = realtor_last_name;

    RETURN total_sales * S + R;
END;
$$;
 �   DROP FUNCTION public.calculateearnings1(start_date date, end_date date, realtor_last_name character varying, s numeric, r numeric);
       public          postgres    false            �            1255    24841 C   calculateearnings2(date, date, character varying, numeric, numeric)    FUNCTION     �  CREATE FUNCTION public.calculateearnings2(start_date date, end_date date, realtor_last_name character varying, s numeric, r numeric) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
DECLARE
    total_sales DECIMAL(10, 2);
    func_earnings DECIMAL(10, 2);
BEGIN
    SELECT SUM(price) INTO total_sales
    FROM Sales s
    JOIN realtors r ON r.realtor_code = s.realtor_code
    WHERE sale_date >= start_date AND sale_date <= end_date AND r.last_name = realtor_last_name;

    func_earnings := total_sales * S + R;

    INSERT INTO earnings (year, month, payout)
    VALUES (EXTRACT(YEAR FROM start_date), EXTRACT(MONTH FROM start_date), func_earnings);

    RETURN func_earnings;
END;
$$;
 �   DROP FUNCTION public.calculateearnings2(start_date date, end_date date, realtor_last_name character varying, s numeric, r numeric);
       public          postgres    false            �            1255    24967    calculatelateminutes(integer)    FUNCTION     x  CREATE FUNCTION public.calculatelateminutes(p_employee_code integer) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
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
$$;
 D   DROP FUNCTION public.calculatelateminutes(p_employee_code integer);
       public          postgres    false            �            1255    24962    calculatelunchhours(integer)    FUNCTION     y  CREATE FUNCTION public.calculatelunchhours(p_employee_code integer) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
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
$$;
 C   DROP FUNCTION public.calculatelunchhours(p_employee_code integer);
       public          postgres    false            �            1255    24749 T   calculatemonthlymortgagepayment(bigint, double precision, integer, double precision)    FUNCTION     K  CREATE FUNCTION public.calculatemonthlymortgagepayment(object_id bigint, interest_rate double precision, loan_term integer, down_payment double precision) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
DECLARE
    property_price DOUBLE PRECISION;
    loan_amount DOUBLE PRECISION;
    monthly_interest_rate DOUBLE PRECISION;
    monthly_payment DOUBLE PRECISION;
BEGIN
    SELECT price INTO property_price
    FROM real_estate_objects
    WHERE object_code = object_id;
    
    loan_amount := property_price - down_payment;
    
    monthly_interest_rate := (interest_rate / 12) / 100;
    
    monthly_payment := loan_amount * (monthly_interest_rate * (POWER(1 + monthly_interest_rate, loan_term))) / (POWER(1 + monthly_interest_rate, loan_term) - 1);
    
    RETURN ROUND(monthly_payment::numeric, 2);
END;
$$;
 �   DROP FUNCTION public.calculatemonthlymortgagepayment(object_id bigint, interest_rate double precision, loan_term integer, down_payment double precision);
       public          postgres    false            �            1255    24750 +   calculatepricechangeandsaleduration(bigint)    FUNCTION     �  CREATE FUNCTION public.calculatepricechangeandsaleduration(id_object bigint, OUT price_change numeric, OUT date_change integer) RETURNS record
    LANGUAGE plpgsql
    AS $$
DECLARE start_price DECIMAL;
DECLARE end_price DECIMAL;

DECLARE start_date DATE;
DECLARE end_date DATE;
DECLARE date_interval INTERVAL; 
BEGIN
    SELECT price INTO start_price
    FROM 
        real_estate_objects 
    WHERE
        object_code = id_object
    ORDER BY price DESC
    LIMIT 1;

    SELECT price INTO end_price 
    FROM 
        sales
    WHERE
        object_code = id_object
    ORDER BY price DESC
    LIMIT 1;

    SELECT listing_date INTO start_date
    FROM 
        real_estate_objects
    WHERE 
        object_code = id_object
    ORDER BY listing_date DESC
    LIMIT 1;

    SELECT sale_date INTO end_date
    FROM 
        sales
    WHERE 
        object_code = id_object
    ORDER BY sale_date DESC
    LIMIT 1;

    price_change := ROUND((((end_price - start_price) / start_price) * 100)::numeric, 2);

    date_interval := end_date - start_date; 
    date_change := EXTRACT(MONTH FROM date_interval)::INT + 1;

    RETURN;
END;
$$;
    DROP FUNCTION public.calculatepricechangeandsaleduration(id_object bigint, OUT price_change numeric, OUT date_change integer);
       public          postgres    false            �            1255    24751 ,   calculatepricechangeandsaleduration5(bigint)    FUNCTION     %  CREATE FUNCTION public.calculatepricechangeandsaleduration5(id_object bigint, OUT price_change numeric, OUT date_change integer, OUT duration_message text) RETURNS record
    LANGUAGE plpgsql
    AS $$
DECLARE start_price DECIMAL;
DECLARE end_price DECIMAL;

DECLARE start_date DATE;
DECLARE end_date DATE;
DECLARE date_interval INTERVAL; 
BEGIN
    SELECT price INTO start_price
    FROM 
        real_estate_objects 
    WHERE
        object_code = id_object
    ORDER BY price DESC
    LIMIT 1;

    SELECT price INTO end_price 
    FROM 
        sales
    WHERE
        object_code = id_object
    ORDER BY price DESC
    LIMIT 1;

    SELECT listing_date INTO start_date
    FROM 
        real_estate_objects
    WHERE 
        object_code = id_object
    ORDER BY listing_date DESC
    LIMIT 1;

    SELECT sale_date INTO end_date
    FROM 
        sales
    WHERE 
        object_code = id_object
    ORDER BY sale_date DESC
    LIMIT 1;

    price_change := ROUND((((end_price - start_price) / start_price) * 100)::numeric, 2);

    date_interval := end_date - start_date; 
    date_change := EXTRACT(MONTH FROM date_interval)::INT + 1;

    IF date_change < 3 THEN
        duration_message := 'Очень быстро';
    ELSIF date_change >= 3 AND date_change <= 6 THEN
        duration_message := 'Быстро';
    ELSIF date_change > 6 AND date_change < 12 THEN
        duration_message := 'Долго';
    ELSE
        duration_message := 'Очень долго';
    END IF;

    RETURN;
END;
$$;
 �   DROP FUNCTION public.calculatepricechangeandsaleduration5(id_object bigint, OUT price_change numeric, OUT date_change integer, OUT duration_message text);
       public          postgres    false            �            1255    24835    calculatepricedynamics()    FUNCTION       CREATE FUNCTION public.calculatepricedynamics() RETURNS TABLE(change_date date, new_price double precision, price_change double precision, percent_change double precision)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        pd.change_date,
        pd.new_price,
        COALESCE(pd.new_price - LAG(pd.new_price) OVER (ORDER BY pd.change_date), 0) AS price_change,
        CASE
            WHEN LAG(pd.new_price) OVER (ORDER BY pd.change_date) <> 0
            THEN COALESCE(((pd.new_price - LAG(pd.new_price) OVER (ORDER BY pd.change_date)) / LAG(pd.new_price) OVER (ORDER BY pd.change_date)) * 100, 0)
            ELSE 0
        END AS percent_change
    FROM
        price_dynamics pd
    ORDER BY
        pd.change_date;
END;
$$;
 /   DROP FUNCTION public.calculatepricedynamics();
       public          postgres    false            �            1255    24836    calculatepricedynamics(bigint)    FUNCTION     �  CREATE FUNCTION public.calculatepricedynamics(p_property_code bigint) RETURNS TABLE(change_date date, new_price double precision, price_change double precision, percent_change double precision)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        pd.change_date,
        pd.new_price,
        ROUND((COALESCE(pd.new_price - LAG(pd.new_price) OVER (ORDER BY pd.change_date), 0))::numeric, 2)::DOUBLE PRECISION AS price_change,
        CASE
            WHEN LAG(pd.new_price) OVER (ORDER BY pd.change_date) <> 0
            THEN ROUND((COALESCE(((pd.new_price - LAG(pd.new_price) OVER (ORDER BY pd.change_date)) / LAG(pd.new_price) OVER (ORDER BY pd.change_date)) * 100, 0))::numeric, 2)::DOUBLE PRECISION
            ELSE 0
        END AS percent_change
    FROM
        price_dynamics pd
    WHERE
        pd.property_code = p_property_code
    ORDER BY
        pd.change_date;
END;
$$;
 E   DROP FUNCTION public.calculatepricedynamics(p_property_code bigint);
       public          postgres    false            �            1255    24753 4   calculatepropertytaxbycode(bigint, double precision)    FUNCTION     �  CREATE FUNCTION public.calculatepropertytaxbycode(property_code bigint, tax_rate double precision) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
DECLARE
    property_value DOUBLE PRECISION;
    property_tax DOUBLE PRECISION;
BEGIN
    
    SELECT price INTO property_value
    FROM real_estate_objects
    WHERE object_code = property_code;

    property_tax := property_value * (tax_rate / 100);

    RETURN ROUND(property_tax::numeric, 2);
END;
$$;
 b   DROP FUNCTION public.calculatepropertytaxbycode(property_code bigint, tax_rate double precision);
       public          postgres    false            �            1255    24974    calculatesalary(integer)    FUNCTION     �  CREATE FUNCTION public.calculatesalary(p_employee_code integer) RETURNS text
    LANGUAGE plpgsql
    AS $$
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
$$;
 ?   DROP FUNCTION public.calculatesalary(p_employee_code integer);
       public          postgres    false            �            1255    25002 %   calculateworkedemployeesbyhourrange()    FUNCTION     )  CREATE FUNCTION public.calculateworkedemployeesbyhourrange() RETURNS TABLE(hour_range timestamp without time zone, employees_count integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
 RETURN QUERY
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
END; $$;
 <   DROP FUNCTION public.calculateworkedemployeesbyhourrange();
       public          postgres    false            �            1255    24891 !   calculateworkhoursstatus(integer)    FUNCTION       CREATE FUNCTION public.calculateworkhoursstatus(p_employee_code integer) RETURNS text
    LANGUAGE plpgsql
    AS $$
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
    ))/3600
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
$$;
 H   DROP FUNCTION public.calculateworkhoursstatus(p_employee_code integer);
       public          postgres    false            �            1255    24754     convertcurrency(numeric, bigint)    FUNCTION     �  CREATE FUNCTION public.convertcurrency(conversion_rate numeric, property_code bigint, OUT price_in_other_value double precision) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
DECLARE
    original_price DOUBLE PRECISION;
BEGIN
    SELECT 
        price 
    INTO 
        original_price 
    FROM 
        real_estate_objects 
    WHERE 
        object_code = property_code;

    price_in_other_value := ROUND((original_price / conversion_rate)::numeric, 2);

    RETURN;
END;
$$;
 �   DROP FUNCTION public.convertcurrency(conversion_rate numeric, property_code bigint, OUT price_in_other_value double precision);
       public          postgres    false            �            1255    24755    count_of_sales(bigint)    FUNCTION     �   CREATE FUNCTION public.count_of_sales(number_year bigint) RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN MAX(CASE WHEN sale_year = number_year THEN sales_count ELSE 0 END);
END;
$$;
 9   DROP FUNCTION public.count_of_sales(number_year bigint);
       public          postgres    false            �            1255    25000    countemployeesperhour()    FUNCTION       CREATE FUNCTION public.countemployeesperhour() RETURNS TABLE(hour_range timestamp without time zone, employees_count integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
   RETURN QUERY
   SELECT
       generate_series('2023-11-13 09:00:00'::timestamp, '2023-11-13 18:59:59'::timestamp, '1 hour'::interval) AS hour_range,
       COUNT(DISTINCT employee_code) AS employees_count
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
   GROUP BY hour_range
   ORDER BY hour_range;
END; $$;
 .   DROP FUNCTION public.countemployeesperhour();
       public          postgres    false            �            1255    24834 #   getpricedynamicsforproperty(bigint)    FUNCTION     �  CREATE FUNCTION public.getpricedynamicsforproperty(property_code bigint) RETURNS TABLE(change_date date, new_price double precision, price_change double precision, percent_change double precision)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        pd.change_date,
        pd.new_price,
        pd.new_price - LAG(pd.new_price, 1, pd.new_price) OVER (ORDER BY pd.change_date) AS price_change,
        ((pd.new_price - LAG(pd.new_price, 1, pd.new_price) OVER (ORDER BY pd.change_date)) / LAG(pd.new_price, 1, pd.new_price) OVER (ORDER BY pd.change_date)) * 100 AS percent_change
    FROM
        price_dynamics pd
    WHERE
        pd.property_code = property_code
    ORDER BY
        pd.change_date;
END;
$$;
 H   DROP FUNCTION public.getpricedynamicsforproperty(property_code bigint);
       public          postgres    false            �            1259    24756    assessment_criteria    TABLE     x   CREATE TABLE public.assessment_criteria (
    criteria_code bigint NOT NULL,
    criteria_name character varying(30)
);
 '   DROP TABLE public.assessment_criteria;
       public         heap    postgres    false            �            1259    24759    assessments    TABLE     �   CREATE TABLE public.assessments (
    assessment_code bigint NOT NULL,
    object_code bigint,
    assessment_date timestamp without time zone,
    criteria_code bigint,
    rating double precision
);
    DROP TABLE public.assessments;
       public         heap    postgres    false            �            1259    24762 	   districts    TABLE     n   CREATE TABLE public.districts (
    district_code bigint NOT NULL,
    district_name character varying(30)
);
    DROP TABLE public.districts;
       public         heap    postgres    false            �            1259    24851    earnings    TABLE     `   CREATE TABLE public.earnings (
    year integer,
    month integer,
    payout numeric(10,2)
);
    DROP TABLE public.earnings;
       public         heap    postgres    false            �            1259    24768    price_dynamics    TABLE     w   CREATE TABLE public.price_dynamics (
    property_code bigint,
    new_price double precision,
    change_date date
);
 "   DROP TABLE public.price_dynamics;
       public         heap    postgres    false            �            1259    24771    real_estate_objects    TABLE     �  CREATE TABLE public.real_estate_objects (
    object_code bigint NOT NULL,
    district_code bigint,
    address character varying(100),
    floor bigint,
    room_count bigint,
    type_id bigint,
    status bigint,
    price double precision,
    description text,
    area double precision,
    listing_date timestamp without time zone,
    CONSTRAINT real_estate_objects_type_id_check CHECK ((type_id = ANY (ARRAY[(1)::bigint, (2)::bigint])))
);
 '   DROP TABLE public.real_estate_objects;
       public         heap    postgres    false            �            1259    24777    real_estate_structure    TABLE     O  CREATE TABLE public.real_estate_structure (
    structure_id bigint NOT NULL,
    real_estate_object_id bigint,
    room_type smallint,
    area numeric,
    CONSTRAINT real_estate_structure_area_check CHECK ((area > (0)::numeric)),
    CONSTRAINT real_estate_structure_room_type_check CHECK ((room_type = ANY (ARRAY[1, 2, 3, 4])))
);
 )   DROP TABLE public.real_estate_structure;
       public         heap    postgres    false            �            1259    24784    realtors    TABLE     �   CREATE TABLE public.realtors (
    realtor_code bigint NOT NULL,
    last_name character varying(30),
    first_name character varying(30),
    middle_name character varying(30),
    contact_phone character varying(30)
);
    DROP TABLE public.realtors;
       public         heap    postgres    false            �            1259    24787    sales    TABLE     �   CREATE TABLE public.sales (
    sale_code bigint NOT NULL,
    object_code bigint,
    sale_date timestamp without time zone,
    realtor_code bigint,
    price double precision
);
    DROP TABLE public.sales;
       public         heap    postgres    false            �            1259    24904    total_hours_worked    TABLE     C   CREATE TABLE public.total_hours_worked (
    "?column?" numeric
);
 &   DROP TABLE public.total_hours_worked;
       public         heap    postgres    false            �            1259    24988    workday    TABLE     �   CREATE TABLE public.workday (
    workday_id integer NOT NULL,
    employee_code integer,
    entry_exit_datetime timestamp without time zone,
    card_reader_value integer
);
    DROP TABLE public.workday;
       public         heap    postgres    false            �            1259    24987    workday_workday_id_seq    SEQUENCE     �   CREATE SEQUENCE public.workday_workday_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.workday_workday_id_seq;
       public          postgres    false    225            [           0    0    workday_workday_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.workday_workday_id_seq OWNED BY public.workday.workday_id;
          public          postgres    false    224            �           2604    24991    workday workday_id    DEFAULT     x   ALTER TABLE ONLY public.workday ALTER COLUMN workday_id SET DEFAULT nextval('public.workday_workday_id_seq'::regclass);
 A   ALTER TABLE public.workday ALTER COLUMN workday_id DROP DEFAULT;
       public          postgres    false    225    224    225            I          0    24756    assessment_criteria 
   TABLE DATA           K   COPY public.assessment_criteria (criteria_code, criteria_name) FROM stdin;
    public          postgres    false    214   �       J          0    24759    assessments 
   TABLE DATA           k   COPY public.assessments (assessment_code, object_code, assessment_date, criteria_code, rating) FROM stdin;
    public          postgres    false    215   ��       K          0    24762 	   districts 
   TABLE DATA           A   COPY public.districts (district_code, district_name) FROM stdin;
    public          postgres    false    216   ��       Q          0    24851    earnings 
   TABLE DATA           7   COPY public.earnings (year, month, payout) FROM stdin;
    public          postgres    false    222   X�       L          0    24768    price_dynamics 
   TABLE DATA           O   COPY public.price_dynamics (property_code, new_price, change_date) FROM stdin;
    public          postgres    false    217   ��       M          0    24771    real_estate_objects 
   TABLE DATA           �   COPY public.real_estate_objects (object_code, district_code, address, floor, room_count, type_id, status, price, description, area, listing_date) FROM stdin;
    public          postgres    false    218   ̕       N          0    24777    real_estate_structure 
   TABLE DATA           e   COPY public.real_estate_structure (structure_id, real_estate_object_id, room_type, area) FROM stdin;
    public          postgres    false    219   �       O          0    24784    realtors 
   TABLE DATA           c   COPY public.realtors (realtor_code, last_name, first_name, middle_name, contact_phone) FROM stdin;
    public          postgres    false    220   ��       P          0    24787    sales 
   TABLE DATA           W   COPY public.sales (sale_code, object_code, sale_date, realtor_code, price) FROM stdin;
    public          postgres    false    221   S�       R          0    24904    total_hours_worked 
   TABLE DATA           8   COPY public.total_hours_worked ("?column?") FROM stdin;
    public          postgres    false    223   ��       T          0    24988    workday 
   TABLE DATA           d   COPY public.workday (workday_id, employee_code, entry_exit_datetime, card_reader_value) FROM stdin;
    public          postgres    false    225   ��       \           0    0    workday_workday_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.workday_workday_id_seq', 78, true);
          public          postgres    false    224            �           2606    24791 ,   assessment_criteria assessment_criteria_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.assessment_criteria
    ADD CONSTRAINT assessment_criteria_pkey PRIMARY KEY (criteria_code);
 V   ALTER TABLE ONLY public.assessment_criteria DROP CONSTRAINT assessment_criteria_pkey;
       public            postgres    false    214            �           2606    24793    assessments assessments_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.assessments
    ADD CONSTRAINT assessments_pkey PRIMARY KEY (assessment_code);
 F   ALTER TABLE ONLY public.assessments DROP CONSTRAINT assessments_pkey;
       public            postgres    false    215            �           2606    24795    districts districts_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (district_code);
 B   ALTER TABLE ONLY public.districts DROP CONSTRAINT districts_pkey;
       public            postgres    false    216            �           2606    24797 ,   real_estate_objects real_estate_objects_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.real_estate_objects
    ADD CONSTRAINT real_estate_objects_pkey PRIMARY KEY (object_code);
 V   ALTER TABLE ONLY public.real_estate_objects DROP CONSTRAINT real_estate_objects_pkey;
       public            postgres    false    218            �           2606    24799 0   real_estate_structure real_estate_structure_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.real_estate_structure
    ADD CONSTRAINT real_estate_structure_pkey PRIMARY KEY (structure_id);
 Z   ALTER TABLE ONLY public.real_estate_structure DROP CONSTRAINT real_estate_structure_pkey;
       public            postgres    false    219            �           2606    24801    realtors realtors_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.realtors
    ADD CONSTRAINT realtors_pkey PRIMARY KEY (realtor_code);
 @   ALTER TABLE ONLY public.realtors DROP CONSTRAINT realtors_pkey;
       public            postgres    false    220            �           2606    24803    sales sales_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (sale_code);
 :   ALTER TABLE ONLY public.sales DROP CONSTRAINT sales_pkey;
       public            postgres    false    221            �           2606    24993    workday workday_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.workday
    ADD CONSTRAINT workday_pkey PRIMARY KEY (workday_id);
 >   ALTER TABLE ONLY public.workday DROP CONSTRAINT workday_pkey;
       public            postgres    false    225            �           2606    24804 *   assessments assessments_criteria_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.assessments
    ADD CONSTRAINT assessments_criteria_code_fkey FOREIGN KEY (criteria_code) REFERENCES public.assessment_criteria(criteria_code);
 T   ALTER TABLE ONLY public.assessments DROP CONSTRAINT assessments_criteria_code_fkey;
       public          postgres    false    214    3237    215            �           2606    24809 (   assessments assessments_object_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.assessments
    ADD CONSTRAINT assessments_object_code_fkey FOREIGN KEY (object_code) REFERENCES public.real_estate_objects(object_code);
 R   ALTER TABLE ONLY public.assessments DROP CONSTRAINT assessments_object_code_fkey;
       public          postgres    false    3243    218    215            �           2606    24814 :   real_estate_objects real_estate_objects_district_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.real_estate_objects
    ADD CONSTRAINT real_estate_objects_district_code_fkey FOREIGN KEY (district_code) REFERENCES public.districts(district_code);
 d   ALTER TABLE ONLY public.real_estate_objects DROP CONSTRAINT real_estate_objects_district_code_fkey;
       public          postgres    false    216    3241    218            �           2606    24819 F   real_estate_structure real_estate_structure_real_estate_object_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.real_estate_structure
    ADD CONSTRAINT real_estate_structure_real_estate_object_id_fkey FOREIGN KEY (real_estate_object_id) REFERENCES public.real_estate_objects(object_code);
 p   ALTER TABLE ONLY public.real_estate_structure DROP CONSTRAINT real_estate_structure_real_estate_object_id_fkey;
       public          postgres    false    3243    218    219            �           2606    24824    sales sales_object_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_object_code_fkey FOREIGN KEY (object_code) REFERENCES public.real_estate_objects(object_code);
 F   ALTER TABLE ONLY public.sales DROP CONSTRAINT sales_object_code_fkey;
       public          postgres    false    218    3243    221            �           2606    24829    sales sales_realtor_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_realtor_code_fkey FOREIGN KEY (realtor_code) REFERENCES public.realtors(realtor_code);
 G   ALTER TABLE ONLY public.sales DROP CONSTRAINT sales_realtor_code_fkey;
       public          postgres    false    221    3247    220            �           2606    24994 "   workday workday_employee_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.workday
    ADD CONSTRAINT workday_employee_code_fkey FOREIGN KEY (employee_code) REFERENCES public.realtors(realtor_code);
 L   ALTER TABLE ONLY public.workday DROP CONSTRAINT workday_employee_code_fkey;
       public          postgres    false    225    220    3247            I   �   x�-�M
�0��3��D�_��a�n
ׂ�k!h�Ś�
on�k�bB����HpBi[�Р�ԜJDT(u,8w����$��mC���N��+���!0���ҙ�J�:�_x��x6��fł��tʓ5�.�/����v}�Jpdfp|�,�1�����v�=      J   �  x�uSɑ#1{�QtR���X&�8Ԍ����e�A��^��*�j���0)V��&-�����&X�*�d����p����&/����Ʒ+|�	v�ԋ|�o�<2�,܀{�4��lUz¾ޛv���.��P+�oZW����a�aMhc�/� xd`qx?��H��Uǃ\d��;�����-�q��g�1�$����g������3�`��_5\xe|��~�E|�w��A%\B��ޱ 	���)-'mb �!��6�5�/񷡝[O���!a_�3$;����򨂆W�L!�W�gA ZR��E���Y�����,m��o	�eKhy�~��� &a#���-��YND�w���w���U"5��S"��yA��̐߉��|%�+8�T�o�ap_�W�I�	z^1�� F�s���7:o�S��yc��+N��`��FD� ���      K   �   x�=��NA���C�w�a֕x�7�	o���u��y#k؅̥����*4�ⓖ�/��|�k_$����7���^��2�s-�2�Fpfl�Ib>��u7t�b�;ڔ7�F�j����s�E�z\o��r-I�:G	�3���џ�`��,�ATa#��C��oǛ��¢�
����Y�us5z-&���I��      Q   <   x�u˱ D��cnױ���:����t2!��h��R��"�.�����~xdf3[N�!      L     x�m�In�0C��]l�����稜�h�M�@�&A�����RQ�'�(+�^��n�a'�JD�,<�EY�Bf�l Ä��psә�
�P&G2Ko�}x�I,É��)�$ѱw+���1�%+k͍��!�W"���q���~���WXk6r�f�[�.��Y;u��������{�=|���*;4���th��o���t]>��t�	�'X�U�>*���.�n]�5����F��J���H������3���*.��T���j��Z�H��d�o>�}      M     x���kn1�ۧ�dG�n�_��9	~�@$���J��e�d��!��(�j'��Uսd������'�[=�^�>���チ	ߋi�|���d�u�ˆ�ƅ�I.JV�v}W���z1ݯ����{�'�p2=�����߹!��4�ԸYf��@.���z�]�@_�<�緔7���i�1v�)o�Nv�+�FM}������ԍ��E]h��S�Pq�L=�M��C}5�-�g(�.]��/<��u�$Ka)�l4���p����)�u �A\�:F�R��2�)�m2��O���|8=�g��tF�9kj�h�璙�'�+ꊈ�&��ez>=\�q��!��3Bu�1/�������t<�x\t���9����%UJi�s-�L�0M�p:���Na�y��J���Knp���R�䮤��%Q�`[��ԗs���&w�QN���<�=v"_wԹ�Y"g	�a���h^�����k���g
	���&�0���*+|����9��(��s�͗B	Z��E�� ��q�uS�[��hR��U3���B��)�v1�&�
45(:�@�~�e1��i� v��i_n�A�;����.����ʲ���y�^.h�O�+��bO�_Ԇj�����~&-�-�9`���
��v���S+����� s����M��S�!AZK�eQ<vټ�o�-1�B�WW���|T���E�:ݟ��n pu���)��ԏz](V�!+g�"w�]BAdr�.T�'ư�p���g&�      N   �   x�%�Q!B��0��UG��?ǂC�����8,hXhїE���ӗ�&�m�Xp�0qA/��c�S�K�<�8b��N�r$T!k^b5�StXow��^��h�ݪ}&K8��*�q:�f-�mZ�?9ѕ��zS,EXېN�:*����\ߢ(��!���)�      O   �  x�uSKN�@]Ϝ"K"4h<���)l� ��7(-�Җ�΍p�ɤI�M�g����`��K��Yಹ���⮹o>�+��з�����Ņ��, ���Wm�*�t�	����X_F��*(�>�?��������A{��T^��FH$�𙗙��7FDc,���ǁ�y_���Q�Z0�1��>�3N2� ��XgE�&r߭�!o��K�Te|����Kb�Ib��C
�����,��d����v��D&���,;lBY�@�m�$�o���u�� 7���a�-�2��~$��GEs��4�  z�A��ڧ������If0�Qw畐F�t�Ox �5M�2�d��䁃(T������|�қ��\8lf��͖�[Z������fA��~'N2�9E:'������+��?�!G      P   3  x����m�0�Rn��TK��#���l.A ^DF�6nL,'ŉy@6�����ú7{ N�vr��\��hX�Հ6O��bm���9Leh�|B^���#4��\�H0VO�c���`����j�ǸN�2�lͶ�6��y�90�(�����r�aO*I���JlN�g*h��@!W��T�%���[����yu���0Ժ4��� ��2ww̢�Ϸ���:VNf���h����� ��vJ@E��ϞAT�g'���^�la�����.W|͖��M�U�[��r�1
e[Q2��Yn*��`��_���%{�      R      x�������� ]      T   �  x�e��q�0�o��4��xɩ%�����f��f�H��.,�D�ž��[��;�d/$C��$2j4H_5�=}�[c^�OK2�� }�J���QC��]��-"B�0bOЊ0*�*�U�	{aD��'�Y��=a�up��L��'��)�̝9�^0ҳas�z�4�"u̐��jHϾx��p�+ќKJ���`�W{�?Hc.�D�J�4�xφ���<}z���^=̅i�'J�-.���RJ��>ڽԥ!O�1��'ؗ�D���j;$�h�yj����D�W-��@ϣFH�WeOp6�$Z�4<��ݔj�`����h﫺4.<�V<�\F�V��2L�_��z�^5�|���o�8�=A�v%�s�h���i��k��ƞ�~5I�zi�����|{�y�[K�z�@{_?�y�-�e     