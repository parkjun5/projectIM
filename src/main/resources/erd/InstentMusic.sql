
/* Drop Triggers */

DROP TRIGGER TRI_Comment_com_number;
DROP TRIGGER TRI_Customer_cust_number;
DROP TRIGGER TRI_Follow_fol_number;
DROP TRIGGER TRI_Key_Sound_key_number;
DROP TRIGGER TRI_Letter_let_number;
DROP TRIGGER TRI_like_click_like_number;
DROP TRIGGER TRI_Like_like_number;
DROP TRIGGER TRI_Member_mem_number;
DROP TRIGGER TRI_Music_Library_mus_number;
DROP TRIGGER TRI_Notification_not_number;
DROP TRIGGER TRI_Post_post_number;
DROP TRIGGER TRI_Post_tag_pt_number;
DROP TRIGGER TRI_recv_letter_let_number;
DROP TRIGGER TRI_Reply_rep_number;
DROP TRIGGER TRI_send_letter_let_number;
DROP TRIGGER TRI_Sound_Library_sou_number;
DROP TRIGGER TRI_Sound_mike_mike_number;
DROP TRIGGER TRI_Tag_tag_number;
DROP TRIGGER TRI_Temporary_temp_number;
DROP TRIGGER TRI_Temp_temp_number;
DROP TRIGGER TRI_User_user_number;



/* Drop Tables */

DROP TABLE Notification CASCADE CONSTRAINTS;
DROP TABLE Follow CASCADE CONSTRAINTS;
DROP TABLE letter CASCADE CONSTRAINTS;
DROP TABLE like_click CASCADE CONSTRAINTS;
DROP TABLE Reply CASCADE CONSTRAINTS;
DROP TABLE Customer CASCADE CONSTRAINTS;
DROP TABLE Temp CASCADE CONSTRAINTS;
DROP TABLE Key_Sound CASCADE CONSTRAINTS;
DROP TABLE Post_tag CASCADE CONSTRAINTS;
DROP TABLE Post CASCADE CONSTRAINTS;
DROP TABLE Music_Library CASCADE CONSTRAINTS;
DROP TABLE Sound_Library CASCADE CONSTRAINTS;
DROP TABLE Tag CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_Comment_com_number;
DROP SEQUENCE SEQ_Customer_cust_number;
DROP SEQUENCE SEQ_Follow_fol_number;
DROP SEQUENCE SEQ_Key_Sound_key_number;
DROP SEQUENCE SEQ_Letter_let_number;
DROP SEQUENCE SEQ_like_click_like_number;
DROP SEQUENCE SEQ_Like_like_number;
DROP SEQUENCE SEQ_Member_mem_number;
DROP SEQUENCE SEQ_Music_Library_mus_number;
DROP SEQUENCE SEQ_Notification_not_number;
DROP SEQUENCE SEQ_Post_post_number;
DROP SEQUENCE SEQ_Post_tag_pt_number;
DROP SEQUENCE SEQ_recv_letter_let_number;
DROP SEQUENCE SEQ_Reply_rep_number;
DROP SEQUENCE SEQ_send_letter_let_number;
DROP SEQUENCE SEQ_Sound_Library_sou_number;
DROP SEQUENCE SEQ_Sound_mike_mike_number;
DROP SEQUENCE SEQ_Tag_tag_number;
DROP SEQUENCE SEQ_Temporary_temp_number;
DROP SEQUENCE SEQ_Temp_temp_number;
DROP SEQUENCE SEQ_User_user_number;




/* Create Sequences */

CREATE SEQUENCE SEQ_Comment_com_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Customer_cust_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Follow_fol_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Key_Sound_key_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Letter_let_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_like_click_like_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Like_like_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Member_mem_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Music_Library_mus_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Notification_not_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Post_post_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Post_tag_pt_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_recv_letter_let_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Reply_rep_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_send_letter_let_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Sound_Library_sou_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Sound_mike_mike_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Tag_tag_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Temporary_temp_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Temp_temp_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_User_user_number INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE Customer
(
	-- ????????? ????????????. ???????????? ????????? ?????? ??????
	cust_number number NOT NULL,
	-- ?????????????????? ?????? ?????????
	cust_id varchar2(30) NOT NULL UNIQUE,
	-- ?????????????????? ?????? ????????????
	cust_password varchar2(30) NOT NULL,
	-- ???????????? ????????? ????????? ?????? ?????? ?????????
	cust_email varchar2(50) NOT NULL,
	-- ????????? ????????? ????????? ????????? ?????????
	cust_nickname varchar2(20) NOT NULL UNIQUE,
	-- ????????? ?????? ???????????? ????????? ???????????? ??????
	cust_introduce varchar2(1000),
	-- ????????? ???????????? ????????? ????????? ?????? ?????? ??????
	cust_photo_original varchar2(500),
	-- ?????? ????????? ????????? ???????????? ????????? ?????? ??????
	cust_photo_saved varchar2(500),
	-- ???????????? ????????? ???????????? ???
	cust_key varchar2(80),
	PRIMARY KEY (cust_number)
);


CREATE TABLE Follow
(
	-- ????????? ???????????? ?????? ??????. ?????????.
	fol_number number NOT NULL,
	-- ???????????? ?????? ??????. Member table ??????
	follower_number number NOT NULL,
	-- ???????????? ?????? ??????. member ????????? ??????
	follow_number number NOT NULL,
	PRIMARY KEY (fol_number)
);


CREATE TABLE Key_Sound
(
	-- ?????? ???????????? ?????? ??????
	key_number number NOT NULL,
	-- ?????? ?????? ???????????? ?????? ??????
	cust_number number,
	-- ????????? ????????? ?????? ????????? ??????
	key_board varchar2(30) NOT NULL,
	-- ????????? ????????? ?????? ?????? ?????????
	sou_number number NOT NULL,
	-- ?????? ???????????? ?????? ??????
	sou_name varchar2(30) NOT NULL,
	-- ????????? ???????????? ??? ??????
	key_name varchar2(2) NOT NULL,
	PRIMARY KEY (key_number)
);


CREATE TABLE letter
(
	-- ????????? ?????? ?????? ?????????
	let_number number NOT NULL,
	-- ????????? ?????? ?????? ??????. member ??????
	send_number number NOT NULL,
	-- ????????? ?????? ?????? ??????. member ??????
	recv_number number NOT NULL,
	-- ?????? ?????? ??????
	let_title varchar2(50) NOT NULL,
	-- ?????? ??????
	let_content varchar2(1000) NOT NULL,
	-- ????????? ???????????? ??????. ????????? 1
	recv_check nchar DEFAULT '0' NOT NULL,
	-- ???,?????? ??????
	let_date date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (let_number)
);


CREATE TABLE like_click
(
	-- ????????? ?????? ?????? ?????????
	like_number number NOT NULL,
	-- ???????????? ?????? ????????? ?????? ??????
	cust_number number NOT NULL,
	-- ???????????? ?????? ???????????? ????????? ????????? ?????? ??????
	target_number number NOT NULL,
	-- ???????????? ?????? ?????? ?????????
	post_number number NOT NULL,
	-- 0. ????????? ??????, 1.????????? ??????
	likt_type nchar DEFAULT '0' NOT NULL,
	PRIMARY KEY (like_number)
);


CREATE TABLE Music_Library
(
	-- ????????? ?????? ?????? ?????????
	mus_number number NOT NULL,
	-- ????????? ????????? ????????????. ??????
	cust_number number NOT NULL,
	-- ?????? ??????
	mus_title varchar2(50) NOT NULL,
	-- ????????? ??? ??????
	mus_time varchar2(10) NOT NULL,
	-- ?????? ????????? ?????? ??????
	mus_saved varchar2(500) NOT NULL,
	-- ????????? ??????
	mus_date date NOT NULL,
	PRIMARY KEY (mus_number)
);


CREATE TABLE Notification
(
	-- ?????? ?????? ?????? ?????????
	not_number number NOT NULL,
	-- ????????? ?????? ?????? ??????
	recv_number number NOT NULL,
	-- ?????? ????????? ????????? ??????, ??????, ????????? ?????? ????????? ?????? ????????? ??????
	send_number number NOT NULL,
	-- ????????? ?????? ??? ????????? ???????????? ?????? ??????. ?????????.
	fol_number number,
	-- ????????? ?????? ??? ????????? ?????? ?????? ?????????
	let_number number,
	-- ????????? ?????? ??? ?????? ?????? ?????? ?????????
	rep_number number,
	-- ????????? ?????? ??? ????????? ?????? ?????? ?????????
	like_number number,
	-- comment, letter, like, follow ?????? ?????? ??????
	not_type varchar2(30) NOT NULL,
	-- ?????? ????????? ????????? ?????? ??????
	not_url varchar2(500) NOT NULL,
	-- ?????? ????????? ??????
	not_time date DEFAULT sysdate NOT NULL,
	-- ????????? ??????????????? ??????
	not_check nchar DEFAULT '0',
	PRIMARY KEY (not_number)
);


CREATE TABLE Post
(
	-- ???????????? ?????? ?????? ?????????
	post_number number NOT NULL,
	-- ???????????? ???????????? ????????? ?????? ??????
	mus_number number NOT NULL,
	-- ???????????? ????????? ????????? ?????? ??????. ???????????? ??????
	cust_number number NOT NULL,
	-- ?????? ???????????? ????????? ??????
	mus_title varchar2(50) NOT NULL,
	-- ????????? ??? ??????
	mus_time varchar2(10) NOT NULL,
	-- ????????? ??????
	post_content varchar2(3000),
	-- ???????????? ?????????
	post_nickname varchar2(20) NOT NULL,
	-- ???????????? ????????? ??????
	post_url varchar2(500) NOT NULL,
	-- ????????? ?????? ??????
	post_date date NOT NULL,
	-- ???????????? ?????? ?????? ???
	post_reply number DEFAULT 0 NOT NULL,
	-- ???????????? ????????? ??????
	post_like number DEFAULT 0 NOT NULL,
	-- ?????? ???????????? ????????? ??????
	post_play number DEFAULT 0 NOT NULL,
	-- ???????????? ????????? ???????????? ?????? ??????
	post_original varchar2(500),
	-- ???????????? ????????? ???????????? ?????? ??????
	post_saved varchar2(500),
	PRIMARY KEY (post_number)
);


CREATE TABLE Post_tag
(
	-- ???????????? ????????? ?????? ?????? ?????????
	pt_number number NOT NULL,
	-- ?????? ???????????? ?????????
	tag_number number NOT NULL,
	-- ???????????? ?????? ?????? ?????????
	post_number number NOT NULL,
	PRIMARY KEY (pt_number)
);


CREATE TABLE Reply
(
	-- ?????? ?????? ?????? ?????????
	rep_number number NOT NULL,
	-- ????????? ?????? ???????????? ?????? ??????
	post_number number NOT NULL,
	-- ????????? ????????? ????????? ????????????. 
	cust_number number NOT NULL,
	-- ?????? ??????
	rep_content varchar2(1000) NOT NULL,
	-- ????????? ????????? ????????? ?????????
	rep_nickname varchar2(30) NOT NULL,
	-- ????????? ????????? ????????? ????????? ??????
	rep_url varchar2(500) NOT NULL,
	-- ?????? ?????? ??????
	rep_date date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (rep_number)
);


CREATE TABLE Sound_Library
(
	-- ????????? ????????? ?????? ?????? ?????????
	sou_number number NOT NULL,
	-- ????????? ????????? ????????? ?????? ??????. ??????
	cust_number number,
	-- ?????????, ??????, ??????, ????????? ?????? ???
	sou_type varchar2(30) NOT NULL,
	-- ?????? ?????? ?????? ??????
	sou_name varchar2(30) NOT NULL,
	-- ?????? ?????? ?????? ??????
	sou_saved varchar2(500) NOT NULL,
	PRIMARY KEY (sou_number)
);


CREATE TABLE Tag
(
	-- ?????? ???????????? ?????????
	tag_number number NOT NULL,
	-- ?????? ??????
	tag_name varchar2(50) NOT NULL,
	PRIMARY KEY (tag_number)
);


CREATE TABLE Temp
(
	-- temp ?????? ??????
	temp_number number NOT NULL,
	-- ???????????? ?????? ??????
	cust_number number NOT NULL,
	-- ?????? ??? ????????? ??? ?????? ??????????????? ??????????????? ??????
	trap_number number DEFAULT 1 NOT NULL,
	-- ?????? ???????????? ?????? ??????
	key_number number NOT NULL,
	-- ?????? ???????????? ????????? ???-?????? ????????? ???????????????
	key_board varchar2(30),
	-- ????????? ?????? ?????? ?????? (???????????????)
	temp_title varchar2(50) NOT NULL,
	PRIMARY KEY (temp_number)
);



/* Create Foreign Keys */

ALTER TABLE Follow
	ADD FOREIGN KEY (follower_number)
	REFERENCES Customer (cust_number)
;


ALTER TABLE Follow
	ADD FOREIGN KEY (follow_number)
	REFERENCES Customer (cust_number)
;


ALTER TABLE letter
	ADD FOREIGN KEY (send_number)
	REFERENCES Customer (cust_number)
;


ALTER TABLE letter
	ADD FOREIGN KEY (recv_number)
	REFERENCES Customer (cust_number)
;


ALTER TABLE like_click
	ADD FOREIGN KEY (cust_number)
	REFERENCES Customer (cust_number)
;


ALTER TABLE like_click
	ADD FOREIGN KEY (target_number)
	REFERENCES Customer (cust_number)
;


ALTER TABLE Notification
	ADD FOREIGN KEY (send_number)
	REFERENCES Customer (cust_number)
;


ALTER TABLE Notification
	ADD FOREIGN KEY (recv_number)
	REFERENCES Customer (cust_number)
;


ALTER TABLE Reply
	ADD FOREIGN KEY (cust_number)
	REFERENCES Customer (cust_number)
;


ALTER TABLE Notification
	ADD FOREIGN KEY (fol_number)
	REFERENCES Follow (fol_number)
;


ALTER TABLE Temp
	ADD FOREIGN KEY (key_number)
	REFERENCES Key_Sound (key_number)
;


ALTER TABLE Notification
	ADD FOREIGN KEY (let_number)
	REFERENCES letter (let_number)
;


ALTER TABLE Notification
	ADD FOREIGN KEY (like_number)
	REFERENCES like_click (like_number)
;


ALTER TABLE Post
	ADD FOREIGN KEY (mus_number)
	REFERENCES Music_Library (mus_number)
;


ALTER TABLE like_click
	ADD FOREIGN KEY (post_number)
	REFERENCES Post (post_number)
;


ALTER TABLE Post_tag
	ADD FOREIGN KEY (post_number)
	REFERENCES Post (post_number)
;


ALTER TABLE Reply
	ADD FOREIGN KEY (post_number)
	REFERENCES Post (post_number)
;


ALTER TABLE Notification
	ADD FOREIGN KEY (rep_number)
	REFERENCES Reply (rep_number)
;


ALTER TABLE Key_Sound
	ADD FOREIGN KEY (sou_number)
	REFERENCES Sound_Library (sou_number)
;


ALTER TABLE Post_tag
	ADD FOREIGN KEY (tag_number)
	REFERENCES Tag (tag_number)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_Comment_com_number BEFORE INSERT ON Comment
FOR EACH ROW
BEGIN
	SELECT SEQ_Comment_com_number.nextval
	INTO :new.com_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Customer_cust_number BEFORE INSERT ON Customer
FOR EACH ROW
BEGIN
	SELECT SEQ_Customer_cust_number.nextval
	INTO :new.cust_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Follow_fol_number BEFORE INSERT ON Follow
FOR EACH ROW
BEGIN
	SELECT SEQ_Follow_fol_number.nextval
	INTO :new.fol_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Key_Sound_key_number BEFORE INSERT ON Key_Sound
FOR EACH ROW
BEGIN
	SELECT SEQ_Key_Sound_key_number.nextval
	INTO :new.key_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Letter_let_number BEFORE INSERT ON Letter
FOR EACH ROW
BEGIN
	SELECT SEQ_Letter_let_number.nextval
	INTO :new.let_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_like_click_like_number BEFORE INSERT ON like_click
FOR EACH ROW
BEGIN
	SELECT SEQ_like_click_like_number.nextval
	INTO :new.like_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Like_like_number BEFORE INSERT ON Like
FOR EACH ROW
BEGIN
	SELECT SEQ_Like_like_number.nextval
	INTO :new.like_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Member_mem_number BEFORE INSERT ON Member
FOR EACH ROW
BEGIN
	SELECT SEQ_Member_mem_number.nextval
	INTO :new.mem_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Music_Library_mus_number BEFORE INSERT ON Music_Library
FOR EACH ROW
BEGIN
	SELECT SEQ_Music_Library_mus_number.nextval
	INTO :new.mus_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Notification_not_number BEFORE INSERT ON Notification
FOR EACH ROW
BEGIN
	SELECT SEQ_Notification_not_number.nextval
	INTO :new.not_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Post_post_number BEFORE INSERT ON Post
FOR EACH ROW
BEGIN
	SELECT SEQ_Post_post_number.nextval
	INTO :new.post_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Post_tag_pt_number BEFORE INSERT ON Post_tag
FOR EACH ROW
BEGIN
	SELECT SEQ_Post_tag_pt_number.nextval
	INTO :new.pt_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_recv_letter_let_number BEFORE INSERT ON recv_letter
FOR EACH ROW
BEGIN
	SELECT SEQ_recv_letter_let_number.nextval
	INTO :new.let_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Reply_rep_number BEFORE INSERT ON Reply
FOR EACH ROW
BEGIN
	SELECT SEQ_Reply_rep_number.nextval
	INTO :new.rep_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_send_letter_let_number BEFORE INSERT ON send_letter
FOR EACH ROW
BEGIN
	SELECT SEQ_send_letter_let_number.nextval
	INTO :new.let_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Sound_Library_sou_number BEFORE INSERT ON Sound_Library
FOR EACH ROW
BEGIN
	SELECT SEQ_Sound_Library_sou_number.nextval
	INTO :new.sou_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Sound_mike_mike_number BEFORE INSERT ON Sound_mike
FOR EACH ROW
BEGIN
	SELECT SEQ_Sound_mike_mike_number.nextval
	INTO :new.mike_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Tag_tag_number BEFORE INSERT ON Tag
FOR EACH ROW
BEGIN
	SELECT SEQ_Tag_tag_number.nextval
	INTO :new.tag_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Temporary_temp_number BEFORE INSERT ON Temporary
FOR EACH ROW
BEGIN
	SELECT SEQ_Temporary_temp_number.nextval
	INTO :new.temp_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Temp_temp_number BEFORE INSERT ON Temp
FOR EACH ROW
BEGIN
	SELECT SEQ_Temp_temp_number.nextval
	INTO :new.temp_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_User_user_number BEFORE INSERT ON User
FOR EACH ROW
BEGIN
	SELECT SEQ_User_user_number.nextval
	INTO :new.user_number
	FROM dual;
END;

/




/* Comments */

COMMENT ON COLUMN Customer.cust_number IS '????????? ????????????. ???????????? ????????? ?????? ??????';
COMMENT ON COLUMN Customer.cust_id IS '?????????????????? ?????? ?????????';
COMMENT ON COLUMN Customer.cust_password IS '?????????????????? ?????? ????????????';
COMMENT ON COLUMN Customer.cust_email IS '???????????? ????????? ????????? ?????? ?????? ?????????';
COMMENT ON COLUMN Customer.cust_nickname IS '????????? ????????? ????????? ????????? ?????????';
COMMENT ON COLUMN Customer.cust_introduce IS '????????? ?????? ???????????? ????????? ???????????? ??????';
COMMENT ON COLUMN Customer.cust_photo_original IS '????????? ???????????? ????????? ????????? ?????? ?????? ??????';
COMMENT ON COLUMN Customer.cust_photo_saved IS '?????? ????????? ????????? ???????????? ????????? ?????? ??????';
COMMENT ON COLUMN Customer.cust_key IS '???????????? ????????? ???????????? ???';
COMMENT ON COLUMN Follow.fol_number IS '????????? ???????????? ?????? ??????. ?????????.';
COMMENT ON COLUMN Follow.follower_number IS '???????????? ?????? ??????. Member table ??????';
COMMENT ON COLUMN Follow.follow_number IS '???????????? ?????? ??????. member ????????? ??????';
COMMENT ON COLUMN Key_Sound.key_number IS '?????? ???????????? ?????? ??????';
COMMENT ON COLUMN Key_Sound.cust_number IS '?????? ?????? ???????????? ?????? ??????';
COMMENT ON COLUMN Key_Sound.key_board IS '????????? ????????? ?????? ????????? ??????';
COMMENT ON COLUMN Key_Sound.sou_number IS '????????? ????????? ?????? ?????? ?????????';
COMMENT ON COLUMN Key_Sound.sou_name IS '?????? ???????????? ?????? ??????';
COMMENT ON COLUMN Key_Sound.key_name IS '????????? ???????????? ??? ??????';
COMMENT ON COLUMN letter.let_number IS '????????? ?????? ?????? ?????????';
COMMENT ON COLUMN letter.send_number IS '????????? ?????? ?????? ??????. member ??????';
COMMENT ON COLUMN letter.recv_number IS '????????? ?????? ?????? ??????. member ??????';
COMMENT ON COLUMN letter.let_title IS '?????? ?????? ??????';
COMMENT ON COLUMN letter.let_content IS '?????? ??????';
COMMENT ON COLUMN letter.recv_check IS '????????? ???????????? ??????. ????????? 1';
COMMENT ON COLUMN letter.let_date IS '???,?????? ??????';
COMMENT ON COLUMN like_click.like_number IS '????????? ?????? ?????? ?????????';
COMMENT ON COLUMN like_click.cust_number IS '???????????? ?????? ????????? ?????? ??????';
COMMENT ON COLUMN like_click.target_number IS '???????????? ?????? ???????????? ????????? ????????? ?????? ??????';
COMMENT ON COLUMN like_click.post_number IS '???????????? ?????? ?????? ?????????';
COMMENT ON COLUMN like_click.likt_type IS '0. ????????? ??????, 1.????????? ??????';
COMMENT ON COLUMN Music_Library.mus_number IS '????????? ?????? ?????? ?????????';
COMMENT ON COLUMN Music_Library.cust_number IS '????????? ????????? ????????????. ??????';
COMMENT ON COLUMN Music_Library.mus_title IS '?????? ??????';
COMMENT ON COLUMN Music_Library.mus_time IS '????????? ??? ??????';
COMMENT ON COLUMN Music_Library.mus_saved IS '?????? ????????? ?????? ??????';
COMMENT ON COLUMN Music_Library.mus_date IS '????????? ??????';
COMMENT ON COLUMN Notification.not_number IS '?????? ?????? ?????? ?????????';
COMMENT ON COLUMN Notification.recv_number IS '????????? ?????? ?????? ??????';
COMMENT ON COLUMN Notification.send_number IS '?????? ????????? ????????? ??????, ??????, ????????? ?????? ????????? ?????? ????????? ??????';
COMMENT ON COLUMN Notification.fol_number IS '????????? ?????? ??? ????????? ???????????? ?????? ??????. ?????????.';
COMMENT ON COLUMN Notification.let_number IS '????????? ?????? ??? ????????? ?????? ?????? ?????????';
COMMENT ON COLUMN Notification.rep_number IS '????????? ?????? ??? ?????? ?????? ?????? ?????????';
COMMENT ON COLUMN Notification.like_number IS '????????? ?????? ??? ????????? ?????? ?????? ?????????';
COMMENT ON COLUMN Notification.not_type IS 'comment, letter, like, follow ?????? ?????? ??????';
COMMENT ON COLUMN Notification.not_url IS '?????? ????????? ????????? ?????? ??????';
COMMENT ON COLUMN Notification.not_time IS '?????? ????????? ??????';
COMMENT ON COLUMN Notification.not_check IS '????????? ??????????????? ??????';
COMMENT ON COLUMN Post.post_number IS '???????????? ?????? ?????? ?????????';
COMMENT ON COLUMN Post.mus_number IS '???????????? ???????????? ????????? ?????? ??????';
COMMENT ON COLUMN Post.cust_number IS '???????????? ????????? ????????? ?????? ??????. ???????????? ??????';
COMMENT ON COLUMN Post.mus_title IS '?????? ???????????? ????????? ??????';
COMMENT ON COLUMN Post.mus_time IS '????????? ??? ??????';
COMMENT ON COLUMN Post.post_content IS '????????? ??????';
COMMENT ON COLUMN Post.post_nickname IS '???????????? ?????????';
COMMENT ON COLUMN Post.post_url IS '???????????? ????????? ??????';
COMMENT ON COLUMN Post.post_date IS '????????? ?????? ??????';
COMMENT ON COLUMN Post.post_reply IS '???????????? ?????? ?????? ???';
COMMENT ON COLUMN Post.post_like IS '???????????? ????????? ??????';
COMMENT ON COLUMN Post.post_play IS '?????? ???????????? ????????? ??????';
COMMENT ON COLUMN Post.post_original IS '???????????? ????????? ???????????? ?????? ??????';
COMMENT ON COLUMN Post.post_saved IS '???????????? ????????? ???????????? ?????? ??????';
COMMENT ON COLUMN Post_tag.pt_number IS '???????????? ????????? ?????? ?????? ?????????';
COMMENT ON COLUMN Post_tag.tag_number IS '?????? ???????????? ?????????';
COMMENT ON COLUMN Post_tag.post_number IS '???????????? ?????? ?????? ?????????';
COMMENT ON COLUMN Reply.rep_number IS '?????? ?????? ?????? ?????????';
COMMENT ON COLUMN Reply.post_number IS '????????? ?????? ???????????? ?????? ??????';
COMMENT ON COLUMN Reply.cust_number IS '????????? ????????? ????????? ????????????. ';
COMMENT ON COLUMN Reply.rep_content IS '?????? ??????';
COMMENT ON COLUMN Reply.rep_nickname IS '????????? ????????? ????????? ?????????';
COMMENT ON COLUMN Reply.rep_url IS '????????? ????????? ????????? ????????? ??????';
COMMENT ON COLUMN Reply.rep_date IS '?????? ?????? ??????';
COMMENT ON COLUMN Sound_Library.sou_number IS '????????? ????????? ?????? ?????? ?????????';
COMMENT ON COLUMN Sound_Library.cust_number IS '????????? ????????? ????????? ?????? ??????. ??????';
COMMENT ON COLUMN Sound_Library.sou_type IS '?????????, ??????, ??????, ????????? ?????? ???';
COMMENT ON COLUMN Sound_Library.sou_name IS '?????? ?????? ?????? ??????';
COMMENT ON COLUMN Sound_Library.sou_saved IS '?????? ?????? ?????? ??????';
COMMENT ON COLUMN Tag.tag_number IS '?????? ???????????? ?????????';
COMMENT ON COLUMN Tag.tag_name IS '?????? ??????';
COMMENT ON COLUMN Temp.temp_number IS 'temp ?????? ??????';
COMMENT ON COLUMN Temp.cust_number IS '???????????? ?????? ??????';
COMMENT ON COLUMN Temp.trap_number IS '?????? ??? ????????? ??? ?????? ??????????????? ??????????????? ??????';
COMMENT ON COLUMN Temp.key_number IS '?????? ???????????? ?????? ??????';
COMMENT ON COLUMN Temp.key_board IS '?????? ???????????? ????????? ???-?????? ????????? ???????????????';
COMMENT ON COLUMN Temp.temp_title IS '????????? ?????? ?????? ?????? (???????????????)';



