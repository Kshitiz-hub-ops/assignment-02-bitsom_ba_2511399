CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE sales_reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address VARCHAR(200) NOT NULL
);

CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    sales_rep_id VARCHAR(10),
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    UNIQUE (order_id, product_id)
);


INSERT INTO customers VALUES
('C001','Rohan Mehta','rohan@gmail.com','Mumbai'),
('C002','Priya Sharma','priya@gmail.com','Delhi'),
('C003','Amit Verma','amit@gmail.com','Bangalore'),
('C004','Sneha Iyer','sneha@gmail.com','Chennai'),
('C005','Vikram Singh','vikram@gmail.com','Mumbai');

INSERT INTO products VALUES
('P001','Laptop','Electronics',55000.00),
('P002','Mouse','Electronics',800.00),
('P003','Desk Chair','Furniture',8500.00),
('P004','Notebook','Stationery',120.00),
('P005','Headphones','Electronics',3200.00);

INSERT INTO sales_reps VALUES
('SR01','Deepak Joshi','deepak@corp.com','Mumbai HQ'),
('SR02','Anita Desai','anita@corp.com','Delhi Office'),
('SR03','Ravi Kumar','ravi@corp.com','South Zone Bangalore'),
('SR04','Rahul Singh','rahul@corp.com','Hyderabad Office'),
('SR05','Kiran Patel','kiran@corp.com','Pune Office');

INSERT INTO orders VALUES
('O001','C001','SR01','2024-01-10'),
('O002','C002','SR02','2024-01-12'),
('O003','C003','SR03','2024-01-15'),
('O004','C004','SR04','2024-01-18'),
('O005','C005','SR05','2024-01-20');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
('O001','P001',1),
('O001','P002',2),
('O002','P003',1),
('O003','P004',5),
('O004','P005',2),
('O005','P002',3);
