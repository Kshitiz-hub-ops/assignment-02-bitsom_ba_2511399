-- =========================
-- DIMENSION TABLES
-- =========================

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day INT,
    month INT,
    year INT
);

CREATE TABLE dim_store (
    store_id VARCHAR(10) PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE dim_product (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- =========================
-- FACT TABLE
-- =========================

CREATE TABLE fact_sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    date_id INT,
    store_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- =========================
-- INSERT CLEANED DATA
-- =========================

-- DIM_DATE (cleaned consistent format)
INSERT INTO dim_date VALUES
(1,'2024-01-01',1,1,2024),
(2,'2024-01-02',2,1,2024),
(3,'2024-01-03',3,1,2024),
(4,'2024-01-04',4,1,2024),
(5,'2024-01-05',5,1,2024);

-- DIM_STORE
INSERT INTO dim_store VALUES
('S001','Store A','Mumbai'),
('S002','Store B','Delhi'),
('S003','Store C','Bangalore');

-- DIM_PRODUCT (category standardized)
INSERT INTO dim_product VALUES
('P001','Laptop','Electronics'),
('P002','Shirt','Clothing'),
('P003','Milk','Groceries'),
('P004','Headphones','Electronics'),
('P005','Rice','Groceries');

-- FACT_SALES (10 rows, cleaned values)
INSERT INTO fact_sales (date_id, store_id, product_id, quantity, total_amount) VALUES
(1,'S001','P001',1,55000.00),
(1,'S001','P002',2,2400.00),
(2,'S002','P003',5,300.00),
(2,'S003','P004',1,3200.00),
(3,'S001','P005',3,1500.00),
(3,'S002','P001',1,55000.00),
(4,'S003','P002',4,4800.00),
(4,'S001','P003',6,360.00),
(5,'S002','P004',2,6400.00),
(5,'S003','P005',5,2500.00);
