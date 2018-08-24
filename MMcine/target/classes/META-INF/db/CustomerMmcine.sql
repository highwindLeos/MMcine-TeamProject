-----------------------------��------------------------------------------------------
-- ��
DROP TABLE CUSTOMER;
CREATE TABLE CUSTOMER (
    cusId VARCHAR2(20) PRIMARY KEY,
    cusPw   VARCHAR2(20) NOT NULL,
    cusName VARCHAR2(20) NOT NULL,
    cusNick VARCHAR2(20) UNIQUE, --�ѱ� 6���� ���� 20�� �ʰ�����
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

--	//ȸ������ : INSERT���̿��� ������ SQL�� (���ϰ��� INT�ι޾� N�� ������Ʈ�� ���и��˾ƺ���)

INSERT INTO CUSTOMER VALUES ('movie1','movie1','�赿��','���ؿ�','19930307','010-7777-7777','movie1@naver.com','���� ���ϱ�','����','kim.jpg',0,0,SYSDATE,0);
INSERT INTO CUSTOMER VALUES ('movie2','movie2','������','��ȫö','19870101','010-7777-7777','movie2@naver.com','���� ���ϱ�','����','noimg.jpg',0,0,SYSDATE,0);

INSERT INTO CUSTOMER (cusId,cusPw,cusName,cusNick,cusBirth,cusPhone,cusEmail,cusAddress,cusGender,cusSum,cusPoint,cusRdate,cusBlack) 
    VALUES ('movie3','movie3','������','�����','19800101','010-7777-7777','movie3@naver.com','��õ ������','����',0,0,SYSDATE,0);
INSERT INTO CUSTOMER (cusId,cusPw,cusName,cusNick,cusBirth,cusPhone,cusEmail,cusAddress,cusGender,cusSum,cusPoint,cusRdate,cusBlack) 
    VALUES ('movie4','movie4','�̽���','����Ŭ����','19850101','010-7777-7777','movie4@naver.com','���� â��','����',0,0,SYSDATE,0);
INSERT INTO CUSTOMER (cusId,cusPw,cusName,cusNick,cusBirth,cusPhone,cusEmail,cusAddress,cusGender,cusSum,cusPoint,cusRdate,cusBlack) 
    VALUES ('movie5','movie5','���翭','�׷�Ʈ','19970101','010-7777-7777','movie5@naver.com','���� ������','����',0,0,SYSDATE,0);
INSERT INTO CUSTOMER (cusId,cusPw,cusName,cusNick,cusBirth,cusPhone,cusEmail,cusAddress,cusGender,cusSum,cusPoint,cusRdate,cusBlack) 
    VALUES ('movie6','movie6','�����','CEO','19970101','010-7777-7777','movie5@naver.com','���� ������','����',0,0,SYSDATE,0);    

--  //���̵� �ߺ�üũ : ���ǿ� ID�˻��� �������ν� �ߺ�üũ�Ҽ��ְ��� (������������ �ߺ�,�������ȳ����� ���԰���)
SELECT * FROM CUSTOMER WHERE cusId='movie1'; 
--	//�α��� : Ư��ȸ�� ������ �޾� ������ ������ �켱 ID���� ���� ���������� PW�� �˻��Ͽ� ���� �Է��� PW�� ������ Ȯ��
SELECT * FROM CUSTOMER WHERE cusId='movie1' AND cusPw='movie1' ;
--	//ȸ�������������� : Ư��ȸ�� ������ �޾� dto��ü�� �ְ� ����,�α��ν� ���ǰ�ü�� ������(dto)�� ���鶧 ��� ���δ�.
SELECT * FROM CUSTOMER WHERE cusId='movie1'; 
--	//ȸ�����������ϱ� : UPDATE�� �̿��� ������ SQL�� (���ϰ��� INT�ι޾� N�� ������Ʈ�� ���и��˾ƺ���)
UPDATE CUSTOMER SET cusPw = 'movie11', cusName = '�赿��', cusNick='����', cusPhone = '010-9089-7682', cusEmail = 'football@naver.com', cusAddress ='��⵵ ����', cusPhoto ='noimg.jpg'
         WHERE cusId = 'movie1';
--	//ȸ����������Ʈ(����¡on) : ��ü ȸ���� ������ ����Ұǵ� ������������ ��ŭ ����Ұ���,���ļ����� ����Ұ��� ������ SQL��
--1�ܰ�
SELECT * FROM CUSTOMER where cNAME LIKE '%'||'��'||'%' AND ctel LIKE '%'||7777||'%' ORDER BY CNAME; 
--2�ܰ�
SELECT ROWNUM RM, A.* FROM(SELECT * FROM CUSTOMER where cNAME LIKE '%'||'��'||'%' AND ctel LIKE '%'||010||'%' ORDER BY CNAME)A; 
--3�ܰ�(���̵��, �г������� ȸ���˻�)
SELECT * FROM(SELECT ROWNUM RM, A.* FROM
    (SELECT * FROM CUSTOMER WHERE cusId LIKE '%'||''||'%' AND cusNick LIKE '%'||''||'%' ORDER BY cusName)A) 
        WHERE RM BETWEEN 1 AND 4; 
--	//��üȸ����(����¡ó������) : ��üȸ�������̾ƿ� �߸��缭 ���������� ȸ������Ʈ���� ��ŭ ����Ұ��� ������ SQL��
SELECT COUNT(*) COUNT FROM CUSTOMER;

UPDATE CUSTOMER SET cusPhoto = 'lee.jpg' WHERE cusId='movie3';

--Ż��
UPDATE CUSTOMER SET cusBlack = 1 WHERE cusId='movie2';
--��
UPDATE CUSTOMER SET cusBlack = 2 WHERE cusId='movie1';
--������
UPDATE CUSTOMER SET cusBlack = 0 WHERE cusId='movie2';

--------------------------�����------------------------------------------------------
-- �� ���
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
--��޹�ġ
INSERT INTO CUS_GRADE VALUES ('NORMAL',0,99999,0); --�븻 ������ 0% 3������ �̿�� ���
INSERT INTO CUS_GRADE VALUES ('SILVER',100000,149999,3); --�ʸ��� 3% 5������ �̿�� ���
INSERT INTO CUS_GRADE VALUES ('GOLD',150000,299999,5); --�ʿ����� 5% 10������ �̿�� ���
INSERT INTO CUS_GRADE VALUES ('PLATINUM',300000,599999,10); --��ʸ��� 10% 20������ �̿�� ���
INSERT INTO CUS_GRADE VALUES ('VIP',600000,1499999,20); --���ʸ��� 20% 50������ �̿�� ���
INSERT INTO CUS_GRADE VALUES ('VVIP',1500000,999999999999,50); --����ʸ��� 50% 

--��ް˻�
SELECT c.*,cusGrade,cusDiscount FROM CUS_GRADE G, CUSTOMER C WHERE C.cusSum BETWEEN G.cusLow AND G.cusHigh AND cusId='movie1';

--��޿÷��ִ� SQL
UPDATE CUSTOMER SET cusSum=1560000 WHERE cusId = 'movie6';
--����Ʈ�÷��ִ� SQL
UPDATE CUSTOMER SET cusPoint=10000 WHERE cusId = 'movie1';


-----------------------------������------------------------------------------------------
-- ������
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
--������ INSERT��
INSERT INTO ADMIN VALUES ('MMCINE1','MMCINE1','������');
INSERT INTO ADMIN VALUES ('MMCINE2','MMCINE2','�ڰ���');
INSERT INTO ADMIN VALUES ('MMCINE3','MMCINE3','�̰���');
INSERT INTO ADMIN VALUES ('MMCINE4','MMCINE4','�����');
INSERT INTO ADMIN VALUES ('MMCINE5','MMCINE5','�ɰ���');
--������ �α���
SELECT * FROM ADMIN WHERE aId='MMCINE1' AND apw='MMCINE1';
--������ ����Ʈ
SELECT * FROM ADMIN;
-----------------------------�����Խ���------------------------------------------------------
-- �����Խ���
DROP SEQUENCE SEQ_FREEBOARD;
CREATE SEQUENCE SEQ_FREEBOARD;
DROP TABLE FREEBOARD;

CREATE TABLE FREEBOARD (
    fBoardNum NUMBER(10) PRIMARY KEY,
    fBoardId VARCHAR2(20) NOT NULL, --�г���
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
--Q&A���̺� INSERT
INSERT INTO FREEBOARD VALUES (SEQ_FREEBOARD.NEXTVAL,'aaa1212','�����ḻ','���ؿ���������',SEQ_FREEBOARD.CURRVAL,0,0,'RUW.jpg',0,SYSDATE); 



--1-1�۸�� (paging����)  --�۱׷����� �۹�ȣ�̱⶧���� �ֽż����� ����� �������� �׷쳻 ��¼������༭ �亯����
SELECT * FROM (SELECT ROWNUM RN, A.* FROM(SELECT Q.* FROM FREEBOARD Q ORDER BY fBoardGroup DESC, fBoardStep)A) 
        WHERE RN BETWEEN 1 AND 4 ;      
--1-2.�� ���� (����¡�Ҷ� �� �������� ������ �Ұ��� �Ҷ� �ʿ�)
SELECT COUNT(*) COUNT FROM FREEBOARD;

--2.���۾��� --�̹���÷��
INSERT INTO FREEBOARD VALUES (SEQ_FREEBOARD.NEXTVAL,'aaa1212','�����ḻ','���ؿ���������',SEQ_FREEBOARD.CURRVAL,0,0,'RUW.jpg',0,SYSDATE);

--2.���۾��� --�̹�������
INSERT INTO FREEBOARD (fBoardNum, fBoardId, fBoardTitle, fBoardContent, fBoardGroup, fBoardStep, fBoardIndent, fBoardHit, fBoardRdate)
    VALUES (SEQ_FREEBOARD.NEXTVAL,'aaa1212','�����ḻ','���ؿ���������',SEQ_FREEBOARD.CURRVAL,0,0,0,SYSDATE); 
                             
--3-1.���� ��ȸ�� �ϳ��ø���
UPDATE FREEBOARD SET fBoardHit = fBoardHit+1 WHERE fBoardNum = 1;                 
--3-2.�۳��� ����
SELECT * FROM FREEBOARD WHERE fBoardNum=1;
--4.�� ����
UPDATE FREEBOARD SET  fBoardTitle='����Ŀ�', fBoardContent='����ּ���', fBoardImg='JYP.jpg', fBoardRdate=SYSDATE 
    WHERE fBoardNum=1;
--5.�ۻ���
DELETE FREEBOARD WHERE fBoardNum=1;
--6-1.�亯�� �������� ������ ������ �������� sql
SELECT * FROM FREEBOARD WHERE fBoardNum= 21 ;
--6-2.�亯�� �������� �ؾ��ϴ� A���� (���� �亯���� ��ĭ������ ���ο� �亯���� �ֽ���ġ�� ��ġ�ϰ�)
UPDATE FREEBOARD SET fBoardStep = fBoardStep+1 WHERE fBoardGroup=1 AND fBoardStep>0; --�۹�ȣ=3 �̰� ���� BSTEP�� 0�ʰ�(����X,�亯��O)�϶�
--6-3.�亯�� ���� �̹���÷��
INSERT INTO FREEBOARD VALUES (SEQ_FREEBOARD.NEXTVAL,'aaa1212','�����ḻ','���ؿ���������',1,0,0,'RUW.jpg',0,SYSDATE);
--6-3.�亯�� ���� �̹�������
INSERT INTO FREEBOARD (fBoardNum, fBoardId, fBoardTitle, fBoardContent, fBoardGroup, fBoardStep, fBoardIndent, fBoardHit, fBoardRdate)
    VALUES (SEQ_FREEBOARD.NEXTVAL,'aaa1212','�����ḻ','���ؿ���������',1,0,0,0,SYSDATE);

