CREATE DATABASE IF NOT EXISTS jurisconnect;
USE jurisconnect;

CREATE TABLE IF NOT EXISTS users (
    id VARCHAR(20) PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);
