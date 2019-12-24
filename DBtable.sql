
/* Drop Tables */

DROP TABLE notice CASCADE CONSTRAINTS;
DROP TABLE qna CASCADE CONSTRAINTS;
DROP TABLE reservation CASCADE CONSTRAINTS;
DROP TABLE menufiles CASCADE CONSTRAINTS;
DROP TABLE menu CASCADE CONSTRAINTS;
DROP TABLE restfiles CASCADE CONSTRAINTS;
DROP TABLE resttable CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE restaurant CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;


/* Create Tables */

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
	-- join date
	joindate date,
	writecount number(5,0),
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
	menu_name varchar2(400) NOT NULL,
	menu_contents varchar2(4000),
	-- price
	price number(5,0) NOT NULL,
	-- origin
	origin varchar2(400) NOT NULL,
	-- rest num
	rest_num number(10,0) NOT NULL,
	PRIMARY KEY (menu_num)
);


CREATE TABLE menufiles
(
	fnum number(10,0) NOT NULL,
	-- menu num
	menu_num number(5,0) NOT NULL,
	fname varchar2(4000),
	oname varchar2(4000),
	PRIMARY KEY (fnum)
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
	id varchar2(400) NOT NULL UNIQUE,
	PRIMARY KEY (notice_num)
);


CREATE TABLE qna
(
	-- qna num
	qna_num number(5,0) NOT NULL,
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
	id varchar2(400) NOT NULL UNIQUE,
	PRIMARY KEY (qna_num)
);


CREATE TABLE reservation
(
	rev_num number(10,0) NOT NULL,
	member_num number(10,0) NOT NULL,
	member_name varchar2(400),
	rev_time varchar2(400),
	rest_name varchar2(400),
	-- rest num
	rest_num number(10,0) NOT NULL,
	table_num number(10,0) NOT NULL,
	rev_date varchar2(400),
	rev_status number(2,0),
	PRIMARY KEY (rev_num)
);


CREATE TABLE restaurant
(
	-- rest num
	rest_num number(10,0) NOT NULL,
	-- rest name
	-- 
	rest_name varchar2(400) NOT NULL,
	-- rest contents
	rest_contents varchar2(4000) NOT NULL,
	rest_post1 number(5,0),
	-- rest addr
	rest_addr1 varchar2(400),
	rest_addr2 varchar2(400),
	-- taste tel
	rest_tel varchar2(20),
	-- rest_url
	rest_url varchar2(4000),
	kind varchar2(400),
	-- taste_reg_date
	reg_date date,
	-- taste_hit
	hit number(5,0) NOT NULL,
	review_hit number(5,0),
	-- rest_time
	rest_time varchar2(400),
	rest_accept number(5,0),
	member_num number(10,0) NOT NULL,
	rest_id varchar2(400),
	PRIMARY KEY (rest_num)
);


CREATE TABLE restfiles
(
	fnum number(10,0) NOT NULL,
	-- rest num
	rest_num number(10,0) NOT NULL,
	fname varchar2(4000),
	oname varchar2(4000),
	PRIMARY KEY (fnum)
);


CREATE TABLE resttable
(
	table_num number(10,0) NOT NULL,
	table_user number(10,0),
	open_time varchar2(400),
	close_time varchar2(400),
	-- rest num
	rest_num number(10,0) NOT NULL,
	member_num number(10,0) NOT NULL,
	PRIMARY KEY (table_num)
);


CREATE TABLE review
(
	-- review num
	review_num number(10,0) NOT NULL,
	writer varchar2(400),
	-- review contents
	contents varchar2(4000),
	score number(1) NOT NULL,
	-- reg_date
	reg_date date,
	member_num number(10,0) NOT NULL,
	-- rest num
	rest_num number(10,0) NOT NULL,
	PRIMARY KEY (review_num)
);



/* Create Foreign Keys */

ALTER TABLE notice
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
 	ON DELETE CASCADE
;


ALTER TABLE qna
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
 	ON DELETE CASCADE
;


ALTER TABLE reservation
	ADD FOREIGN KEY (member_num)
	REFERENCES member (member_num)
	 ON DELETE CASCADE
;


ALTER TABLE restaurant
	ADD FOREIGN KEY (member_num)
	REFERENCES member (member_num)
	 ON DELETE CASCADE
;


ALTER TABLE resttable
	ADD FOREIGN KEY (member_num)
	REFERENCES member (member_num)
	 ON DELETE CASCADE
;


ALTER TABLE review
	ADD FOREIGN KEY (member_num)
	REFERENCES member (member_num)
	 ON DELETE CASCADE
;


ALTER TABLE menufiles
	ADD FOREIGN KEY (menu_num)
	REFERENCES menu (menu_num)
	 ON DELETE CASCADE
;


ALTER TABLE menu
	ADD FOREIGN KEY (rest_num)
	REFERENCES restaurant (rest_num)
	 ON DELETE CASCADE
;


ALTER TABLE reservation
	ADD FOREIGN KEY (rest_num)
	REFERENCES restaurant (rest_num)
	 ON DELETE CASCADE
;


ALTER TABLE restfiles
	ADD FOREIGN KEY (rest_num)
	REFERENCES restaurant (rest_num)
	 ON DELETE CASCADE
;


ALTER TABLE resttable
	ADD FOREIGN KEY (rest_num)
	REFERENCES restaurant (rest_num)
	 ON DELETE CASCADE
;


ALTER TABLE review
	ADD FOREIGN KEY (rest_num)
	REFERENCES restaurant (rest_num)
	 ON DELETE CASCADE
;


ALTER TABLE reservation
	ADD FOREIGN KEY (table_num)
	REFERENCES resttable (table_num)
 ON DELETE CASCADE
;

/* Sequences */
/* create sequence */
CREATE SEQUENCE rest_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE board_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE member_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE menu_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE rev_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE file_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE review_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE resttable_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

/* Comments */

COMMENT ON COLUMN member.pw IS 'pw
';
COMMENT ON COLUMN member.tel IS 'tel
';
COMMENT ON COLUMN member.joindate IS 'join date';
COMMENT ON COLUMN member.reg_number IS 'reg_num';
COMMENT ON COLUMN menu.menu_num IS 'menu num';
COMMENT ON COLUMN menu.menu_name IS 'menu_name';
COMMENT ON COLUMN menu.price IS 'price';
COMMENT ON COLUMN menu.origin IS 'origin';
COMMENT ON COLUMN menu.rest_num IS 'rest num';
COMMENT ON COLUMN menufiles.menu_num IS 'menu num';
COMMENT ON COLUMN mypage.mp_num IS 'mp_num';
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
COMMENT ON COLUMN reservation.rest_num IS 'rest num';
COMMENT ON COLUMN restaurant.rest_num IS 'rest num';
COMMENT ON COLUMN restaurant.rest_name IS 'rest name
';
COMMENT ON COLUMN restaurant.rest_contents IS 'rest contents';
COMMENT ON COLUMN restaurant.rest_addr1 IS 'rest addr';
COMMENT ON COLUMN restaurant.rest_tel IS 'taste tel';
COMMENT ON COLUMN restaurant.rest_url IS 'rest_url';
COMMENT ON COLUMN restaurant.reg_date IS 'taste_reg_date';
COMMENT ON COLUMN restaurant.hit IS 'taste_hit';
COMMENT ON COLUMN restaurant.rest_time IS 'rest_time';
COMMENT ON COLUMN restfiles.rest_num IS 'rest num';
COMMENT ON COLUMN resttable.rest_num IS 'rest num';
COMMENT ON COLUMN review.review_num IS 'review num';
COMMENT ON COLUMN review.contents IS 'review contents';
COMMENT ON COLUMN review.reg_date IS 'reg_date';
COMMENT ON COLUMN review.rest_num IS 'rest num';

---------------------------------------------------------------------------------------
/* insert */

--------------------------------------------------------
/* member */
REM INSERTING into MID.MEMBER
SET DEFINE OFF;
Insert into MID.MEMBER (MEMBER_NUM,ID,PW,EMAIL,NAME,TEL,JOINDATE,WRITECOUNT,REG_NUMBER,GRADE) values (4,'id1','pw1','id1@.@naver.com','name1','010-4565-6644',to_date('19/11/29','RR/MM/DD'),0,'0',1);
Insert into MID.MEMBER (MEMBER_NUM,ID,PW,EMAIL,NAME,TEL,JOINDATE,WRITECOUNT,REG_NUMBER,GRADE) values (2,'young','jae','dudwo123wjs@naver.com','전영재','01088327217',to_date('19/12/02','RR/MM/DD'),1,'1',1);
Insert into MID.MEMBER (MEMBER_NUM,ID,PW,EMAIL,NAME,TEL,JOINDATE,WRITECOUNT,REG_NUMBER,GRADE) values (3,'test','test','test@.@naver.com','test','01012345678',to_date('19/12/19','RR/MM/DD'),0,'0',2);
Insert into MID.MEMBER (MEMBER_NUM,ID,PW,EMAIL,NAME,TEL,JOINDATE,WRITECOUNT,REG_NUMBER,GRADE) values (27,'afkn100','afkn100','afkn100.@naver.com','홍길동','01088320101',to_date('19/12/24','RR/MM/DD'),0,'0',1);
Insert into MID.MEMBER (MEMBER_NUM,ID,PW,EMAIL,NAME,TEL,JOINDATE,WRITECOUNT,REG_NUMBER,GRADE) values (28,'dudwo123wjs','dudwo','dudwo.@naver.com','황진희','01088327217',to_date('19/12/24','RR/MM/DD'),0,'0',1);
Insert into MID.MEMBER (MEMBER_NUM,ID,PW,EMAIL,NAME,TEL,JOINDATE,WRITECOUNT,REG_NUMBER,GRADE) values (1,'123','a','123@.@naver.com','123','01012345678',to_date('19/12/03','RR/MM/DD'),0,'1',2);
Insert into MID.MEMBER (MEMBER_NUM,ID,PW,EMAIL,NAME,TEL,JOINDATE,WRITECOUNT,REG_NUMBER,GRADE) values (29,'dudwo231wjs','dudwo231wjs','dudwo231wjs.@naver.com','한주희','010880101234',to_date('19/12/24','RR/MM/DD'),0,'0',1);
Insert into MID.MEMBER (MEMBER_NUM,ID,PW,EMAIL,NAME,TEL,JOINDATE,WRITECOUNT,REG_NUMBER,GRADE) values (26,'test123','test123','test123@naver.com','test123','010-1234-5678',to_date('19/12/24','RR/MM/DD'),0,'0',1);
Insert into MID.MEMBER (MEMBER_NUM,ID,PW,EMAIL,NAME,TEL,JOINDATE,WRITECOUNT,REG_NUMBER,GRADE) values (30,'dudwo321wjs','dudwo321wjs','dudwo321wjs.@naver.com','황현희','010-4565-6644',to_date('19/12/24','RR/MM/DD'),0,'0',1);
Insert into MID.MEMBER (MEMBER_NUM,ID,PW,EMAIL,NAME,TEL,JOINDATE,WRITECOUNT,REG_NUMBER,GRADE) values (31,'leejunsu','leejunsu','leejunsu.@naver.com','황희','01088327217',to_date('19/12/24','RR/MM/DD'),0,'0',1);
Insert into MID.MEMBER (MEMBER_NUM,ID,PW,EMAIL,NAME,TEL,JOINDATE,WRITECOUNT,REG_NUMBER,GRADE) values (32,'rkdcksgml','rkdcksgml','rkdcksgml.@naver.com','이순진','01088327010',to_date('19/12/24','RR/MM/DD'),0,'0',1);
Insert into MID.MEMBER (MEMBER_NUM,ID,PW,EMAIL,NAME,TEL,JOINDATE,WRITECOUNT,REG_NUMBER,GRADE) values (33,'adkn1123','adkn1123','adkn1123.@naver.com','나대용','010883010-',to_date('19/12/24','RR/MM/DD'),0,'0',1);
Insert into MID.MEMBER (MEMBER_NUM,ID,PW,EMAIL,NAME,TEL,JOINDATE,WRITECOUNT,REG_NUMBER,GRADE) values (34,'hansol23','hansol23','hansol23.@naver.com','조헌','01088327217',to_date('19/12/24','RR/MM/DD'),0,'0',1);
Insert into MID.MEMBER (MEMBER_NUM,ID,PW,EMAIL,NAME,TEL,JOINDATE,WRITECOUNT,REG_NUMBER,GRADE) values (35,'chanju23','chanju23','chanju23.@naver.com','정기룡','01012345678',to_date('19/12/24','RR/MM/DD'),0,'0',1);
Insert into MID.MEMBER (MEMBER_NUM,ID,PW,EMAIL,NAME,TEL,JOINDATE,WRITECOUNT,REG_NUMBER,GRADE) values (9999,'admin','admin','admin@admin.com','admin','010-8832-7217',to_date('19/12/10','RR/MM/DD'),0,'0',3);
Insert into MID.MEMBER (MEMBER_NUM,ID,PW,EMAIL,NAME,TEL,JOINDATE,WRITECOUNT,REG_NUMBER,GRADE) values (36,'daeki','daeki','daeki.@naver.com','유금필','0108832010-1',to_date('19/12/24','RR/MM/DD'),0,'0',1);
Insert into MID.MEMBER (MEMBER_NUM,ID,PW,EMAIL,NAME,TEL,JOINDATE,WRITECOUNT,REG_NUMBER,GRADE) values (37,'loollo22','loollo22','loollo22.@naver.com','성삼문','010-4565-6644',to_date('19/12/24','RR/MM/DD'),0,'0',1);
Insert into MID.MEMBER (MEMBER_NUM,ID,PW,EMAIL,NAME,TEL,JOINDATE,WRITECOUNT,REG_NUMBER,GRADE) values (38,'nobody1994','nobody1994','nobody1994.@naver.com','이혼','01088320107',to_date('19/12/24','RR/MM/DD'),0,'0',1);
Insert into MID.MEMBER (MEMBER_NUM,ID,PW,EMAIL,NAME,TEL,JOINDATE,WRITECOUNT,REG_NUMBER,GRADE) values (39,'nobody1993','nobody1993','nobody1993.@naver.com','정관장','01012345678',to_date('19/12/24','RR/MM/DD'),0,'0',1);
Insert into MID.MEMBER (MEMBER_NUM,ID,PW,EMAIL,NAME,TEL,JOINDATE,WRITECOUNT,REG_NUMBER,GRADE) values (40,'enterprice','enterprice','enterprice.@naver.com','홍삼','010-4565-6644',to_date('19/12/24','RR/MM/DD'),0,'0',1);
Insert into MID.MEMBER (MEMBER_NUM,ID,PW,EMAIL,NAME,TEL,JOINDATE,WRITECOUNT,REG_NUMBER,GRADE) values (41,'leesunsin','leesunsin','leesunsin.@naver.com','곽재우','01012345678',to_date('19/12/24','RR/MM/DD'),0,'0',1);
Insert into MID.MEMBER (MEMBER_NUM,ID,PW,EMAIL,NAME,TEL,JOINDATE,WRITECOUNT,REG_NUMBER,GRADE) values (42,'hansohee99','hansohee99','hansohee99.@naver.com','김자점','010-4565-6644',to_date('19/12/24','RR/MM/DD'),0,'0',1);
Insert into MID.MEMBER (MEMBER_NUM,ID,PW,EMAIL,NAME,TEL,JOINDATE,WRITECOUNT,REG_NUMBER,GRADE) values (43,'hanha232','hanha232','hanha232.@naver.com','김신','010883201',to_date('19/12/24','RR/MM/DD'),0,'0',1);
Insert into MID.MEMBER (MEMBER_NUM,ID,PW,EMAIL,NAME,TEL,JOINDATE,WRITECOUNT,REG_NUMBER,GRADE) values (44,'loco9989','loco9989','loco9989.@naver.com','김승현','010-4565-6644',to_date('19/12/24','RR/MM/DD'),0,'0',1);
Insert into MID.MEMBER (MEMBER_NUM,ID,PW,EMAIL,NAME,TEL,JOINDATE,WRITECOUNT,REG_NUMBER,GRADE) values (60,'computer','computer','computer.@naver.com','박근혜','01088327217',to_date('19/12/24','RR/MM/DD'),0,'0',1);
Insert into MID.MEMBER (MEMBER_NUM,ID,PW,EMAIL,NAME,TEL,JOINDATE,WRITECOUNT,REG_NUMBER,GRADE) values (61,'VictorChurchill','VictorChurchill','VictorChurchill@vic.com','Victor','02-8888-8888',to_date('19/12/24','RR/MM/DD'),0,'0',2);

/* menu */
REM INSERTING into MID.MENU
SET DEFINE OFF;
Insert into MID.MENU (MENU_NUM,MENU_NAME,MENU_CONTENTS,PRICE,ORIGIN,REST_NUM) values (1,'자장면','대한민국 대표 음식',6000,'양파 중국산',29);
Insert into MID.MENU (MENU_NUM,MENU_NAME,MENU_CONTENTS,PRICE,ORIGIN,REST_NUM) values (3,'짬뽕','얼큰하고 칼칼한 맛',7000,'양파 중국산',29);
Insert into MID.MENU (MENU_NUM,MENU_NAME,MENU_CONTENTS,PRICE,ORIGIN,REST_NUM) values (8,'라면','얼큰하고 칼칼한 맛',3000,'국내산',29);
Insert into MID.MENU (MENU_NUM,MENU_NAME,MENU_CONTENTS,PRICE,ORIGIN,REST_NUM) values (10,'오븐구이치킨','오븐에서 구운 담백한 치킨 ',13900,'국내산',29);
Insert into MID.MENU (MENU_NUM,MENU_NAME,MENU_CONTENTS,PRICE,ORIGIN,REST_NUM) values (11,'베이컨버거 ','100% 순쇠고기 패티, 아메리칸 치즈, 로메인 상추, 홈메이드 소스, 베이컨',11000,'쇠고기: 호주산, 치즈: 미국산',29);
Insert into MID.MENU (MENU_NUM,MENU_NAME,MENU_CONTENTS,PRICE,ORIGIN,REST_NUM) values (12,'클래식 샐러드','신선한 로메인에 부드러운 시저드래싱을 곁들인 샐러드',9000,'국내산',29);
Insert into MID.MENU (MENU_NUM,MENU_NAME,MENU_CONTENTS,PRICE,ORIGIN,REST_NUM) values (13,'파스타','정말 맛있는 파스타',10000,'감자 : 국산',35);
Insert into MID.MENU (MENU_NUM,MENU_NAME,MENU_CONTENTS,PRICE,ORIGIN,REST_NUM) values (14,'아이스크림','정말 시원한 아이스크림',6000,'우유 : 국내산',35);
Insert into MID.MENU (MENU_NUM,MENU_NAME,MENU_CONTENTS,PRICE,ORIGIN,REST_NUM) values (15,'뿌링 감자','정말 맛있는 감자튀김에 뿌링치즈를 곁들였다!',4500,'감자 : 국산, 치즈 : 외국산',35);
Insert into MID.MENU (MENU_NUM,MENU_NAME,MENU_CONTENTS,PRICE,ORIGIN,REST_NUM) values (16,'햄버거 & 아이스크림','아이스크림과 햄버거가 만났다!',12000,'쇠고기 : 호주산',35);
Insert into MID.MENU (MENU_NUM,MENU_NAME,MENU_CONTENTS,PRICE,ORIGIN,REST_NUM) values (17,'페코리노 아마트리치아나','베이컨과 페코리노 치즈를 넣어 풍미가 좋은 매콤한 토마토 소스의 스파게티',16500,'베이컨( 돼지고기 : 외국산)',48);
Insert into MID.MENU (MENU_NUM,MENU_NAME,MENU_CONTENTS,PRICE,ORIGIN,REST_NUM) values (18,'마레 파스타','새우, 오징어, 홍합을 넣은 새콤한 토마토 소스의 파스타',19500,'오징어 : 국내산',48);
Insert into MID.MENU (MENU_NUM,MENU_NAME,MENU_CONTENTS,PRICE,ORIGIN,REST_NUM) values (19,'딸리아따 디 만조','세 가지 멜팅 치즈와 감자를 섞은 특별한 소스를 더해 더플레이스만의 스타일로 재해석한 이탈리안 정통 스테이크',44500,'쇠고기 : 호주산',48);
Insert into MID.MENU (MENU_NUM,MENU_NAME,MENU_CONTENTS,PRICE,ORIGIN,REST_NUM) values (20,'만조 & 감베로니','이탈리안 드레싱 ''그레몰라타'' 를 곁들인 고소한 새우를 함께 즐길 수 있는 채끝등심 스테이크',35800,'쇠고기 : 호주산',48);
Insert into MID.MENU (MENU_NUM,MENU_NAME,MENU_CONTENTS,PRICE,ORIGIN,REST_NUM) values (21,'아보카도 쉬림프 오픈샌드위치','호밀빵, 사워크림, 어린잎, 과카몰리, 시즈닝새우',14000,'외국산',46);
Insert into MID.MENU (MENU_NUM,MENU_NAME,MENU_CONTENTS,PRICE,ORIGIN,REST_NUM) values (22,'그리트 밀','두가지 빵과 써니사이드업 에그, 소시지, 샐러드, 잼과 크림치즈, 홈메이드요거트 1/2',11000,'외국산',46);

/* menufiles */
REM INSERTING into MID.MENUFILES
SET DEFINE OFF;
Insert into MID.MENUFILES (FNUM,MENU_NUM,FNAME,ONAME) values (56,8,'1576131340835.png','deshes2.png');
Insert into MID.MENUFILES (FNUM,MENU_NUM,FNAME,ONAME) values (62,10,'1576462827785.jpg','food6.jpg');
Insert into MID.MENUFILES (FNUM,MENU_NUM,FNAME,ONAME) values (93,17,'1577160623646.PNG','pasta1.PNG');
Insert into MID.MENUFILES (FNUM,MENU_NUM,FNAME,ONAME) values (94,18,'1577160623684.PNG','pasta2.PNG');
Insert into MID.MENUFILES (FNUM,MENU_NUM,FNAME,ONAME) values (80,14,'1577067462551.jpg','main_visual6.jpg');
Insert into MID.MENUFILES (FNUM,MENU_NUM,FNAME,ONAME) values (81,15,'1577082222214.jpg','main_visual5.jpg');
Insert into MID.MENUFILES (FNUM,MENU_NUM,FNAME,ONAME) values (82,16,'1577082222250.jpg','main_visual6.jpg');
Insert into MID.MENUFILES (FNUM,MENU_NUM,FNAME,ONAME) values (95,19,'1577160623717.PNG','steak1.PNG');
Insert into MID.MENUFILES (FNUM,MENU_NUM,FNAME,ONAME) values (96,20,'1577160623751.PNG','steak2.PNG');
Insert into MID.MENUFILES (FNUM,MENU_NUM,FNAME,ONAME) values (97,21,'1577161151715.PNG','sandwitch1.PNG');
Insert into MID.MENUFILES (FNUM,MENU_NUM,FNAME,ONAME) values (98,22,'1577161151754.PNG','sandwitch.PNG');
Insert into MID.MENUFILES (FNUM,MENU_NUM,FNAME,ONAME) values (100,13,'1577169445078.PNG','pasta1.PNG');

/* notice */
REM INSERTING into MID.NOTICE
SET DEFINE OFF;
Insert into MID.NOTICE (NOTICE_NUM,TITLE,CONTENTS,HIT,REG_DATE,ID) values (9998,'(12/5)FoodFun 정기점검 안내','안녕하세요, Foodfun 고객 여러분.

 

매주 목요일은 Foodfun 정기점검으로 12월 5일(목) 오전 1시부터 7시까지

Foodfun 홈페이지를 이용할 수 없습니다.

 

고객 여러분들의 너그러운 양해 부탁드리며

자세한 점검시간과 작업영향은 아래 내용을 확인해 주시기 바랍니다.

 

▣ 점검시간과 작업영향

 

- 오전 1시 ~ 오전 7시(6시간)
: Foodfun 로그인을 할 수 없습니다.
: Foodfun 회원 가입/탈퇴/본인인증 서비스를 이용할 수 없습니다.
: Foodfun 서비스를 이용할 수 없습니다.
: Foodfun 홈페이지를 이용할 수 없습니다.
: 보안서비스(Foodfun-OTP)를 이용할 수 없습니다.

 

- 오전 1시 ~ 오전 9시(8시간)
: Foodfun 전환/조회 서비스를 이용할 수 없습니다.
: Foodfun 서비스를 이용할 수 없습니다.


- 오전 7시 ~ 오전 9시(2시간)
: Foodfun 고객센터 & 게임별 고객센터(1:1 문의하기)를 이용이 원활하지 않습니다.

 

안내 드리는 내용 참고하셔서 이용에 불편 없으시길 바랍니다.

 

감사합니다.',0,to_date('19/12/05','RR/MM/DD'),'admin');
Insert into MID.NOTICE (NOTICE_NUM,TITLE,CONTENTS,HIT,REG_DATE,ID) values (44,'참고해주세요!','- IE의 InPrivate 브라우징, 크롬의 시크릿 창 기능을 사용하는 경우에도 

　쿠키 정보가 삭제됩니다.',0,to_date('19/12/16','RR/MM/DD'),'admin');
Insert into MID.NOTICE (NOTICE_NUM,TITLE,CONTENTS,HIT,REG_DATE,ID) values (9999,'(12/12)FoodFun 정기점검 안내','안녕하세요, Foodfun 고객 여러분.

 

매주 목요일은 Foodfun 정기점검으로 12월 12일(목) 오전 1시부터 7시까지

Foodfun 홈페이지를 이용할 수 없습니다.

 

고객 여러분들의 너그러운 양해 부탁드리며

자세한 점검시간과 작업영향은 아래 내용을 확인해 주시기 바랍니다.

 

▣ 점검시간과 작업영향.

 

- 오전 1시 ~ 오전 7시(6시간)
: Foodfun 로그인을 할 수 없습니다.
: Foodfun 회원 가입/탈퇴/본인인증 서비스를 이용할 수 없습니다.
: Foodfun 서비스를 이용할 수 없습니다.
: Foodfun 홈페이지를 이용할 수 없습니다.
: 보안서비스(Foodfun-OTP)를 이용할 수 없습니다.

 

- 오전 1시 ~ 오전 9시(8시간)
: Foodfun 전환/조회 서비스를 이용할 수 없습니다.
: Foodfun 서비스를 이용할 수 없습니다.


- 오전 7시 ~ 오전 9시(2시간)
: Foodfun 고객센터 & 게임별 고객센터(1:1 문의하기)를 이용이 원활하지 않습니다.

 

안내 드리는 내용 참고하셔서 이용에 불편 없으시길 바랍니다.

 

감사합니다.',0,to_date('19/12/12','RR/MM/DD'),'admin');
Insert into MID.NOTICE (NOTICE_NUM,TITLE,CONTENTS,HIT,REG_DATE,ID) values (57,'로그인 기록 확인 방법','로그인 기록은 [내정보 > 보안설정 > 내 활동 기록 보기] 메뉴를 통해 확인할 수 있으며, 

''일반 로그인'' 기록과 스마트폰 등에 연동한 메일 로그인(POP3 로그인) 기록을 확인할 수 있습니다.



▶ 보안설정 페이지 바로 가기



※ 개인정보처리방침에 명시된 통신비밀보호법에 의해 조회일 기준 90일 전까지의 접속 성공 기록 제공',0,to_date('19/12/16','RR/MM/DD'),'admin');
Insert into MID.NOTICE (NOTICE_NUM,TITLE,CONTENTS,HIT,REG_DATE,ID) values (58,'로그인 상태 유지 소개','로그인 상태 유지란?



매번 로그인할 필요 없이 편리하게 로그인 상태를 유지할 수 있는 기능입니다.



로그인 상태 유지 이용 방법



로그인 상태 유지에 체크 후 로그인하시면 브라우저의 쿠키를 삭제하거나

로그아웃을 선택하기 전까지는 계속 로그인 상태가 유지됩니다.



로그인상태





단, 2주 동안 해당 PC에서 네이버를 사용하지 않는다면 로그인 상태 유지는 해제될 수 있습니다.



- 개인 정보 보호를 위해 공용 PC에서는 사용에 유의해 주시기 바랍니다.
- 일부 브라우저에서 제공하는 ‘개인정보보호 브라우징 (InPrivate 브라우징)’ 상태로 인터넷을 이용하실

  경우 쿠키가 저장되지 않아 로그인 상태 유지 기능을 사용하실 수 없습니다.


로그인 상태 유지 해제 방법



1. [로그아웃]을 클릭하시면, 로그인 상태 유지는 해제 됩니다.



2. [내정보 > 보안설정 > 로그인 목록]에서 해제를 원하는 로그인 정보에 ''연결 끊기''를 클릭하면

    해당 단말기에서의 로그인 유지 상태는 해제됩니다.



로그인 상태 유지 및 해제 설정에 오류가 발생한다면, 브라우저를 점검해 주세요.',0,to_date('19/12/16','RR/MM/DD'),'admin');
Insert into MID.NOTICE (NOTICE_NUM,TITLE,CONTENTS,HIT,REG_DATE,ID) values (59,'간편 로그인 설정 및 해제 방법','간편 로그인이란?



네이버에서 제공하는 앱 간에 로그인 정보를 공유하는 기능입니다.



- 최신 버전의 네이버앱이 설치되어 있어야 간편 로그인 기능을 사용할 수 있습니다.

- 로그아웃을 하여도 휴대전화에 정보가 남아있어 비밀번호를 다시 입력하지 않고 바로 로그인할 수 있습니다.

간편 로그인 해제 방법



타인의 정보가 간편 로그인으로 저장되어 있거나, 보안 상의 이유로 간편 로그인 사용을

원치 않으신다면 아래의 방법으로 해제해 주세요.



1. [네이버앱 홈> 하단 내 정보관리> 보안설정> 로그인 관리]에서 로그인 중인 기기의 연결을 끊어 해제할 수 있습니다. 



2. 네이버 관련 앱에서 로그아웃 시 해제를 원하는 아이디를 선택하여 삭제하시거나, 모든 간편 로그인 아이디를 삭제하여 해제할 수 있습니다.



3. 간편 로그인을 설정한 휴대폰을 분실하셨다면, PC에서 네이버로 로그인하신 후 [내정보 클릭 > 보안설정 클릭 > 비밀번호 변경]을 통해 간편 로그인을 해제하실 수 있습니다.

',0,to_date('19/12/16','RR/MM/DD'),'admin');
Insert into MID.NOTICE (NOTICE_NUM,TITLE,CONTENTS,HIT,REG_DATE,ID) values (68,'새로운 환경 로그인 알림','새로운 환경 로그인 알림이란?


회원님의 아이디를 안전하게 보호하기 위해, 평소에 사용하던 환경이 아닌 새로운 환경에서

로그인이 발생하는 경우, 알림을 발송하여 회원님의 로그인이 맞는지 확인하고 있으며,

도용 방지를 위한 알림/메일 서비스 입니다.

회원님이 로그인 하지 않으셨다면 ?


다른 사람이 회원님의 비밀번호를 사용하여 로그인에 성공했다고 볼 수 있습니다.

발송된 알림 메시지에서 “아니요” 버튼을 눌러서 최대한 빠르게 비밀번호를 변경해주셔야 합니다.

비밀번호 변경 후 기존의 로그인 연결을 모두 끊어주세요.



이상로그인



추가적인 도용 방지를 위해 보안기능을 설정해 주세요.



▶ 도용 발생 시 대처방법


내가 로그인 했는데도 알림이 발송되는 이유 ?



새로운 환경 로그인 알림은 아래와 같은 경우 메시지가 발송될 수 있습니다.



1. 휴대전화 변경 및 새로운 모바일 기기를 구매하여 로그인을 시도할 경우



2. 평소에 사용하던 기기라도 LTE망을 이용해  네이버에 로그인 할 경우

   상황에 따라 알림이 발생될 수 있습니다.



이 알림은 다른 사람으로부터 회원님의 계정을 안전하게

보호해드리기 위한 확인 절차이니, 불편하시더라도 회원님의 로그인인지 꼭 확인 부탁 드립니다.



새로운 환경 알림 수신을 원하지 않으실 경우 2단계 인증을 사용하는

방법도 있으니 아래 링크를 통해 확인해 주세요.



▶ 2단계 인증 설정



회원님의 계정을 안전하게 지킬 수 있도록 앞으로도 더욱 노력하겠습니다.',0,to_date('19/12/22','RR/MM/DD'),'admin');
Insert into MID.NOTICE (NOTICE_NUM,TITLE,CONTENTS,HIT,REG_DATE,ID) values (56,'로그인 IP 기록 열람이 안될 시 확인 방법','로그인 관리 페이지에서 제공하는 로그인 IP 정보는 회원이 로그인한

단말기(PC 또는 휴대폰)에 부여된 IP 정보를 제공하는 것입니다.

로그인한 IP 정보가 기록되지 않는 경우



- 단말기 운영체계(OS)에서 인터넷 브라우저로 로그인 시 단말기의 IP를 조회할 수 없도록 제한된 경우

- 단말기의 IP 정보가 네이버로 전달되는 과정에서 네트워크 통신사/중계 서버의 문제로 유실되는 경우

- 단말기에서 조회된 IP 정보를 네이버로 전달하는 것을 누락한 경우

  (예 : PC/맥 버전 ''라인'' 프로그램에서 로그인한 경우)

로그인한 단말기의 IP 정보와 로그인 기록의 로그인 IP 정보가 다른 경우



- 스마트폰 단말기를 통신사 네트워크 환경에서 이용할 경우

- 스마트폰에 IP를 부여하지 않고 통신사 중계 서버의 대표 IP를 사용하는 경우

- 단말기가 네트워크 공유기에 연결되어 가상의 IP를 부여받은 경우

 

이 같은 다양한 경우에 의해서 로그인한 IP가 기록되지 않거나,

실제 단말기의 IP와 다른 IP가 로그인 기록에 표시될 수 있습니다.',0,to_date('19/12/16','RR/MM/DD'),'admin');
Insert into MID.NOTICE (NOTICE_NUM,TITLE,CONTENTS,HIT,REG_DATE,ID) values (55,'외부 사이트 연결 관리','외부 사이트 연결



네이버 ID와 인증이 연결된 외부 사이트를 확인하고 관리할 수 있습니다.



외부 사이트 연결 목록은 아래 경로를 통해 확인할 수 있습니다.



* 내정보 > 보안설정 > 외부 사이트 연결



▶ 보안설정 페이지 바로 가기



1. 외부사이트 → 네이버



네이버 아이디로 로그인 등을 통해 외부사이트에서 네이버에 접근을 허용한 목록입니다.


항목을 클릭하면 상세정보를 볼 수 있으며, 원하실 경우 연결을 해제할 수 있습니다. ',0,to_date('19/12/16','RR/MM/DD'),'admin');
Insert into MID.NOTICE (NOTICE_NUM,TITLE,CONTENTS,HIT,REG_DATE,ID) values (54,'아이디/비밀번호가 자동으로 입력되는 경우 해결 방법','
아이디/비밀번호가 자동으로 입력되는 경우 해결 방법



아이디/비밀번호가 자동으로 입력되어 있다면, 

사용 중인 익스플로러에서 자동 저장 기능이 설정되어 있는 것은 아닌지 확인해 주셔야 합니다.



자동 저장 기능은 익스플로러에서 제공하는 기능이므로,

아래의 방법으로 설정을 변경하신 후 이용해 주시길 바랍니다.



1. 인터넷 익스플로러 창 상단의 메뉴에서 도구 > 인터넷 옵션 클릭

2. 일반 탭에서 검색 기록의 삭제 클릭 > 암호 체크 후 삭제

3. 내용 탭에서 자동 완성의 설정 클릭 > 양식과 양식에 사용할 사용자 이름과 암호 체크 해제

4. 설정 완료 후 인터넷 옵션 화면 하단의 적용 클릭



위와 같이 익스플로러의 설정을 변경하시면,

저장되어 있던 아이디/비밀번호가 삭제되어 정상 이용이 가능합니다.',0,to_date('19/12/16','RR/MM/DD'),'admin');
Insert into MID.NOTICE (NOTICE_NUM,TITLE,CONTENTS,HIT,REG_DATE,ID) values (53,'인터넷 익스플로러 점검 방법','아래는 회원정보를 이용하는 도중 발생할 수 있는 대표적인 오류 예시입니다.



- 올바른 로그인 정보를 입력하였으나 실패하였을 경우
- 비밀번호 변경 후 로그인을 시도했는데 로그인안되는 경우
- 로그인 상태를 유지하였으나 로그아웃이 반복되는 경우
- 본인인증 후 로그인을 실패하는 경우



브라우저 오류로 인해 원활한 서비스 이용이 어려우실 경우,

아래 단계별로 브라우저 설정 값을 점검해 보시길 권해 드립니다.

(인터넷 익스플로러 11 버전 기준)

인터넷 익스플로러 점검 방법


1. 인터넷 익스플로러의 메뉴 중 도구 > 검색 기록 삭제를 선택하신 후

  임시 인터넷 파일과 쿠키를 삭제해 주세요.

 

  단, 즐겨찾기 웹 사이트 데이터 보존 옵션이 체크된 경우 임시 인터넷 파일 및

  쿠키 삭제 작업이 정상적으로 수행되지 않을 수 있으니 반드시 체크해제 후, 진행해 주세요.',0,to_date('19/12/16','RR/MM/DD'),'admin');
Insert into MID.NOTICE (NOTICE_NUM,TITLE,CONTENTS,HIT,REG_DATE,ID) values (52,'2단계 인증 해제 방법','타인의 도용 시도로부터 계정을 보호하는 ‘2단계 인증’의 해제를 원하신다면
로그인의 가능/불가능 상황에 따라 아래의 방법을 확인해 주세요.




로그인 할 수 있다면
[내정보 > 보안설정 > 2단계 인증 > 관리하기] 페이지 하단의 ‘해제하기’ 버튼을 클릭하여 진행








2단계 인증이 되지 않아, 로그인 할 수 없다면
1) 로그인 시 알림 발송 안내 화면에서, [OTP 인증번호를 입력하여 로그인 하기] 클릭









2) 네이버앱에서 OTP 인증번호를 확인 후 입력해 다시 한 번 로그인 시도

3) OTP 인증번호로도 로그인에 실패하는 경우, OTP 인증번호 입력란 아래의 ‘2단계 인증 해제’를 클릭









4) 회원정보에 등록된 휴대전화 또는 이메일로 인증한 후 해제








※2단계 인증 해제나 비밀번호 찾기 등 비상 시 본인 확인을 위해 최신의 연락처로 업데이트하십시오.



비상 시를 위한 연락처로 인증할 수 없다면, 아래 양식에 본인 확인 정보를 기재하여 문의하실 수 있습니다.',0,to_date('19/12/16','RR/MM/DD'),'admin');
Insert into MID.NOTICE (NOTICE_NUM,TITLE,CONTENTS,HIT,REG_DATE,ID) values (51,'로그인을 허용한 지역에서 타지역/해외 로그인 차단 실행 시 해결 방법','
로그인을 허용한 지역에서 타지역/해외 로그인 차단 기능 실행 시 해결 방법


1. [내정보 > 보안설정 > 로그인 차단 설정 > 타지역 로그인 차단]에서 ‘지역선택’은 선택한 지역 외에 지역이 로그인 시 차단되는 보안설정입니다.



차단을 원하는 지역을 ‘지역선택’에 선택하셨다면, 접속 가능한 지역으로 수정 부탁 드립니다.



로그인 차단1





2. 로그인을 시도한 IP의 국가/지역 정보는 추정된 값이므로 100% 정확하지 않아 변경될 수 있습니다.



설정한 지역에서 로그인을 시도하고 있으나, 다른 지역으로 표시된다면 IP 찾기를 통해 고객님의 IP를 확인하신 후 접속 위치의 ''동''까지 주소를 함께 기재하여 문의해 주시기 바랍니다.



▶ IP 확인 페이지 바로 가기

',0,to_date('19/12/16','RR/MM/DD'),'admin');
Insert into MID.NOTICE (NOTICE_NUM,TITLE,CONTENTS,HIT,REG_DATE,ID) values (50,'사칭 사이트 구별 방법','FoodFun 사칭 사이트 구별 방법


최근 FoodFun 을사칭한 사이트로 개인 정보 탈취를 시도하는 피싱, 스미싱 사례가 발생하고 있습니다.

 

개인정보보호법에 의해 ''주민등록번호 수집 법정주의''라는 제도가 신설되었으며,

이 제도에 따라 법령 상의 근거 없이 주민등록번호를 수집할 수 없기 때문에

FoodFun에서는 절대 고객님께 주민등록번호를 요구하지 않습니다.

 

FoodFun와 관련된 화면 혹은 메시지에서 주민등록번호 등의 개인 정보를 

입력하라는 내용이 확인된다면 FoodFun에서 제공하는 보호조치 페이지가 아니니, 

피싱/스미싱 피해가 발생하지 않도록 절대 개인 정보를 입력하지 마세요.

 ',0,to_date('19/12/16','RR/MM/DD'),'admin');
Insert into MID.NOTICE (NOTICE_NUM,TITLE,CONTENTS,HIT,REG_DATE,ID) values (49,'로그인 전용 아이디로 회원 가입할 수 없는 사유','이미 한 번 사용된 로그인 전용 아이디는 회원 가입 시 사용할 수 없습니다.

로그인 전용 아이디로 회원 가입할 수 없는 사유


로그인 전용 아이디는 안전한 로그인을 위한 또 하나의 비밀번호와 같은 개념입니다.

 

누군가 사용하고 해지한 로그인 전용 아이디를 내가 설정하는 경우,

이전에 사용했던 사람이 깜빡하고 그 아이디로 다시 로그인을 시도할 수도 있는데요.

 

물론, 비밀번호가 다르기 때문에 내 계정으로 로그인할 수는 없겠지만,

혹시라도 로그인이 성공할 가능성을 배제할 수는 없습니다.

 

이러한 만일의 사태에 대비하기 위하여 한 번 설정되었던 로그인 전용 아이디는

다른 사람이 다시 사용할 수 없도록 금지하고 있습니다.

 

또한, 신규로 회원 가입을 진행하는 경우, 로그인 전용 아이디를 설정했었던

기존의 사용자가 가입하려는 것인지 확인할 수 없습니다.

 

위와 같은 이유로 새로운 사용자가 가입하려는 것으로 판단할 수 밖에 없기 때문에

기존에 사용하셨던 로그인 전용 아이디로는 회원 가입을 진행할 수 없는 점 참고해 주세요.',0,to_date('19/12/16','RR/MM/DD'),'admin');
Insert into MID.NOTICE (NOTICE_NUM,TITLE,CONTENTS,HIT,REG_DATE,ID) values (47,'로그인 전용 아이디 설정 해제 방법','로그인 전용 아이디를 분실한 경우, 

로그인 전용 아이디 자체를 확인하실 수는 없으며

아이디 찾기 페이지를 통해 로그인 전용 아이디 설정만 해제하실 수 있습니다.',0,to_date('19/12/16','RR/MM/DD'),'admin');
Insert into MID.NOTICE (NOTICE_NUM,TITLE,CONTENTS,HIT,REG_DATE,ID) values (46,'새로운 기기 로그인 알림 소개 및 설정 방법','
새로운 기기 로그인 알림이란?



고객님께서 사용한 적 없는 PC나 모바일 기기(브라우저)에서 로그인하는 기록을

회원정보에 등록된 이메일로 안내해 드리는 기능입니다.



누군가가 고객님의 아이디를 다른 기기에서 로그인하는 것이 의심된다면,

새로운 기기 로그인 알림 기능을 이용해 보세요.

새로운 기기 로그인 알림 설정 방법



내정보 접속 > 보안설정 클릭 > 새로운 기기 로그인 알림 ON 클릭',0,to_date('19/12/16','RR/MM/DD'),'admin');
Insert into MID.NOTICE (NOTICE_NUM,TITLE,CONTENTS,HIT,REG_DATE,ID) values (45,'로그인 시 기기 등록 안내 문구 노출 시 해결 방법','새로운 기기 로그인 알림 기능은 쿠키를 기반으로 제공됩니다.



이미 등록한 기기임에도 불구하고 로그인 시 기기를 등록하라는 안내가 확인된다면, 

브라우저에서 쿠키 정보 등이 지속적으로 삭제되기 때문입니다.

반복적인 기기 등록 안내 노출 시 해결 방법


브라우저 또는 PC 종료 시에도 쿠키가 삭제되지 않도록 
브라우저/툴바/클리너/백신 등의 설정과 PC 환경을 확인해 보세요.



1. 브라우저의 도구 > 인터넷 옵션 > 일반 탭

　> 검색 기록 영역의 ''종료할 때 검색 기록 삭제'' 체크 해제



2. 백신 환경 설정에서 쿠키가 자동 삭제되도록 설정되었다면

　삭제되지 않도록 재설정',0,to_date('19/12/16','RR/MM/DD'),'admin');
Insert into MID.NOTICE (NOTICE_NUM,TITLE,CONTENTS,HIT,REG_DATE,ID) values (31,'서비스 이용 중 비밀번호를 확인하라는 메시지 노출 시 해결 방법','서비스 이용 중 비밀번호를 확인하라는 메세지가 노출될 수 있습니다.

비밀번호 확인 메세지 노출



IP 보안 설정에 따른 이용자 확인 과정이므로

비밀번호를 다시 한 번 입력하시면 이 후 정상적인 서비스 이용이 가능합니다.



다만, IP 주소가 자주 변경되는 환경이라면, 

서비스 이용이 불편할 수 있으므로 IP 보안 단계를

''OFF''로 설정하신 후 이용하시면 됩니다.',0,to_date('19/12/12','RR/MM/DD'),'admin');

/* qna */
REM INSERTING into MID.QNA
SET DEFINE OFF;
Insert into MID.QNA (QNA_NUM,TITLE,CONTENTS,REG_DATE,HIT,REF,STEP,DEPTH,ID) values (186,'서비스 소개','FoodFun 나만의 경험과 지식을 글로 작성하고 
동일한 관심사를 가진 분들과 소통할 수 있는 서비스입니다.

FoodFun 에서는 사진, 동영상, 지도 등을 첨부하여 편리하게 글을 작성하실 수 있으며
이웃/서로이웃, 타 사이트 블로거와의 교류 등 다양한 소통 기능을 제공하고 있습니다.
 
경험과 정보의 공유, 그리고 소통이 가능한 네이버 블로그, 지금 시작해 보세요. ',to_date('19/12/18','RR/MM/DD'),0,186,0,0,'admin');
Insert into MID.QNA (QNA_NUM,TITLE,CONTENTS,REG_DATE,HIT,REF,STEP,DEPTH,ID) values (198,'회원탈퇴 방법을 알려주세요.','탈퇴하고싶어요',to_date('19/12/24','RR/MM/DD'),0,198,0,0,'daeki');
Insert into MID.QNA (QNA_NUM,TITLE,CONTENTS,REG_DATE,HIT,REF,STEP,DEPTH,ID) values (300,'로그아웃을 했는데도 계속 로그인 상태가 유지되고 있어요. 어떻게 해야 하나요?','로그아웃을 했는데도 계속 로그인 상태가 유지되고 있어요. 어떻게 해야 하나요?',to_date('19/12/24','RR/MM/DD'),0,300,0,0,'dudwo123wjs');
Insert into MID.QNA (QNA_NUM,TITLE,CONTENTS,REG_DATE,HIT,REF,STEP,DEPTH,ID) values (301,'오랜만에 로그인했더니, 휴면 상태라고 나와요.','오랜만에 로그인했더니, 휴면 상태라고 나와요.',to_date('19/12/24','RR/MM/DD'),0,301,0,0,'enterprice');
Insert into MID.QNA (QNA_NUM,TITLE,CONTENTS,REG_DATE,HIT,REF,STEP,DEPTH,ID) values (302,'로그아웃을 했는데도 계속 로그인 상태가 유지되고 있어요. 어떻게 해야 하나요?','로그아웃을 했는데도 계속 로그인 상태가 유지되고 있어요. 어떻게 해야 하나요?',to_date('19/12/24','RR/MM/DD'),0,302,0,0,'enterprice');
Insert into MID.QNA (QNA_NUM,TITLE,CONTENTS,REG_DATE,HIT,REF,STEP,DEPTH,ID) values (308,'오랜만에 로그인했더니, 휴면 상태라고 나와요.','오랜만에 로그인했더니, 휴면 상태라고 나와요.',to_date('19/12/18','RR/MM/DD'),0,308,0,0,'enterprice');
Insert into MID.QNA (QNA_NUM,TITLE,CONTENTS,REG_DATE,HIT,REF,STEP,DEPTH,ID) values (199,'사칭하는 스팸 메일은 어떻게 구분할 수 있나요?','사칭하는 스팸 메일은 어떻게 구분할 수 있나요?',to_date('19/12/24','RR/MM/DD'),0,199,0,0,'nobody1994');
Insert into MID.QNA (QNA_NUM,TITLE,CONTENTS,REG_DATE,HIT,REF,STEP,DEPTH,ID) values (200,'웹브라우저에서 자바스크립트 사용 설정은 어떻게 하나요?','웹브라우저에서 자바스크립트 사용 설정은 어떻게 하나요?',to_date('19/12/24','RR/MM/DD'),0,200,0,0,'nobody1994');
Insert into MID.QNA (QNA_NUM,TITLE,CONTENTS,REG_DATE,HIT,REF,STEP,DEPTH,ID) values (201,'갑자기 IP보안이라며 비밀번호 재확인 페이지가 나와요.','갑자기 IP보안이라며 비밀번호 재확인 페이지가 나와요.',to_date('19/12/24','RR/MM/DD'),0,201,0,0,'nobody1994');
Insert into MID.QNA (QNA_NUM,TITLE,CONTENTS,REG_DATE,HIT,REF,STEP,DEPTH,ID) values (202,'로그인 기록에서 ''현재 로그인 정보''가 무엇인가요','로그인 기록에서 ''현재 로그인 정보''가 무엇인가요',to_date('19/12/24','RR/MM/DD'),0,202,0,0,'nobody1994');
Insert into MID.QNA (QNA_NUM,TITLE,CONTENTS,REG_DATE,HIT,REF,STEP,DEPTH,ID) values (203,'로그인 시 ''입력한 아이디가 존재하지 않습니다. 아이디를 다시 한번 입력해 주세요.'' 라는 메시지는 무엇인가요?','로그인 시 ''입력한 아이디가 존재하지 않습니다. 아이디를 다시 한번 입력해 주세요.'' 라는 메시지는 무엇인가요?',to_date('19/12/24','RR/MM/DD'),0,203,0,0,'computer');
Insert into MID.QNA (QNA_NUM,TITLE,CONTENTS,REG_DATE,HIT,REF,STEP,DEPTH,ID) values (204,'갑자기 IP보안이라며 비밀번호 재확인 페이지가 나와요.','갑자기 IP보안이라며 비밀번호 재확인 페이지가 나와요.',to_date('19/12/24','RR/MM/DD'),0,204,0,0,'computer');
Insert into MID.QNA (QNA_NUM,TITLE,CONTENTS,REG_DATE,HIT,REF,STEP,DEPTH,ID) values (205,'오랜만에 로그인했더니, 휴면 상태라고 나와요.','오랜만에 로그인했더니, 휴면 상태라고 나와요.',to_date('19/12/24','RR/MM/DD'),0,205,0,0,'computer');
Insert into MID.QNA (QNA_NUM,TITLE,CONTENTS,REG_DATE,HIT,REF,STEP,DEPTH,ID) values (208,'이용해주셔서 감사합니다','이용해주셔서 감사합니다',to_date('19/12/24','RR/MM/DD'),0,301,1,1,'admin');
Insert into MID.QNA (QNA_NUM,TITLE,CONTENTS,REG_DATE,HIT,REF,STEP,DEPTH,ID) values (218,'페이지가 이상해요','고쳐주세요',to_date('19/12/24','RR/MM/DD'),0,218,0,0,'123');

/* reservation */
REM INSERTING into MID.RESERVATION
SET DEFINE OFF;
Insert into MID.RESERVATION (REV_NUM,MEMBER_NUM,MEMBER_NAME,REV_TIME,REST_NAME,REST_NUM,TABLE_NUM,REV_DATE,REV_STATUS) values (9,1,'123','15:00','SHAKE SHACK',35,58,'2019-12-20',0);
Insert into MID.RESERVATION (REV_NUM,MEMBER_NUM,MEMBER_NAME,REV_TIME,REST_NAME,REST_NUM,TABLE_NUM,REV_DATE,REV_STATUS) values (10,1,'123','17:00','SHAKE SHACK',35,58,'2019-12-20',0);
Insert into MID.RESERVATION (REV_NUM,MEMBER_NUM,MEMBER_NAME,REV_TIME,REST_NAME,REST_NUM,TABLE_NUM,REV_DATE,REV_STATUS) values (11,3,'test','13:00','SHAKE SHACK',35,57,'2019-12-20',0);
Insert into MID.RESERVATION (REV_NUM,MEMBER_NUM,MEMBER_NAME,REV_TIME,REST_NAME,REST_NUM,TABLE_NUM,REV_DATE,REV_STATUS) values (8,1,'123','16:00','SHAKE SHACK',35,57,'2019-12-20',0);
Insert into MID.RESERVATION (REV_NUM,MEMBER_NUM,MEMBER_NAME,REV_TIME,REST_NAME,REST_NUM,TABLE_NUM,REV_DATE,REV_STATUS) values (12,3,'test','14:00','SHAKE SHACK',35,57,'2019-12-20',0);
Insert into MID.RESERVATION (REV_NUM,MEMBER_NUM,MEMBER_NAME,REV_TIME,REST_NAME,REST_NUM,TABLE_NUM,REV_DATE,REV_STATUS) values (13,3,'test','15:00','SHAKE SHACK',35,57,'2019-12-20',0);
Insert into MID.RESERVATION (REV_NUM,MEMBER_NUM,MEMBER_NAME,REV_TIME,REST_NAME,REST_NUM,TABLE_NUM,REV_DATE,REV_STATUS) values (17,26,'test123','16:00','바이킹스 워프',30,81,'2020-01-01',0);
Insert into MID.RESERVATION (REV_NUM,MEMBER_NUM,MEMBER_NAME,REV_TIME,REST_NAME,REST_NUM,TABLE_NUM,REV_DATE,REV_STATUS) values (15,1,'123','15:00','SHAKE SHACK',35,57,'2019-12-25',0);
Insert into MID.RESERVATION (REV_NUM,MEMBER_NUM,MEMBER_NAME,REV_TIME,REST_NAME,REST_NUM,TABLE_NUM,REV_DATE,REV_STATUS) values (16,26,'test123','18:00','SHAKE SHACK',35,67,'2019-12-20',0);

/* restaurant */
REM INSERTING into MID.RESTAURANT
SET DEFINE OFF;
Insert into MID.RESTAURANT (REST_NUM,REST_NAME,REST_CONTENTS,REST_POST1,REST_ADDR1,REST_ADDR2,REST_TEL,REST_URL,KIND,REG_DATE,HIT,REVIEW_HIT,REST_TIME,REST_ACCEPT,MEMBER_NUM,REST_ID) values (29,'벽제 갈비','벽제의 경영이념은 ‘신뢰를 통한 고객 가치 창조(Close To Customer)’입니다. 지금까지도 그리고 앞으로도 벽제인들의 사명이라고 여기며 경영이념을 지켜나가겠습니다. 기업을 둘러싼 상황이 매일매일 급변해 가고 더 어려워지더라도 벽제는 일류식당으로서 고객께서 언제 방문하시더라도 즐겁고 안심할 수 있는 서비스, 편안한 분위기, 그리고 맛있고 안전한 요리를 지속적으로 제공해 나갈 것입니다. 벽제는 산지를 직접 관리하여 가장 신선하고 건강에 유익한 식재를 항상 빠르고 신선하게 공급받는 시스템을 확립하였으며, 최상의 식재를 최고의 조리사들이 성심을 다해 조리하여 내드리고 있습니다. 벽제는 모든 벽제인과 고객 여러분께 인정받는 기업이 되겠습니다. 벽제인 모두는 자신의 행동에 책임을 지고, 풍요로운 마음을 갖고 ‘고객’, ‘함께일 하는 동료’ 그리고 ‘가족’을 소중히 여기겠습니다. 벽제인들은 스스로 즐거워하며 「일류」를 목표로 성심을 다해 나가겠습니다. 벽제인은 이 일을 오래 도록 계승하려는 의지를 갖고 있으며, 회사가 성장하면 벽제인 모두의 꿈도 이루어 질 수 있다는 신념을 가지고 미래를 향해 정진해 나가겠습니다.','5639','서울 송파구 양재대로71길 1-4',null,'02-415-5522','http://www.bjgalbi.com/','한식',to_date('19/12/13','RR/MM/DD'),1297,0,'월 - 금 : 11:00 ~ 21:00, 토 - 일 : 11:00 ~ 23:00',150,1,'123');
Insert into MID.RESTAURANT (REST_NUM,REST_NAME,REST_CONTENTS,REST_POST1,REST_ADDR1,REST_ADDR2,REST_TEL,REST_URL,KIND,REG_DATE,HIT,REVIEW_HIT,REST_TIME,REST_ACCEPT,MEMBER_NUM,REST_ID) values (30,'바이킹스 워프','샌프란시스코의 Fisherman''s Wharf(피셔맨스 워프)를 모티브로
해산물들이 눈 앞에 펼쳐져 마치 해안가에 와 있는 듯한 경험을 선사합니다.

캐나다와 미국으로부터 직접 공수한 랍스터를 무제한으로,
수십가지 제철 자연산 해산물을 건강하게 즐기실 수 있습니다.

매일 매일 신선한 해산물로 푸른 바다의 향에 빠져보세요.','5551','서울 송파구 올림픽로 300','롯데월드 캐쥬얼동 4층','1644-3210','http://www.ivikings.co.kr/akg/ko/storetype/wharf.asp','한식',to_date('19/12/13','RR/MM/DD'),694,0,'365일 연중 무휴 11:00 ~ 23:00',300,1,'123');
Insert into MID.RESTAURANT (REST_NUM,REST_NAME,REST_CONTENTS,REST_POST1,REST_ADDR1,REST_ADDR2,REST_TEL,REST_URL,KIND,REG_DATE,HIT,REVIEW_HIT,REST_TIME,REST_ACCEPT,MEMBER_NUM,REST_ID) values (35,'SHAKE SHACK','Stand For Something good
쉐이크쉑은 프리미엄 식재료를 사용한 클래식 아메리칸 스타일의 메뉴를 제공하는 파인 캐주얼 레스토랑입니다.
프리미엄 버거, 플랫탑 도그, 크링클 컷 프라이, 신선한 커스터드, 에일 맥주, 와인 등을 함께 즐길 수 있을 뿐만 아니라 쉑에 방문한 모든 분들을 내 집에 머물러 온 게스트로서 응대하며 따뜻한 호스피탈리티를 제공합니다.
이처럼 쉐이크쉑은 늘 활기가 넘치고 긍정적인 분위기가 가득한 사람들의 커뮤니티 개더링 공간입니다.','6123','서울 강남구 강남대로 452','대연빌딩 1층','02-553-5576','http://www.shakeshack.kr/index.jsp','한식',to_date('19/12/18','RR/MM/DD'),633,0,'10:00 ~ 24:00',50,1,'123');
Insert into MID.RESTAURANT (REST_NUM,REST_NAME,REST_CONTENTS,REST_POST1,REST_ADDR1,REST_ADDR2,REST_TEL,REST_URL,KIND,REG_DATE,HIT,REVIEW_HIT,REST_TIME,REST_ACCEPT,MEMBER_NUM,REST_ID) values (40,'Victor Churchill','호주 명품 레스토랑 빅터처칠 Victor Churchill ''한 덩이의 고기도 루이비통처럼 팔아라'' 라는 도서에서 말해주고 있는 하이엔드 전략의 대표적인 Victor Churchill ''루이비통''을 파는 레스토랑??  바로 Victor Churchill Victor Churchill은 1876년 설립된 레스토랑으로 창업주인 제임스 처칠의 이름을 따서 ''처칠스 부처 숍''으로 시작되었습니다.  2009년 호주의 육가공업체 ''빅스미트''에 인수되면서 이름이 지금의 빅터처칠로 바뀌었습니다.   [음식 종류] : 스테이크    와인    바베큐   훈제     각종 육류 및 육가공품 판매 전문점 레스토랑 Victor Churchill','02824','서울 성북구 성북로14라길 16','빅터밀딩 1층','02-8888-5882','https://victorchurchill.com/','양식',to_date('19/12/18','RR/MM/DD'),565,0,'365일 연중 무휴 11:00 ~ 23:00',100,1,'123');
Insert into MID.RESTAURANT (REST_NUM,REST_NAME,REST_CONTENTS,REST_POST1,REST_ADDR1,REST_ADDR2,REST_TEL,REST_URL,KIND,REG_DATE,HIT,REVIEW_HIT,REST_TIME,REST_ACCEPT,MEMBER_NUM,REST_ID) values (41,'감성타코합정점','합정에 위치한 타코 전문점. 인기메뉴는 ''감성 그릴드 파히타''로 2인 메뉴다. 소고기와 돼지고기, 칠리새우와 미트볼, 야채 등으로 이루어져 있고 직접 또띠아에 싸먹으면 된다. 특히, 화로브릿지로 식지않고 계속해서 따뜻하게 먹을 수 있다. 이외에도 브리또, 감자튀김 등 다양한 멕시코 음식을 즐길 수 있다. 큰 테이블이 있어 단체 손님도 받을 수 있으니 참고할 ','04024','서울 마포구 월드컵로3길 14','합정역 8번출구에서 7분거리에 위치한 프루지오 2차에 위치','02-332-8836','https://www.siksinhot.com/P/482203','양식',to_date('19/12/18','RR/MM/DD'),819,0,'매장 영업시간 11:30 ~ 23:00',50,1,'123');
Insert into MID.RESTAURANT (REST_NUM,REST_NAME,REST_CONTENTS,REST_POST1,REST_ADDR1,REST_ADDR2,REST_TEL,REST_URL,KIND,REG_DATE,HIT,REVIEW_HIT,REST_TIME,REST_ACCEPT,MEMBER_NUM,REST_ID) values (42,'위볼','매장소개 로제미트볼과 파스타, 피자가 맛있는 집 // 내부는 깔끔한 우드소재로 이루어져있으며, 테이블과 인테리어에 많은 조화로움이 보이는 식당  // 단체석 준비 되어있으며 주 메뉴로는 페퍼로니 피자, 청양 크림파스타, 위볼의 대표메뉴인 로제 미트볼 등 많은 메뉴가 준비되어 있습니다.','04018','서울 마포구 동교로9길 10','망원동 386-11 지층','02-333-2555',null,'양식',to_date('19/12/18','RR/MM/DD'),234,0,'평일 11:30 - 22:00Break 15:00~17:30 / 라스트오더 21:00',60,3,'test');
Insert into MID.RESTAURANT (REST_NUM,REST_NAME,REST_CONTENTS,REST_POST1,REST_ADDR1,REST_ADDR2,REST_TEL,REST_URL,KIND,REG_DATE,HIT,REVIEW_HIT,REST_TIME,REST_ACCEPT,MEMBER_NUM,REST_ID) values (43,'감성바베큐	','감성바베큐는 감각적인 바베큐음식을 만드는 감성바베큐입니다','04026','서울시 마포구 합정동 473','합정동 473','02-337-8788','https://www.siksinhot.com/P/224166','양식',to_date('19/12/18','RR/MM/DD'),186,0,'평일 11:30 - 23:00B.T 15:00-17:00 , L.O 22:00',80,3,'test');
Insert into MID.RESTAURANT (REST_NUM,REST_NAME,REST_CONTENTS,REST_POST1,REST_ADDR1,REST_ADDR2,REST_TEL,REST_URL,KIND,REG_DATE,HIT,REVIEW_HIT,REST_TIME,REST_ACCEPT,MEMBER_NUM,REST_ID) values (44,'아우룸','안녕하세요 합정에 위치한 아우룸입니다 :) 

정직하게 맛있게 예쁘게 만든 음식들을 정성을 담아 손님들에게 제공하고 있습니다.
각종 데이트, 모임, 회식, 소개팅 장소로 제격입니다. 

연예인들 영화배우분들이 비밀데이트를 하러 많이 오실만큼 
프라이빗하고 좋은 분위기입니다. 

맛이면 맛 서비스면 서비스 뭐 하나 빠지지 않는 아우룸 찾아주시면 
선택 잘하셨다는 생각 드릴 수 있게 최선을 다하겠습니다 :)','04025','서울 마포구 월드컵로5길 33-26','합정동 389-14','02-6105-0707','https://www.siksinhot.com/P/980401','양식',to_date('19/12/18','RR/MM/DD'),230,0,'평일 11:30 - 24:00',100,3,'test');
Insert into MID.RESTAURANT (REST_NUM,REST_NAME,REST_CONTENTS,REST_POST1,REST_ADDR1,REST_ADDR2,REST_TEL,REST_URL,KIND,REG_DATE,HIT,REVIEW_HIT,REST_TIME,REST_ACCEPT,MEMBER_NUM,REST_ID) values (45,'첸토페르첸토','첸토 페르 첸토 서울 마포구 서교동 382-14 평일 12:00 - 21:30break time 14:30~18:00 주말 12:00 - 21:30break time 15:00~17:00 월요일 휴무 ☎ 02-334-8622 까로짜 튀김 소고기 부타네스카 생면 세트 알 아마트리치아나 세트 스튜만조 세트 등 다양한 메뉴 준비되어있으며, 첸토페르첸토 CENTO PER CENTO 맛있는 그리고 분위기 좋은 혼밥집 발견! 합정에서 볼 일을 보고 마침 식사시간이 되어 어디에서 무얼 먹을까 고민하던 중 눈에 들어온 메뉴 바로 ''스튜'' 지금 있는 곳에서 멀지 않은 곳에서 이 곳 첸토페르첸토에서 맛보실 수 있습니다.','04036','서울 마포구 양화로 45','서교동 490 메세나폴리스 지하1층','02-334-8622','https://www.siksinhot.com/P/1082755','양식',to_date('19/12/18','RR/MM/DD'),499,0,'평일 12:00 - 21:30break time 14:30~18:00',50,3,'test');
Insert into MID.RESTAURANT (REST_NUM,REST_NAME,REST_CONTENTS,REST_POST1,REST_ADDR1,REST_ADDR2,REST_TEL,REST_URL,KIND,REG_DATE,HIT,REVIEW_HIT,REST_TIME,REST_ACCEPT,MEMBER_NUM,REST_ID) values (46,'그리트','Eat Fresh, Stay Healthy 신선한 재료로 매일 조리하는 건강한 멕시칸','03997','서울 마포구 성미산로6길 53','서교동 473-25 1층','02-6952-1021','https://www.siksinhot.com/P/1207333','양식',to_date('19/12/18','RR/MM/DD'),185,0,'매일 10:30 - 22:00',80,3,'test');
Insert into MID.RESTAURANT (REST_NUM,REST_NAME,REST_CONTENTS,REST_POST1,REST_ADDR1,REST_ADDR2,REST_TEL,REST_URL,KIND,REG_DATE,HIT,REVIEW_HIT,REST_TIME,REST_ACCEPT,MEMBER_NUM,REST_ID) values (47,'더메리어','’건강하게 즐기며 먹자’를 테마로  신선한 제철 식재료를 통해  꾸밈없는 본연의 맛을 살린 레시피로 만듭니다. 또한 공간은 단체 모임, 파티, 북토크, 공연, 전시, 촬영 대관이 가능하도록 넓고 깔끔하게 스타일링 되어있습니다','04044','서울 마포구 양화로8길 17-25 1층','서교동 395-183 1층','02-335-3600','https://www.siksinhot.com/P/1067360','양식',to_date('19/12/18','RR/MM/DD'),186,0,'평일 12:00 - 15:00LUNCH(L.O. 14:30)',70,3,'test');
Insert into MID.RESTAURANT (REST_NUM,REST_NAME,REST_CONTENTS,REST_POST1,REST_ADDR1,REST_ADDR2,REST_TEL,REST_URL,KIND,REG_DATE,HIT,REVIEW_HIT,REST_TIME,REST_ACCEPT,MEMBER_NUM,REST_ID) values (48,'더플레이스 합정점','★지금 네이버로 예약하고 더플레이스에 방문하시면 에이드 1잔을 무료로 드립니다 ! ★      //     11월 1일 ~ 12월 22일 채끝스테이크 50%+리코타샐러드 30% 할인 행사 진행','4029','서울 마포구 월드컵로1길 14','합정동 472','02-336-0421','https://www.italiantheplace.co.kr:7022/default.asp','패밀리 레스토랑',to_date('19/12/18','RR/MM/DD'),250,0,'매일 11:00 - 22:00',60,3,'test');

/* restfiles */
REM INSERTING into MID.RESTFILES
SET DEFINE OFF;
Insert into MID.RESTFILES (FNUM,REST_NUM,FNAME,ONAME) values (76,39,'1576722125203.jpg','nishinokana3.jpg');
Insert into MID.RESTFILES (FNUM,REST_NUM,FNAME,ONAME) values (77,44,'1577065783325.jpg','mina.jpg');
Insert into MID.RESTFILES (FNUM,REST_NUM,FNAME,ONAME) values (78,44,'1577065783350.jpg','nishinokana.jpg');
Insert into MID.RESTFILES (FNUM,REST_NUM,FNAME,ONAME) values (83,29,'1577096406395.jpg','nishinokana.jpg');
Insert into MID.RESTFILES (FNUM,REST_NUM,FNAME,ONAME) values (84,29,'1577096406415.jpg','nishinokana2.jpg');
Insert into MID.RESTFILES (FNUM,REST_NUM,FNAME,ONAME) values (85,35,'1577147313929.jpg','sana.jpg');
Insert into MID.RESTFILES (FNUM,REST_NUM,FNAME,ONAME) values (89,30,'1577148770768.jpg','twice2.jpg');
Insert into MID.RESTFILES (FNUM,REST_NUM,FNAME,ONAME) values (90,30,'1577148770789.jpg','twice3.jpg');
Insert into MID.RESTFILES (FNUM,REST_NUM,FNAME,ONAME) values (86,35,'1577147313949.jpg','sana2.jpg');
Insert into MID.RESTFILES (FNUM,REST_NUM,FNAME,ONAME) values (88,30,'1577148770734.jpg','twice.jpg');
Insert into MID.RESTFILES (FNUM,REST_NUM,FNAME,ONAME) values (75,39,'1576722125176.jpg','nishinokana2.jpg');
Insert into MID.RESTFILES (FNUM,REST_NUM,FNAME,ONAME) values (92,48,'1577159922051.jpg','nishinokana2.jpg');
Insert into MID.RESTFILES (FNUM,REST_NUM,FNAME,ONAME) values (99,48,'1577161259211.jpg','nishinokana.jpg');

/* resttables */
REM INSERTING into MID.RESTTABLE
SET DEFINE OFF;
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (57,4,'11:00','22:00',35,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (58,4,'11:00','22:00',35,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (59,4,'11:00','22:00',35,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (60,4,'11:00','22:00',35,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (61,4,'11:00','22:00',35,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (73,4,'11:00','21:00',29,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (74,4,'11:00','21:00',29,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (75,4,'11:00','21:00',29,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (76,4,'11:00','23:00',29,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (77,4,'11:00','23:00',29,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (67,2,'11:00','22:00',35,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (68,2,'11:00','22:00',35,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (69,2,'11:00','22:00',35,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (70,2,'11:00','22:00',35,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (71,4,'11:00','21:00',29,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (72,4,'11:00','21:00',29,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (78,4,'11:00','23:00',29,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (79,4,'11:00','23:00',29,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (80,4,'11:00','23:00',29,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (81,2,'11:00','23:00',30,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (82,2,'11:00','23:00',30,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (83,2,'11:00','23:00',30,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (84,2,'11:00','23:00',30,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (85,4,'11:00','23:00',30,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (86,4,'11:00','23:00',30,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (87,4,'11:00','23:00',30,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (88,4,'11:00','23:00',30,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (89,4,'11:00','23:00',30,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (90,4,'11:00','23:00',30,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (91,2,'11:00','22:00',48,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (92,2,'11:00','22:00',48,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (93,2,'11:00','22:00',48,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (94,2,'11:00','22:00',48,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (95,4,'11:00','22:00',48,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (96,4,'11:00','22:00',48,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (97,4,'11:00','22:00',48,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (98,4,'11:00','22:00',48,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (99,4,'10:00','20:00',47,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (100,4,'10:00','20:00',47,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (101,4,'10:00','20:00',47,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (102,4,'10:00','20:00',47,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (103,4,'10:00','20:00',47,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (104,4,'10:00','22:00',46,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (105,4,'10:00','22:00',46,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (106,4,'10:00','22:00',46,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (107,4,'10:00','22:00',46,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (108,4,'10:00','22:00',46,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (109,4,'10:00','22:00',46,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (110,4,'10:00','22:00',46,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (111,4,'10:00','22:00',46,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (112,4,'12:00','22:00',45,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (113,4,'12:00','22:00',45,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (114,4,'12:00','22:00',45,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (115,4,'12:00','22:00',45,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (116,4,'12:00','22:00',45,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (117,4,'12:00','22:00',45,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (118,4,'12:00','22:00',45,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (119,4,'12:00','22:00',45,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (120,4,'10:00','21:00',44,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (121,4,'10:00','21:00',44,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (122,4,'10:00','21:00',44,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (123,4,'10:00','21:00',44,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (124,4,'10:00','21:00',44,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (125,4,'10:00','21:00',44,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (126,4,'10:00','21:00',44,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (127,4,'10:00','21:00',44,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (128,4,'10:00','21:00',44,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (129,4,'10:00','21:00',44,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (130,4,'11:00','22:00',42,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (131,4,'11:00','22:00',42,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (132,4,'11:00','22:00',42,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (133,4,'11:00','22:00',42,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (134,4,'11:00','22:00',42,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (135,4,'11:00','22:00',42,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (136,4,'11:00','22:00',42,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (137,4,'11:00','22:00',42,3);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (138,2,'11:00','23:00',41,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (139,2,'11:00','23:00',41,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (140,2,'11:00','23:00',41,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (141,2,'11:00','23:00',41,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (142,2,'11:00','23:00',41,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (143,2,'11:00','23:00',41,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (144,2,'11:00','23:00',41,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (145,2,'11:00','23:00',41,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (146,2,'11:00','23:00',41,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (147,2,'11:00','23:00',41,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (148,4,'11:00','23:00',40,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (149,4,'11:00','23:00',40,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (150,4,'11:00','23:00',40,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (151,4,'11:00','23:00',40,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (152,4,'11:00','23:00',40,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (153,4,'11:00','23:00',40,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (154,4,'11:00','23:00',40,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (155,4,'11:00','23:00',40,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (156,4,'11:00','23:00',40,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (157,4,'11:00','23:00',40,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (158,4,'11:00','23:00',40,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (159,4,'11:00','23:00',40,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (160,4,'11:00','23:00',40,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (161,4,'11:00','23:00',40,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (162,4,'11:00','23:00',40,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (163,4,'11:00','23:00',40,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (164,3,'11:00','23:00',35,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (165,3,'11:00','23:00',35,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (166,3,'11:00','23:00',35,1);
Insert into MID.RESTTABLE (TABLE_NUM,TABLE_USER,OPEN_TIME,CLOSE_TIME,REST_NUM,MEMBER_NUM) values (167,3,'11:00','23:00',35,1);

/* review */
REM INSERTING into MID.REVIEW
SET DEFINE OFF;
Insert into MID.REVIEW (REVIEW_NUM,WRITER,SCORE,CONTENTS,REG_DATE,MEMBER_NUM,REST_NUM) values (26,'name1',3,'괜찮아요',to_date('19/12/19','RR/MM/DD'),4,29);
Insert into MID.REVIEW (REVIEW_NUM,WRITER,SCORE,CONTENTS,REG_DATE,MEMBER_NUM,REST_NUM) values (27,'name1',4,'좋아요',to_date('19/12/19','RR/MM/DD'),4,30);
Insert into MID.REVIEW (REVIEW_NUM,WRITER,SCORE,CONTENTS,REG_DATE,MEMBER_NUM,REST_NUM) values (40,'123',5,'맛있어요',to_date('19/12/20','RR/MM/DD'),1,29);
Insert into MID.REVIEW (REVIEW_NUM,WRITER,SCORE,CONTENTS,REG_DATE,MEMBER_NUM,REST_NUM) values (46,'test',5,'정말 맛있어요!',to_date('19/12/24','RR/MM/DD'),3,48);
Insert into MID.REVIEW (REVIEW_NUM,WRITER,SCORE,CONTENTS,REG_DATE,MEMBER_NUM,REST_NUM) values (47,'hi',3,'별로에요...',to_date('19/12/24','RR/MM/DD'),3,48);
Insert into MID.REVIEW (REVIEW_NUM,WRITER,SCORE,CONTENTS,REG_DATE,MEMBER_NUM,REST_NUM) values (25,'name1',2,'별로예요 ',to_date('19/12/19','RR/MM/DD'),4,29);
Insert into MID.REVIEW (REVIEW_NUM,WRITER,SCORE,CONTENTS,REG_DATE,MEMBER_NUM,REST_NUM) values (48,'bye',1,'최악이에요!',to_date('19/12/20','RR/MM/DD'),3,48);
Insert into MID.REVIEW (REVIEW_NUM,WRITER,SCORE,CONTENTS,REG_DATE,MEMBER_NUM,REST_NUM) values (49,'taster',3,'그저 그렇습니다',to_date('19/12/22','RR/MM/DD'),3,48);
Insert into MID.REVIEW (REVIEW_NUM,WRITER,SCORE,CONTENTS,REG_DATE,MEMBER_NUM,REST_NUM) values (50,'viva',3,'먹을만해요',to_date('19/12/20','RR/MM/DD'),3,48);
