-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS cryptomessage;

USE cryptomessage;

-- Crear la tabla de usuarios
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    public_key TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear la tabla de contactos
CREATE TABLE IF NOT EXISTS contacts (
    user_id INT,
    contact_id INT,
    PRIMARY KEY (user_id, contact_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (contact_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Crear la tabla de conversaciones
CREATE TABLE IF NOT EXISTS chats (
    chat_id INT AUTO_INCREMENT PRIMARY KEY,
    user1_id INT NOT NULL,
    user2_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user1_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (user2_id) REFERENCES users(user_id) ON DELETE CASCADE,
    UNIQUE KEY unique_chat (user1_id, user2_id)
);

-- Crear la tabla de mensajes
CREATE TABLE IF NOT EXISTS messages (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    chat_id INT NOT NULL,
    sender_id INT NOT NULL,
    content TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (chat_id) REFERENCES chats(chat_id) ON DELETE CASCADE,
    FOREIGN KEY (sender_id) REFERENCES users(user_id) ON DELETE CASCADE
);

/*
-- Insertar algunos datos de prueba
INSERT INTO users (username, password_hash, public_key) VALUES
('user1', 'hashed_password_1', 'public_key_1'),
('user2', 'hashed_password_2', 'public_key_2');

INSERT INTO contacts (user_id, contact_id) VALUES
(1, 2),
(2, 1);

INSERT INTO conversations (user1_id, user2_id) VALUES
(1, 2);

INSERT INTO messages (conversation_id, sender_id, content) VALUES
(1, 1, 'Hello! This is a test message.');
*/
