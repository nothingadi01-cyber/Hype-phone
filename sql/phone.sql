CREATE TABLE IF NOT EXISTS phone_users (
    identifier VARCHAR(60) PRIMARY KEY,
    phone_number VARCHAR(20) UNIQUE
);

CREATE TABLE IF NOT EXISTS phone_contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    owner VARCHAR(60),
    name VARCHAR(50),
    number VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS phone_messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sender VARCHAR(20),
    receiver VARCHAR(20),
    message TEXT,
    time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
