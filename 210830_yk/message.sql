select * from all_tables;
create table message(
	mnum int primary key,
	writer varchar(30) not null,
	title varchar(30) not null,
	content varchar(200) not null,
	wdate date default sysdate
);
select * from MESSAGE;

drop table message;

insert into message values(1,'kim','����','����',sysdate);
insert into message values(2,'kim2','����2','����2',sysdate);
INSERT INTO MESSAGE VALUES((SELECT NVL(MAX(MNUM),0)+1 FROM MESSAGE),'AN','hello, java?','Hello java nice to meet you',SYSDATE);