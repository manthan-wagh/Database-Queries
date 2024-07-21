CREATE TABLE Teams (
	team_id INT IDENTITY(1,1) PRIMARY KEY, 
	team_name VARCHAR(100) NOT NULL, 
	owner_name VARCHAR(100) NOT NULL, 
	creation_date DATE NOT NULL
);

CREATE TABLE Players (
    player_id INT IDENTITY(1,1) PRIMARY KEY,
    player_name VARCHAR(100) NOT NULL,
    position VARCHAR(50) NOT NULL,
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE Matches (
    match_id INT IDENTITY(1,1) PRIMARY KEY,
    team1_id INT,
    team2_id INT,
    match_date DATE NOT NULL
);

CREATE TABLE Scores (
    score_id INT IDENTITY(1,1) PRIMARY KEY,
    match_id INT,
    player_id INT,
    points_scored INT NOT NULL,
    FOREIGN KEY (match_id) REFERENCES Matches(match_id),
    FOREIGN KEY (player_id) REFERENCES Players(player_id)
);

CREATE TABLE League (
    league_id INT IDENTITY(1,1) PRIMARY KEY,
    league_name VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE Team_League (
    team_league_id INT IDENTITY(1,1) PRIMARY KEY,
    team_id INT,
    league_id INT,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (league_id) REFERENCES League(league_id)
);





--Data Insertion
INSERT INTO Teams (team_name, owner_name, creation_date) VALUES ('The Avengers', 'Nick Fury', '2023-07-01');
INSERT INTO Teams (team_name, owner_name, creation_date) VALUES ('The Defenders', 'Jessica Jones', '2023-07-02');

-- Inserting into Players
INSERT INTO Players (player_name, position, team_id) VALUES ('Tony Stark', 'Forward', 1);
INSERT INTO Players (player_name, position, team_id) VALUES ('Bruce Banner', 'Midfielder', 1);
INSERT INTO Players (player_name, position, team_id) VALUES ('Luke Cage', 'Defender', 2);
INSERT INTO Players (player_name, position, team_id) VALUES ('Danny Rand', 'Forward', 2);

-- Inserting into Matches
INSERT INTO Matches (team1_id, team2_id, match_date) VALUES (1, 2, '2023-07-15');

-- Inserting into Scores
INSERT INTO Scores (match_id, player_id, points_scored) VALUES (1, 1, 15);
INSERT INTO Scores (match_id, player_id, points_scored) VALUES (1, 2, 20);
INSERT INTO Scores (match_id, player_id, points_scored) VALUES (1, 3, 10);
INSERT INTO Scores (match_id, player_id, points_scored) VALUES (1, 4, 5);

-- Inserting into League
INSERT INTO League (league_name, season, start_date, end_date) VALUES ('Premier League', '2023', '2023-07-01', '2023-12-31');

-- Inserting into Team_League
INSERT INTO Team_League (team_id, league_id) VALUES (1, 1);
INSERT INTO Team_League (team_id, league_id) VALUES (2, 1);