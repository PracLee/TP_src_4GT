

CREATE TABLE userInfo(
	id varchar(30) primary key,
	pw varchar(30),
	name varchar(30)
);

CREATE TABLE post(
	pnum int primary key,
	views int default 0,
	plike int default 0,
	category varchar(30),
	title varchar(100),
	content varchar(4000),
	writer varchar(30),
	pdate date default sysdate,
	p_user varchar(30),
	path varchar(1000),
	foreign key (p_user) references userInfo(id) on delete cascade
);

CREATE TABLE comments(
	cnum int primary key,
	cment varchar(300),
	cdate date default sysdate,
	c_user varchar(30),
	c_post int,
	foreign key (c_user) references userInfo(id) on delete cascade,
	foreign key (c_post) references post(pnum) on delete cascade
);

CREATE TABLE likeInfo(
	l_user varchar(30),
	l_post int,
	ldate date default sysdate,
	foreign key (l_user) references userInfo(id) on delete cascade,
	foreign key (l_post) references post(pnum) on delete cascade
);

/* SELECT ALL */
select * from all_tables;
select * from userInfo;
select * from post;
select * from comments;
select * from likeInfo;

/* 테이블 삭제 */
drop table userInfo;
drop table post CASCADE CONSTRAINTS;
drop table comments;
drop table likeInfo;