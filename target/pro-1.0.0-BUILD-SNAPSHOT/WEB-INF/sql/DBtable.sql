
/* Drop Tables */

DROP TABLE notice CASCADE CONSTRAINTS;
DROP TABLE admin CASCADE CONSTRAINTS;
DROP TABLE files CASCADE CONSTRAINTS;
DROP TABLE mypage CASCADE CONSTRAINTS;
DROP TABLE qna CASCADE CONSTRAINTS;
DROP TABLE reservation CASCADE CONSTRAINTS;
DROP TABLE menu CASCADE CONSTRAINTS;
DROP TABLE restaurant CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE admin
(
	admin_num number(5,0) NOT NULL,
	admin_id varchar2(40) NOT NULL,
	admin_pw varchar2(40) NOT NULL,
	PRIMARY KEY (admin_num)
);


CREATE TABLE files
(
	fnum number(10,0) NOT NULL,
	-- menu num
	menu_num number(5,0) NOT NULL,
	fname varchar2(4000),
	oname varchar2(4000),
	PRIMARY KEY (fnum)
);


CREATE TABLE member
(
	member_num number(10,0) NOT NULL,
	id varchar2(400) NOT NULL UNIQUE,
	-- pw
	-- 
	pw varchar2(400) NOT NULL,
	email varchar2(400) NOT NULL UNIQUE,
	name varchar2(400) NOT NULL,
	-- tel
	-- 
	tel varchar2(13),
	-- post1
	post1 varchar2(5),
	addr1 varchar2(400),
	-- addr2
	addr2 varchar2(400),
	-- join date
	joindate date,
	writecount number(5,0),
	kind varchar2(400) NOT NULL UNIQUE,
	-- reg_num
	reg_number number(5,0),
	grade number(1),
	PRIMARY KEY (member_num)
);


CREATE TABLE menu
(
	-- menu num
	menu_num number(5,0) NOT NULL,
	-- menu_name
	name varchar2(400) NOT NULL,
	-- price
	price number(5,0) NOT NULL,
	-- origin
	origin varchar2(400) NOT NULL,
	-- rest num
	rest_num number(10,0) NOT NULL,
	PRIMARY KEY (menu_num)
);


CREATE TABLE mypage
(
	-- mp_num
	mp_num number(5,0) NOT NULL,
	id varchar2(400) NOT NULL UNIQUE,
	pw varchar2(400) NOT NULL,
	email varchar2(400) NOT NULL,
	name varchar2(400) NOT NULL,
	tel varchar2(13),
	post1 varchar2(5) NOT NULL,
	addr1 varchar2(400) NOT NULL,
	addr2 varchar2(400) NOT NULL,
	joindate date,
	writecount number(5,0),
	kind varchar2(400),
	reg_number number(5,0),
	grade number(1),
	member_num number(10,0) NOT NULL,
	-- reservation_num
	res_num number(5,0) NOT NULL,
	PRIMARY KEY (mp_num)
);


CREATE TABLE notice
(
	notice_num number(5,0) NOT NULL,
	-- notice
	title varchar2(400) NOT NULL,
	contents varchar2(4000),
	hit number(10,0),
	-- notice reg_date
	reg_date date,
	admin_num number(5,0) NOT NULL,
	PRIMARY KEY (notice_num)
);


CREATE TABLE qna
(
	-- qna num
	qna_num number(5,0) NOT NULL,
	id varchar2(400) NOT NULL UNIQUE,
	-- qna title
	title varchar2(400) NOT NULL,
	-- qna contents
	contents varchar2(4000),
	-- qna reg_date
	reg_date date,
	-- qna hit
	hit number(5,0),
	-- qna ref
	ref number(5,0),
	-- qna step
	step number(5,0),
	-- qna depth
	depth number(5,0),
	PRIMARY KEY (qna_num)
);


CREATE TABLE reservation
(
	-- reservation_num
	res_num number(5,0) NOT NULL,
	-- rest num
	rest_num number(10,0) NOT NULL,
	member_num number(10,0) NOT NULL,
	-- reservation_people
	res_people number(5,0) NOT NULL,
	-- reservation_date
	res_date date NOT NULL UNIQUE,
	res_state number(1),
	PRIMARY KEY (res_num)
);


CREATE TABLE restaurant
(
	-- rest num
	rest_num number(10,0) NOT NULL,
	id varchar2(400) NOT NULL UNIQUE,
	-- rest name
	-- 
	rest_name varchar2(400),
	-- rest addr
	rest_addr varchar2(4000),
	-- taste tel
	rest_tel varchar2(20),
	kind varchar2(400) NOT NULL UNIQUE,
	-- taste parking
	parking varchar2(400),
	-- taste time
	orderTime varchar2(20),
	-- taste lastOrder
	-- 
	lastOrder varchar2(20),
	-- rest_url
	rest_url varchar2(4000),
	-- taste_reg_date
	reg_date date,
	-- taste_hit
	hit number(5,0) NOT NULL,
	review_hit number(5,0),
	member_num number(10,0) NOT NULL,
	-- reservation_date
	res_date date UNIQUE,
	PRIMARY KEY (rest_num)
);


CREATE TABLE review
(
	-- review num
	review_num number(10,0) NOT NULL,
	id varchar2(400) NOT NULL UNIQUE,
	score number(1) NOT NULL,
	-- review contents
	contents varchar2(4000),
	-- reg_date
	reg_date date,
	PRIMARY KEY (review_num)
);



/* Create Foreign Keys */

ALTER TABLE notice
	ADD FOREIGN KEY (admin_num)
	REFERENCES admin (admin_num)
;


ALTER TABLE mypage
	ADD FOREIGN KEY (member_num)
	REFERENCES member (member_num)
;


ALTER TABLE qna
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE reservation
	ADD FOREIGN KEY (member_num)
	REFERENCES member (member_num)
;


ALTER TABLE restaurant
	ADD FOREIGN KEY (kind)
	REFERENCES member (kind)
;


ALTER TABLE restaurant
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE restaurant
	ADD FOREIGN KEY (member_num)
	REFERENCES member (member_num)
;


ALTER TABLE review
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE files
	ADD FOREIGN KEY (menu_num)
	REFERENCES menu (menu_num)
;


ALTER TABLE mypage
	ADD FOREIGN KEY (res_num)
	REFERENCES reservation (res_num)
;


ALTER TABLE menu
	ADD FOREIGN KEY (rest_num)
	REFERENCES restaurant (rest_num)
;


ALTER TABLE reservation
	ADD FOREIGN KEY (rest_num)
	REFERENCES restaurant (rest_num)
;


ALTER TABLE reservation
	ADD FOREIGN KEY (res_date)
	REFERENCES restaurant (res_date)
;



/* Comments */

COMMENT ON COLUMN files.menu_num IS 'menu num';
COMMENT ON COLUMN member.pw IS 'pw
';
COMMENT ON COLUMN member.tel IS 'tel
';
COMMENT ON COLUMN member.post1 IS 'post1';
COMMENT ON COLUMN member.addr2 IS 'addr2';
COMMENT ON COLUMN member.joindate IS 'join date';
COMMENT ON COLUMN member.reg_number IS 'reg_num';
COMMENT ON COLUMN menu.menu_num IS 'menu num';
COMMENT ON COLUMN menu.name IS 'menu_name';
COMMENT ON COLUMN menu.price IS 'price';
COMMENT ON COLUMN menu.origin IS 'origin';
COMMENT ON COLUMN menu.rest_num IS 'rest num';
COMMENT ON COLUMN mypage.mp_num IS 'mp_num';
COMMENT ON COLUMN mypage.res_num IS 'reservation_num';
COMMENT ON COLUMN notice.title IS 'notice';
COMMENT ON COLUMN notice.reg_date IS 'notice reg_date';
COMMENT ON COLUMN qna.qna_num IS 'qna num';
COMMENT ON COLUMN qna.title IS 'qna title';
COMMENT ON COLUMN qna.contents IS 'qna contents';
COMMENT ON COLUMN qna.reg_date IS 'qna reg_date';
COMMENT ON COLUMN qna.hit IS 'qna hit';
COMMENT ON COLUMN qna.ref IS 'qna ref';
COMMENT ON COLUMN qna.step IS 'qna step';
COMMENT ON COLUMN qna.depth IS 'qna depth';
COMMENT ON COLUMN reservation.res_num IS 'reservation_num';
COMMENT ON COLUMN reservation.rest_num IS 'rest num';
COMMENT ON COLUMN reservation.res_people IS 'reservation_people';
COMMENT ON COLUMN reservation.res_date IS 'reservation_date';
COMMENT ON COLUMN restaurant.rest_num IS 'rest num';
COMMENT ON COLUMN restaurant.rest_name IS 'rest name
';
COMMENT ON COLUMN restaurant.rest_addr IS 'rest addr';
COMMENT ON COLUMN restaurant.rest_tel IS 'taste tel';
COMMENT ON COLUMN restaurant.parking IS 'taste parking';
COMMENT ON COLUMN restaurant.orderTime IS 'taste time';
COMMENT ON COLUMN restaurant.lastOrder IS 'taste lastOrder
';
COMMENT ON COLUMN restaurant.rest_url IS 'rest_url';
COMMENT ON COLUMN restaurant.reg_date IS 'taste_reg_date';
COMMENT ON COLUMN restaurant.hit IS 'taste_hit';
COMMENT ON COLUMN restaurant.res_date IS 'reservation_date';
COMMENT ON COLUMN review.review_num IS 'review num';
COMMENT ON COLUMN review.contents IS 'review contents';
COMMENT ON COLUMN review.reg_date IS 'reg_date';



