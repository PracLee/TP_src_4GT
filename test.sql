

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
	comCnt int default 0,
	foreign key (p_user) references userInfo(id) on delete cascade
);

CREATE TABLE comments(
	cnum int primary key,
	cment varchar(300),
	cdate date default sysdate,
	cwriter varchar(30),
	replyCnt int default 0,
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

CREATE TABLE reply(
	rnum int primary key,
	rment varchar(300),
	rdate date default sysdate,
	rwriter varchar(30),
	r_user varchar(30),
	r_post int,
	r_comments int,
	foreign key (r_user) references userInfo(id) on delete cascade,
	foreign key (r_post) references post(pnum) on delete cascade,
	foreign key (r_comments) references comments(cnum) on delete cascade
);

/* SELECT ALL */
select * from all_tables;
select * from userInfo;
select * from post;
select * from comments;
select * from likeInfo;
select * from reply;

/* Å×ÀÌºí »èÁ¦ */
drop table userInfo;
drop table post CASCADE CONSTRAINTS;
drop table comments;
drop table likeInfo;
drop table reply;

delete from post WHERE PNUM=2;

insert into userInfo values('1111','1111','¸ù');
insert into post (pnum, views, plike, category, title, content, writer, p_user, path)
values(1,0,0, 'Ä¡Å²', '³ä³ä', 'Çª¶ó´ß Â¯¸À', '¸ù', '1111', '??');

insert into comments (cnum, cment, c_user, c_post)
values(1, '1111','1111', 1);

insert into likeInfo (l_user,l_post)values ('1111', 1);
