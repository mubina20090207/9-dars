
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category_id INT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

INSERT INTO categories (category_name) VALUES
('Electronics'),
('Clothing'),
('Books'),
('Furniture'),
('Toys');

INSERT INTO products (product_name, category_id) VALUES
('Smartphone', 1),
('Laptop', 1),
('Headphones', 1),
('T-Shirt', 2),
('Jeans', 2),
('Jacket', 2),
('Novel', 3),
('Textbook', 3),
('Table', 4),
('Chair', 4),
('Default Item 1 1', NULL),
('Default Item 1 2', NULL),
('Default Item 1 3', NULL),
('Default Item 1 4', NULL),
('Default Item 1 5', NULL);

SELECT c.category_name, p.product_name
FROM categories c
JOIN products p ON c.category_id = p.category_id;

SELECT c.category_name, p.product_name
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id;

SELECT p.product_name, c.category_name
FROM products p
LEFT JOIN categories c ON p.category_id = c.category_id;

SELECT product_name
FROM products
WHERE category_id IS NULL;

SELECT category_name
FROM categories
WHERE category_id NOT IN (SELECT DISTINCT category_id FROM products WHERE category_id IS NOT NULL);

SELECT * FROM categories;
SELECT * FROM products;

SELECT category_name
FROM categories
WHERE category_id NOT IN (SELECT DISTINCT category_id FROM products WHERE category_id IS NOT NULL);

SELECT product_name
FROM products
WHERE category_id IS NULL;

SELECT c.category_name, p.product_name
FROM categories c
CROSS JOIN products p;

SELECT *
FROM categories
NATURAL JOIN products;

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(255),
    manager_id INT NULL
);

INSERT INTO employees (employee_name, manager_id) VALUES
('Alice', NULL),
('Bob', 1),
('Charlie', 1),
('David', 2),
('Eve', 2),
('Frank', 3);

SELECT e1.employee_name AS Employee, e2.employee_name AS Manager
FROM employees e1
LEFT JOIN employees e2 ON e1.manager_id = e2.employee_id;

CREATE TABLE movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_title VARCHAR(255) NOT NULL
);

CREATE TABLE actors (
    actor_id INT AUTO_INCREMENT PRIMARY KEY,
    actor_name VARCHAR(255) NOT NULL
);

CREATE TABLE movie_actors (
    movie_id INT,
    actor_id INT,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (actor_id) REFERENCES actors(actor_id)
);

INSERT INTO movies (movie_title) VALUES
('Inception'),
('The Dark Knight'),
('Interstellar');

-- Aktyorlar qo'shish
INSERT INTO actors (actor_name) VALUES
('Leonardo DiCaprio'),
('Christian Bale'),
('Anne Hathaway'),
('Michael Caine');

INSERT INTO movie_actors (movie_id, actor_id) VALUES
(1, 1), 
(1, 3),
(2, 2), 
(2, 4),  
(3, 3), 
(3, 4); 

SELECT m.movie_title, a.actor_name
FROM movies m
JOIN movie_actors ma ON m.movie_id = ma.movie_id
JOIN actors a ON ma.actor_id = a.actor_id;