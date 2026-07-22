-- ============================================
-- Project: Enterprise Data Reconciliation & Quality Analytics
-- Database: enterprise_data_reconciliation
-- Author: Kajal Sharma
-- Description:
-- This database simulates an e-commerce system used for
-- data reconciliation and quality analysis.
-- ============================================

CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    city VARCHAR(100),
    signup_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE products(
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(100) NOT NULL,
    unit_price NUMERIC(8,2) NOT NULL CHECK(unit_price > 0)
);

CREATE TABLE orders(
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customers(customer_id),
    product_id INT NOT NULL REFERENCES products(product_id),
    order_date DATE DEFAULT CURRENT_DATE,
    quantity INT NOT NULL CHECK(quantity > 0),
    unit_price NUMERIC(8,2) NOT NULL CHECK(unit_price >0)
);

CREATE TABLE payments(
    payment_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES orders(order_id),
    pay_amount NUMERIC(8,2) NOT NULL CHECK(pay_amount >0),
    payment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    payment_status VARCHAR(20) CHECK (payment_status IN ('Pending','Completed','Failed')) NOT NULL 
);