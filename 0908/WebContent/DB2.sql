create table bank1(
   bid int primary key,
    name varchar(20),
    balance int
);
create table bank2(
   bid int primary key,
    name varchar(20),
    balance int
);
insert into bank1 values(1001,'아무무',5000);
insert into bank2 values(2001,'티모',1000);

create table test(
   name varchar(20),
    email varchar(20)
);
insert into test values('kim','adsf');
insert into test values('kim2','adsf');
insert into test values('kim3','adsf');

select @@autocommit; -- 기본적으로 autocommit이 설정되어있다.
set autocommit=0; -- autocommit 해제
commit; -- 직접 commit을 해야지된다.

delete from test where name='a';

set sql_safe_updates=0;
