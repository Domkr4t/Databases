/*1 запрос*/
ALTER TABLE ticket 
ADD CONSTRAINT van_number_more_0 CHECK (van_number > 0);

/*2 запрос*/
ALTER TABLE intermediate_stations
ADD COLUMN stop_time INTERVAL;

/*3-4 запрос*/
CREATE TABLE physical_person (
    id BIGINT PRIMARY KEY,
    surname CHARACTER(255), 
    firstname CHARACTER(255),
    lastname CHARACTER(255),
    passport BIGINT,
    date_of_birth DATE,
    sex CHARACTER(1) CHECK (sex IN ('М', 'Ж'))
);

/*5 запрос*/
CREATE TABLE purchase (
    id BIGINT PRIMARY KEY,
    ticket_id BIGINT,
    phis_pers_id BIGINT,
    date_of_purchase TIMESTAMP,
    date_return TIMESTAMP DEFAULT NULL,
    FOREIGN KEY (ticket_id) REFERENCES ticket(id),
    FOREIGN KEY (phis_pers_id) REFERENCES physical_person(id)
);

/*6 запрос*/
ALTER TABLE ticket
DROP COLUMN status;

/*7 запрос*/ 
CREATE TABLE bonus (
    id BIGINT PRIMARY KEY,
    balance BIGINT,
    number_of_trips BIGINT
);

/*8 запрос*/ 
ALTER TABLE physical_person
ADD COLUMN bonus_card BIGINT,
ADD CONSTRAINT phys_bonus_card FOREIGN KEY (bonus_card) REFERENCES bonus(id);

/*9 запрос*/ 
ALTER TABLE ticket
ALTER COLUMN van_number SET DEFAULT 1;

/*10 запрос*/
ALTER TABLE intermediate_stations
ADD COLUMN distance FLOAT; 