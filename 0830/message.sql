drop table message;
create table message(
	mnum int primary key,    -- primarykey안에는 not null&unique가 들어가있다.
	writer varchar(150) not null,
	title varchar(150) not null,
	content varchar(300) not null,
	wdate date default sysdate 
	-- cnt	int, -- 조회수
	-- fav int	 -- 좋아요
);
select * from message;
insert into message values(1,'kim','title','content',sysdate);
insert into message values(2,'kim2','제목2','내용2',sysdate);
-- [ 샘플데이터 ]
-- 주의사항 :데이터가 없을때 null pointer exception이 떠도 모를수 있음
-- 		    일반적으로 서비스 될때에는 샘플데이터 有! 
INSERT INTO MESSAGE VALUES((SELECT NVL(MAX(MNUM),0)+1 FROM MESSAGE),'무','안녕','하이',SYSDATE);
