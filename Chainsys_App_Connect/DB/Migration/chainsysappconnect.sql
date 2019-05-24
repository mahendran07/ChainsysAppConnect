------------------------ Chat Application --------------------------------------
create table UserInfo
(uname varchar(20),
fullname varchar(20),
male varchar(10),
age number,
gmail varchar(20),
constraint UserInfo_uname_pk primary key(uname));

ALTER TABLE UserInfo MODIFY gmail VARCHAR2(40);

create table UserCredentials
(uname varchar(20),
password varchar(20),
constraint UserCredentials_uname_pk primary key(uname),
constraint UserCredentials_uname_fk foreign key(uname) references UserInfo(uname));

create table Friendlist
(fromId varchar(20),
toId varchar(20),
status varchar(20),
constraint Friendlist_fromidtoid_pk primary key(fromId,toId),
constraint Friendlist_fromId_fk foreign key(fromId) references UserInfo(uname),
constraint Friendlist_toId_fk foreign key(toId) references UserInfo(uname));

create table Inbox
(fromid varchar(20),
toid varchar(20),
message varchar(2000),
lastseen varchar(35));

create table status
(uname varchar(20),
lastseen varchar(20),
constraint status_uname_pk primary key(uname),
constraint status_uname_fk foreign key(uname) references UserInfo(uname));

ALTER TABLE status MODIFY lastseen VARCHAR(40);

create table timeline
(id number,
uname varchar(20),
content varchar(100),
likes number,
constraint timeline_id_pk primary key(id),
constraint timeline_uname_fk foreign key(uname) references UserInfo(uname));

create table likes
(id number,
uname varchar(20),
constraint likes_id_uname_pk primary key(id,uname),
constraint likes_uname_fk foreign key(uname) references UserInfo(uname),
constraint likes_id_fk foreign key(id) references Timeline(id));

create table notification
(id number,
fromid varchar(20),
toid varchar(20),
alerts varchar(100),
constraint notification_id_pk primary key(id),
constraint notification_fromid_fk foreign key(fromid) references UserInfo(uname),
constraint notification_toid_fk foreign key(toid) references UserInfo(uname));

create sequence timeline_id_seq
start with 1
INCREMENT by 1;

create sequence notification_id_seq
start with 1
INCREMENT by 1;

select * from UserInfo;
select * from UserCredentials;
select * from Inbox;
select * from FriendList;
select * from status;
select * from timeline;
select * from likes;
select * from notification;
--------------------------------------------------------------------------------

------------------------------ Food App ----------------------------------------
CREATE TABLE "HR"."CATEGORY" 
("CATEGORY_ID" NUMBER(10,0), 
"NAME" VARCHAR2(30 BYTE)); 

Insert into HR.CATEGORY (CATEGORY_ID,NAME) values (3,'Beverages');
Insert into HR.CATEGORY (CATEGORY_ID,NAME) values (4,'Multi-Cuisine');
Insert into HR.CATEGORY (CATEGORY_ID,NAME) values (2,'Non-Veg');
Insert into HR.CATEGORY (CATEGORY_ID,NAME) values (1,'Vegeterian');

ALTER TABLE "HR"."CATEGORY" ADD CONSTRAINT "CATEGORY_ID_PK" PRIMARY KEY ("CATEGORY_ID");
  
ALTER TABLE "HR"."CATEGORY" ADD CONSTRAINT "CATEGORY_NAME_UK" UNIQUE ("NAME");
  
ALTER TABLE "HR"."CATEGORY" MODIFY ("NAME" NOT NULL ENABLE);

COMMIT;

CREATE TABLE "HR"."CITY" 
("CITY_ID" NUMBER(10,0), 
"PINCODE" NUMBER(6,0), 
"CITY_NAME" VARCHAR2(50 BYTE));

Insert into HR.CITY (CITY_ID,PINCODE,CITY_NAME) values (1,625198,'vandalur');
Insert into HR.CITY (CITY_ID,PINCODE,CITY_NAME) values (2,625199,'kelambakkam');
Insert into HR.CITY (CITY_ID,PINCODE,CITY_NAME) values (3,625200,'thambaram');
Insert into HR.CITY (CITY_ID,PINCODE,CITY_NAME) values (4,625201,'perangulathur');
Insert into HR.CITY (CITY_ID,PINCODE,CITY_NAME) values (5,625202,'vadapalani');

ALTER TABLE "HR"."CITY" ADD CONSTRAINT "CITY_NAME_UK" UNIQUE ("CITY_NAME");
  
ALTER TABLE "HR"."CITY" MODIFY ("PINCODE" NOT NULL ENABLE);
 
ALTER TABLE "HR"."CITY" MODIFY ("CITY_NAME" NOT NULL ENABLE);
 
ALTER TABLE "HR"."CITY" ADD CONSTRAINT "TRN_CITYID_PK" PRIMARY KEY ("CITY_ID");
  
ALTER TABLE "HR"."CITY" ADD CONSTRAINT "TRN_PINCODE_UK" UNIQUE ("PINCODE");
  
COMMIT;

CREATE TABLE "HR"."RESTAURANT" 
("RESTAURANT_ID" NUMBER(10,0), 
"RESTAURANT_NAME" VARCHAR2(50 BYTE), 
"PHONE_NUMBER" NUMBER(10,0), 
"ADDRESS" VARCHAR2(100 BYTE), 
"CITY_ID" NUMBER(10,0), 
"CATEGORY_ID" NUMBER(10,0));

Insert into HR.RESTAURANT (RESTAURANT_ID,RESTAURANT_NAME,PHONE_NUMBER,ADDRESS,CITY_ID,CATEGORY_ID) values (1,'anjappar',9862621234,'3/5 cpm nagar,vandalur.',1,4);
Insert into HR.RESTAURANT (RESTAURANT_ID,RESTAURANT_NAME,PHONE_NUMBER,ADDRESS,CITY_ID,CATEGORY_ID) values (2,'thalapakkati',9812345679,'2,k.k nagar,thambaram',3,2);
Insert into HR.RESTAURANT (RESTAURANT_ID,RESTAURANT_NAME,PHONE_NUMBER,ADDRESS,CITY_ID,CATEGORY_ID) values (3,'saravana bhavan',9876543210,'5,sixth avenue,vandalur',1,1);
Insert into HR.RESTAURANT (RESTAURANT_ID,RESTAURANT_NAME,PHONE_NUMBER,ADDRESS,CITY_ID,CATEGORY_ID) values (4,'famous Jigarthanda',9876541239,'anna nagar,kelambakkam',2,3);
Insert into HR.RESTAURANT (RESTAURANT_ID,RESTAURANT_NAME,PHONE_NUMBER,ADDRESS,CITY_ID,CATEGORY_ID) values (5,'annaporna',8787676754,'3/612 avenue street kelambakam',1,1);
Insert into HR.RESTAURANT (RESTAURANT_ID,RESTAURANT_NAME,PHONE_NUMBER,ADDRESS,CITY_ID,CATEGORY_ID) values (6,'amma mess',9090808090,'13 annai salai vandalur',1,1);
Insert into HR.RESTAURANT (RESTAURANT_ID,RESTAURANT_NAME,PHONE_NUMBER,ADDRESS,CITY_ID,CATEGORY_ID) values (7,'amul kulfi',8989707078,'123 karumbukadai vandalur',1,3);
Insert into HR.RESTAURANT (RESTAURANT_ID,RESTAURANT_NAME,PHONE_NUMBER,ADDRESS,CITY_ID,CATEGORY_ID) values (8,'konar kadai',9981234561,'simakkal',2,2);

ALTER TABLE "HR"."RESTAURANT" ADD CONSTRAINT "RESTPHONE_ID_UK" UNIQUE ("PHONE_NUMBER");

ALTER TABLE "HR"."RESTAURANT" ADD CONSTRAINT "RESTUARANT_ID_PK" PRIMARY KEY ("RESTAURANT_ID");
  
ALTER TABLE "HR"."RESTAURANT" ADD CONSTRAINT "REST_ADDRESS_UK" UNIQUE ("ADDRESS");
  
ALTER TABLE "HR"."RESTAURANT" MODIFY ("RESTAURANT_NAME" NOT NULL ENABLE);
 
ALTER TABLE "HR"."RESTAURANT" MODIFY ("PHONE_NUMBER" NOT NULL ENABLE);
 
ALTER TABLE "HR"."RESTAURANT" MODIFY ("ADDRESS" NOT NULL ENABLE);

COMMIT;

CREATE TABLE "HR"."TRN_CUSTOMERS" 
("ACCOUNT_NUMBER" NUMBER(15,0), 
"CUSTOMER_NAME" VARCHAR2(50 BYTE), 
"CUSTOMER_ID" NUMBER(10,0), 
"EMAIL" VARCHAR2(60 BYTE), 
"PHONE_NUMBER" NUMBER(12,0), 
"FATHERS_NAME" VARCHAR2(50 BYTE), 
"GENDER" VARCHAR2(7 BYTE), 
"BALANCE" NUMBER(12,2) DEFAULT 0, 
"USERNAME" VARCHAR2(30 BYTE), 
"PASSWORD" VARCHAR2(30 BYTE), 
"DOB" DATE, 
"PERMANENT_ADDRESS" VARCHAR2(250 BYTE), 
"PERMANENT_CITY" VARCHAR2(25 BYTE), 
"CURRENT_ADDRESS" VARCHAR2(250 BYTE), 
"CURRENT_CITY" VARCHAR2(25 BYTE), 
"STATE" VARCHAR2(25 BYTE), 
"IFSC_CODE" VARCHAR2(10 BYTE), 
"FLAG" NUMBER(2,0), 
"CREATED_DATE" TIMESTAMP (6), 
"MODIFIED_DATE" TIMESTAMP (6), 
"MMID" NUMBER(10,0)); 

Insert into HR.TRN_CUSTOMERS (ACCOUNT_NUMBER,CUSTOMER_NAME,CUSTOMER_ID,EMAIL,PHONE_NUMBER,FATHERS_NAME,GENDER,BALANCE,USERNAME,PASSWORD,DOB,PERMANENT_ADDRESS,PERMANENT_CITY,CURRENT_ADDRESS,CURRENT_CITY,STATE,IFSC_CODE,FLAG,CREATED_DATE,MODIFIED_DATE,MMID) values (620410100000,'Athiselvam',5021,'athitek@rediffmail.com',9042401691,'Nainar','Male',27031.2,'its773','pass123',to_date('11-05-97','DD-MM-RR'),'shanmugam street','shencottai','shanmugam street','shencottai','Tamil nadu','ATEK000138',1,to_timestamp('21-05-19 10:17:00.912000000 PM','DD-MM-RR HH12:MI:SSXFF AM'),to_timestamp('21-05-19 10:17:00.912000000 PM','DD-MM-RR HH12:MI:SSXFF AM'),8807651);
Insert into HR.TRN_CUSTOMERS (ACCOUNT_NUMBER,CUSTOMER_NAME,CUSTOMER_ID,EMAIL,PHONE_NUMBER,FATHERS_NAME,GENDER,BALANCE,USERNAME,PASSWORD,DOB,PERMANENT_ADDRESS,PERMANENT_CITY,CURRENT_ADDRESS,CURRENT_CITY,STATE,IFSC_CODE,FLAG,CREATED_DATE,MODIFIED_DATE,MMID) values (620410100022,'rich',5022,'ric@gmail.com',9042401891,'Nainar','Male',15413,'ric123','pass123',to_date('11-05-97','DD-MM-RR'),'shanmugam street','shencottai','shanmugam street','shencottai','Tamil nadu','ATEK000139',1,to_timestamp('21-05-19 10:17:43.790000000 PM','DD-MM-RR HH12:MI:SSXFF AM'),to_timestamp('21-05-19 10:17:43.790000000 PM','DD-MM-RR HH12:MI:SSXFF AM'),8807652);

ALTER TABLE "HR"."TRN_CUSTOMERS" MODIFY ("CUSTOMER_NAME" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_CUSTOMERS" MODIFY ("CUSTOMER_ID" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_CUSTOMERS" MODIFY ("EMAIL" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_CUSTOMERS" MODIFY ("PHONE_NUMBER" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_CUSTOMERS" MODIFY ("FATHERS_NAME" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_CUSTOMERS" MODIFY ("GENDER" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_CUSTOMERS" MODIFY ("USERNAME" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_CUSTOMERS" MODIFY ("PASSWORD" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_CUSTOMERS" MODIFY ("DOB" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_CUSTOMERS" MODIFY ("PERMANENT_ADDRESS" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_CUSTOMERS" MODIFY ("PERMANENT_CITY" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_CUSTOMERS" MODIFY ("CURRENT_ADDRESS" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_CUSTOMERS" MODIFY ("CURRENT_CITY" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_CUSTOMERS" MODIFY ("STATE" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_CUSTOMERS" MODIFY ("IFSC_CODE" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_CUSTOMERS" MODIFY ("FLAG" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_CUSTOMERS" MODIFY ("CREATED_DATE" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_CUSTOMERS" MODIFY ("MODIFIED_DATE" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_CUSTOMERS" ADD UNIQUE ("CUSTOMER_ID");
  
ALTER TABLE "HR"."TRN_CUSTOMERS" ADD UNIQUE ("EMAIL");

ALTER TABLE "HR"."TRN_CUSTOMERS" ADD UNIQUE ("PHONE_NUMBER");
 
ALTER TABLE "HR"."TRN_CUSTOMERS" ADD UNIQUE ("USERNAME");
 
ALTER TABLE "HR"."TRN_CUSTOMERS" ADD UNIQUE ("IFSC_CODE");
  
ALTER TABLE "HR"."TRN_CUSTOMERS" ADD CONSTRAINT "TRN_CUSTOMER_ACNUM_PK" PRIMARY KEY ("ACCOUNT_NUMBER");

COMMIT;

CREATE TABLE "HR"."TRN_MENU" 
("MENU_ID" NUMBER(10,0), 
"MENU_NAME" VARCHAR2(30 BYTE), 
"PRICE" NUMBER(10,2), 
"CATEGORY_ID" NUMBER(10,0), 
"IMAGE" VARCHAR2(50 BYTE));

Insert into HR.TRN_MENU (MENU_ID,MENU_NAME,PRICE,CATEGORY_ID,IMAGE) values (1,'veg-Biriyani',120,1,'./images/vegbriyani.jpg');
Insert into HR.TRN_MENU (MENU_ID,MENU_NAME,PRICE,CATEGORY_ID,IMAGE) values (2,'chicken- Biriyani',150.35,2,'./images/chickenbriyani.jpg');
Insert into HR.TRN_MENU (MENU_ID,MENU_NAME,PRICE,CATEGORY_ID,IMAGE) values (3,'mushroom-Biriyani',130,1,'./images/vegbriyani.jpg');
Insert into HR.TRN_MENU (MENU_ID,MENU_NAME,PRICE,CATEGORY_ID,IMAGE) values (4,'tikka-Biriyani',150,2,'./images/tikkabriyani.jpg');
Insert into HR.TRN_MENU (MENU_ID,MENU_NAME,PRICE,CATEGORY_ID,IMAGE) values (5,'lemon Juice',30.45,3,'./images/lemonjuice.jpg');
Insert into HR.TRN_MENU (MENU_ID,MENU_NAME,PRICE,CATEGORY_ID,IMAGE) values (6,'apple Juice',40,3,'./images/applejuice.jpg');
Insert into HR.TRN_MENU (MENU_ID,MENU_NAME,PRICE,CATEGORY_ID,IMAGE) values (7,'mutton-Biriyani',180,2,'./images/muttonbriyani.jpg');
Insert into HR.TRN_MENU (MENU_ID,MENU_NAME,PRICE,CATEGORY_ID,IMAGE) values (8,'salad',60.22,1,'./images/salad.jpg');

ALTER TABLE "HR"."TRN_MENU" ADD CONSTRAINT "MENU_NAME_UK" UNIQUE ("MENU_NAME");
 
ALTER TABLE "HR"."TRN_MENU" MODIFY ("MENU_NAME" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_MENU" MODIFY ("PRICE" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_MENU" ADD CHECK (PRICE>0) ENABLE;
 
ALTER TABLE "HR"."TRN_MENU" ADD CONSTRAINT "TRN_MENUID_PK" PRIMARY KEY ("MENU_ID");

COMMIT;

CREATE TABLE "HR"."TRN_TRNSC_LIST" 
("CUSTOMER_ID" NUMBER(10,0), 
"TRANSACTION_ID" NUMBER(10,0), 
"CURRENT_BALANCE" NUMBER(10,2) DEFAULT 0, 
"AMOUNT" NUMBER(10,2) DEFAULT 0, 
"BENF_AC_NUMBER" NUMBER(15,0), 
"TRANSACTION_DATE" TIMESTAMP (6), 
"MMID" NUMBER(10,0));

Insert into HR.TRN_TRNSC_LIST (CUSTOMER_ID,TRANSACTION_ID,CURRENT_BALANCE,AMOUNT,BENF_AC_NUMBER,TRANSACTION_DATE,MMID) values (5022,1404,18762,343,620410100000,to_timestamp('22-05-19 05:04:50.567000000 PM','DD-MM-RR HH12:MI:SSXFF AM'),0);
Insert into HR.TRN_TRNSC_LIST (CUSTOMER_ID,TRANSACTION_ID,CURRENT_BALANCE,AMOUNT,BENF_AC_NUMBER,TRANSACTION_DATE,MMID) values (5022,1401,19632,184,620410100000,to_timestamp('22-05-19 03:22:34.673000000 PM','DD-MM-RR HH12:MI:SSXFF AM'),0);
Insert into HR.TRN_TRNSC_LIST (CUSTOMER_ID,TRANSACTION_ID,CURRENT_BALANCE,AMOUNT,BENF_AC_NUMBER,TRANSACTION_DATE,MMID) values (5022,1410,17011.4,533.8,620410100000,to_timestamp('22-05-19 11:42:02.552000000 PM','DD-MM-RR HH12:MI:SSXFF AM'),0);
Insert into HR.TRN_TRNSC_LIST (CUSTOMER_ID,TRANSACTION_ID,CURRENT_BALANCE,AMOUNT,BENF_AC_NUMBER,TRANSACTION_DATE,MMID) values (5022,1412,16484.4,184,620410100000,to_timestamp('23-05-19 09:21:48.230000000 AM','DD-MM-RR HH12:MI:SSXFF AM'),0);
Insert into HR.TRN_TRNSC_LIST (CUSTOMER_ID,TRANSACTION_ID,CURRENT_BALANCE,AMOUNT,BENF_AC_NUMBER,TRANSACTION_DATE,MMID) values (5022,1413,16141.4,343,620410100000,to_timestamp('23-05-19 10:08:49.224000000 AM','DD-MM-RR HH12:MI:SSXFF AM'),0);
Insert into HR.TRN_TRNSC_LIST (CUSTOMER_ID,TRANSACTION_ID,CURRENT_BALANCE,AMOUNT,BENF_AC_NUMBER,TRANSACTION_DATE,MMID) values (5022,1414,16031.6,109.8,620410100000,to_timestamp('23-05-19 10:34:02.132000000 AM','DD-MM-RR HH12:MI:SSXFF AM'),0);
Insert into HR.TRN_TRNSC_LIST (CUSTOMER_ID,TRANSACTION_ID,CURRENT_BALANCE,AMOUNT,BENF_AC_NUMBER,TRANSACTION_DATE,MMID) values (5022,1415,15413,618.6,620410100000,to_timestamp('23-05-19 10:42:46.126000000 PM','DD-MM-RR HH12:MI:SSXFF AM'),0);
Insert into HR.TRN_TRNSC_LIST (CUSTOMER_ID,TRANSACTION_ID,CURRENT_BALANCE,AMOUNT,BENF_AC_NUMBER,TRANSACTION_DATE,MMID) values (5022,1403,19105,343,620410100000,to_timestamp('22-05-19 05:04:00.218000000 PM','DD-MM-RR HH12:MI:SSXFF AM'),0);
Insert into HR.TRN_TRNSC_LIST (CUSTOMER_ID,TRANSACTION_ID,CURRENT_BALANCE,AMOUNT,BENF_AC_NUMBER,TRANSACTION_DATE,MMID) values (5022,1405,18419,343,620410100000,to_timestamp('22-05-19 05:48:30.586000000 PM','DD-MM-RR HH12:MI:SSXFF AM'),0);
Insert into HR.TRN_TRNSC_LIST (CUSTOMER_ID,TRANSACTION_ID,CURRENT_BALANCE,AMOUNT,BENF_AC_NUMBER,TRANSACTION_DATE,MMID) values (5022,1406,18076,343,620410100000,to_timestamp('22-05-19 05:54:10.853000000 PM','DD-MM-RR HH12:MI:SSXFF AM'),0);
Insert into HR.TRN_TRNSC_LIST (CUSTOMER_ID,TRANSACTION_ID,CURRENT_BALANCE,AMOUNT,BENF_AC_NUMBER,TRANSACTION_DATE,MMID) values (5022,1407,17892,184,620410100000,to_timestamp('22-05-19 06:44:12.998000000 PM','DD-MM-RR HH12:MI:SSXFF AM'),0);
Insert into HR.TRN_TRNSC_LIST (CUSTOMER_ID,TRANSACTION_ID,CURRENT_BALANCE,AMOUNT,BENF_AC_NUMBER,TRANSACTION_DATE,MMID) values (5022,1409,17545.2,184,620410100000,to_timestamp('22-05-19 11:38:34.053000000 PM','DD-MM-RR HH12:MI:SSXFF AM'),0);
Insert into HR.TRN_TRNSC_LIST (CUSTOMER_ID,TRANSACTION_ID,CURRENT_BALANCE,AMOUNT,BENF_AC_NUMBER,TRANSACTION_DATE,MMID) values (5022,1411,16668.4,343,620410100000,to_timestamp('23-05-19 12:08:53.860000000 AM','DD-MM-RR HH12:MI:SSXFF AM'),0);
Insert into HR.TRN_TRNSC_LIST (CUSTOMER_ID,TRANSACTION_ID,CURRENT_BALANCE,AMOUNT,BENF_AC_NUMBER,TRANSACTION_DATE,MMID) values (5022,1402,19448,184,620410100000,to_timestamp('22-05-19 03:24:30.712000000 PM','DD-MM-RR HH12:MI:SSXFF AM'),0);
Insert into HR.TRN_TRNSC_LIST (CUSTOMER_ID,TRANSACTION_ID,CURRENT_BALANCE,AMOUNT,BENF_AC_NUMBER,TRANSACTION_DATE,MMID) values (5022,1400,19816,184,620410100000,to_timestamp('22-05-19 03:08:24.731000000 PM','DD-MM-RR HH12:MI:SSXFF AM'),0);
Insert into HR.TRN_TRNSC_LIST (CUSTOMER_ID,TRANSACTION_ID,CURRENT_BALANCE,AMOUNT,BENF_AC_NUMBER,TRANSACTION_DATE,MMID) values (5022,1408,17729.2,162.8,620410100000,to_timestamp('22-05-19 06:47:07.614000000 PM','DD-MM-RR HH12:MI:SSXFF AM'),0);

COMMIT;

CREATE TABLE "HR"."USERLOGIN" 
("ID" NUMBER(10,0), 
"USER_ID" VARCHAR2(40 BYTE), 
"USER_NAME" VARCHAR2(40 BYTE), 
"PASSWORD" VARCHAR2(30 BYTE));

Insert into HR.USERLOGIN (ID,USER_ID,USER_NAME,PASSWORD) values (1,'ric@gmail.com','richard','richard');
Insert into HR.USERLOGIN (ID,USER_ID,USER_NAME,PASSWORD) values (2,'sakthi@gmail.com','sakthi','sakthi');
Insert into HR.USERLOGIN (ID,USER_ID,USER_NAME,PASSWORD) values (3,'siva@gmail.com','siva','siva');
  
ALTER TABLE "HR"."USERLOGIN" MODIFY ("ID" NOT NULL ENABLE);
 
ALTER TABLE "HR"."USERLOGIN" MODIFY ("USER_ID" NOT NULL ENABLE);
 
ALTER TABLE "HR"."USERLOGIN" MODIFY ("USER_NAME" NOT NULL ENABLE);
 
ALTER TABLE "HR"."USERLOGIN" MODIFY ("PASSWORD" NOT NULL ENABLE);
 
ALTER TABLE "HR"."USERLOGIN" ADD CONSTRAINT "USERLOGIN_PK" PRIMARY KEY ("USER_ID");

CREATE SEQUENCE Trn_translist_transid_seq03 START WITH 1430 INCREMENT BY 1;
CREATE SEQUENCE Trn_customers_cusid_seq01 START WITH 5000 INCREMENT BY 1;
CREATE SEQUENCE Trn_customers_acnum_seq02 START WITH 620410100000 INCREMENT BY 1;

COMMIT;
--------------------------------------------------------------------------------

----------------------------- Job Portal ---------------------------------------
CREATE TABLE "HR"."TRN_USERS" 
("USER_ID" NUMBER(10,0), 
"USER_NAME" VARCHAR2(50 BYTE), 
"EMAIL" VARCHAR2(60 BYTE), 
"CREATE_PASSWORD" VARCHAR2(10 BYTE), 
"PHONE_NO" VARCHAR2(10 BYTE), 
"CREATED_DATE" TIMESTAMP (6));

Insert into HR.TRN_USERS (USER_ID,USER_NAME,EMAIL,CREATE_PASSWORD,PHONE_NO,CREATED_DATE) values (1004,'karthikeyeni','karthikeyeni1997@gmail.com','karthi17','7200253333',to_timestamp('21-05-19 12:00:00.000000000 AM','DD-MM-RR HH12:MI:SSXFF AM'));
Insert into HR.TRN_USERS (USER_ID,USER_NAME,EMAIL,CREATE_PASSWORD,PHONE_NO,CREATED_DATE) values (1008,'durgadevi','ammudd308@gmail.com','durga','9876567898',to_timestamp('23-05-19 12:00:00.000000000 AM','DD-MM-RR HH12:MI:SSXFF AM'));
Insert into HR.TRN_USERS (USER_ID,USER_NAME,EMAIL,CREATE_PASSWORD,PHONE_NO,CREATED_DATE) values (1007,'Ishwarya','ishwarya15127@gmail.com','ishwarya','9876567898',to_timestamp('23-05-19 12:00:00.000000000 AM','DD-MM-RR HH12:MI:SSXFF AM'));

ALTER TABLE "HR"."TRN_USERS" MODIFY ("USER_NAME" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS" MODIFY ("EMAIL" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS" MODIFY ("CREATE_PASSWORD" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS" MODIFY ("PHONE_NO" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS" MODIFY ("CREATED_DATE" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS" ADD UNIQUE ("USER_NAME");

ALTER TABLE "HR"."TRN_USERS" ADD UNIQUE ("EMAIL");
  
ALTER TABLE "HR"."TRN_USERS" ADD CONSTRAINT "TRN_USER_ID_PK" PRIMARY KEY ("USER_ID");

COMMIT;

CREATE TABLE "HR"."TRN_USERS_PROFILE" 
("PROFILE_ID" NUMBER(10,0), 
"DATE_OF_BIRTH" DATE, 
"GENDER" CHAR(1 BYTE), 
"ADDRESS" VARCHAR2(60 BYTE), 
"EDUCATION_DEGREE" VARCHAR2(40 BYTE), 
"COLLEGE_NAME" VARCHAR2(60 BYTE), 
"MARIAL_STATUS" VARCHAR2(10 BYTE), 
"YR_OF_COMPLETION" NUMBER(10,0), 
"RELOCATE" VARCHAR2(10 BYTE), 
"USER_ID" NUMBER(10,0), 
"CREATED_BY" NUMBER(10,0), 
"CREATED_DATE" TIMESTAMP (6), 
"MODIFIED_BY" NUMBER(10,0), 
"MODIFIED_DATE" TIMESTAMP (6), 
"PINCODE" NUMBER(10,0));

Insert into HR.TRN_USERS_PROFILE (PROFILE_ID,DATE_OF_BIRTH,GENDER,ADDRESS,EDUCATION_DEGREE,COLLEGE_NAME,MARIAL_STATUS,YR_OF_COMPLETION,RELOCATE,USER_ID,CREATED_BY,CREATED_DATE,MODIFIED_BY,MODIFIED_DATE,PINCODE) values (2,to_date('12-05-97','DD-MM-RR'),'F','madurai','BE/CSE','SITE','unmarried',2019,'yes',1007,1007,to_timestamp('23-05-19 12:00:00.000000000 AM','DD-MM-RR HH12:MI:SSXFF AM'),1007,to_timestamp('23-05-19 12:00:00.000000000 AM','DD-MM-RR HH12:MI:SSXFF AM'),641077);
Insert into HR.TRN_USERS_PROFILE (PROFILE_ID,DATE_OF_BIRTH,GENDER,ADDRESS,EDUCATION_DEGREE,COLLEGE_NAME,MARIAL_STATUS,YR_OF_COMPLETION,RELOCATE,USER_ID,CREATED_BY,CREATED_DATE,MODIFIED_BY,MODIFIED_DATE,PINCODE) values (3,to_date('17-08-96','DD-MM-RR'),'F','Coimbatore','BE/CSE','SITE','unmarried',2019,'yes',1008,1008,to_timestamp('23-05-19 12:00:00.000000000 AM','DD-MM-RR HH12:MI:SSXFF AM'),1008,to_timestamp('23-05-19 12:00:00.000000000 AM','DD-MM-RR HH12:MI:SSXFF AM'),641047);

ALTER TABLE "HR"."TRN_USERS_PROFILE" MODIFY ("DATE_OF_BIRTH" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_PROFILE" MODIFY ("GENDER" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_PROFILE" MODIFY ("ADDRESS" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_PROFILE" MODIFY ("EDUCATION_DEGREE" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_PROFILE" MODIFY ("COLLEGE_NAME" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_PROFILE" MODIFY ("RELOCATE" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_PROFILE" MODIFY ("CREATED_BY" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_PROFILE" MODIFY ("CREATED_DATE" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_PROFILE" MODIFY ("MODIFIED_BY" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_PROFILE" MODIFY ("MODIFIED_DATE" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_PROFILE" MODIFY ("PINCODE" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_PROFILE" ADD CONSTRAINT "TRN_PROFILE_ID_PK" PRIMARY KEY ("PROFILE_ID");

COMMIT;

CREATE TABLE "HR"."TRN_USERS_PROJECT" 
("PROJECT_ID" NUMBER(10,0), 
"TITLE" VARCHAR2(40 BYTE), 
"DETAILS" VARCHAR2(60 BYTE), 
"SKILLS" VARCHAR2(50 BYTE), 
"USER_ID" NUMBER(10,0), 
"CREATED_BY" NUMBER(10,0), 
"CREATED_DATE" TIMESTAMP (6), 
"MODIFIED_BY" NUMBER(10,0), 
"MODIFIED_DATE" TIMESTAMP (6), 
"DURATION" VARCHAR2(30 BYTE));

Insert into HR.TRN_USERS_PROJECT (PROJECT_ID,TITLE,DETAILS,SKILLS,USER_ID,CREATED_BY,CREATED_DATE,MODIFIED_BY,MODIFIED_DATE,DURATION) values (1,'Course management ','Online courses','Java,SQL',1007,1007,to_timestamp('23-05-19 12:00:00.000000000 AM','DD-MM-RR HH12:MI:SSXFF AM'),1007,to_timestamp('23-05-19 12:00:00.000000000 AM','DD-MM-RR HH12:MI:SSXFF AM'),'1 month');

ALTER TABLE "HR"."TRN_USERS_PROJECT" MODIFY ("TITLE" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_PROJECT" MODIFY ("DETAILS" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_PROJECT" MODIFY ("SKILLS" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_PROJECT" MODIFY ("CREATED_BY" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_PROJECT" MODIFY ("CREATED_DATE" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_PROJECT" MODIFY ("MODIFIED_BY" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_PROJECT" MODIFY ("MODIFIED_DATE" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_PROJECT" ADD CONSTRAINT "TRN_PROJECT_ID_PK" PRIMARY KEY ("PROJECT_ID");
 
COMMIT;

CREATE TABLE "HR"."TRN_USERS_LANGUAGE" 
("LANGUAGE_ID" NUMBER(10,0), 
"LANGUAGE_KNOWN" VARCHAR2(40 BYTE), 
"PROFICIENCY" VARCHAR2(40 BYTE), 
"USER_ID" NUMBER(10,0), 
"CREATED_BY" NUMBER(10,0), 
"CREATED_DATE" TIMESTAMP (6), 
"MODIFIED_BY" NUMBER(10,0), 
"MODIFIED_DATE" TIMESTAMP (6));

Insert into HR.TRN_USERS_LANGUAGE (LANGUAGE_ID,LANGUAGE_KNOWN,PROFICIENCY,USER_ID,CREATED_BY,CREATED_DATE,MODIFIED_BY,MODIFIED_DATE) values (2,'English,Tamil','None',1007,1007,to_timestamp('23-05-19 12:00:00.000000000 AM','DD-MM-RR HH12:MI:SSXFF AM'),1007,to_timestamp('23-05-19 12:00:00.000000000 AM','DD-MM-RR HH12:MI:SSXFF AM'));
Insert into HR.TRN_USERS_LANGUAGE (LANGUAGE_ID,LANGUAGE_KNOWN,PROFICIENCY,USER_ID,CREATED_BY,CREATED_DATE,MODIFIED_BY,MODIFIED_DATE) values (1,'English,Tamil','None',1007,1007,to_timestamp('23-05-19 12:00:00.000000000 AM','DD-MM-RR HH12:MI:SSXFF AM'),1007,to_timestamp('23-05-19 12:00:00.000000000 AM','DD-MM-RR HH12:MI:SSXFF AM'));

ALTER TABLE "HR"."TRN_USERS_LANGUAGE" MODIFY ("LANGUAGE_KNOWN" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_LANGUAGE" MODIFY ("CREATED_BY" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_LANGUAGE" MODIFY ("CREATED_DATE" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_LANGUAGE" MODIFY ("MODIFIED_BY" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_LANGUAGE" MODIFY ("MODIFIED_DATE" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_LANGUAGE" ADD CONSTRAINT "TRN_LANGUAGE_ID_PK" PRIMARY KEY ("LANGUAGE_ID");

COMMIT;

CREATE TABLE "HR"."TRN_USERS_FUNCTIONAL" 
("FUNCTIONAL_ID" NUMBER(10,0), 
"INDUSTRY" VARCHAR2(50 BYTE), 
"DEPARTMENT" VARCHAR2(40 BYTE), 
"ROLE" VARCHAR2(30 BYTE), 
"EMPLOYMENT_TYPE" VARCHAR2(30 BYTE), 
"LOCATION" VARCHAR2(50 BYTE), 
"USER_ID" NUMBER(10,0), 
"CREATED_BY" NUMBER(10,0), 
"CREATED_DATE" TIMESTAMP (6), 
"MODIFIED_BY" NUMBER(10,0), 
"MODIFIED_DATE" TIMESTAMP (6), 
"JOB_TYPE" VARCHAR2(30 BYTE));

Insert into HR.TRN_USERS_FUNCTIONAL (FUNCTIONAL_ID,INDUSTRY,DEPARTMENT,ROLE,EMPLOYMENT_TYPE,LOCATION,USER_ID,CREATED_BY,CREATED_DATE,MODIFIED_BY,MODIFIED_DATE,JOB_TYPE) values (1,'IT-Hardware and Networking','IT-Software ERP/CRM','Web designer','option1','Chennai',1007,1007,to_timestamp('23-05-19 12:00:00.000000000 AM','DD-MM-RR HH12:MI:SSXFF AM'),1007,to_timestamp('23-05-19 12:00:00.000000000 AM','DD-MM-RR HH12:MI:SSXFF AM'),'option1');

ALTER TABLE "HR"."TRN_USERS_FUNCTIONAL" MODIFY ("INDUSTRY" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_FUNCTIONAL" MODIFY ("DEPARTMENT" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_FUNCTIONAL" MODIFY ("ROLE" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_FUNCTIONAL" MODIFY ("EMPLOYMENT_TYPE" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_FUNCTIONAL" MODIFY ("LOCATION" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_FUNCTIONAL" MODIFY ("CREATED_BY" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_FUNCTIONAL" MODIFY ("CREATED_DATE" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_FUNCTIONAL" MODIFY ("MODIFIED_BY" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_FUNCTIONAL" MODIFY ("MODIFIED_DATE" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USERS_FUNCTIONAL" ADD CONSTRAINT "TRN_FUNCTIONAL_ID_PK" PRIMARY KEY ("FUNCTIONAL_ID");

COMMIT;

CREATE TABLE "HR"."TRN_USER_JOBINFO" 
("JOBINFO_ID" NUMBER(10,0), 
"USER_ID" NUMBER(10,0), 
"COMPANY_ID" NUMBER(10,0), 
"SAVE_JOB" NUMBER(10,0) DEFAULT 0, 
"APPLY_JOB" NUMBER(10,0) DEFAULT 0, 
"CREATED_BY" NUMBER(10,0), 
"CREATED_DATE" DATE, 
"SHORTLIST" VARCHAR2(30 BYTE) DEFAULT 0);

Insert into HR.TRN_USER_JOBINFO (JOBINFO_ID,USER_ID,COMPANY_ID,SAVE_JOB,APPLY_JOB,CREATED_BY,CREATED_DATE,SHORTLIST) values (39,1004,5,0,1,1004,to_date('23-05-19','DD-MM-RR'),'1');
Insert into HR.TRN_USER_JOBINFO (JOBINFO_ID,USER_ID,COMPANY_ID,SAVE_JOB,APPLY_JOB,CREATED_BY,CREATED_DATE,SHORTLIST) values (36,1007,5,0,1,1007,to_date('23-05-19','DD-MM-RR'),'1');
Insert into HR.TRN_USER_JOBINFO (JOBINFO_ID,USER_ID,COMPANY_ID,SAVE_JOB,APPLY_JOB,CREATED_BY,CREATED_DATE,SHORTLIST) values (34,1007,1,0,1,1007,to_date('23-05-19','DD-MM-RR'),'1');
Insert into HR.TRN_USER_JOBINFO (JOBINFO_ID,USER_ID,COMPANY_ID,SAVE_JOB,APPLY_JOB,CREATED_BY,CREATED_DATE,SHORTLIST) values (35,1007,3,0,1,1007,to_date('23-05-19','DD-MM-RR'),'0');
Insert into HR.TRN_USER_JOBINFO (JOBINFO_ID,USER_ID,COMPANY_ID,SAVE_JOB,APPLY_JOB,CREATED_BY,CREATED_DATE,SHORTLIST) values (37,1008,1,0,1,1008,to_date('23-05-19','DD-MM-RR'),'1');
Insert into HR.TRN_USER_JOBINFO (JOBINFO_ID,USER_ID,COMPANY_ID,SAVE_JOB,APPLY_JOB,CREATED_BY,CREATED_DATE,SHORTLIST) values (38,1008,3,0,1,1008,to_date('23-05-19','DD-MM-RR'),'1');

ALTER TABLE "HR"."TRN_USER_JOBINFO" ADD CONSTRAINT "JOBINFO_ID_PK" PRIMARY KEY ("JOBINFO_ID");

ALTER TABLE "HR"."TRN_USER_JOBINFO" MODIFY ("CREATED_BY" NOT NULL ENABLE);
 
ALTER TABLE "HR"."TRN_USER_JOBINFO" MODIFY ("CREATED_DATE" NOT NULL ENABLE);

COMMIT;

create sequence trn_functional_id_seq 
start with 1
increment by 1;

create sequence trn_language_id_seq 
start with 1
increment by 1;

create sequence trn_user_id_seq 
start with 1000
increment by 1;

create sequence trn_profile_id_seq 
start with 1
increment by 1;

create sequence trn_functional_id_seq 
start with 1
increment by 1;

create sequence trn_project_id_seq 
start with 1
increment by 1;

create sequence trn_recruiters_id_seq
start with 1
increment by 1;

CREATE SEQUENCE login_id_seq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE jobinfo_id_seq
START WITH 1
INCREMENT BY 1;

COMMIT;
--------------------------------------------------------------------------------