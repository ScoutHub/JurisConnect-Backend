CREATE DATABASE IF NOT EXISTS jurisconnect;
USE jurisconnect;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL
);

INSERT INTO users (email) VALUES ('sample@example.com');
