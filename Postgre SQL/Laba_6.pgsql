/*1 задание */
CREATE FUNCTION ConvertCurrency(
    IN conversion_rate NUMERIC,
    IN property_code BIGINT,
    OUT price_in_other_value DOUBLE PRECISION
)
RETURNS DOUBLE PRECISION AS $$
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
$$ LANGUAGE plpgsql;

SELECT * FROM ConvertCurrency(50.50, 3) AS "Стоимость"


/*2 задание */
CREATE OR REPLACE FUNCTION CalculateEarnings1(
    start_date DATE,
    end_date DATE,
    realtor_last_name VARCHAR(255),
    S DECIMAL(10, 2),
    R DECIMAL(10, 2)
)
RETURNS DECIMAL(10, 2) AS $$
DECLARE
    total_sales DECIMAL(10, 2);
BEGIN

    SELECT SUM(price) INTO total_sales
    FROM Sales s
    JOIN realtors r ON r.realtor_code = s.realtor_code
    WHERE sale_date >= start_date AND sale_date <= end_date AND r.last_name = realtor_last_name;

    RETURN total_sales * S + R;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM CalculateEarnings1('2022-01-01', '2023-01-31', 'Панкратов', 0.03, 1000);

/*3 задание */
CREATE TABLE earnings (
    year INT,
    month INT,
    payout DECIMAL(10, 2)
);

CREATE OR REPLACE FUNCTION CalculateEarnings2(
    start_date DATE,
    end_date DATE,
    realtor_last_name VARCHAR(255),
    S DECIMAL(10, 2),
    R DECIMAL(10, 2)
)
RETURNS DECIMAL(10, 2) AS $$
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
$$ LANGUAGE plpgsql;

SELECT * FROM CalculateEarnings2('2022-01-01', '2023-01-31', 'Панкратов', 0.03, 512122);

SELECT * FROM earnings;


/*4 задание */
CREATE OR REPLACE FUNCTION CalculatePriceChangeAndSaleDuration(
    IN id_object BIGINT,
    OUT price_change DECIMAL,
    OUT date_change INT
)
RETURNS RECORD AS $$
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
$$ LANGUAGE plpgsql;

SELECT * FROM CalculatePriceChangeAndSaleDuration(2)

/*5 задание */
CREATE OR REPLACE FUNCTION CalculatePriceChangeAndSaleDuration5(
    IN id_object BIGINT,
    OUT price_change DECIMAL,
    OUT date_change INT,
    OUT duration_message TEXT
)
RETURNS RECORD AS $$
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
$$ LANGUAGE plpgsql;

SELECT * FROM CalculatePriceChangeAndSaleDuration5(2)

/*6 задание */
CREATE OR REPLACE FUNCTION CalculateAverageRatingsForObject(
    IN object_id BIGINT
)
RETURNS TABLE (
    criteria_name VARCHAR(30),
    average_rating DOUBLE PRECISION
) AS $$
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
$$ LANGUAGE plpgsql;

SELECT * FROM CalculateAverageRatingsForObject(10)

/*7 задание */
CREATE OR REPLACE FUNCTION CalculateMonthlyMortgagePayment(
    IN object_id BIGINT,
    IN interest_rate DOUBLE PRECISION,
    IN loan_term INT,
    IN down_payment DOUBLE PRECISION
)
RETURNS DOUBLE PRECISION AS $$
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
$$ LANGUAGE plpgsql;

SELECT * FROM CalculateMonthlyMortgagePayment(1, 5.0, 240, 100000.0);

/*8 задание */
CREATE OR REPLACE FUNCTION CalculatePropertyTaxByCode(
    IN property_code BIGINT,
    IN tax_rate DOUBLE PRECISION
)
RETURNS DOUBLE PRECISION AS $$
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
$$ LANGUAGE plpgsql;

SELECT * FROM CalculatePropertyTaxByCode(5, 1.5);

/*9 задание */
CREATE TABLE price_dynamics (
    property_code BIGINT,
    new_price DOUBLE PRECISION,
    change_date DATE
);

INSERT INTO price_dynamics (property_code, new_price, change_date)
SELECT
    object_code,
    price + 1000000,
    listing_date + INTERVAL '6 months'
FROM
    real_estate_objects;

INSERT INTO price_dynamics (property_code, new_price, change_date) VALUES (10, 51255188.91, '2023-11-05');
INSERT INTO price_dynamics (property_code, new_price, change_date) VALUES (10, 41255188.91, '2023-11-07');


CREATE OR REPLACE FUNCTION CalculatePriceDynamics(
    IN p_property_code BIGINT
)
RETURNS TABLE (
    change_date DATE,
    new_price DOUBLE PRECISION,
    price_change DOUBLE PRECISION,
    percent_change DOUBLE PRECISION
) AS $$
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
$$ LANGUAGE plpgsql;

SELECT change_date AS "Дата изменения", new_price AS "Новая стоимость", price_change AS "Изменение цены", percent_change AS "Изменение цены в %" FROM CalculatePriceDynamics(10);
