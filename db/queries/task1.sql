CREATE DATABASE t20_world_cup;

USE t20_world_cup;

CREATE TABLE teams (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL UNIQUE,
    country varchar(255) NOT NULL,
    founded YEAR,
    PRIMARY KEY (id)
);

INSERT INTO teams VALUES(DEFAULT, "Aussies", "Austraia", 1996);

INSERT INTO teams VALUES
    (DEFAULT, "Eng", "England", 2004),
    (DEFAULT, "Ind", "India", 1999),
    (DEFAULT, "SAF", "South-Africa", 1998),
    (DEFAULT, "Pak", "Pakistan", 2011);

SELECT * FROM teams;

SELECT * FROM teams WHERE name = "Ind";

SELECT * FROM teams WHERE founded < 2000;

INSERT INTO teams VALUES(DEFAULT, "NZ", "New-Zealand", 2005);

UPDATE teams SET name = "SA" WHERE country = "South-Africa";

DELETE FROM teams where name = "NZ";

INSERT INTO teams (name, country, founded) VALUES
    ('Team A', 'USA', 1901),
    ('Team B', 'UK', 1902),
    ('Team C', 'Spain', 1920),
    ('Team D', 'Germany', 1903),
    ('Team E', 'Italy', 1905),
    ('Team F', 'France', 1908),
    ('Team G', 'Brazil', 1910),
    ('Team H', 'Argentina', 1913),
    ('Team I', 'Mexico', 1922),
    ('Team J', 'Netherlands', 1908);

INSERT INTO players (name, age, position, team_id) VALUES
    ('Player 1', 25, 'Forward', 1),
    ('Player 2', 30, 'Midfielder', 1),
    ('Player 3', 22, 'Defender', 2),
    ('Player 4', 27, 'Goalkeeper', 2),
    ('Player 5', 24, 'Forward', 3),
    ('Player 6', 29, 'Midfielder', 3),
    ('Player 7', 21, 'Defender', 4),
    ('Player 8', 26, 'Goalkeeper', 4),
    ('Player 9', 23, 'Forward', 5),
    ('Player 10', 28, 'Midfielder', 5),
    ('Player 11', 31, 'Defender', 6),
    ('Player 12', 20, 'Goalkeeper', 6),
    ('Player 13', 22, 'Forward', 7),
    ('Player 14', 24, 'Midfielder', 7),
    ('Player 15', 26, 'Defender', 8),
    ('Player 16', 25, 'Goalkeeper', 8),
    ('Player 17', 29, 'Forward', 9),
    ('Player 18', 27, 'Midfielder', 9),
    ('Player 19', 21, 'Defender', 10),
    ('Player 20', 30, 'Goalkeeper', 10),
    ('Player 21', 23, 'Forward', 1),
    ('Player 22', 25, 'Midfielder', 2),
    ('Player 23', 28, 'Defender', 3),
    ('Player 24', 31, 'Goalkeeper', 4),
    ('Player 25', 20, 'Forward', 5),
    ('Player 26', 22, 'Midfielder', 6),
    ('Player 27', 27, 'Defender', 7),
    ('Player 28', 29, 'Goalkeeper', 8),
    ('Player 29', 24, 'Forward', 9),
    ('Player 30', 26, 'Midfielder', 10);

