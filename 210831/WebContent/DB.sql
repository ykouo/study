SELECT * FROM ALL_TABLES;
DROP TABLE MEMBER;

CREATE TABLE MESSAGE(
	MNUM INT PRIMARY KEY, 
	WRITER VARCHAR(30) NOT NULL,
	TITLE VARCHAR(30) NOT NULL,
	CONTENT VARCHAR(150) NOT NULL,
	WDATE DATE DEFAULT SYSDATE
);
SELECT *FROM MESSAGE;
INSERT INTO MESSAGE VALUES ((SELECT NVL(MAX(MNUM),0)+1 FROM MESSAGE),'SIRI','SIRI��','WELCOME',SYSDATE);


create table member(
   mnum int primary key ,
    mid varchar(15),
    mpw varchar(15)
);

SELECT *FROM MEMBER;
SELECT * FROM MESSAGE WHERE TITLE LIKE '%y%';
INSERT INTO MEMBER VALUES ((SELECT NVL(MAX(MNUM),0)+1 FROM MEMBER),'an','11');