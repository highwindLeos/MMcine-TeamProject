-- ��ȭ ���̺� ���� : �̽���
DROP TABLE MOVIE CASCADE CONSTRAINTS;
CREATE TABLE MOVIE (
    movieCode VARCHAR2(40) PRIMARY KEY,
    movieName VARCHAR2(100) NOT NULL,
    movieGener VARCHAR2(30) NOT NULL,
    movieOpenDate DATE NOT NULL,
    movieAccrue NUMBER(10) NOT NULL,
    movieSummary CLOB NOT NULL,
    movieImg1 VARCHAR2(100) NOT NULL, 
    movieImg2 VARCHAR2(100) DEFAULT 'mImg02.jpg',
    movieImg3 VARCHAR2(100) DEFAULT 'mImg03.jpg',
    movieImg4 VARCHAR2(100) DEFAULT 'mImg04.jpg',
    movieImg5 VARCHAR2(100) DEFAULT 'mImg05.jpg',
    movieVideo VARCHAR2(200) NOT NULL
);

-- �� : �赿��
DROP TABLE CUSTOMER;
CREATE TABLE CUSTOMER (
    cusId VARCHAR2(20) PRIMARY KEY,
    cusPw VARCHAR2(20) NOT NULL,
    cusName VARCHAR2(20) NOT NULL,
    cusNick VARCHAR2(20) UNIQUE,
    cusBirth DATE NOT NULL,
    cusPhone VARCHAR2(50) NOT NULL,
    cusEmail VARCHAR2(100) NOT NULL,
    cusAddress VARCHAR2(300),
    cusGender VARCHAR2(30) NOT NULL,
    cusPhoto VARCHAR2(100) DEFAULT 'noimg.jpg',
    cusSum NUMBER(20) DEFAULT 0,
    cusPoint VARCHAR2(20)  DEFAULT 0,
    cusRdate DATE  DEFAULT SYSDATE,
    cusBlack NUMBER(5)  DEFAULT 0
);

-- ��ȭ��� : �̽���
DROP TABLE MOVIE_GRADE cascade CONSTRAINTS;
CREATE TABLE MOVIE_GRADE (
    mgNum NUMBER(20) PRIMARY KEY,
    mScore NUMBER(5) NOT NULL,
    mRecomm NUMBER(5) NOT NULL,
    cusId VARCHAR2(20) REFERENCES CUSTOMER(cusId),
    movieCode VARCHAR2(20) REFERENCES MOVIE(movieCode)
);

-- �� ��� :�赿��
DROP TABLE CUS_GRADE;
CREATE TABLE CUS_GRADE (
    cusGrade VARCHAR2(20) PRIMARY KEY,
    cusLow NUMBER(20) NOT NULL,
    cusHigh NUMBER(20) NOT NULL,
    cusDiscount NUMBER(10) NOT NULL
);

-- ���� (�ڸ�Ʈ ���̺� ����) : �̽���
DROP TABLE REVIEW;
CREATE TABLE REVIEW (
    rCode VARCHAR2(20) PRIMARY KEY,
    rTitle VARCHAR2(20) NOT NULL,
    rContent DATE NOT NULL,
    rRDate NUMBER(5) NOT NULL,
    cusId VARCHAR2(20) REFERENCES CUSTOMER(cusId),
    movieCode VARCHAR2(40) REFERENCES MOVIE(movieCode)
);

-- ������ : �赿��
DROP TABLE ADMIN;
CREATE TABLE ADMIN (
    aId VARCHAR2(20) PRIMARY KEY,
    aPw VARCHAR2(20) NOT NULL,
    aName VARCHAR2(20) NOT NULL
);

-- ���� : �̽���
DROP TABLE SCREEN_MOVIE;
CREATE TABLE SCREEN_MOVIE (
    smCode VARCHAR2(20) PRIMARY KEY,
    movieCode VARCHAR2(20) REFERENCES MOVIE(movieCode),
    theaterCode DATE REFERENCES THEATER(theaterCode),
    smStartDate NUMBER(5) NOT NULL,
    smEndDate VARCHAR2(20)
);

-- ��ǰ �ֹ� : ���翭
DROP TABLE ORDERS;
CREATE TABLE ORDERS (
    orderCode number(10) PRIMARY KEY,
    foodCode NUMBER(10) REFERENCES FOOD(foodCode),
    cusId VARCHAR(20) REFERENCES CUSTOMER(cusId),
    orderPrice NUMBER(10) NOT NULL,
    orderAmount NUMBER(10) NOT NULL
);

-- ��ǰ (����) : ���翭
DROP TABLE FOOD;
CREATE TABLE FOOD (
    foodCode NUMBER(10) PRIMARY KEY,
    foodName VARCHAR(50) NOT NULL,
    foodPrice NUMBER(10) NOT NULL,
    foodImg VARCHAR(50) NOT NULL,
    foodSummary CLOB NOT NULL
);

-- ���� ���̺�
DROP TABLE RESERVE;
CREATE TABLE RESERVE (
    reserveCode VARCHAR2(20) PRIMARY KEY,
    cusId VARCHAR2(20) REFERENCES CUSTOMER(cusId)
);

-- �󿵿�ȭ ���̺�
DROP TABLE SCREEN_MOVIE;
CREATE TABLE SCREEN_MOVIE (
    smCode NUMBER(10) PRIMARY KEY,
    movieCode VARCHAR2(20) REFERENCES CUSTOMER(cusId),
    theaterCode NUMBER(10) REFERENCES THEATER(theaterCode),
    smStartDate DATE NOT NULL,
    smEndDate DATE NOT NULL
);

-- �� ��ȭ �ð�ǥ ���̺� 
DROP TABLE SCREEN_MOVIE_TIME;
CREATE TABLE SCREEN_MOVIE_TIME (
    smtCode NUMBER(10) PRIMARY KEY,
    smCode NUMBER(10) REFERENCES SCREEN_MOVIE(smCode),
    smtStart DATE NOT NULL,
    smtEnd DATE NOT NULL,
    smtDate DATE NOT NULL,
    smtNum NUMBER(10) NOT NULL
);

-- �󿵽ð��� �¼� 
DROP TABLE STSeat;
CREATE TABLE STSeat (
    stsCode VARCHAR2(20) PRIMARY KEY,
    seatCode VARCHAR2(3) REFERENCES SEAT(seatCode),
    smtCode NUMBER(10) REFERENCES SCREEN_MOVIE_TIME(smtCode),
    reserveCode VARCHAR2(20) REFERENCES RESERVE(reserveCode),
    stsAgeGrade VARCHAR2(20) NOT NULL
);

--�󿵰�
DROP TABLE THEATER;
CREATE TABLE THEATER (
    theaterCode NUMBER(10) PRIMARY KEY,
    theaterName VARCHAR2(50) NOT NULL,
    theaterImage VARCHAR2(50) NOT NULL,
    theaterSummary VARCHAR2(1000) NOT NULL
);

-- �¼� 
DROP TABLE SEAT;
CREATE TABLE SEAT (
    seatCode VARCHAR2(3) PRIMARY KEY,
    theaterCode NUMBER(10) REFERENCES THEATER(theaterCode),
    seatNum VARCHAR2(10)
);

-------------------------------------------------------------
-- �Խ��ǵ� -------------------------------------------------
-------------------------------------------------------------
-- �����Խ��� : �赿��
DROP TABLE FREEBOARD;
CREATE TABLE FREEBOARD (
    fBoardNum NUMBER(10) PRIMARY KEY,
    fBoardId VARCHAR2(20) NOT NULL,
    fBoardTitle VARCHAR2(50) NOT NULL,
    fBoardContent CLOB NOT NULL,
    fBoardGroup NUMBER(10) NOT NULL,
    fBoardStep NUMBER(10) NOT NULL,
    fBoardIndent  NUMBER(10) NOT NULL,
    fBoardImg VARCHAR2(100),
    fBoardHit NUMBER(10) DEFAULT 0,
    fBoardRdate DATE DEFAULT SYSDATE
);

-- ���ǰԽ��� : ���翭
DROP TABLE QNABOARD;
CREATE TABLE QNABOARD (
    qBoardNum NUMBER(10) PRIMARY KEY,
    qBoardId VARCHAR2(20) NOT NULL,
    qBoardTitle VARCHAR2(50) NOT NULL,
    qBoardContent CLOB NOT NULL,
    qBoardGroup NUMBER(10) NOT NULL,
    qBoardStep  NUMBER(10) NOT NULL,
    qBoardIndent NUMBER(10) NOT NULL,
    qBoardImg VARCHAR2(100),
    qBoardHit NUMBER(10) DEFAULT 0,
    qBoardRdate DATE DEFAULT SYSDATE
);

-- �����Խ��� : �̽���
DROP TABLE NOTICE;
CREATE TABLE NOTICE (
    nBoardNum NUMBER(10) PRIMARY KEY,
    nBoardId VARCHAR2(20) NOT NULL,
    nBoardTitle VARCHAR2(50) NOT NULL,
    nBoardContent CLOB NOT NULL,
    nBoardGroup NUMBER(10) NOT NULL,
    nBoardStep NUMBER(10) NOT NULL,
    nBoardIndent NUMBER(10) NOT NULL,
    nBoardImg VARCHAR2(100),
    nBoardHit NUMBER(10) DEFAULT 0,
    nBoardRdate DATE DEFAULT SYSDATE
);


-------------------------------------------------------------
-- ������ �� -------------------------------------------------
-------------------------------------------------------------
-- �� 14 ��
-- �ֿ� ���̺� ������
CREATE SEQUENCE SEQ_MOVIE; -- ��ȭ
CREATE SEQUENCE SEQ_MOVIE_GRADE; -- ��ȭ���
CREATE SEQUENCE SEQ_REVIEW; -- ����
CREATE SEQUENCE SEQ_RESERVE; -- ����
CREATE SEQUENCE SEQ_SCREEN_MOVIE; -- �󿵿�ȭ
CREATE SEQUENCE SEQ_SCREEN_MOVIE_TIME; -- �� ��ȭ �ð�ǥ
CREATE SEQUENCE SEQ_STSeat; --�󿵽ð��� �¼�
CREATE SEQUENCE SEQ_THEATER; -- �󿵰�
CREATE SEQUENCE SEQ_SEAT; -- �¼�

-- ��ǰ ���� ������
CREATE SEQUENCE SEQ_ORDER; -- �ֹ� ���̺�
CREATE SEQUENCE SEQ_FOOD; -- ��ǰ [����]

-- �Խ��� ������
CREATE SEQUENCE SEQ_FREEBOARD; -- �����Խ���
CREATE SEQUENCE SEQ_QNABOARD; -- ���ǰԽ���
CREATE SEQUENCE SEQ_NOTICE; -- ���� �Խ���

----------------------------------------------------------------------------
-- ��ȭ --------------------------------------------------------------------
----------------------------------------------------------------------------

--  ��ȭ ����Ʈ ���� (����¡) -- �ڽ����ǽ�
SELECT * FROM
(SELECT ROWNUM RN, A.* FROM (SELECT * FROM MOVIE ORDER BY movieAccrue DESC) A)
    WHERE RN BETWEEN 1 AND 4;
    
--  ��ȭ ����Ʈ ���� (����¡) -- �����ϼ�
SELECT * FROM
(SELECT ROWNUM RN, A.* FROM (SELECT * FROM MOVIE ORDER BY movieOpenDate DESC) A)
    WHERE RN BETWEEN 1 AND 10;
    
--  ��ȭ ����Ʈ ���� (����¡) -- �󿵿�����
SELECT * FROM
(SELECT ROWNUM RN, A.* FROM (SELECT * FROM MOVIE ORDER BY movieOpenDate DESC) A)
    WHERE RN BETWEEN 1 AND 10 
    AND movieOpenDate > SYSDATE;

--  ��ȭ ����Ʈ ���� (����¡) -- ��ȭ db (��  ���� ������ ��ȭ )
SELECT * FROM
(SELECT ROWNUM RN, A.* FROM (SELECT * FROM MOVIE ORDER BY movieOpenDate DESC) A)
    WHERE RN BETWEEN 1 AND 10;      

-- ��ȭ �󼼺���
SELECT * FROM MOVIE_GRADE;
SELECT * FROM MOVIE WHERE MOVIECODE = 'A11';

SELECT M.*, MG.MSCORE, MG.mRecomm 
FROM MOVIE M, MOVIE_GRADE MG 
WHERE M.MOVIECODE = MG.MOVIECODE AND M.MOVIECODE = 'A11';

--��ȭ �� ���� ���ϱ�
SELECT COUNT(*) FROM MOVIE;

-- ��ȭ ���.
INSERT INTO MOVIE VALUES ('A' || SEQ_MOVIE.NEXTVAL, '�̼����ļ���:���ƿ�', '�׼�', '2018-07-25', 1, '2018 �̼����ļ��� �����Դϴ�.', 'img1.jpg', 'img2.jpg', 'img3.jpg', 'img4.jpg', 'img5.jpg', 'https://youtu.be/MOo9iJ8RYWM');
INSERT INTO MOVIE VALUES ('R' || SEQ_MOVIE.NEXTVAL, '�θǽ���Ű��', '�θǽ�', '2018-07-25', 100, '������ �θǽ�.', 'rimg1.jpg', 'rimg2.jpg', 'rimg3.jpg', 'rimg4.jpg', 'rimg5.jpg', 'https://youtu.be/MOo9iJ8RYWM');
INSERT INTO MOVIE VALUES ('D' || SEQ_MOVIE.NEXTVAL, '�ýÿ�����', '���', '2018-07-25', 1000, '��󸶸� ������ ���繰.', 'dimg1.jpg', 'dimg2.jpg', 'dimg3.jpg', 'dimg4.jpg', 'dimg5.jpg', 'https://youtu.be/MOo9iJ8RYWM');
INSERT INTO MOVIE VALUES ('H' || SEQ_MOVIE.NEXTVAL, '������', '����/ȣ��', '2018-07-25', 10000, '����� ������.', 'himg1.jpg', 'himg2.jpg', 'himg3.jpg', 'himg4.jpg', 'himg5.jpg', 'https://youtu.be/MOo9iJ8RYWM');
INSERT INTO MOVIE VALUES ('W' || SEQ_MOVIE.NEXTVAL, '������', '����', '2018-07-25', 20000, '���￵ȭ�� ����', 'wimg1.jpg', 'wimg2.jpg', 'wimg3.jpg', 'wimg4.jpg', 'wimg5.jpg', 'https://youtu.be/MOo9iJ8RYWM');
INSERT INTO MOVIE VALUES ('S' || SEQ_MOVIE.NEXTVAL, '���', '������', '2018-08-25', 40000, '����', 'simg1.jpg', 'swimg2.jpg', 'swimg3.jpg', 'swimg4.jpg', 'swimg5.jpg', 'https://youtu.be/MOo9iJ8RYWM');

COMMIT;
-- ��ȭ 

-- ��ȭ ����
UPDATE MOVIE SET 
        movieName = '�̼����ļ���:���ƿ�2',
        movieGener  = '�׼�',
        movieOpenDate  = '2018-07-26',
        movieAccrue  = 10,
        movieSummary  = '������ �ι�° ���丮',
        movieImg1  = 'm1.jpg', 
        movieImg2  = 'm2.jpg',
        movieImg3  = 'm3.jpg',
        movieImg4  = 'm4.jpg',
        movieImg5  = 'm5.jpg',
        movieVideo  = 'https://youtu.be/MOo9iJ8RYWM'
    WHERE MOVIECODE = 'A11';
    
-- ��ȭ ����
DELETE FROM MOVIE WHERE MOVIECODE = 'A10';

-----------------------------------------------------
-- ��ȭ �� ���̺� ----------------------------------
-----------------------------------------------------
SELECT * FROM MOVIE_GRADE;

INSERT INTO MOVIE_GRADE (mgnum, mscore, mrecomm, cusid, moviecode) 
VALUES (SEQ_MOVIE_GRADE.NEXTVAL, 30,  0,'movie1', 'A11');

INSERT INTO MOVIE_GRADE (mgnum, mscore, mrecomm, cusid, moviecode) 
VALUES (SEQ_MOVIE_GRADE.NEXTVAL, 40, 0,'movie2', 'R12');

-- Ư�� ��ȭ�� ���� ���� ���ϱ�
SELECT COUNT(*) VOTECNT 
FROM MOVIE_GRADE WHERE MOVIECODE = 'A11';

-- 
COMMIT;
-------------------------------------------------------
-- ȸ�� -----------------------------------------------
-------------------------------------------------------
SELECT * FROM CUSTOMER;

-- ȸ������ INSERT��
INSERT INTO CUSTOMER VALUES ('movie1', 'movie1', '�赿��', '���ؿ�', '1993-03-07', '010-9089-7682', 'movie1@naver.com', '���� ���ϱ�', '����', 'kim.jpg', 0, 0, SYSDATE, 0);
INSERT INTO CUSTOMER VALUES ('movie2', 'movie2', '������', '�ظ�����', '1993-03-07', '010-9089-7682', 'mo2e1@naver.com', '���� ���ϱ�','����', 'Oh.jpg', 0, 0, SYSDATE, 0);
INSERT INTO CUSTOMER VALUES ('movie3', 'movie3', '�̽���', 'LEOS', '1982-09-16', '010-8695-0977', 'movie3@naver.com', '���� ���ϱ�', '����', 'LEE.jpg', 0, 0, SYSDATE, 0);
INSERT INTO CUSTOMER VALUES ('movie4', 'movie4', '������', 'ū����', '1993-03-07', '010-9089-7682', 'movie4@naver.com', '��⵵ ����', '����', 'HYUN.jpg', 0, 0, SYSDATE, 0);
INSERT INTO CUSTOMER VALUES ('movie5', 'movie5', '���翭', '���̿��׷�Ʈ', '1993-03-07', '010-9089-7682', 'movie5@naver.com', '���� ���ϱ�', '����', 'Sim.jpg', 0, 0, SYSDATE, 0);

INSERT INTO CUSTOMER (cusId, cusPw, cusName, cusNick, cusBirth, cusPhone, cusEmail, cusAddress, cusGender, cusSum, cusPoint, cusRdate, cusBlack)
VALUES ('movie2','movie2','���翭','���������','19970307','010-7777-7777','movie1@naver.com','���� �̻絿','����',0,0,SYSDATE,0);
COMMIT;