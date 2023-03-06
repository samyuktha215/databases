
CREATE DATABASE Fiktiv_StreamingPlatform;
USE Fiktiv_StreamingPlatform;
DROP TABLE IF EXISTS Titles , Actors , Ratings , Producers , Title_Producers;
CREATE TABLE Titles (Title_id INTEGER NOT NULL AUTO_INCREMENT, Title VARCHAR (100) DEFAULT ' ' NOT NULL , ReleasedYear YEAR ,  PRIMARY KEY (Title_id));
CREATE TABLE Actors ( Actor_id INTEGER NOT NULL AUTO_INCREMENT, Actor_name VARCHAR(100) DEFAULT ' ' NOT NULL , Gender CHAR NOT NULL ,  PRIMARY KEY (Actor_id));
CREATE TABLE Ratings (Rating_id INTEGER NOT NULL AUTO_INCREMENT , Title_id INTEGER NOT NULL , Rating INTEGER NOT NULL , PRIMARY KEY(Rating_id) , FOREIGN KEY (Title_id) REFERENCES Titles(TItle_id));
CREATE TABLE Producers (Producer_id INTEGER NOT NULL AUTO_INCREMENT , Name VARCHAR(100) DEFAULT ' ' NOT NULL , PRIMARY KEY (Producer_id));
CREATE TABLE Title_Producers( Title_id INTEGER NOT NULL , Producer_id INTEGER NOT NULL , FOREIGN KEY (Title_id) REFERENCES Titles(Title_id) , FOREIGN KEY (Producer_id) REFERENCES Producers(Producer_id));

INSERT INTO Titles (Title,ReleasedYear) VALUES (  'Bahubali' , '2015' ) , (  'Arundathi' , '2009'); 
INSERT INTO Titles (Title , ReleasedYear) VALUES ( 'SixthSense' , '2011') , ('LifeisBeautiful' , '2012 ');
INSERT INTO Actors (Actor_name,Gender) VALUES (  'Prabhas' , 'M') , ( 'Anushka' , 'F');  
INSERT INTO Ratings(Title_id,Rating) VALUES (  1 , 5 ) , (   2 , 3);
INSERT INTO Producers(Name) VALUES (  'Rajamouli' ) , (  'KodiRamakri'); 

INSERT INTO Producers(Name) VALUES (  'Dil' );

INSERT INTO Title_Producers  VALUES ( 1 , 1 ) , (2 ,2 );
SELECT DISTINCT(Title) FROM Titles;
SELECT  Title  FROM Titles;
SELECT DISTINCT Title FROM Titles WHERE ReleasedYear >2000;
SELECT DISTINCT Actor_name FROM Actors; 
SELECT Rating FROM Ratings;
SELECT  DISTINCT Rating FROM Ratings INNER JOIN Titles ON Ratings.Title_id= Titles.Title_id WHERE Titles.Title_id = 2 AND Titles.Title ='Arundathi';
SELECT  Title FROM Titles INNER JOIN Ratings ON Titles.Title_id =Ratings.Title_id WHERE Ratings.Rating >=4 ORDER BY Titles.Title_id DESC;
SELECT DISTINCT Name FROM Producers;
SELECT Titles.Title  FROM Titles INNER JOIN Title_Producers ON Titles.Title_id =Title_Producers.Title_id WHERE Titles.Title_id 
= 2 ;
SELECT Titles.Title  FROM Titles INNER JOIN Title_Producers ON Titles.Title_id =Title_Producers.Title_id GROUP BY Titles.Title_id;

INSERT INTO Titles ( Title ) VALUES ( 'Bommarillu ');
INSERT INTO Actors ( Actor_name , Gender ) VALUES ( 6 , 'Surya' ,'F');
INSERT INTO Actors (Actor_name ,	Gender ) VALUES ('Siddartha' ,'M');
INSERT INTO Producers(Name) VALUES ( 'Shekarkamla');
INSERT INTO Producers(Name) VALUES ( 'Savitri');
-- INSERT INTO Ratings (Rating) SELECT Title FROM Titles WHERE Title ='Arundhati';
INSERT INTO Ratings(Title_id ,Rating) VALUES((SELECT Title_id FROM Titles WHERE Titles.Title='LifeisBeautiful') ,5);

INSERT INTO Producers(Name) VALUES('Dil' );
UPDATE Titles SET ReleasedYear = '2020' WHERE Titles.Title_id=2 AND Titles.Title='Arundhati';
UPDATE Actors SET Gender = 'M' WHERE Actors.Actor_id =6;
UPDATE Ratings SET Rating = 4 WHERE Ratings.Rating_id =2;

DELETE FROM Titles WHERE Titles.Title_id= '2'AND Titles.Title='Arundhati';
DELETE FROM Actors WHERE Actors.Actor_id = '7' AND Actors.Actor_name= 'Sunil';
DELETE FROM Producers WHERE Producers.Producer_id = '20';
DELETE FROM Ratings WHERE Ratings.Rating_id = '10';
INSERT INTO Ratings (Title_id,Rating) VALUES( 2 , 1);
DROP TABLE IF EXISTS Ranks;
CREATE TABLE Ranks( Rank_id INTEGER NOT NULL AUTO_INCREMENT, Title_id INTEGER NOT NULL , Rating INTEGER NOT NULL , PRIMARY KEY(Rank_id), FOREIGN KEY (Title_id) REFERENCES Titles(Title_id));
INSERT INTO Ranks(Title_id ,Rating) VALUES( (SELECT Title_id FROM Titles WHERE Titles.Title= 'Bahubali'),8);
 SELECT Title_id FROM Titles WHERE LOWER (Titles.Title) = LOWER('Arundathi');
SELECT DISTINCT Rating FROM Ratings;
SELECT* FROM Ratings;
DELETE FROM Ratings WHERE Rating_id=6 AND Title_id = 2;
SELECT * FROM Ratings;
 select * from producers;
 select title_id from titles where Title = 'Bahubali';
 
 
insert into Title_Producers(Title_id,Producer_id) values (
(SELECT Title_id FROM Titles WHERE Lower(Titles.Title)= Lower('Bahubali')),(select Producer_id from producers where Producers.Name = 'Dil'));