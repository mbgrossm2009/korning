DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS invoice;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS product;


CREATE TABLE employee (
  id SERIAL PRIMARY KEY,
  name varchar(100),
  email varchar (100)
);

CREATE TABLE customer (
  id SERIAL PRIMARY KEY,
  name varchar(100),
  acct_num varchar(100)
);

CREATE TABLE product (
  id SERIAL PRIMARY KEY,
  name varchar(100)
);

CREATE TABLE invoice (
  id SERIAL PRIMARY KEY,
  sale_date varchar(50),
  sale_amount varchar(50),
  units_sold varchar(50),
  invoice_no varchar(50),
  invoice_frequency varchar(50),
  employee_id integer REFERENCES employee(id),
  customer_id integer REFERENCES customer(id),
  product_id integer REFERENCES product(id)
);
