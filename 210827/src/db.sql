select * from all_tables;
drop table student;
-- ���� ����Ű : alt+x

create table test(
	a varchar(10) ,
	b int
);
select * from test;


create table member(
	pk int,
	userID varchar(10),
	userPW varchar(10),
	userName varchar(10)
);
insert into member values(1,'����','���','�浿');
insert into member values(2,'id','pw','name');
insert into member values(3,'kim','1234','Ƽ��'); /*���� ������*/
select * from member;
drop table member;
select * from all_tables;