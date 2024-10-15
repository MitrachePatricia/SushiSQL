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

--DML statements
--INSERTing data 

INSERT INTO PROJECT_EMPLOYEES (employee_id, phone_number, first_name, last_name, email, job_name, hire_date) VALUES (3212, '0720802619', 'Patricia-Andreea', 'Mitrache','patriciamitrache@gmail.com','Host','12-12-2020');
