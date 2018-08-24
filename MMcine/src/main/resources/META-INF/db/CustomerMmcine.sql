-----------------------------고객------------------------------------------------------
-- 고객
DROP TABLE CUSTOMER;
CREATE TABLE CUSTOMER (
    cusId VARCHAR2(20) PRIMARY KEY,
    cusPw   VARCHAR2(20) NOT NULL,
    cusName VARCHAR2(20) NOT NULL,
    cusNick VARCHAR2(20) UNIQUE, --한글 6글자 영어 20자 초과제한
    cusBirth DATE NOT NULL,
    cusPhone VARCHAR2(50) NOT NULL,
    cusEmail VARCHAR2(100) NOT NULL,
    cusAddress VARCHAR2(300),
    cusGender VARCHAR2(30) NOT NULL,
    cusPhoto VARCHAR2(100) DEFAULT 'noimg.jpg',
    cusSum NUMBER(20) DEFAULT 0,
    cusPoint NUMBER(20)  DEFAULT 0,
    cusRdate DATE  DEFAULT SYSDATE,
    cusBlack NUMBER(5)  DEFAULT 0
);
SELECT * FROM CUSTOMER; 
COMMIT;
ROLLBACK;
DELETE CUSTOMER;
DELETE CUSTOMER WHERE cusId = 'movie2';

--	//회원가입 : INSERT를이용한 간단한 SQL문 (리턴값을 INT로받아 N행 업데이트로 성패를알아본다)

INSERT INTO CUSTOMER VALUES ('movie1','movie1','김동석','류준열','19930307','010-7777-7777','movie1@naver.com','서울 강북구','남자','kim.jpg',0,0,SYSDATE,0);
INSERT INTO CUSTOMER VALUES ('movie2','movie2','오병욱','노홍철','19870101','010-7777-7777','movie2@naver.com','서울 강북구','남자','noimg.jpg',0,0,SYSDATE,0);

INSERT INTO CUSTOMER (cusId,cusPw,cusName,cusNick,cusBirth,cusPhone,cusEmail,cusAddress,cusGender,cusSum,cusPoint,cusRdate,cusBlack) 
    VALUES ('movie3','movie3','박현준','기술고문','19800101','010-7777-7777','movie3@naver.com','인천 연수동','남자',0,0,SYSDATE,0);
INSERT INTO CUSTOMER (cusId,cusPw,cusName,cusNick,cusBirth,cusPhone,cusEmail,cusAddress,cusGender,cusSum,cusPoint,cusRdate,cusBlack) 
    VALUES ('movie4','movie4','이승훈','레드클리프','19850101','010-7777-7777','movie4@naver.com','서울 창동','남자',0,0,SYSDATE,0);
INSERT INTO CUSTOMER (cusId,cusPw,cusName,cusNick,cusBirth,cusPhone,cusEmail,cusAddress,cusGender,cusSum,cusPoint,cusRdate,cusBlack) 
    VALUES ('movie5','movie5','심재열','그루트','19970101','010-7777-7777','movie5@naver.com','서울 종각역','남자',0,0,SYSDATE,0);
INSERT INTO CUSTOMER (cusId,cusPw,cusName,cusNick,cusBirth,cusPhone,cusEmail,cusAddress,cusGender,cusSum,cusPoint,cusRdate,cusBlack) 
    VALUES ('movie6','movie6','김사장','CEO','19970101','010-7777-7777','movie5@naver.com','서울 종각역','남자',0,0,SYSDATE,0);    

--  //아이디 중복체크 : 조건에 ID검색을 넣음으로써 중복체크할수있게함 (정보가나오면 중복,정보가안나오면 가입가능)
SELECT * FROM CUSTOMER WHERE cusId='movie1'; 
--	//로그인 : 특정회원 정보를 받아 정보가 나오면 우선 ID존재 그후 받은정보속 PW를 검색하여 내가 입력한 PW와 같은지 확인
SELECT * FROM CUSTOMER WHERE cusId='movie1' AND cusPw='movie1' ;
--	//회원정보가져오기 : 특정회원 정보를 받아 dto객체에 넣고 수정,로그인시 세션객체에 데이터(dto)를 만들때 등등 쓰인다.
SELECT * FROM CUSTOMER WHERE cusId='movie1'; 
--	//회원정보수정하기 : UPDATE를 이용한 간단한 SQL문 (리턴값을 INT로받아 N행 업데이트로 성패를알아본다)
UPDATE CUSTOMER SET cusPw = 'movie11', cusName = '김동석', cusNick='개리', cusPhone = '010-9089-7682', cusEmail = 'football@naver.com', cusAddress ='경기도 성남', cusPhoto ='noimg.jpg'
         WHERE cusId = 'movie1';
--	//회원정보리스트(페이징on) : 전체 회원의 정보를 출력할건데 한페이지마다 얼만큼 출력할건지,정렬순서는 어떻게할건지 생각한 SQL문
--1단계
SELECT * FROM CUSTOMER where cNAME LIKE '%'||'김'||'%' AND ctel LIKE '%'||7777||'%' ORDER BY CNAME; 
--2단계
SELECT ROWNUM RM, A.* FROM(SELECT * FROM CUSTOMER where cNAME LIKE '%'||'김'||'%' AND ctel LIKE '%'||010||'%' ORDER BY CNAME)A; 
--3단계(아이디와, 닉네임으로 회원검색)
SELECT * FROM(SELECT ROWNUM RM, A.* FROM
    (SELECT * FROM CUSTOMER WHERE cusId LIKE '%'||''||'%' AND cusNick LIKE '%'||''||'%' ORDER BY cusName)A) 
        WHERE RM BETWEEN 1 AND 4; 
--	//전체회원수(페이징처리위함) : 전체회원수를뽑아와 잘맞춰서 한페이지당 회원리스트수를 얼만큼 출력할건지 생각한 SQL문
SELECT COUNT(*) COUNT FROM CUSTOMER;

UPDATE CUSTOMER SET cusPhoto = 'lee.jpg' WHERE cusId='movie3';

--탈퇴
UPDATE CUSTOMER SET cusBlack = 1 WHERE cusId='movie2';
--블랙
UPDATE CUSTOMER SET cusBlack = 2 WHERE cusId='movie1';
--블랙복구
UPDATE CUSTOMER SET cusBlack = 0 WHERE cusId='movie2';

--------------------------고객등급------------------------------------------------------
-- 고객 등급
DROP TABLE CUS_GRADE;
CREATE TABLE CUS_GRADE (
    cusGrade VARCHAR2(20) PRIMARY KEY,
    cusLow NUMBER(20) NOT NULL,
    cusHigh NUMBER(20) NOT NULL,
    cusDiscount NUMBER(10) NOT NULL
);
SELECT * FROM CUS_GRADE ;
COMMIT;
ROLLBACK;
DELETE CUS_GRADE;
DELETE CUS_GRADE WHERE cusGrade = 'NORMAL';
--등급배치
INSERT INTO CUS_GRADE VALUES ('NORMAL',0,99999,0); --노말 할인율 0% 3번정도 이용시 등업
INSERT INTO CUS_GRADE VALUES ('SILVER',100000,149999,3); --십만원 3% 5번정도 이용시 등업
INSERT INTO CUS_GRADE VALUES ('GOLD',150000,299999,5); --십오만원 5% 10번정도 이용시 등업
INSERT INTO CUS_GRADE VALUES ('PLATINUM',300000,599999,10); --삼십만원 10% 20번정도 이용시 등업
INSERT INTO CUS_GRADE VALUES ('VIP',600000,1499999,20); --육십만원 20% 50번정도 이용시 등업
INSERT INTO CUS_GRADE VALUES ('VVIP',1500000,999999999999,50); --백오십만원 50% 

--등급검색
SELECT c.*,cusGrade,cusDiscount FROM CUS_GRADE G, CUSTOMER C WHERE C.cusSum BETWEEN G.cusLow AND G.cusHigh AND cusId='movie1';

--등급올려주는 SQL
UPDATE CUSTOMER SET cusSum=1560000 WHERE cusId = 'movie6';
--포인트올려주는 SQL
UPDATE CUSTOMER SET cusPoint=10000 WHERE cusId = 'movie1';


-----------------------------관리자------------------------------------------------------
-- 관리자
DROP TABLE ADMIN;
CREATE TABLE ADMIN (
    aId VARCHAR2(20) PRIMARY KEY,
    aPw VARCHAR2(20) NOT NULL,
    aName VARCHAR2(20) NOT NULL
);
SELECT * FROM ADMIN ;
COMMIT;
ROLLBACK;
DELETE ADMIN;
DELETE ADMIN WHERE AID = 'MMCINE1';
--관리자 INSERT문
INSERT INTO ADMIN VALUES ('MMCINE1','MMCINE1','오관리');
INSERT INTO ADMIN VALUES ('MMCINE2','MMCINE2','박관리');
INSERT INTO ADMIN VALUES ('MMCINE3','MMCINE3','이관리');
INSERT INTO ADMIN VALUES ('MMCINE4','MMCINE4','김관리');
INSERT INTO ADMIN VALUES ('MMCINE5','MMCINE5','심관리');
--관리자 로그인
SELECT * FROM ADMIN WHERE aId='MMCINE1' AND apw='MMCINE1';
--관리자 리스트
SELECT * FROM ADMIN;
-----------------------------자유게시판------------------------------------------------------
-- 자유게시판
DROP SEQUENCE SEQ_FREEBOARD;
CREATE SEQUENCE SEQ_FREEBOARD;
DROP TABLE FREEBOARD;

CREATE TABLE FREEBOARD (
    fBoardNum NUMBER(10) PRIMARY KEY,
    fBoardId VARCHAR2(20) NOT NULL, --닉네임
    fBoardTitle VARCHAR2(50) NOT NULL,
    fBoardContent CLOB NOT NULL,
    fBoardGroup  NUMBER(10) NOT NULL,
    fBoardStep  NUMBER(10) NOT NULL,
    fBoardIndent  NUMBER(10) NOT NULL,
    fBoardImg VARCHAR2(100),
    fBoardHit NUMBER(10) NOT NULL,
    fBoardRdate DATE DEFAULT SYSDATE
);
SELECT * FROM FREEBOARD ;
COMMIT;
ROLLBACK;
DELETE FREEBOARD;
DELETE FREEBOARD WHERE fBoardNum = 1;
--Q&A테이블 INSERT
INSERT INTO FREEBOARD VALUES (SEQ_FREEBOARD.NEXTVAL,'aaa1212','독전결말','류준열죽음ㅋㅋ',SEQ_FREEBOARD.CURRVAL,0,0,'RUW.jpg',0,SYSDATE); 



--1-1글목록 (paging포함)  --글그룹은즉 글번호이기때문에 최신순으로 목록을 가져오고 그룹내 출력순서를줘서 답변순서
SELECT * FROM (SELECT ROWNUM RN, A.* FROM(SELECT Q.* FROM FREEBOARD Q ORDER BY fBoardGroup DESC, fBoardStep)A) 
        WHERE RN BETWEEN 1 AND 4 ;      
--1-2.글 개수 (페이징할때 몇 페이지씩 나눠서 할건지 할때 필요)
SELECT COUNT(*) COUNT FROM FREEBOARD;

--2.원글쓰기 --이미지첨부
INSERT INTO FREEBOARD VALUES (SEQ_FREEBOARD.NEXTVAL,'aaa1212','독전결말','류준열죽음ㅋㅋ',SEQ_FREEBOARD.CURRVAL,0,0,'RUW.jpg',0,SYSDATE);

--2.원글쓰기 --이미지없음
INSERT INTO FREEBOARD (fBoardNum, fBoardId, fBoardTitle, fBoardContent, fBoardGroup, fBoardStep, fBoardIndent, fBoardHit, fBoardRdate)
    VALUES (SEQ_FREEBOARD.NEXTVAL,'aaa1212','독전결말','류준열죽음ㅋㅋ',SEQ_FREEBOARD.CURRVAL,0,0,0,SYSDATE); 
                             
--3-1.글의 조회수 하나올리기
UPDATE FREEBOARD SET fBoardHit = fBoardHit+1 WHERE fBoardNum = 1;                 
--3-2.글내용 보기
SELECT * FROM FREEBOARD WHERE fBoardNum=1;
--4.글 수정
UPDATE FREEBOARD SET  fBoardTitle='배고파요', fBoardContent='고기주세요', fBoardImg='JYP.jpg', fBoardRdate=SYSDATE 
    WHERE fBoardNum=1;
--5.글삭제
DELETE FREEBOARD WHERE fBoardNum=1;
--6-1.답변글 쓰기위해 원글의 정보를 가져오는 sql
SELECT * FROM FREEBOARD WHERE fBoardNum= 21 ;
--6-2.답변글 저장전에 해야하는 A스탭 (원래 답변글을 한칸내리고 새로운 답변글이 최신위치로 위치하게)
UPDATE FREEBOARD SET fBoardStep = fBoardStep+1 WHERE fBoardGroup=1 AND fBoardStep>0; --글번호=3 이고 원래 BSTEP이 0초과(원글X,답변글O)일때
--6-3.답변글 쓰기 이미지첨부
INSERT INTO FREEBOARD VALUES (SEQ_FREEBOARD.NEXTVAL,'aaa1212','독전결말','류준열죽음ㅋㅋ',1,0,0,'RUW.jpg',0,SYSDATE);
--6-3.답변글 쓰기 이미지없음
INSERT INTO FREEBOARD (fBoardNum, fBoardId, fBoardTitle, fBoardContent, fBoardGroup, fBoardStep, fBoardIndent, fBoardHit, fBoardRdate)
    VALUES (SEQ_FREEBOARD.NEXTVAL,'aaa1212','독전결말','류준열죽음ㅋㅋ',1,0,0,0,SYSDATE);

