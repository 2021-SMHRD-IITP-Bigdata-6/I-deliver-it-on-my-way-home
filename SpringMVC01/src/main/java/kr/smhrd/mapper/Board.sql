create table board(
idx int not null auto_increment,
title varchar(100) not null,
content varchar(2000) not null,
writer varchar(20) not null,
indate datetime default now(), -- sysdate랑 같다
count int default 0,
primary key(idx)
);


insert into board(title,content,writer)
values('스프링게시판','스프링게시판','관리자');
insert into board(title,content,writer)
values('스프링게시판','스프링게시판','배윤서');

select * from board;