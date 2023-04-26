
CREATE DATABASE fiktiv_streamingplatform;
DROP TABLE IF EXISTS title , actor , rating , producer , title_producer;
DROP DATABASE IF EXISTS fiktiv_streamingplatform;
USE fiktiv_streamingplatform;

CREATE TABLE title (title_id INTEGER NOT NULL AUTO_INCREMENT, title VARCHAR (100) DEFAULT ' ' NOT NULL , releasedyear YEAR ,  PRIMARY KEY (title_id));
CREATE TABLE actor ( actor_id INTEGER NOT NULL AUTO_INCREMENT, actor_name VARCHAR(100) DEFAULT ' ' NOT NULL , Gender CHAR NOT NULL ,  PRIMARY KEY (actor_id));
CREATE TABLE rating (rating_id INTEGER NOT NULL AUTO_INCREMENT , title_id INTEGER NOT NULL , rating INTEGER NOT NULL , PRIMARY KEY(rating_id) , FOREIGN KEY (title_id) REFERENCES title(title_id));
CREATE TABLE producer (producer_id INTEGER NOT NULL AUTO_INCREMENT , Producer_name VARCHAR(100) DEFAULT ' ' NOT NULL , PRIMARY KEY (producer_id));
CREATE TABLE title_producer( title_id INTEGER NOT NULL , producer_id INTEGER NOT NULL  , FOREIGN KEY (title_id) REFERENCES title(title_id) , FOREIGN KEY (producer_id) REFERENCES producer(producer_id));

INSERT INTO title (title,releasedyear) VALUES (  'Bahubali' , '2015' ) , (  'Arundathi' , '2009'); 
INSERT INTO title (title , releasedyear) VALUES ( 'SixthSense' , '2011') , ('LifeisBeautiful' , '2012 ');
INSERT INTO actor (actor_name,gender) VALUES (  'Prabhas' , 'M') , ( 'Anushka' , 'F');  
INSERT INTO rating(title_id,rating) VALUES (  1 , 5 ) , (   2 , 3);
INSERT INTO producer(producer_name) VALUES (  'Rajamouli' ) , (  'KodiRamakri'); 
INSERT INTO producer(producer_name) VALUES (  'Dil' );



SELECT title , releasedYear FROM title;
SELECT actor_name ,gender FROM actor;
SELECT rating_id , title_id , rating FROM rating;
SELECT producer_id, producer_name from producer;
SELECT * FROM title_producer;
SELECT  title  FROM title;
SELECT DISTINCT title FROM title WHERE releasedYear >2000;
SELECT DISTINCT actor_name FROM actor; 
SELECT rating FROM rating;
SELECT  DISTINCT rating FROM rating INNER JOIN title ON rating.title_id= title.title_id WHERE title.title_id = 2 AND title.title ='Arundathi';
SELECT  title FROM title INNER JOIN rating ON title.title_id =rating.title_id WHERE rating.rating >=4 ORDER BY title.title_id DESC;
SELECT DISTINCT producer_name FROM producer;
SELECT title.title  FROM title LEFT JOIN title_producer ON title.title_id =title_producer.title_id WHERE title.title_id 
= 2 ;
SELECT title.title  FROM title LEFT JOIN title_producer ON title.title_id =title_producer.title_id GROUP BY title.title_id;

INSERT INTO title ( title ) VALUES ( 'Bommarillu ');
INSERT INTO actor ( actor_name , gender ) VALUES (  'Surya' ,'F');
INSERT INTO actor (actor_name ,	gender ) VALUES ('Siddartha' ,'M');
INSERT INTO producer(producer_name) VALUES ( 'Shekarkamla');
INSERT INTO producer(producer_name) VALUES ( 'Savitri');
-- INSERT INTO Ratings (Rating) SELECT Title FROM Titles WHERE Title ='Arundhati';
INSERT INTO rating(title_id ,rating) VALUES((SELECT title_id FROM title WHERE title.title='LifeisBeautiful') ,5);

INSERT INTO producer(producer_name) VALUES('Dil' );
UPDATE title SET releasedyear = '2020' WHERE title.title_id=2 AND title.title='Arundhati';
UPDATE actor SET gender = 'M' WHERE actor.actor_id =6;
UPDATE rating SET rating = 4 WHERE rating.rating_id =2;

DELETE FROM title WHERE title.title_id= '2'AND title.title='Arundhati';
DELETE FROM actor WHERE actor.actor_id = '7' AND actor.actor_name= 'Sunil';
DELETE FROM producer WHERE producer.producer_id = '20';
DELETE FROM rating WHERE rating.rating_id = '10';
INSERT INTO rating (title_id,rating) VALUES( 2 , 1);
DROP TABLE IF EXISTS Ranks;
CREATE TABLE Ranks( Rank_id INTEGER NOT NULL AUTO_INCREMENT, Title_id INTEGER NOT NULL , Rating INTEGER NOT NULL , PRIMARY KEY(Rank_id), FOREIGN KEY (Title_id) REFERENCES Titles(Title_id));
INSERT INTO Ranks(Title_id ,Rating) VALUES( (SELECT Title_id FROM Titles WHERE Titles.Title= 'Bahubali'),8);
 INSERT INTO rating(title_id,rating) VALUES((SELECT title_id FROM title WHERE title_id=2),4);
 INSERT  INTO title_producer(title_id,producer_id) VALUES (
(SELECT title_id FROM title WHERE (title.title)= Lower('Bahubali')),(SELECT producer_id FROM producer WHERE producer.producer_name = 'Dil'));
 SELECT Title_id FROM Title WHERE LOWER (Title.Title) = LOWER('Arundathi');
SELECT DISTINCT rating FROM rating;
SELECT* FROM rating;
SELECT * FROM title;
SELECT * FROM actor;
SELECT * FROM title LEFT JOIN title_producer ON title.title_id =title_producer.title_id;
DELETE FROM rating WHERE rating_id=6 AND title_id = 2;
SELECT * FROM rating;
 select * from producer;
 select title_id from title where title = 'Bahubali';
 SELECT * FROM title_producer;

 
