SELECT * FROM ALL_TABLES;

CREATE TABLE USERINFO(
	USERID VARCHAR(20) PRIMARY KEY, 
	USERNAME VARCHAR(25),
	USERPW VARCHAR(20),
	UDATE DATE
);

INSERT INTO USERINFO VALUES ('timo','Ƽ��','1234',SYSDATE);

-- ================================================================================================

CREATE TABLE MESSAGE(
	MID INT PRIMARY KEY, 
	USERID VARCHAR(20),
	MSG VARCHAR(100),
	FAVCOUNT INT DEFAULT 0,
	REPLYCOUNT INT DEFAULT 0,
	MDATE DATE
);
INSERT INTO MESSAGE VALUES ((SELECT NVL(MAX(MID),0)+1 FROM MESSAGE),'timo','���ۼ�',1,2,SYSDATE);
INSERT INTO MESSAGE VALUES ((SELECT NVL(MAX(MID),0)+1 FROM MESSAGE),'timo','�ڡڡڡڡ�',2,3,SYSDATE);
INSERT INTO MESSAGE VALUES ((SELECT NVL(MAX(MID),0)+1 FROM MESSAGE),'timo','Ȯ��',2,0,SYSDATE);
SELECT * FROM MESSAGE WHERE USERID ='timo' AND ROWNUM <= 1;
SELECT * FROM REPLY WHERE ROWNUM <= 5 ;
-- ================================================================================================

CREATE TABLE REPLY(
	RID INT PRIMARY KEY, 
	MID INT, 
	USERID VARCHAR(20),
	RDATE DATE,
	RMSG VARCHAR(50),
	CONSTRAINT MSGRP FOREIGN KEY (MID) REFERENCES MESSAGE (MID) ON DELETE CASCADE
);

INSERT INTO REPLY VALUES((SELECT NVL(MAX(RID),0)+1 FROM REPLY),1,'timo',SYSDATE,'���1');
INSERT INTO REPLY VALUES((SELECT NVL(MAX(RID),0)+1 FROM REPLY),1,'timo',SYSDATE,'���2');
INSERT INTO REPLY VALUES((SELECT NVL(MAX(RID),0)+1 FROM REPLY),2,'timo',SYSDATE,'���3');
INSERT INTO REPLY VALUES((SELECT NVL(MAX(RID),0)+1 FROM REPLY),2,'timo',SYSDATE,'���4');
INSERT INTO REPLY VALUES((SELECT NVL(MAX(RID),0)+1 FROM REPLY),2,'timo',SYSDATE,'���5');

-- ================================================================================================

SELECT * FROM REPLY;
SELECT * FROM MESSAGE;
SELECT * FROM USERINFO;
select * from reply;