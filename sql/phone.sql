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
CREATE TABLE IF NOT EXISTS phone_bank_accounts (
    identifier VARCHAR(60) PRIMARY KEY,
    phone_number VARCHAR(20) UNIQUE,
    pin VARCHAR(10) DEFAULT '1234'
);

CREATE TABLE IF NOT EXISTS phone_bank_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sender VARCHAR(20),
    receiver VARCHAR(20),
    amount INT,
    time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS phone_photos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    owner VARCHAR(60),
    image VARCHAR(255),
    time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS phone_calls (
    id INT AUTO_INCREMENT PRIMARY KEY,
    caller VARCHAR(20),
    receiver VARCHAR(20),
    status VARCHAR(20),
    time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS phone_crypto_wallets (
    identifier VARCHAR(60) PRIMARY KEY,
    balance INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS phone_dark_messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sender VARCHAR(60),
    receiver VARCHAR(60),
    message TEXT,
    time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS phone_dark_orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    buyer VARCHAR(60),
    item VARCHAR(50),
    price INT,
    status VARCHAR(20),
    time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS phone_apps (
    identifier VARCHAR(60),
    app VARCHAR(50),
    installed TINYINT DEFAULT 1,
    PRIMARY KEY (identifier, app)
);

CREATE TABLE IF NOT EXISTS phone_settings (
    identifier VARCHAR(60) PRIMARY KEY,
    theme VARCHAR(20) DEFAULT 'dark',
    wallpaper VARCHAR(100) DEFAULT 'default.jpg',
    ringtone VARCHAR(50) DEFAULT 'ringtone',
    volume FLOAT DEFAULT 0.5
);
CREATE TABLE IF NOT EXISTS phone_social_posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    author VARCHAR(60),
    message TEXT,
    image VARCHAR(255),
    likes INT DEFAULT 0,
    time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS phone_voice_notes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sender VARCHAR(60),
    receiver VARCHAR(60),
    group_id INT NULL,
    audio VARCHAR(255),
    duration FLOAT,
    time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS phone_groups (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    owner VARCHAR(60)
);

CREATE TABLE IF NOT EXISTS phone_group_members (
    group_id INT,
    member VARCHAR(60),
    role VARCHAR(20) DEFAULT 'member',
    muted TINYINT DEFAULT 0,
    PRIMARY KEY (group_id, member)
);
CREATE TABLE IF NOT EXISTS phone_vehicle_keys (
    plate VARCHAR(12),
    owner VARCHAR(60),
    PRIMARY KEY (plate, owner)
);
