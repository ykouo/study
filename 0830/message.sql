drop table message;
create table message(
	mnum int primary key,    -- primarykey�ȿ��� not null&unique�� ���ִ�.
	writer varchar(15) not null,
	title varchar(15) not null,
	content varchar(100) not null,
	wdate date default sysdate 
	-- cnt	int, -- ��ȸ��
	-- fav int	 -- ���ƿ�
);
select * from message;
insert into message values(1,'kim','title','content',sysdate);
insert into message values(2,'kim2','����2','����2',sysdate);
-- [ ���õ����� ]
-- ���ǻ��� :�����Ͱ� ������ null pointer exception�� ���� �𸦼� ����
-- 		    �Ϲ������� ���� �ɶ����� ���õ����� ��! 
