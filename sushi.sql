-- dropping tables

DROP TABLE PROJECT_EMPLOYEES CASCADE CONSTRAINTS;
DROP TABLE PROJECT_CHEFS CASCADE CONSTRAINTS;
DROP TABLE PROJECT_WAITERS CASCADE CONSTRAINTS;
DROP TABLE PROJECT_TABLES CASCADE CONSTRAINTS;
DROP TABLE PROJECT_CUSTOMERS CASCADE CONSTRAINTS;
DROP TABLE PROJECT_MENU_ITEMS CASCADE CONSTRAINTS;
DROP TABLE PROJECT_INGREDIENTS CASCADE CONSTRAINTS;
DROP TABLE PROJECT_INGREDIENT_LISTS CASCADE CONSTRAINTS;
DROP TABLE PROJECT_ORDERS CASCADE CONSTRAINTS;

--creating the tables

CREATE TABLE PROJECT_EMPLOYEES (
    employee_id NUMBER(6) CONSTRAINT pk_employees PRIMARY KEY,
    phone_number NUMBER(12) CONSTRAINT ck_phone CHECK(phone_number LIKE '+40%'),
    first_name VARCHAR2(20),
    last_name VARCHAR2(20),
    email VARCHAR2(20) CONSTRAINT ck_email CHECK(email LIKE '%@%.%'),
    job_name VARCHAR2(20) NOT NULL,
    hire_date DATE
);

CREATE TABLE CHEFS (
    chef_id NUMBER(6) CONSTRAINT pk_chefs PRIMARY KEY,
    chef_speciality VARCHAR(20),
    employee_id REFERENCES PROJECT_EMPLOYEES(employee_id),
    CONSTRAINT uk_chefs UNIQUE(employee_id)
);

CREATE TABLE PROJECT_WAITERS(
    waiter_id NUMBER(6) CONSTRAINT pk_waiter PRIMARY KEY,
    employee_id REFERENCES PROJECT_EMPLOYEES(employee_id),
    CONSTRAINT uk_waiter UNIQUE(employee_id)
)

CREATE TABLE PROJECT_TABLES(
    table_no NUMBER(2) CONSTRAINT pk_table PRIMARY KEY,
    capacity NUMBER(2),
    location VARCHAR2(20)
);

CREATE TABLE PROJECT_CUSTOMERS(
    reservation_id NUMBER(7) CONSTRAINT pk_customers PRIMARY KEY,
    customer_name VARCHAR(20),
    customer_phone NUMBER(12) CONSTRAINT ck2_phone CHECK(customer_phone LIKE '+40%')
);

CREATE TABLE PROJECT_MENU_ITEMS(
    item_id NUMBER(4) CONSTRAINT pk_menu PRIMARY KEY,
    item_name VARCHAR2(20),
    item_type VARCHAR2(20),
    item_allergens VARCHAR(20),
    item_price NUMBER(5,2) NOT NULL,
    chef_id REFERENCES PROJECT_CHEFS(chef_id)
);

CREATE TABLE PROJECT_INGREDIENTS(
    ingredient_id NUMBER(4) CONSTRAINT pk_ingredients PRIMARY KEY,
    ingredient_name VARCHAR2(20),
    expiration_date DATE,
    measurement_type VARCHAR(10),
    ingredient_price_per_measurment NUMBER(5,2)
);

CREATE TABLE PROJECT_INGREDIENT_LISTS(
    list_id NUMBER(5) CONSTRAINT pk_list PRIMARY KEY,
    quantity NUMBER(2),
    item_id NUMBER(4) REFERENCES PROJECT_MENU_ITEMS(item_id)
);

CREATE TABLE PROJECT_ORDERS(
    order_id NUMBER(10) PRIMARY KEY,
    tips NUMBER(5),
    order_type VARCHAR2(20),
    waiter_id NUMBER(6) REFERENCES PROJECT_WAITERS(waiter_id),
    reservation_id NUMBER(7) REFERENCES PROJECT_CUSTOMERS(reservation_id),
    table_no NUMBER(2) REFERENCES PROJECT_TABLES(table_no)
);

--DDL - ALTER TABLE

ALTER TABLE CHEFS RENAME TO PROJECT_CHEFS;
ALTER TABLE PROJECT_EMPLOYEES ADD (salary NUMBER(9,2));
ALTER TABLE PROJECT_EMPLOYEES DROP CONSTRAINT ck_phone;
ALTER TABLE PROJECT_EMPLOYEES ADD CONSTRAINT ck_phone CHECK(customer_phone LIKE '07%');
ALTER TABLE PROJECT_CUSTOMERS DROP CONSTRAINT ck2_phone;
ALTER TABLE PROJECT_EMPLOYEES MODIFY (email VARCHAR2(40));

-- dropping tables

DROP TABLE PROJECT_EMPLOYEES CASCADE CONSTRAINTS;
DROP TABLE PROJECT_CHEFS CASCADE CONSTRAINTS;
DROP TABLE PROJECT_WAITERS CASCADE CONSTRAINTS;
DROP TABLE PROJECT_TABLES CASCADE CONSTRAINTS;
DROP TABLE PROJECT_CUSTOMERS CASCADE CONSTRAINTS;
DROP TABLE PROJECT_MENU_ITEMS CASCADE CONSTRAINTS;
DROP TABLE PROJECT_INGREDIENTS CASCADE CONSTRAINTS;
DROP TABLE PROJECT_INGREDIENT_LISTS CASCADE CONSTRAINTS;
DROP TABLE PROJECT_ORDERS CASCADE CONSTRAINTS;

--creating the tables

CREATE TABLE PROJECT_EMPLOYEES (
    employee_id NUMBER(6) CONSTRAINT pk_employees PRIMARY KEY,
    phone_number NUMBER(12) CONSTRAINT ck_phone CHECK(phone_number LIKE '+40%'),
    first_name VARCHAR2(20),
    last_name VARCHAR2(20),
    email VARCHAR2(20) CONSTRAINT ck_email CHECK(email LIKE '%@%.%'),
    job_name VARCHAR2(20) NOT NULL,
    hire_date DATE
);

CREATE TABLE CHEFS (
    chef_id NUMBER(6) CONSTRAINT pk_chefs PRIMARY KEY,
    chef_speciality VARCHAR(20),
    employee_id REFERENCES PROJECT_EMPLOYEES(employee_id),
    CONSTRAINT uk_chefs UNIQUE(employee_id)
);

CREATE TABLE PROJECT_WAITERS(
    waiter_id NUMBER(6) CONSTRAINT pk_waiter PRIMARY KEY,
    employee_id REFERENCES PROJECT_EMPLOYEES(employee_id),
    CONSTRAINT uk_waiter UNIQUE(employee_id)
)

CREATE TABLE PROJECT_TABLES(
    table_no NUMBER(2) CONSTRAINT pk_table PRIMARY KEY,
    capacity NUMBER(2),
    location VARCHAR2(20)
);

CREATE TABLE PROJECT_CUSTOMERS(
    customer_id NUMBER(7) CONSTRAINT pk_customers PRIMARY KEY,
    customer_name VARCHAR(20),
    customer_phone NUMBER(12) CONSTRAINT ck2_phone CHECK(customer_phone LIKE '40%'),
    reservation_date DATE
);

CREATE TABLE PROJECT_MENU_ITEMS(
    item_id NUMBER(4) CONSTRAINT pk_menu PRIMARY KEY,
    item_name VARCHAR2(20),
    item_type VARCHAR2(20),
    item_allergens VARCHAR(20),
    item_price NUMBER(5,2) NOT NULL,
    chef_id REFERENCES PROJECT_CHEFS(chef_id)
);

CREATE TABLE PROJECT_INGREDIENTS(
    ingredient_id NUMBER(4) CONSTRAINT pk_ingredients PRIMARY KEY,
    ingredient_name VARCHAR2(20),
    expiration_date DATE,
    measurement_type VARCHAR(10),
    ingredient_price_per_measurment NUMBER(5,2)
);

CREATE TABLE PROJECT_INGREDIENT_LISTS(
    list_id NUMBER(5) CONSTRAINT pk_list PRIMARY KEY,
    quantity NUMBER(2),
    item_id NUMBER(4) REFERENCES PROJECT_MENU_ITEMS(item_id),
    ingredient_id NUMBER(4) REFERENCES PROJECT_INGREDIENTS(ingredient_id)
);

CREATE TABLE PROJECT_ORDERS(
    order_id NUMBER(10) PRIMARY KEY,
    tips NUMBER(5),
    waiter_id NUMBER(6) REFERENCES PROJECT_WAITERS(waiter_id),
    customer_id NUMBER(7) REFERENCES PROJECT_CUSTOMERS(customer_id),
    table_no NUMBER(2) REFERENCES PROJECT_TABLES(table_no),
    item_id NUMBER(4) REFERENCES PROJECT_MENU_ITEMS(item_id)
);

--DDL - ALTER TABLE

ALTER TABLE CHEFS RENAME TO PROJECT_CHEFS;
ALTER TABLE PROJECT_EMPLOYEES ADD (salary NUMBER(9,2));
ALTER TABLE PROJECT_EMPLOYEES DROP CONSTRAINT ck_phone;
ALTER TABLE PROJECT_CUSTOMERS DROP CONSTRAINT ck2_phone;
ALTER TABLE PROJECT_EMPLOYEES MODIFY (email VARCHAR2(40));
ALTER TABLE PROJECT_CHEFS MODIFY (chef_speciality VARCHAR2(60));
ALTER TABLE PROJECT_TABLES MODIFY (location VARCHAR2(30));
ALTER TABLE PROJECT_MENU_ITEMS MODIFY(item_name VARCHAR(50));
ALTER TABLE PROJECT_ORDERS ADD (item_quantity NUMBER(1));

--DML statements
--INSERTing data 

INSERT INTO PROJECT_EMPLOYEES (employee_id, phone_number, first_name, last_name, email, job_name, hire_date, salary) VALUES (3212, '+40732445444', 'Patricia-Andreea', 'Mitrache','patriciamitrache@gmail.com','Host',TO_DATE('11-03-2020','DD-MM-RRRR') ,90000);
INSERT INTO PROJECT_EMPLOYEES (employee_id, phone_number, first_name, last_name, email, job_name, hire_date, salary) VALUES (54365, '+40723441073', 'Jemima', 'Suharto','Jsuh@gmail.com','Chef',TO_DATE('12-02-2020','DD-MM-RRRR'),80000);
INSERT INTO PROJECT_EMPLOYEES (employee_id, phone_number, first_name, last_name, email, job_name, hire_date, salary) VALUES (78439, '+40754367125', 'Carolyn', 'Radomir','caro2314@gmail.com','Waiter',TO_DATE('22-01-2020','DD-MM-RRRR'),19000);
INSERT INTO PROJECT_EMPLOYEES (employee_id, phone_number, first_name, last_name, email, job_name, hire_date, salary) VALUES (76652, '+40776243615', 'Mártuska', 'Isidora','martuskaisia@hotmail.com','Chef',TO_DATE('31-10-2021','DD-MM-RRRR'),40000);
INSERT INTO PROJECT_EMPLOYEES (employee_id, phone_number, first_name, last_name, email, job_name, hire_date, salary) VALUES (12134, '+40787824567', 'Kassidy', 'Lawson','fdgendiv@yahoo.com','Host',TO_DATE('14-05-2022','DD-MM-RRRR'),50000);
INSERT INTO PROJECT_EMPLOYEES (employee_id, phone_number, first_name, last_name, email, job_name, hire_date, salary) VALUES (12435, '+40776432156', 'Vincent', 'Davis','vincenrloe@yahoo.com','Manager',TO_DATE('19-12-2019','DD-MM-RRRR'),50000);
INSERT INTO PROJECT_EMPLOYEES (employee_id, phone_number, first_name, last_name, email, job_name, hire_date, salary) VALUES (65437, '+40775422785', 'Gordon', 'Emily','ramsey125@john.com','Cook',TO_DATE('02-03-2018','DD-MM-RRRR'),23200);
INSERT INTO PROJECT_EMPLOYEES (employee_id, phone_number, first_name, last_name, email, job_name, hire_date, salary) VALUES (75437, '+40733214111', 'Johnnie', 'Afton','kimojohn@gmail.com','Waiter',TO_DATE('04-09-2020','DD-MM-RRRR'),53000);
INSERT INTO PROJECT_EMPLOYEES (employee_id, phone_number, first_name, last_name, email, job_name, hire_date, salary) VALUES (54671, '+40769696969', 'Allice', 'DeChant','messifan123@yahoo.com','Cleaner',TO_DATE('08-11-2022','DD-MM-RRRR'),19000);
INSERT INTO PROJECT_EMPLOYEES (employee_id, phone_number, first_name, last_name, email, job_name, hire_date, salary) VALUES (24653, '+40765726886', 'Jeritza', 'Noir','jernoir123@yahoo.com','Waiter',TO_DATE('08-11-2022','DD-MM-RRRR'),61000);
INSERT INTO PROJECT_EMPLOYEES (employee_id, phone_number, first_name, last_name, email, job_name, hire_date, salary) VALUES (32145, '+40769696969', 'Bonnie', 'Balsa','balsabon@gmail.com','Chef',TO_DATE('08-08-2018','DD-MM-RRRR'),42000);
INSERT INTO PROJECT_EMPLOYEES (employee_id, phone_number, first_name, last_name, email, job_name, hire_date, salary) VALUES (86542, '+40720005145', 'Charles', 'Degreau','charleseye@gmail.com','Waiter',TO_DATE('24-11-2023','DD-MM-RRRR'),49000);
INSERT INTO PROJECT_EMPLOYEES (employee_id, phone_number, first_name, last_name, email, job_name, hire_date, salary) VALUES (76583, '+40746467367', 'Nan-Jho', 'Kim','rwqenan@hotmail.com','Chef',TO_DATE('12-12-2012','DD-MM-RRRR'),89000);


INSERT INTO PROJECT_CHEFS (chef_id, chef_speciality, employee_id) VALUES (1345, 'Chefs special Temaki rolls',76652);
INSERT INTO PROJECT_CHEFS (chef_id, chef_speciality, employee_id) VALUES (4351, 'Chef Jemima special vegan plateau',54365);
INSERT INTO PROJECT_CHEFS (chef_id, chef_speciality, employee_id) VALUES (2345, 'Ramen Surprise',76583);
INSERT INTO PROJECT_CHEFS (chef_id, chef_speciality, employee_id) VALUES (4461, '-',32145);

INSERT INTO PROJECT_WAITERS (waiter_id, employee_id) VALUES (24516, 78439);
INSERT INTO PROJECT_WAITERS (waiter_id, employee_id) VALUES (54651, 75437);
INSERT INTO PROJECT_WAITERS (waiter_id, employee_id) VALUES (86347, 24653);
INSERT INTO PROJECT_WAITERS (waiter_id, employee_id) VALUES (13461, 86542);

INSERT INTO PROJECT_TABLES (table_no, capacity, location) VALUES (1, 2, 'Next to the entrance');
INSERT INTO PROJECT_TABLES (table_no, capacity, location) VALUES (2, 2, 'On the terrace');
INSERT INTO PROJECT_TABLES (table_no, capacity, location) VALUES (3, 4, 'Next to the entrance');
INSERT INTO PROJECT_TABLES (table_no, capacity, location) VALUES (4, 4, 'On the terrace');
INSERT INTO PROJECT_TABLES (table_no, capacity, location) VALUES (5, 6, 'Next to the drinks bar');
INSERT INTO PROJECT_TABLES (table_no, capacity, location) VALUES (6, 6, 'In the centre');
INSERT INTO PROJECT_TABLES (table_no, capacity, location) VALUES (7, 4, 'Next to the dessert bar');

INSERT INTO PROJECT_CUSTOMERS (customer_id, customer_name, customer_phone, reservation_date) VALUES (70999, 'Smith', '+40782914211',TO_DATE('11-03-2024','DD-MM-RRRR'));
INSERT INTO PROJECT_CUSTOMERS (customer_id, customer_name, customer_phone, reservation_date) VALUES (70009, 'Ashiya', '+4074156714',TO_DATE('24-01-2024','DD-MM-RRRR'));
INSERT INTO PROJECT_CUSTOMERS (customer_id, customer_name, customer_phone, reservation_date) VALUES (71346, 'Ionescu', '+40723145153',TO_DATE('28-02-2024','DD-MM-RRRR'));
INSERT INTO PROJECT_CUSTOMERS (customer_id, customer_name, customer_phone, reservation_date) VALUES (75671, 'Zalan', '+40776783234',TO_DATE('05-12-2026','DD-MM-RRRR'));
INSERT INTO PROJECT_CUSTOMERS (customer_id, customer_name, customer_phone, reservation_date) VALUES (73214, 'Gonjur', '+40789178456',TO_DATE('31-12-2023','DD-MM-RRRR'));
INSERT INTO PROJECT_CUSTOMERS (customer_id, customer_name, customer_phone, reservation_date) VALUES (77623, 'Shieda', '+40765879824',TO_DATE('31-12-2023','DD-MM-RRRR'));
INSERT INTO PROJECT_CUSTOMERS (customer_id, customer_name, customer_phone, reservation_date) VALUES (79814, 'Fennel', '+40745346751',TO_DATE('25-01-2024','DD-MM-RRRR'));

INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (1, 'MANGO ROLL / 8 BUC', 'SUSHI ROLLS', 'Dairy', 59.00, 1345);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (2, 'GOLDEN ROLL / 8 BUC', 'SUSHI ROLLS', 'Dairy', 69.00, 4461);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (3, 'PHILADEPHIA DE LUX', 'SUSHI ROLLS', 'Dairy', 108.00, 4461);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (4, 'OKINAWA SOMON', 'SUSHI ROLLS', 'Dairy', 79.00, 1345);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (5, 'BANZAI CLASSIC', 'TEMPURA / HOT ROLLS', 'Dairy', 59.00, 4461);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (6, 'CRUNCH UNAGHI', 'MAKI', 'Eggs', 79.00, 1345);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (7, 'SOMON MAKI', 'MAKI', 'Fish', 29.00, 4461);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (8, 'KAPA MAKI', 'MAKI', '-', 15.00, 1345);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (9, 'AVOCADO MAKI', 'MAKI', '-', 19.00, 4461);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (10, 'VEGETARIAN MAKI', 'MAKI', '-', 25.00, 1345);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (11, 'SAKE SPICY MAKI', 'MAKI', 'Fish', 30.00, 4351);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (12, 'NIGIRI SOMON', 'NIGIRI', 'Fish', 25.00, 4461);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (13, 'NIGIRI CREVEȚI', 'NIGITI', 'Shellfish', 20.00, 4351);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (14, 'NIGIRI TON', 'NIGIRI', 'Fish', 28.00, 4351);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (15, 'NOODLES DIN HRIȘCĂ CU LEGUME', 'NOODLES', '-', 38.00, 1345);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (16, 'NOODLES DIN OREZ CU CARNE DE PUI', 'NOODLES', '-', 38.00, 4461);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (17, 'NOODLES DIN HRIȘCĂ CU FRUCTE DE MARE', 'NOODLES', 'Shellfish', 60.00, 4351);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (18, 'NOODLES DIN HRIȘCĂ CU MUȘCHIULEȚ VITĂ', 'NOODLES', '-', 70.00, 1345);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (19, 'OREZ SIMPLU', 'RICE', '-', 11.00, 4461);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (20, 'OREZ CU LEGUME', 'RICE', '-', 32.00, 4461);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (21, 'OREZ CU FRUCTE DE MARE', 'RICE', 'Shellfish', 56.00, 4461);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (22, 'OREZ CU CARNE DE PUI', 'RICE', '-', 28.00, 4461);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (23, 'CREVEȚI TEMPURA', 'ZENSAI', 'Shellfish', 56.00, 4461);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (24, 'LEGUME TEMPURA', 'ZENSAI', '-', 29.00, 4461);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (25, 'GYOZA CU CARNE', 'ZENSAI', '-', 40.00, 1345);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (26, 'GROZA CU LEGUME', 'ZENSAI', '-', 35.00, 4351);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (27, 'MOCHI', 'DESSERT', 'Dairy', 40.00, 1345);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (28, 'EXOTIC ROLL', 'DESSERT', 'Dairy', 33.00, 4461);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (29, 'BANANE PRAJITE', 'DESSERT', '-', 23.00, 4461);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (30, 'SOS SOYA', 'EXTRA', 'Soy', 5.00, 2345);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (31, 'WASABI', 'EXTRA', '-', 5.00, 2345);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (32, 'GHIMBIR MARINAT', 'EXTRA', '-', 5.00, 2345);
INSERT INTO PROJECT_MENU_ITEMS (item_id, item_name, item_type, item_allergens, item_price, chef_id) VALUES (33, 'SOS TERIYAKI', 'EXTRA', 'Sesame', 5.00, 2345);

INSERT INTO PROJECT_INGREDIENTS (ingredient_id, ingredient_name, expiration_date, measurement_type, ingredient_price_per_measurment) VALUES (40, 'Sushi Rice', TO_DATE('25-01-2024','DD-MM-RRRR'),'kg','10.00');
INSERT INTO PROJECT_INGREDIENTS (ingredient_id, ingredient_name, expiration_date, measurement_type, ingredient_price_per_measurment) VALUES (41, 'Tuna', TO_DATE('27-02-2024','DD-MM-RRRR'),'kg','120.00');
INSERT INTO PROJECT_INGREDIENTS (ingredient_id, ingredient_name, expiration_date, measurement_type, ingredient_price_per_measurment) VALUES (42, 'Somon', TO_DATE('25-12-2023','DD-MM-RRRR'),'kg','155.00');
INSERT INTO PROJECT_INGREDIENTS (ingredient_id, ingredient_name, expiration_date, measurement_type, ingredient_price_per_measurment) VALUES (43, 'Flour', TO_DATE('31-12-2023','DD-MM-RRRR'),'kg','10.00');
INSERT INTO PROJECT_INGREDIENTS (ingredient_id, ingredient_name, expiration_date, measurement_type, ingredient_price_per_measurment) VALUES (44, 'Cream cheese', TO_DATE('12-11-2023','DD-MM-RRRR'),'kg','60.00');
INSERT INTO PROJECT_INGREDIENTS (ingredient_id, ingredient_name, expiration_date, measurement_type, ingredient_price_per_measurment) VALUES (45, 'Soy Sauce', TO_DATE('01-02-2025','DD-MM-RRRR'),'liter','100.00');
INSERT INTO PROJECT_INGREDIENTS (ingredient_id, ingredient_name, expiration_date, measurement_type, ingredient_price_per_measurment) VALUES (46, 'Simple Rice', TO_DATE('11-01-2026','DD-MM-RRRR'),'kg','12.00');
INSERT INTO PROJECT_INGREDIENTS (ingredient_id, ingredient_name, expiration_date, measurement_type, ingredient_price_per_measurment) VALUES (47, 'Noodles', TO_DATE('25-01-2025','DD-MM-RRRR'),'kg','40.00');
INSERT INTO PROJECT_INGREDIENTS (ingredient_id, ingredient_name, expiration_date, measurement_type, ingredient_price_per_measurment) VALUES (48, 'Teriaky Sauce', TO_DATE('24-01-2024','DD-MM-RRRR'),'liter','39.00');
INSERT INTO PROJECT_INGREDIENTS (ingredient_id, ingredient_name, expiration_date, measurement_type, ingredient_price_per_measurment) VALUES (49, 'Seaweed', TO_DATE('26-05-2024','DD-MM-RRRR'),'kg','600.00');
INSERT INTO PROJECT_INGREDIENTS (ingredient_id, ingredient_name, expiration_date, measurement_type, ingredient_price_per_measurment) VALUES (50, 'Oil', TO_DATE('22-09-2024','DD-MM-RRRR'),'liter','10.00');
INSERT INTO PROJECT_INGREDIENTS (ingredient_id, ingredient_name, expiration_date, measurement_type, ingredient_price_per_measurment) VALUES (51, 'Shrimp', TO_DATE('25-12-2023','DD-MM-RRRR'),'kg','45.00');
INSERT INTO PROJECT_INGREDIENTS (ingredient_id, ingredient_name, expiration_date, measurement_type, ingredient_price_per_measurment) VALUES (52, 'Avocado', TO_DATE('31-12-2023','DD-MM-RRRR'),'kg','30.00');
INSERT INTO PROJECT_INGREDIENTS (ingredient_id, ingredient_name, expiration_date, measurement_type, ingredient_price_per_measurment) VALUES (53, 'Cucumber', TO_DATE('04-01-2024','DD-MM-RRRR'),'kg','7.00');
INSERT INTO PROJECT_INGREDIENTS (ingredient_id, ingredient_name, expiration_date, measurement_type, ingredient_price_per_measurment) VALUES (54, 'Squid', TO_DATE('25-12-2023','DD-MM-RRRR'),'unit','41.00');
INSERT INTO PROJECT_INGREDIENTS (ingredient_id, ingredient_name, expiration_date, measurement_type, ingredient_price_per_measurment) VALUES (55, 'Mango', TO_DATE('22-12-2023','DD-MM-RRRR'),'kg','66.00');

INSERT INTO PROJECT_INGREDIENT_LISTS (list_id, quantity, item_id, ingredient_id) VALUES (101, 2, 2, 44);
INSERT INTO PROJECT_INGREDIENT_LISTS (list_id, quantity, item_id, ingredient_id) VALUES (102, 22, 1, 41);
INSERT INTO PROJECT_INGREDIENT_LISTS (list_id, quantity, item_id, ingredient_id) VALUES (103, 27, 4, 53);
INSERT INTO PROJECT_INGREDIENT_LISTS (list_id, quantity, item_id, ingredient_id) VALUES (104, 19, 1, 45);
INSERT INTO PROJECT_INGREDIENT_LISTS (list_id, quantity, item_id, ingredient_id) VALUES (105, 1, 1, 55);
INSERT INTO PROJECT_INGREDIENT_LISTS (list_id, quantity, item_id, ingredient_id) VALUES (106, 32, 5, 55);
INSERT INTO PROJECT_INGREDIENT_LISTS (list_id, quantity, item_id, ingredient_id) VALUES (107, 6, 7, 43);
INSERT INTO PROJECT_INGREDIENT_LISTS (list_id, quantity, item_id, ingredient_id) VALUES (108, 17, 8, 47);
INSERT INTO PROJECT_INGREDIENT_LISTS (list_id, quantity, item_id, ingredient_id) VALUES (109, 29, 2, 53);
INSERT INTO PROJECT_INGREDIENT_LISTS (list_id, quantity, item_id, ingredient_id) VALUES (110, 3, 2, 55);
INSERT INTO PROJECT_INGREDIENT_LISTS (list_id, quantity, item_id, ingredient_id) VALUES (111, 27, 6, 55);

INSERT INTO PROJECT_ORDERS (order_id, tips, waiter_id, customer_id, table_no, item_id, item_quantity) VALUES (200, 20, 54651, 75671, 1, 33, 1); 
INSERT INTO PROJECT_ORDERS (order_id, tips, waiter_id, customer_id, table_no, item_id, item_quantity) VALUES (201, 15, 24516, 75671, 1, 2, 6); 
INSERT INTO PROJECT_ORDERS (order_id, tips, waiter_id, customer_id, table_no, item_id, item_quantity) VALUES (202, 20, 54651, 73214, 4, 26, 1); 
INSERT INTO PROJECT_ORDERS (order_id, tips, waiter_id, customer_id, table_no, item_id, item_quantity) VALUES (203, 10, 13461, 79814, 4, 18, 6); 
INSERT INTO PROJECT_ORDERS (order_id, tips, waiter_id, customer_id, table_no, item_id, item_quantity) VALUES (204, 25, 54651, 70999, 2, 22, 3); 
INSERT INTO PROJECT_ORDERS (order_id, tips, waiter_id, customer_id, table_no, item_id, item_quantity) VALUES (205, 20, 24516, 70009, 6, 16, 6); 
INSERT INTO PROJECT_ORDERS (order_id, tips, waiter_id, customer_id, table_no, item_id, item_quantity) VALUES (206, 10, 86347, 70009, 7, 19, 8); 
INSERT INTO PROJECT_ORDERS (order_id, tips, waiter_id, customer_id, table_no, item_id, item_quantity) VALUES (207, 15, 13461, 70009, 5, 28, 2); 

UPDATE PROJECT_INGREDIENTS
SET ingredient_price_per_measurment=ingredient_price_per_measurment-ingredient_price_per_measurment*10/100
WHERE ingredient_name = 'Mango';
SELECT* FROM PROJECT_INGREDIENTS;

DELETE FROM PROJECT_EMPLOYEES
WHERE last_name='Emily';
SELECT* FROM PROJECT_EMPLOYEES;

-- Display all the employees that have worked in the restaurant for less or equal to 4 years

SELECT EMPLOYEE_ID, LAST_NAME, FIRST_NAME, HIRE_DATE
FROM PROJECT_EMPLOYEES
WHERE EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE) <= 4
ORDER BY HIRE_DATE;

-- Create a column in the table ORDERS for the price for the item

ALTER TABLE PROJECT_ORDERS ADD(TOTAL_PRICE_ITEM NUMBER(7,2)) 
GENERATED ALWAYS AS (item_quantity * (SELECT item_price
                                      FROM PROJECT_MENU_ITEMS));
-- Create a table named BILLS where we have the total price of the ordered items of each customer 

CREATE TABLE PROJECT_BILLS AS SELECT CUSTOMER_ID FROM PROJECT_CUSTOMERS;
ALTER TABLE PROJECT_BILLS ADD (TOTAL NUMBER(6,2));
UPDATE PROJECT_BILLS 
SET TOTAL = (SELECT SUM(mi.ITEM_PRICE*o.item_quantity)
            FROM PROJECT_MENU_ITEMS mi, PROJECT_ORDERS o
            WHERE mi.item_id = o.item_id
            AND o.CUSTOMER_ID = 70009)
WHERE CUSTOMER_ID = 70009;

UPDATE PROJECT_BILLS 
SET TOTAL = (SELECT SUM(mi.ITEM_PRICE*o.item_quantity)
            FROM PROJECT_MENU_ITEMS mi, PROJECT_ORDERS o
            WHERE mi.item_id = o.item_id
            AND o.CUSTOMER_ID = 70999)
WHERE CUSTOMER_ID = 70999;

UPDATE PROJECT_BILLS 
SET TOTAL = (SELECT SUM(mi.ITEM_PRICE*o.item_quantity)
            FROM PROJECT_MENU_ITEMS mi, PROJECT_ORDERS o
            WHERE mi.item_id = o.item_id
            AND o.CUSTOMER_ID = 71346)
WHERE CUSTOMER_ID = 71346;

UPDATE PROJECT_BILLS 
SET TOTAL = (SELECT SUM(mi.ITEM_PRICE*o.item_quantity)
            FROM PROJECT_MENU_ITEMS mi, PROJECT_ORDERS o
            WHERE mi.item_id = o.item_id
            AND o.CUSTOMER_ID = 73214)
WHERE CUSTOMER_ID = 73214;

UPDATE PROJECT_BILLS 
SET TOTAL = (SELECT SUM(mi.ITEM_PRICE*o.item_quantity)
            FROM PROJECT_MENU_ITEMS mi, PROJECT_ORDERS o
            WHERE mi.item_id = o.item_id
            AND o.CUSTOMER_ID = 75671)
WHERE CUSTOMER_ID = 75671;

UPDATE PROJECT_BILLS 
SET TOTAL = (SELECT SUM(mi.ITEM_PRICE*o.item_quantity)
            FROM PROJECT_MENU_ITEMS mi, PROJECT_ORDERS o
            WHERE mi.item_id = o.item_id
            AND o.CUSTOMER_ID = 77623)
WHERE CUSTOMER_ID = 77623;

UPDATE PROJECT_BILLS 
SET TOTAL = (SELECT SUM(mi.ITEM_PRICE*o.item_quantity)
            FROM PROJECT_MENU_ITEMS mi, PROJECT_ORDERS o
            WHERE mi.item_id = o.item_id
            AND o.CUSTOMER_ID = 79814)
WHERE CUSTOMER_ID = 79814;

-- Display the name of the employees that work as a chef that have a smaller salary than ALL Hosts

SELECT LAST_NAME, FIRST_NAME, JOB_NAME, SALARY
FROM PROJECT_EMPLOYEES 
WHERE SALARY < ALL(SELECT SALARY FROM PROJECT_EMPLOYEES WHERE JOB_NAME = 'Host')
AND JOB_NAME = 'Chef';

-- Display the name and the salary of the employees who's name start with J

SELECT FIRST_NAME, SALARY
FROM PROJECT_EMPLOYEES
WHERE SUBSTR(FIRST_NAME, 1, 1) = 'J';

-- Display the total amount of tips recieved by the waiter with the id = 54651

SELECT sum(o.TIPS/100*b.TOTAL) AS TOTAL_TIPS
FROM PROJECT_ORDERS o, PROJECT_BILLS b
WHERE o.waiter_id=54651 
AND o.customer_id=b.customer_id;

-- Display the customers that dined between 1st of January 2024 and 1st of March 2024

SELECT customer_name, reservation_date
FROM project_customers
WHERE reservation_date BETWEEN TO_DATE('01-01-2024','DD-MM-RRRR') AND TO_DATE('01-03-2024','DD-MM-RRRR');

-- Display the customer id and the total price of their bill. If they don't have a total yet, return the message "No order placed yet"

SELECT Customer_id, NVL(TO_CHAR(TOTAL), 'No order placed yet') AS TOTAL
FROM PROJECT_BILLS;

-- The restaurant reached its peak popularity, as a prize, the salaries will rise as following:
-- Chef's will have their salary increased by 10%, the hosts as 7%, the waiters as 5% and the rest by 3%.

SELECT first_name, last_name, job_name, 
(CASE UPPER(job_name)
when 'CHEF' then 0.1
when 'HOST' then 0.07
when 'WAITER' then 0.05
else 0.03
END) * SALARY + SALARY
FROM PROJECT_EMPLOYEES;

-- Display all the free tables

SELECT ta.TABLE_NO, ta.capacity
FROM PROJECT_ORDERS ord, PROJECT_TABLES ta
WHERE ta.table_no = ord.table_no(+)
MINUS
SELECT ta.TABLE_NO, ta.capacity
FROM  PROJECT_ORDERS ord, PROJECT_TABLES ta
WHERE ta.table_no = ord.table_no;

-- Display the items that have dairy as an allergen and are cheaper than 100 lei

SELECT mi.chef_id, item_name, item_allergens, item_price
FROM PROJECT_MENU_ITEMS mi, PROJECT_CHEFS ch 
WHERE mi.chef_id=ch.chef_id AND item_allergens = 'Dairy'
INTERSECT
SELECT mi.chef_id, item_name, item_allergens, item_price
FROM  PROJECT_MENU_ITEMS mi, PROJECT_CHEFS ch
WHERE mi.chef_id=ch.chef_id AND item_price < 100;

-- Display the categorization of every table

SELECT table_no,location,
DECODE(CAPACITY,
    2, 'Small party',
    4, 'Medium party',
    6, 'Big party',
    'Uncategorized') AS party_size
FROM project_tables;

-- Create a view for the ingredients that will expire by 1st of February 2024.

CREATE VIEW Expired_Prod_Feb
AS
SELECT ingredient_name, expiration_date
FROM project_ingredients
WHERE expiration_date <= TO_DATE('01-02-2024', 'DD-MM-RRRR');

DROP VIEW Expired_Prod_Feb;

-- Display the number of menu items from each category

SELECT ITEM_TYPE, count(item_type) AS NO_ITEMS
FROM PROJECT_MENU_ITEMS
group by ITEM_TYPE;

-- Create a synonym for the table PROJECT_CUSTOMERS

CREATE SYNONYM Reservations for project_customers;
select* from reservations;
drop synonym reservations;

--Display the name of the employees that have an @yahoo mail.

SELECT last_name, first_name, email
FROM PROJECT_EMPLOYEES
WHERE email LIKE('%@yahoo.com');

--Displaying the hierarchical structure of the table

Update PROJECT_EMPLOYEES
SET JOB_NAME = 'Manager'
WHERE EMPLOYEE_ID = 3212;

ALTER TABLE PROJECT_EMPLOYEES MODIFY (MANAGER_ID NUMBER(6));
UPDATE PROJECT_EMPLOYEES 
SET MANAGER_ID = EMPLOYEE_ID
WHERE JOB_NAME = 'Manager';

ALTER TABLE PROJECT_EMPLOYEES
ADD CONSTRAINT fk_manager foreign key (manager_id) 
references PROJECT_EMPLOYEES(employee_id);

select employee_id, first_name, last_name, salary,
level from PROJECT_employees
WHERE manager_id = 3212
connect by prior employee_id=manager_id
start with manager_id=3212;











