CREATE TABLE Users (
    user1_id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    created_at TIMESTAMP
);

CREATE TABLE Songs (
    song_id INT IDENTITY(1,1) PRIMARY KEY,
    song_name VARCHAR(100) NOT NULL,
    artist VARCHAR(100) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    release_date DATE NOT NULL
);

CREATE TABLE User_Song_History (
    history_id INT IDENTITY(1,1) PRIMARY KEY,
    user1_id INT,
    song_id INT,
    listen_count INT DEFAULT 0,
    last_listened DATE NOT NULL,
    FOREIGN KEY (user1_id) REFERENCES Users(user1_id),
    FOREIGN KEY (song_id) REFERENCES Songs(song_id)
);

CREATE TABLE User_Preferences (
    preference_id INT IDENTITY(1,1) PRIMARY KEY,
    user1_id INT,
    genre VARCHAR(50),
    preference_score INT DEFAULT 0,
    FOREIGN KEY (user1_id) REFERENCES Users(user1_id)
);

--Data Insertion

-- Inserting into Users
INSERT INTO Users (username, email) VALUES ('alice', 'alice@example.com');
INSERT INTO Users (username, email) VALUES ('bob', 'bob@example.com');

-- Inserting into Songs
INSERT INTO Songs (song_name, artist, genre, release_date) VALUES ('Song A', 'Artist 1', 'Pop', '2023-01-01');
INSERT INTO Songs (song_name, artist, genre, release_date) VALUES ('Song B', 'Artist 2', 'Rock', '2023-02-01');
INSERT INTO Songs (song_name, artist, genre, release_date) VALUES ('Song C', 'Artist 3', 'Jazz', '2023-03-01');
INSERT INTO Songs (song_name, artist, genre, release_date) VALUES ('Song D', 'Artist 4', 'Pop', '2023-04-01');

-- Inserting into User_Song_History
INSERT INTO User_Song_History (user1_id, song_id, listen_count, last_listened) VALUES (1, 1, 10, '2023-07-01');
INSERT INTO User_Song_History (user1_id, song_id, listen_count, last_listened) VALUES (1, 2, 5, '2023-07-02');
INSERT INTO User_Song_History (user1_id, song_id, listen_count, last_listened) VALUES (2, 3, 8, '2023-07-03');
INSERT INTO User_Song_History (user1_id, song_id, listen_count, last_listened) VALUES (2, 4, 15, '2023-07-04');

-- Inserting into User_Preferences
INSERT INTO User_Preferences (user1_id, genre, preference_score) VALUES (1, 'Pop', 10);
INSERT INTO User_Preferences (user1_id, genre, preference_score) VALUES (1, 'Rock', 5);
INSERT INTO User_Preferences (user1_id, genre, preference_score) VALUES (2, 'Jazz', 8);
INSERT INTO User_Preferences (user1_id, genre, preference_score) VALUES (2, 'Pop', 15);