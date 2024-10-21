CREATE DATABASE IF NOT EXISTS jurisconnect;
USE jurisconnect;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    firstname VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

INSERT INTO users (email, firstname, lastname, username, password) VALUES ('sample@example.com', 'john', 'doe', 'johndoe', '$2b$10$Ses/fGaSSJC1i6WaJjwB4uEMU5KWAU0IeejScmXgrd2ujZC0nCXu2');
