CREATE DATABASE todo_perfect;

USE todo_perfect;
CREATE TABLE todo (id INTEGER PRIMARY KEY AUTO_INCREMENT, task char(100) NOT NULL, status bool NOT NULL);

INSERT INTO todo (task,status) VALUES ('Have fun with perfect',1);
INSERT INTO todo (task,status) VALUES ('Clean my closet',0);
INSERT INTO todo (task,status) VALUES ('Learn Swift',1);
INSERT INTO todo (task,status) VALUES ('Left the dogs out',0);
