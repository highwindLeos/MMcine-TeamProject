-- 영화 테이블 생성 : 이승훈
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

-- 고객 : 김동석
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

-- 영화등급 : 이승훈
DROP TABLE MOVIE_GRADE cascade CONSTRAINTS;
CREATE TABLE MOVIE_GRADE (
    mgNum NUMBER(20) PRIMARY KEY,
    mScore NUMBER(5) NOT NULL,
    mRecomm NUMBER(5) NOT NULL,
    cusId VARCHAR2(20) REFERENCES CUSTOMER(cusId),
    movieCode VARCHAR2(20) REFERENCES MOVIE(movieCode)
);

-- 고객 등급 :김동석
DROP TABLE CUS_GRADE;
CREATE TABLE CUS_GRADE (
    cusGrade VARCHAR2(20) PRIMARY KEY,
    cusLow NUMBER(20) NOT NULL,
    cusHigh NUMBER(20) NOT NULL,
    cusDiscount NUMBER(10) NOT NULL
);

-- 리뷰 (코멘트 테이블 생성) : 이승훈
DROP TABLE REVIEW;
CREATE TABLE REVIEW (
    rCode VARCHAR2(20) PRIMARY KEY,
    rTitle VARCHAR2(20) NOT NULL,
    rContent DATE NOT NULL,
    rRDate NUMBER(5) NOT NULL,
    cusId VARCHAR2(20) REFERENCES CUSTOMER(cusId),
    movieCode VARCHAR2(40) REFERENCES MOVIE(movieCode)
);

-- 관리자 : 김동석
DROP TABLE ADMIN;
CREATE TABLE ADMIN (
    aId VARCHAR2(20) PRIMARY KEY,
    aPw VARCHAR2(20) NOT NULL,
    aName VARCHAR2(20) NOT NULL
);

-- 상영작 : 이승훈
DROP TABLE SCREEN_MOVIE;
CREATE TABLE SCREEN_MOVIE (
    smCode VARCHAR2(20) PRIMARY KEY,
    movieCode VARCHAR2(20) REFERENCES MOVIE(movieCode),
    theaterCode DATE REFERENCES THEATER(theaterCode),
    smStartDate NUMBER(5) NOT NULL,
    smEndDate VARCHAR2(20)
);

-- 상품 주문 : 심재열
DROP TABLE ORDERS;
CREATE TABLE ORDERS (
    orderCode number(10) PRIMARY KEY,
    foodCode NUMBER(10) REFERENCES FOOD(foodCode),
    cusId VARCHAR(20) REFERENCES CUSTOMER(cusId),
    orderPrice NUMBER(10) NOT NULL,
    orderAmount NUMBER(10) NOT NULL
);

-- 상품 (음식) : 심재열
DROP TABLE FOOD;
CREATE TABLE FOOD (
    foodCode NUMBER(10) PRIMARY KEY,
    foodName VARCHAR(50) NOT NULL,
    foodPrice NUMBER(10) NOT NULL,
    foodImg VARCHAR(50) NOT NULL,
    foodSummary CLOB NOT NULL
);

-- 예약 테이블
DROP TABLE RESERVE;
CREATE TABLE RESERVE (
    reserveCode VARCHAR2(20) PRIMARY KEY,
    cusId VARCHAR2(20) REFERENCES CUSTOMER(cusId)
);

-- 상영영화 테이블
DROP TABLE SCREEN_MOVIE;
CREATE TABLE SCREEN_MOVIE (
    smCode NUMBER(10) PRIMARY KEY,
    movieCode VARCHAR2(20) REFERENCES CUSTOMER(cusId),
    theaterCode NUMBER(10) REFERENCES THEATER(theaterCode),
    smStartDate DATE NOT NULL,
    smEndDate DATE NOT NULL
);

-- 상영 영화 시간표 테이블 
DROP TABLE SCREEN_MOVIE_TIME;
CREATE TABLE SCREEN_MOVIE_TIME (
    smtCode NUMBER(10) PRIMARY KEY,
    smCode NUMBER(10) REFERENCES SCREEN_MOVIE(smCode),
    smtStart DATE NOT NULL,
    smtEnd DATE NOT NULL,
    smtDate DATE NOT NULL,
    smtNum NUMBER(10) NOT NULL
);

-- 상영시간별 좌석 
DROP TABLE STSeat;
CREATE TABLE STSeat (
    stsCode VARCHAR2(20) PRIMARY KEY,
    seatCode VARCHAR2(3) REFERENCES SEAT(seatCode),
    smtCode NUMBER(10) REFERENCES SCREEN_MOVIE_TIME(smtCode),
    reserveCode VARCHAR2(20) REFERENCES RESERVE(reserveCode),
    stsAgeGrade VARCHAR2(20) NOT NULL
);

--상영관
DROP TABLE THEATER;
CREATE TABLE THEATER (
    theaterCode NUMBER(10) PRIMARY KEY,
    theaterName VARCHAR2(50) NOT NULL,
    theaterImage VARCHAR2(50) NOT NULL,
    theaterSummary VARCHAR2(1000) NOT NULL
);

-- 좌석 
DROP TABLE SEAT;
CREATE TABLE SEAT (
    seatCode VARCHAR2(3) PRIMARY KEY,
    theaterCode NUMBER(10) REFERENCES THEATER(theaterCode),
    seatNum VARCHAR2(10)
);

-------------------------------------------------------------
-- 게시판들 -------------------------------------------------
-------------------------------------------------------------
-- 자유게시판 : 김동석
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

-- 문의게시판 : 심재열
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

-- 공지게시판 : 이승훈
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
-- 시퀀스 들 -------------------------------------------------
-------------------------------------------------------------
-- 총 14 개
-- 주요 테이블 시퀀스
CREATE SEQUENCE SEQ_MOVIE; -- 영화
CREATE SEQUENCE SEQ_MOVIE_GRADE; -- 영화등급
CREATE SEQUENCE SEQ_REVIEW; -- 리뷰
CREATE SEQUENCE SEQ_RESERVE; -- 예약
CREATE SEQUENCE SEQ_SCREEN_MOVIE; -- 상영영화
CREATE SEQUENCE SEQ_SCREEN_MOVIE_TIME; -- 상영 영화 시간표
CREATE SEQUENCE SEQ_STSeat; --상영시간별 좌석
CREATE SEQUENCE SEQ_THEATER; -- 상영관
CREATE SEQUENCE SEQ_SEAT; -- 좌석

-- 상품 관련 시퀀스
CREATE SEQUENCE SEQ_ORDER; -- 주문 테이블
CREATE SEQUENCE SEQ_FOOD; -- 상품 [음식]

-- 게시판 시퀀스
CREATE SEQUENCE SEQ_FREEBOARD; -- 자유게시판
CREATE SEQUENCE SEQ_QNABOARD; -- 문의게시판
CREATE SEQUENCE SEQ_NOTICE; -- 공지 게시판

----------------------------------------------------------------------------
-- 영화 --------------------------------------------------------------------
----------------------------------------------------------------------------

--  영화 리스트 보기 (페이징) -- 박스오피스
SELECT * FROM
(SELECT ROWNUM RN, A.* FROM (SELECT * FROM MOVIE ORDER BY movieAccrue DESC) A)
    WHERE RN BETWEEN 1 AND 4;
    
--  영화 리스트 보기 (페이징) -- 개봉일순
SELECT * FROM
(SELECT ROWNUM RN, A.* FROM (SELECT * FROM MOVIE ORDER BY movieOpenDate DESC) A)
    WHERE RN BETWEEN 1 AND 10;
    
--  영화 리스트 보기 (페이징) -- 상영예정작
SELECT * FROM
(SELECT ROWNUM RN, A.* FROM (SELECT * FROM MOVIE ORDER BY movieOpenDate DESC) A)
    WHERE RN BETWEEN 1 AND 10 
    AND movieOpenDate > SYSDATE;

--  영화 리스트 보기 (페이징) -- 영화 db (상영  상영이 마감된 영화 )
SELECT * FROM
(SELECT ROWNUM RN, A.* FROM (SELECT * FROM MOVIE ORDER BY movieOpenDate DESC) A)
    WHERE RN BETWEEN 1 AND 10;      

-- 영화 상세보기
SELECT * FROM MOVIE_GRADE;
SELECT * FROM MOVIE WHERE MOVIECODE = 'A11';

SELECT M.*, MG.MSCORE, MG.mRecomm 
FROM MOVIE M, MOVIE_GRADE MG 
WHERE M.MOVIECODE = MG.MOVIECODE AND M.MOVIECODE = 'A11';

--영화 총 갯수 구하기
SELECT COUNT(*) FROM MOVIE;

-- 영화 등록.
INSERT INTO MOVIE VALUES ('A' || SEQ_MOVIE.NEXTVAL, '미션임파서블:폴아웃', '액션', '2018-07-25', 1, '2018 미션임파서블 신작입니다.', 'img1.jpg', 'img2.jpg', 'img3.jpg', 'img4.jpg', 'img5.jpg', 'https://youtu.be/MOo9iJ8RYWM');
INSERT INTO MOVIE VALUES ('R' || SEQ_MOVIE.NEXTVAL, '로맨스패키지', '로맨스', '2018-07-25', 100, '아찔한 로맨스.', 'rimg1.jpg', 'rimg2.jpg', 'rimg3.jpg', 'rimg4.jpg', 'rimg5.jpg', 'https://youtu.be/MOo9iJ8RYWM');
INSERT INTO MOVIE VALUES ('D' || SEQ_MOVIE.NEXTVAL, '택시운전사', '드라마', '2018-07-25', 1000, '드라마를 빙자한 역사물.', 'dimg1.jpg', 'dimg2.jpg', 'dimg3.jpg', 'dimg4.jpg', 'dimg5.jpg', 'https://youtu.be/MOo9iJ8RYWM');
INSERT INTO MOVIE VALUES ('H' || SEQ_MOVIE.NEXTVAL, '곤지암', '공포/호러', '2018-07-25', 10000, '썸뜩한 공포물.', 'himg1.jpg', 'himg2.jpg', 'himg3.jpg', 'himg4.jpg', 'himg5.jpg', 'https://youtu.be/MOo9iJ8RYWM');
INSERT INTO MOVIE VALUES ('W' || SEQ_MOVIE.NEXTVAL, '고지전', '전쟁', '2018-07-25', 20000, '전쟁영화의 진수', 'wimg1.jpg', 'wimg2.jpg', 'wimg3.jpg', 'wimg4.jpg', 'wimg5.jpg', 'https://youtu.be/MOo9iJ8RYWM');
INSERT INTO MOVIE VALUES ('S' || SEQ_MOVIE.NEXTVAL, '쏘우', '스릴러', '2018-08-25', 40000, '엽기', 'simg1.jpg', 'swimg2.jpg', 'swimg3.jpg', 'swimg4.jpg', 'swimg5.jpg', 'https://youtu.be/MOo9iJ8RYWM');

COMMIT;
-- 영화 

-- 영화 수정
UPDATE MOVIE SET 
        movieName = '미션임파서블:폴아웃2',
        movieGener  = '액션',
        movieOpenDate  = '2018-07-26',
        movieAccrue  = 10,
        movieSummary  = '신작의 두번째 스토리',
        movieImg1  = 'm1.jpg', 
        movieImg2  = 'm2.jpg',
        movieImg3  = 'm3.jpg',
        movieImg4  = 'm4.jpg',
        movieImg5  = 'm5.jpg',
        movieVideo  = 'https://youtu.be/MOo9iJ8RYWM'
    WHERE MOVIECODE = 'A11';
    
-- 영화 삭제
DELETE FROM MOVIE WHERE MOVIECODE = 'A10';

-----------------------------------------------------
-- 영화 평가 테이블 ----------------------------------
-----------------------------------------------------
SELECT * FROM MOVIE_GRADE;

INSERT INTO MOVIE_GRADE (mgnum, mscore, mrecomm, cusid, moviecode) 
VALUES (SEQ_MOVIE_GRADE.NEXTVAL, 30,  0,'movie1', 'A11');

INSERT INTO MOVIE_GRADE (mgnum, mscore, mrecomm, cusid, moviecode) 
VALUES (SEQ_MOVIE_GRADE.NEXTVAL, 40, 0,'movie2', 'R12');

-- 특정 영화의 평가의 수를 구하기
SELECT COUNT(*) VOTECNT 
FROM MOVIE_GRADE WHERE MOVIECODE = 'A11';

-- 
COMMIT;
-------------------------------------------------------
-- 회원 -----------------------------------------------
-------------------------------------------------------
SELECT * FROM CUSTOMER;

-- 회원가입 INSERT문
INSERT INTO CUSTOMER VALUES ('movie1', 'movie1', '김동석', '류준열', '1993-03-07', '010-9089-7682', 'movie1@naver.com', '서울 강북구', '남자', 'kim.jpg', 0, 0, SYSDATE, 0);
INSERT INTO CUSTOMER VALUES ('movie2', 'movie2', '오병욱', '해리포터', '1993-03-07', '010-9089-7682', 'mo2e1@naver.com', '서울 강북구','남자', 'Oh.jpg', 0, 0, SYSDATE, 0);
INSERT INTO CUSTOMER VALUES ('movie3', 'movie3', '이승훈', 'LEOS', '1982-09-16', '010-8695-0977', 'movie3@naver.com', '서울 강북구', '남자', 'LEE.jpg', 0, 0, SYSDATE, 0);
INSERT INTO CUSTOMER VALUES ('movie4', 'movie4', '김현준', '큰형님', '1993-03-07', '010-9089-7682', 'movie4@naver.com', '경기도 시흥', '남자', 'HYUN.jpg', 0, 0, SYSDATE, 0);
INSERT INTO CUSTOMER VALUES ('movie5', 'movie5', '심재열', '아이엠그루트', '1993-03-07', '010-9089-7682', 'movie5@naver.com', '서울 강북구', '남자', 'Sim.jpg', 0, 0, SYSDATE, 0);

INSERT INTO CUSTOMER (cusId, cusPw, cusName, cusNick, cusBirth, cusPhone, cusEmail, cusAddress, cusGender, cusSum, cusPoint, cusRdate, cusBlack)
VALUES ('movie2','movie2','심재열','스토어주인','19970307','010-7777-7777','movie1@naver.com','서울 이사동','남자',0,0,SYSDATE,0);
COMMIT;