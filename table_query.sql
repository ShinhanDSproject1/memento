CREATE TABLE waitingmento_matchup (
	wait_mento_id	int		NOT NULL,
	member_id	int		NOT NULL,
	matchup_id	int		NOT NULL,
	created_at	Date		NOT NULL,
	status		varchar2(10)	NOT NULL
);

CREATE TABLE member (
	member_id		int		NOT NULL,
	match_type_id		int		NOT NULL,
	email			varchar2(50)	NOT NULL,
	nickname		varchar2(100)	NULL,
	phone_number		varchar2(50)	NULL,
	user_type		varchar2(10)	NOT NULL,
	point			int 		NOT NULL,
	introduce		varchar2(255)	NULL,
	introduce_mento		varchar2(1000)	NULL,
	score			int 		NOT NULL,
	region_group		varchar2(100)	NULL,
	region_subgroup		varchar2(100)	NULL,
	region_detail		varchar2(200)	NULL,
	created_at		Date		NOT NULL,
	updated_at		Date		NULL,
	status			varchar2(10)	NOT NULL,
	profile_image_url	varchar2(3000) 	NULL
);

CREATE TABLE chatroom (
	chatroom_id	int		NOT NULL,
	keepgoing_id	int		NOT NULL,
	created_at	Date		NOT NULL,
	updated_at	Date		NULL,
	status		varchar2(10)	NOT NULL
);

CREATE TABLE language (
	language_id	int		NOT NULL,
	language_name	varchar2(50)	NOT NULL,
	language_image  varchar2(500)   NULL,
	status		varchar2(10)	NOT NULL
);

CREATE TABLE mentotest_history (
	mentotest_history_id    int  		NOT NULL,
	member_id      		int 		NOT NULL,
	test_at      		Date            NOT NULL,
	status      		varchar2(10)    NOT NULL
);

CREATE TABLE mentos (
	mentos_id	int		NOT NULL,
	category_id	int		NOT NULL,
	language_id	int		NOT NULL,
	mento_id	int		NOT NULL,
	title		varchar2(100)	NOT NULL,
	simple_content	varchar2(300)	NOT NULL,
	image		varchar2(100)	NULL,
	min_member	int		NOT NULL,
	max_member	int		NOT NULL,
	start_day	Date		NOT NULL,
	end_day		Date		NOT NULL,
	start_time	timestamp	NOT NULL,
	end_time	timestamp	NOT NULL,
	selected_days	varchar2(100)	NOT NULL,
	region_group	varchar2(100)	NOT NULL,
	region_subgroup	varchar2(100)	NOT NULL,
	region_detail	varchar2(200)	NULL,
	content		varchar2(3000)	NOT NULL,
	price		int		NOT NULL,
	times		int		NOT NULL,
	created_at	Date		NOT NULL,
	updated_at	Date		NULL,
	status		varchar2(10)	NOT NULL,
	match_type_id_first	int	NOT NULL,
	match_type_id_second	int	NOT NULL,
	match_type_id_third	int	NOT NULL
);

CREATE TABLE attendance (
	attendance_id	int		NOT NULL,
	member_id	int		NOT NULL,
	attendance_day	Date		NOT NULL,
	status 		varchar2(10)	NOT NULL
);

CREATE TABLE userbalance (
	userbalance_id	int		NOT NULL,
	member_id	int		NOT NULL,
	balance		int		NOT NULL,
	updated_at	Date		NOT NULL,
	status		varchar2(10)	NOT NULL
);

CREATE TABLE member_matchup (
	member_matchup_id	int		NOT NULL,
	member_id		int		NOT NULL,
	matchup_id		int		NOT NULL,
	created_at		Date		NOT NULL,
	updated_at		Date		NULL,
	status			varchar2(10)	NOT NULL
);

CREATE TABLE member_interest (
	member_interest_id	int		NOT NULL,
	member_id		int		NOT NULL,
	interest_id		int		NOT NULL,
	status 			varchar2(10)	NOT NULL
);

CREATE TABLE payment (
	payment_id	int		NOT NULL,
	member_id	int		NOT NULL,
	order_id	varchar2(50)	NOT NULL,
	pay_at		Date		NULL,
	amount		int		NOT NULL,
	pay_type	varchar2(30)	NOT NULL,
	step		varchar2(10)	NOT NULL,
	matchup_id	int		NULL,
	mentos_id	int		NULL,
	keepgoing_id	int		NULL,
	status		varchar2(10)	NOT NULL
);

CREATE TABLE member_keepgoing (
	member_keepgoing_id	int		NOT NULL,
	member_id		int		NOT NULL,
	keepgoing_id		int		NOT NULL,
	created_at		Date		NOT NULL,
	updated_at		Date		NULL,
	status			varchar2(10)	NOT NULL
);

CREATE TABLE chatmessage (
	chatmessage_id	int		NOT NULL,
	sender_id	int		NOT NULL,
	chatroom_id	int		NOT NULL,
	chat_comment	varchar2(255)	NOT NULL,
	created_at	Date		NOT NULL,
	updated_at	Date		NULL,
	status		varchar2(10)	NOT NULL
);

CREATE TABLE member_mentos (
	member_mentos_id	int		NOT NULL,
	mentos_id		int		NOT NULL,
	member_id		int		NOT NULL,
	is_compelete		varchar2(1)	NOT NULL,
	created_at		Date		NOT NULL,
	updated_at		Date		NULL,
	status			varchar2(10)	NOT NULL
);

CREATE TABLE review (
	review_id	int		NOT NULL,
	menti_id	int		NOT NULL,
	mentos_id	int		NOT NULL,
	mento_id	int		NOT NULL,
	review_img	varchar2(200)	NULL,
	score		double		NOT NULL,
	review_comment	varchar2(500)	NULL,
	created_at	Date		NOT NULL,
	updated_at	Date		NULL,
	status		varchar2(10)	NOT NULL
);

CREATE TABLE category (
	category_id	int		NOT NULL,
	category_name	varchar2(100)	NOT NULL,
	status		varchar2(10)	NOT NULL
);

CREATE TABLE notify (
	notify_id	int		NOT NULL,
	member_id	int		NOT NULL,
	notify_title	varchar2(30)	NOT NULL,
	notify_content	varchar2(255)	NOT NULL,
	notify_date	Date		NOT NULL,
	status		varchar2(10)	NOT NULL
);

CREATE TABLE matchup (
	matchup_id		int		NOT NULL,
	category_id		int		NOT NULL,
	language_id		int		NOT NULL,
	leader_id		int		NOT NULL,
	mento_id		int		NULL,
	match_type_first	int		NOT NULL,
	match_type_second	int		NOT NULL,
	match_type_third	int		NOT NULL,
	title			varchar2(50)	NOT NULL,
	count			int		NOT NULL,
	matchup_count		int		NOT NULL,
	start_day		Date		NOT NULL,
	end_day			Date		NOT NULL,
	start_time		timestamp	NOT NULL,
	end_time		timestamp	NOT NULL,
	min_memeber		int		NOT NULL,
	max_member		int		NOT NULL,
	content			varchar2(3000)	NULL,
	has_mento		boolean		NOT NULL,
	price			int		NOT NULL,
	kg_count		int		NOT NULL,
	region_group		varchar2(100)	NOT NULL,
	region_subgroup		varchar2(100)	NOT NULL,
	region_detail		varchar2(200)	NULL,
	selected_days		varchar2(100)	NOT NULL,
	created_at		Date		NOT NULL,
	updated_at		Date		NULL,
	status			varchar2(10)	NOT NULL
);

CREATE TABLE match_type (
	match_type_id	int		NOT NULL,
	match_type_name	varchar2(50)	NOT NULL,
	match_type_info	varchar2(500)	NOT NULL,
	match_type_img 	varchar2(200)	NOT NULL,
	status		varchar2(10)	NOT NULL
);

CREATE TABLE cart (
	cart_id		int		NOT NULL,
	member_id	int		NOT NULL,
	mentos_id	int		NOT NULL,
	created_at	Date		NOT NULL,
	status		varchar2(10)	NOT NULL
);

CREATE TABLE interest (
	interest_id	int		NOT NULL,
	interest_name	varchar2(100)	NOT NULL,
	status 		varchar2(10)	NOT NULL
);

CREATE TABLE keepgoing (
	keepgoing_id	int		NOT NULL,
	member_id	int		NOT NULL,
	category_id	int		NOT NULL,
	language_id	int		NOT NULL,
	match_type_id	int		NOT NULL,
	name		varchar2(100)	NOT NULL,
	img_logo	varchar2(255)	NULL,
	img_activity	varchar2(255)	NULL,
	start_time	timestamp	NOT NULL,
	end_time	timestamp	NOT NULL,
	selected_days	varchar2(100)	NOT NULL,
	content		varchar2(500)	NULL,
	price		int		NOT NULL,
	region_group	varchar2(100)	NOT NULL,
	region_subgroup	varchar2(100)	NOT NULL,
	region_detail	varchar2(200)	NULL,
	created_at	Date		NOT NULL,
	updated_at	Date		NULL,
	status	varchar2(10)		NOT NULL
);

ALTER TABLE waitingmento_matchup ADD CONSTRAINT PK_WAITINGMENTO_MATCHUP PRIMARY KEY (
	wait_mento_id
);

ALTER TABLE member ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
	member_id
);

ALTER TABLE chatroom ADD CONSTRAINT PK_CHATROOM PRIMARY KEY (
	chatroom_id
);

ALTER TABLE language ADD CONSTRAINT PK_LANGUAGE PRIMARY KEY (
	language_id
);

ALTER TABLE mentotest_history ADD CONSTRAINT PK_MENTOTEST_HISTORY PRIMARY KEY (
	metotest_history_id
);

ALTER TABLE mentos ADD CONSTRAINT PK_MENTOS PRIMARY KEY (
	mentos_id
);

ALTER TABLE attendance ADD CONSTRAINT PK_ATTENDANCE PRIMARY KEY (
	attendance_id
);

ALTER TABLE userbalance ADD CONSTRAINT PK_USERBALANCE PRIMARY KEY (
	userbalance_id
);

ALTER TABLE member_matchup ADD CONSTRAINT PK_MEMBER_MATCHUP PRIMARY KEY (
	member_matchup_id
);

ALTER TABLE member_interest ADD CONSTRAINT PK_MEMBER_INTEREST PRIMARY KEY (
	member_interest_id
);

ALTER TABLE payment ADD CONSTRAINT PK_PAYMENT PRIMARY KEY (
	payment_id
);

ALTER TABLE member_keepgoing ADD CONSTRAINT PK_MEMBER_KEEPGOING PRIMARY KEY (
	member_Keepgoing_id
);

ALTER TABLE chatmessage ADD CONSTRAINT PK_CHATMESSAGE PRIMARY KEY (
	chatmessage_id
);

ALTER TABLE member_mentos ADD CONSTRAINT PK_MEMBER_MENTOS PRIMARY KEY (
	member_mentos_id
);

ALTER TABLE review ADD CONSTRAINT PK_REVIEW PRIMARY KEY (
	review_id
);

ALTER TABLE category ADD CONSTRAINT PK_CATEGORY PRIMARY KEY (
	category_id
);

ALTER TABLE notify ADD CONSTRAINT PK_NOTIFY PRIMARY KEY (
	notify_id
);

ALTER TABLE matchup ADD CONSTRAINT PK_MATHCUP PRIMARY KEY (
	matchup_id
);

ALTER TABLE match_type ADD CONSTRAINT PK_MATCH_TYPE PRIMARY KEY (
	match_type_id
);

ALTER TABLE cart ADD CONSTRAINT PK_CART PRIMARY KEY (
	cart_id
);

ALTER TABLE interest ADD CONSTRAINT PK_INTEREST PRIMARY KEY (
	interest_id
);

ALTER TABLE keepgoing ADD CONSTRAINT PK_KEEPGOING PRIMARY KEY (
    	keepgoing_id
);


CREATE SEQUENCE seq_chatmessage_id START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_member_mentos_id START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_review_id START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_category_id START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_notify_id START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_matchup_id START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_match_type_id START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_cart_id START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_interest_id START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_keepgoing_id START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
