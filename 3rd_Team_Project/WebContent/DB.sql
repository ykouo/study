SELECT * FROM ALL_TABLES;
DROP TABLE MEMBER; 
DROP TABLE FREEBOARD;
DROP TABLE STUDYBOARD;
DROP TABLE NOTICEBOARD;
DROP TABLE CONCERM;
DROP TABLE FREECOMMENT;
DROP TABLE STUDYCOMMENT;
DROP TABLE NOTICECOMMENT;

-- ���� ���̺�
CREATE TABLE MEMBER(
	MID VARCHAR(50) PRIMARY KEY, 		 -- ȸ�� ���̵�
	MPW VARCHAR(50) NOT NULL,			 -- ȸ�� ��й�ȣ
	MNAME VARCHAR(50) NOT NULL,			 -- ȸ�� �г���
	MEMAIL VARCHAR(50) NOT NULL,		 -- ȸ�� �̸���	
	ROLE VARCHAR(20) NOT NULL			 -- �����/������
);

INSERT INTO MEMBER VALUES ('hana','11','�ϳ�','hana11@naver.com','user');
INSERT INTO MEMBER VALUES ('admin','1004','������','admin@helper.com','admin');

-- ====================================================================
-- �Խñ� ���̺� 
CREATE TABLE FREEBOARD(
	PNUM INT PRIMARY KEY, 				 -- �Խñ� ���� ��ȣ
	PTITLE VARCHAR(50) NOT NULL,		 -- �Խñ� ���� 
	PCONTENT VARCHAR(1000) NOT NULL,	 -- �Խñ� ����
	PDATE DATE DEFAULT SYSDATE NOT NULL, -- �Խñ� �ۼ����� 
	MNAME VARCHAR(50) NOT NULL,			 -- ȸ�� �г���
	MID VARCHAR(50) NOT NULL,			 -- ȸ�� ���̵�
	CNT INT DEFAULT 0 NOT NULL, 					 -- ��ȸ��
	CATEGORY VARCHAR(50) DEFAULT '�����Խ���' NOT NULL 		 -- ī�װ� 
);
-- �Խñ� ����Ʈ ����
SELECT * FROM FREEBOARD ORDER BY PNUM DESC; --�ֽű� 
SELECT * FROM FREEBOARD WHERE PTITLE= LIKE '%H%' ORDER BY PNUM DESC;  --����
-- �Խñ� �� ����
SELECT * FROM FREEBOARD WHERE PNUM = 1 ;
-- ���̺� ��ü �� ���� �������� 
SELECT COUNT(*) FROM FREEBOARD;
V
-- �Խñ� �ۼ�
INSERT INTO FREEBOARD VALUES ((SELECT NVL(MAX(PNUM),0)+1 FROM FREEBOARD),
'Hello','hellow world',SYSDATE,'hana','�ϳ�',0);

INSERT INTO FREEBOARD (PNUM,PTITLE,PCONTENT,MNAME,MID) VALUES ((SELECT NVL(MAX(PNUM),0)+1 FROM FREEBOARD),
'Hello','hellow world','�ϳ�','hana');
INSERT INTO FREEBOARD (PNUM,PTITLE,PCONTENT,MNAME,MID) VALUES ((SELECT NVL(MAX(PNUM),0)+1 FROM FREEBOARD),
'Welcome','Welcome HAH Conding Community','�θ�','duri');

-- ����
UPDATE FREEBOARD SET PTITLE='HI',PCONTENT='�ڡڡڡڡڡڡڡڡ�' WHERE PNUM=1;

-- ����
DELETE FROM FREEBOARD WHERE PNUM ='2' AND MID='duri';

CREATE TABLE STUDYBOARD(
	PNUM INT PRIMARY KEY, 				 			-- �Խñ� ���� ��ȣ
	PTITLE VARCHAR(50) NOT NULL,		 			-- �Խñ� ���� 
	PCONTENT VARCHAR(1000) NOT NULL,	 			-- �Խñ� ����
	PDATE DATE DEFAULT SYSDATE NOT NULL, 			-- �Խñ� �ۼ����� 
	MNAME VARCHAR(50) NOT NULL,			 			-- ȸ�� �г���
	MID VARCHAR(50) NOT NULL,			 			-- ȸ�� ���̵�
	CNT INT DEFAULT 0 NOT NULL, 					-- ��ȸ��
	CATEGORY VARCHAR(50) DEFAULT 'Study' NOT NULL 	-- ī�װ� 
);
CREATE TABLE NOTICEBOARD(
	PNUM INT PRIMARY KEY, 						 	-- �Խñ� ���� ��ȣ
	PTITLE VARCHAR(50) NOT NULL,		 		 	-- �Խñ� ���� 
	PCONTENT VARCHAR(1000) NOT NULL,			 	-- �Խñ� ����
	PDATE DATE DEFAULT SYSDATE NOT NULL, 		 	-- �Խñ� �ۼ����� 
	MNAME VARCHAR(50) NOT NULL,			 	   	 	-- ȸ�� �г���
	MID VARCHAR(50) NOT NULL,					 	-- ȸ�� ���̵�
	CNT INT DEFAULT 0 NOT NULL, 				 	-- ��ȸ��
	CATEGORY VARCHAR(50) DEFAULT '��������' NOT NULL 	-- ī�װ� 
);




-- ====================================================================
-- ���ɱ� �Խñ� ���̺� 
CREATE TABLE CONCERM(
	FAVNUM INT PRIMARY KEY,				 -- ���� �Խñ� ���� ��ȣ  
	MID VARCHAR(50) NOT NULL,			 -- ȸ�� ���̵�
	PNUM INT NOT NULL, 					 -- �Խñ� ��ȣ
	CATEGORY VARCHAR(50) NOT NULL		 -- ī�װ�

);
-- ���ɱ� ��� ����
SELECT * FROM CONCERM ORDER BY FAVNUM DESC;
-- ���ɱ� ��� 
INSERT INTO CONCERM VALUES ((SELECT NVL(MAX(FAVNUM),0)+1 FROM CONCERM),'hana','1','�����Խ���');
-- ���ɱ� ���� 
DELETE FROM CONCERM WHERE FAVNUM =1 AND MID='hana';

-- ====================================================================
-- ������̺� 
CREATE TABLE FREECOMMENT(
	CNUM INT PRIMARY KEY,				 -- ��� ���� ��ȣ 
	COMMENT VARCHAR(200) NOT NULL,		 -- ��� ���� 
	CDATE DATE DEFAULT SYSDATE NOT NULL, -- ��� �ۼ� ����
	PNUM INT NOT NULL,					 -- �Խñ� ��ȣ  
	MNAME VARCHAR(50) NOT NULL, 		 -- ȸ�� �г���
	MID VARCHAR(50) NOT NULL			 -- ȸ�� ���̵� 
);

CREATE TABLE STUDYCOMMENT(
	CNUM INT PRIMARY KEY,				 -- ��� ���� ��ȣ 
	COMMENT VARCHAR(200) NOT NULL,		 -- ��� ���� 
	CDATE DATE DEFAULT SYSDATE NOT NULL, -- ��� �ۼ� ����
	PNUM INT NOT NULL,					 -- �Խñ� ��ȣ  
	MNAME VARCHAR(50) NOT NULL, 		 -- ȸ�� �г���
	MID VARCHAR(50) NOT NULL			 -- ȸ�� ���̵� 
);

CREATE TABLE NOTICECOMMENT(
	CNUM INT PRIMARY KEY,				 -- ��� ���� ��ȣ 
	COMMENT VARCHAR(200) NOT NULL,		 -- ��� ���� 
	CDATE DATE DEFAULT SYSDATE NOT NULL, -- ��� �ۼ� ����
	PNUM INT NOT NULL,				 	 -- �Խñ� ��ȣ  
	MNAME VARCHAR(50) NOT NULL, 		 -- ȸ�� �г���
	MID VARCHAR(50) NOT NULL			 -- ȸ�� ���̵� 
);