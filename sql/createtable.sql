drop table t_admin cascade constraints;
drop table t_grade cascade constraints;
drop table t_theme cascade constraints;

drop table t_map_purchase cascade constraints;
drop table t_map_register cascade constraints;
drop table t_review cascade constraints;
drop table t_route cascade constraints;
drop table t_place cascade constraints;

drop table t_point_spend cascade constraints;
drop table t_point_charge cascade constraints;
drop table t_point cascade constraints;
drop table t_user cascade constraints;
drop table t_map cascade constraints;
--------------------------------------------------------------------------------------
drop sequence seq_grade;
drop sequence seq_theme;
drop sequence seq_admin;
drop sequence seq_user;
drop sequence seq_point;
drop sequence seq_point_user;
drop sequence seq_point_spend;
drop sequence seq_point_charge;

drop sequence seq_map;
drop sequence seq_review;
drop sequence seq_place;
drop sequence seq_route;
drop sequence seq_map_purchase;
drop sequence seq_map_register;
--------------------------------------------------------------------------------------
CREATE SEQUENCE seq_grade INCREMENT BY 1 START WITH 1 nocache;
CREATE SEQUENCE seq_theme INCREMENT BY 10 START WITH 10 nocache;

CREATE SEQUENCE seq_admin INCREMENT BY 10 START WITH 10 nocache;
CREATE SEQUENCE seq_user INCREMENT BY 10 START WITH 10 nocache;
CREATE SEQUENCE seq_point INCREMENT BY 10 START WITH 10 nocache;
CREATE SEQUENCE seq_point_user INCREMENT BY 10 START WITH 10 nocache;
CREATE SEQUENCE seq_point_spend INCREMENT BY 5 START WITH 5 nocache;
CREATE SEQUENCE seq_point_charge INCREMENT BY 5 START WITH 5 nocache;

CREATE SEQUENCE seq_map INCREMENT BY 5 START WITH 5 nocache;
CREATE SEQUENCE seq_review INCREMENT BY 5 START WITH 5 nocache;
CREATE SEQUENCE seq_place INCREMENT BY 5 START WITH 5 nocache;
CREATE SEQUENCE seq_route INCREMENT BY 5 START WITH 5 nocache;
CREATE SEQUENCE seq_map_purchase INCREMENT BY 5 START WITH 5 nocache;
CREATE SEQUENCE seq_map_register INCREMENT BY 5 START WITH 5 nocache;
--------------------------------------------------------------------------------------
CREATE TABLE t_admin
(
   admin_no NUMBER(9) NOT NULL
   , admin_id VARCHAR2(30) NOT NULL
   , admin_pw VARCHAR2(128) NOT NULL
);

CREATE INDEX idx_admin_no ON t_admin(admin_no);
ALTER TABLE t_admin
   ADD CONSTRAINT pk_admin_no PRIMARY KEY(admin_no); 
    
--------------------------------------------------------------------------------------    
CREATE TABLE t_grade
(
    grade_no NUMBER(9) NOT NULL
    , grade_name VARCHAR(30) NOT NULL
);

CREATE INDEX idx_grade_no ON t_grade(grade_no);
ALTER TABLE t_grade
   ADD CONSTRAINT pk_grade_no PRIMARY KEY(grade_no);
--------------------------------------------------------------------------------------   
CREATE TABLE t_theme
(
   theme_no NUMBER(9) NOT NULL
   , theme_name VARCHAR2(30) NOT NULL
   , theme_content CLOB
);

CREATE INDEX idx_theme_no ON t_theme(theme_no);
ALTER TABLE t_theme
   ADD CONSTRAINT pk_theme_no PRIMARY KEY(theme_no);
--------------------------------------------------------------------------------------
--point current default 0
CREATE TABLE t_point
(
   point_no NUMBER(9) NOT NULL
   , point_current NUMBER(15) DEFAULT 0 NOT NULL
   , user_no NUMBER(9) NOT NULL
);
CREATE INDEX idx_point_no ON t_point(point_no);
ALTER TABLE t_point
   ADD CONSTRAINT pk_point_no PRIMARY KEY(point_no);
--------------------------------------------------------------------------------------
--grade_no default 1 
--alter size of pw
CREATE TABLE t_user
(
   user_no NUMBER(9) NOT NULL
   , user_name VARCHAR2(30) NOT NULL
   , user_id VARCHAR2(30) NOT NULL
   , user_pw VARCHAR2(128) NOT NULL
   , user_gender VARCHAR2(10) NOT NULL
   , user_year NUMBER(4) NOT NULL
   , user_month NUMBER(2) NOT NULL
   , user_day NUMBER(2) NOT NULL
   , user_photo VARCHAR2(20) NOT NULL
   , user_email VARCHAR2(50) NOT NULL
   , user_joindate DATE DEFAULT SYSDATE NOT NULL
   , user_phone VARCHAR2(20) NOT NULL
   , user_address VARCHAR2(255)
   , user_point NUMBER(9)
   , grade_no NUMBER(9) DEFAULT 1 NOT NULL
   , point_no NUMBER(9) 
   , theme_no NUMBER(9) NOT NULL
);

CREATE INDEX idx_user_no ON t_user(user_no);
ALTER TABLE t_user
   ADD CONSTRAINT pk_user_no PRIMARY KEY(user_no);
ALTER TABLE t_user
      ADD CONSTRAINT fk_user_grade_no FOREIGN KEY(grade_no) REFERENCES t_grade(grade_no);
ALTER TABLE t_user
      ADD CONSTRAINT fk_user_theme_no FOREIGN KEY(theme_no) REFERENCES t_theme(theme_no);
ALTER TABLE t_user
      ADD CONSTRAINT uk_user_point_no UNIQUE(point_no);
ALTER TABLE t_user
      ADD CONSTRAINT fk_user_point_no FOREIGN KEY(point_no) REFERENCES t_point(point_no);
        
ALTER TABLE t_point
   ADD CONSTRAINT uk_point_user_no UNIQUE(user_no);
ALTER TABLE t_point
   ADD CONSTRAINT fk_point_user_no FOREIGN KEY(user_no) REFERENCES t_user(user_no);
ALTER TABLE t_point DROP CONSTRAINT fk_point_user_no;
--------------------------------------------------------------------------------------   
CREATE TABLE t_point_spend
(
    point_spend_no number not null,
    point_decrease number(15),
    point_spend_log varchar2(80),
    point_spend_date date DEFAULT sysdate,
    point_no number NOT NULL
);

CREATE INDEX idx_point_spend_no ON t_point_spend(point_spend_no);
ALTER TABLE t_point_spend
   ADD CONSTRAINT pk_point_spend_no PRIMARY KEY(point_spend_no);
ALTER TABLE t_point_spend
   ADD CONSTRAINT fk_point_spend_point_no FOREIGN KEY(point_no) REFERENCES t_point(point_no);
--------------------------------------------------------------------------------------
CREATE TABLE t_point_charge
(
    point_charge_no number not null,
    point_increase number(15),
    point_charge_log varchar2(80),
    point_charge_date date DEFAULT sysdate,
    point_no number NOT NULL
);

CREATE INDEX idx_point_charge_no ON t_point_charge(point_charge_no);
ALTER TABLE t_point_charge
   ADD CONSTRAINT pk_point_charge_no PRIMARY KEY(point_charge_no);
ALTER TABLE t_point_charge
   ADD CONSTRAINT fk_point_charge_point_no FOREIGN KEY(point_no) REFERENCES t_point(point_no);

--------------------------------------------------------------------------------------

CREATE TABLE t_map
(
	map_no NUMBER(9) NOT NULL
	, map_title VARCHAR2(100) NOT NULL
	, map_subtitle VARCHAR2(100) DEFAULT ''
	, map_content CLOB DEFAULT ''
	, map_photo VARCHAR2(255) DEFAULT 'C:/'
	, map_like NUMBER(10) DEFAULT 0
	, map_regdate DATE DEFAULT SYSDATE NOT NULL
	, map_status NUMBER(2) DEFAULT 0 NOT NULL
	, map_country VARCHAR2(40) NOT NULL
	, map_state VARCHAR2(40) NOT NULL
	, map_city VARCHAR2(40) NOT NULL
	, map_placett NUMBER(2) NOT NULL
	, theme_no NUMBER(9) NOT NULL
);

CREATE INDEX idx_map_no ON t_map(map_no);
ALTER TABLE t_map
	ADD CONSTRAINT pk_map_no PRIMARY KEY(map_no);
ALTER TABLE t_map
	ADD CONSTRAINT fk_map_theme_no FOREIGN KEY(theme_no) REFERENCES t_theme(theme_no);
--------------------------------------------------------------------------------------

CREATE TABLE t_place
(
	place_no NUMBER(9) NOT NULL
	, place_name VARCHAR2(50) NOT NULL
	, place_load_addr VARCHAR2(255)
	, place_addr VARCHAR2(255)
	, place_lat VARCHAR2(30) NOT NULL
	, place_lng VARCHAR2(30) NOT NULL
	, place_content CLOB DEFAULT ''
	, place_image VARCHAR2(255) DEFAULT 'C:/'
	, place_course_no NUMBER(2) NOT NULL
	, map_no NUMBER(9) NOT NULL
);

CREATE INDEX idx_place_no ON t_place(place_no);
ALTER TABLE t_place
	ADD CONSTRAINT pk_place_no PRIMARY KEY(place_no);
ALTER TABLE t_place
	ADD CONSTRAINT fk_place_map_no FOREIGN KEY(map_no) REFERENCES t_map(map_no);
	
--------------------------------------------------------------------------------------

CREATE TABLE t_route
(
	route_no NUMBER(9) NOT NULL
	, route_name VARCHAR2(30) NOT NULL
	, route_course_no NUMBER(2) NOT NULL
	, map_no NUMBER(9) NOT NULL
);

CREATE INDEX idx_route_no ON t_route(route_no);
ALTER TABLE t_route 
	ADD CONSTRAINT fk_route_no FOREIGN KEY(map_no) REFERENCES t_map(map_no);
	
--------------------------------------------------------------------------------------

CREATE TABLE t_map_register
(
	register_no NUMBER(9) NOT NULL
	, register_regdate DATE DEFAULT SYSDATE
	, map_no NUMBER(9) NOT NULL
	, user_no NUMBER(9) NOT NULL
);

CREATE INDEX idx_register_no ON t_map_register(register_no);
ALTER TABLE t_map_register
	ADD CONSTRAINT pk_register_no PRIMARY KEY(register_no);
	
ALTER TABLE t_map_register
	ADD CONSTRAINT fk_register_map_no FOREIGN KEY(map_no) REFERENCES t_map(map_no);
	
ALTER TABLE t_map_register
	ADD CONSTRAINT fk_register_user_no FOREIGN KEY(user_no) REFERENCES t_user(user_no);
--------------------------------------------------------------------------------------


CREATE TABLE t_map_purchase
(
	purchase_no NUMBER(9) NOT NULL
	, purchase_regdate DATE DEFAULT SYSDATE
	, map_no NUMBER(9) NOT NULL
	, user_no NUMBER(9) NOT NULL
);

CREATE INDEX idx_purchase_no ON t_map_purchase(purchase_no);
ALTER TABLE t_map_purchase
	ADD CONSTRAINT pk_purchase_no PRIMARY KEY(purchase_no);

ALTER TABLE t_map_purchase
	ADD CONSTRAINT fk_purchase_map_no FOREIGN KEY(map_no) REFERENCES t_map(map_no);
	
ALTER TABLE t_map_purchase
	ADD CONSTRAINT fk_purchase_user_no FOREIGN KEY(user_no) REFERENCES t_user(user_no);


	

	
