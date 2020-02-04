INSERT INTO TB_USER VALUES('ADMIN@NAVER.COM','1234','ADMIN','MALE','ADMIN'
,'1234','TEST@NAVER.COM','N','ADMIN',SYSDATE,SYSDATE,0,null,'EMPTY','EMPTY');

INSERT INTO TB_USER VALUES('COUNSELOR@NAVER.COM','1234','COUNSELOR','MALE','COUNSELOR'
,'1234','COUNSELOR@NAVER.COM','N','COUNSELOR',SYSDATE,SYSDATE,0,null,'EMPTY','EMPTY');

INSERT INTO TB_USER VALUES('USER@NAVER.COM','1234','USER','MALE','USER'
,'1234','USER@NAVER.COM','N','USER',SYSDATE,SYSDATE,0,1234,'EMPTY','EMPTY');

INSERT INTO TB_USER VALUES('USER2@NAVER.COM','1234','USER','FEMALE','USER'
,'1234','USER2@NAVER.COM','N','USER',SYSDATE,SYSDATE,0,1234,'EMPTY','EMPTY');

INSERT INTO TB_USER VALUES('USER4@NAVER.COM','1234','USER','FEMALE','USER'
,'880206','USER4@NAVER.COM','N','USER',SYSDATE, SYSDATE,0,2222,'EMPTY','EMPTY');
INSERT INTO TB_USER VALUES('USER5@NAVER.COM','1234','USER','MALE','USER'
,'880422','USER5@NAVER.COM','N','USER',SYSDATE, SYSDATE,0,2222,'EMPTY','EMPTY');

INSERT INTO TB_BOARD VALUES(
		'ADMIN@NAVER.COM',
		'MALE',
		TB_BOARD_SEQ.NEXTVAL,
		(SELECT BOARD_GROUP_NUM FROM TB_BOARD WHERE BOARD_NUM = 1),
		(SELECT BOARD_GROUP_ORDER + 1 FROM TB_BOARD WHERE BOARD_NUM = 1),
		(SELECT BOARD_TAB + 1 FROM TB_BOARD WHERE BOARD_NUM = 1),
		'N',
		'RE:TEST2',
		'TEST2wefwef',
		'0',
		SYSDATE,
		'NOTICE',
		'0',
		null);
SELECT * FROM TB_USER where USER_ID = 'USER3@NAVER.COM'

SELECT * FROM (
		SELECT * FROM (
		SELECT ROWNUM RNM,USER_ID,BOARD_GENDER,BOARD_NUM,BOARD_GROUP_NUM,BOARD_GROUP_ORDER,BOARD_TAB,BOARD_DELETE_CHECK,BOARD_TITLE,BOARD_CONTENT,BOARD_VIEW_COUNT,BOARD_DATE,BOARD_TYPE,BOARD_FLAG,BOARD_FLAG_TYPE
		FROM (SELECT * FROM TB_BOARD ORDER BY BOARD_GROUP_NUM DESC)) WHERE RNM <=10) WHERE RNM >=1
	
		SELECT * FROM (
		SELECT ROWNUM RNM,USER_ID,BOARD_GENDER,BOARD_NUM,BOARD_GROUP_NUM,BOARD_GROUP_ORDER,BOARD_TAB,BOARD_DELETE_CHECK,BOARD_TITLE,BOARD_CONTENT,BOARD_VIEW_COUNT,BOARD_DATE,BOARD_TYPE,BOARD_FLAG,BOARD_FLAG_TYPE
		FROM (SELECT * FROM TB_BOARD ORDER BY BOARD_GROUP_NUM DESC)) WHERE RNM <=21
	
INSERT INTO TB_GROUP
VALUES('1234','USER','USER2');
INSERT INTO TB_USER VALUES('USER2@NAVER.COM','1234','USER','FEMALE','USER'
,'1234','USER2@NAVER.COM','N','USER',SYSDATE,SYSDATE,0,1234,'EMPTY','EMPTY');
INSERT INTO TB_BOARD VALUES
(#{userId},#{boardGender},TB_BOARD_SEQ.NEXTVAL,TB_BOARD_GROUP_SEQ.NEXTVAL,1,0,#{boardDeleteCheck},#{boardTitle},#{boardContent},#{boardViewCount},SYSDATE,#{boardType},#{boardFlag},#{boardFlagType})

SELECT * FROM TB_USER

INSERT INTO TB_USER VALUES('USER2@NAVER.COM','1234','호로호로','FEMALE','피카츗','1234','USER@NAVER.COM','N','USER',NULL,SYSDATE,0,'1234','EMPTY','EMPTY');

SELECT * FROM TB_USER

--회원정보 테이블
--회원정보 회원아이디 비밀번호 이름 성별 나의애칭 생년월일 이메일 탈퇴여부 등급 탈퇴날짜 가입날짜 신고횟수 커플그룹번호 앨범경로 앨범제목
--0116 커플그룹번호는 커플그룹테이블의 커플그룹번호와 참조관계
CREATE TABLE TB_USER(
    USER_ID              VARCHAR2(100)     NOT NULL, 
    USER_PW              VARCHAR2(1000)      NOT NULL, 
    USER_NAME            VARCHAR2(20)      NOT NULL, 
    USER_GENDER          VARCHAR2(6)       NOT NULL, 
    USER_NICK            VARCHAR2(100)     NULL, 
    USER_DOB             VARCHAR2(20)      NOT NULL, 
    USER_EMAIL           VARCHAR2(100)     NOT NULL, 
    USER_DEACT           VARCHAR2(10)      NOT NULL, 
    USER_STATUS          VARCHAR2(20)      NOT NULL, 
    USER_DEACT_DATE      DATE              NULL, 
    USER_REGDATE         DATE              NOT NULL, 
    USER_FLAGNO          NUMBER            NOT NULL, 
    GROUP_NUM            NUMBER            NULL, 
    USER_ALBUM_PATH      VARCHAR2(3000)    NULL, 
    USER_ALBUM_TITILE    VARCHAR2(1000)    NULL, 
    CONSTRAINT TB_USER_PK PRIMARY KEY (USER_ID)
);

SELECT * FROM TB_USER

DELETE FROM TB_USER WHERE USER_ID = 'zkis@nate.com';

SELECT * FROM TB_USER WHERE GROUP_NUM=2222

SELECT * FROM TB_BOARD


CREATE SEQUENCE TB_USER_SEQ
--DROP SEQUENCE TB_USER_SEQ;

--커플 일정 달력 테이블
--일정번호 커플그룹번호 일정제목  일정내용 일정시간 작성일자
CREATE TABLE TB_CAL(
    CAL_NUM        NUMBER           NOT NULL, 
    GROUP_NUM      NUMBER           NOT NULL, 
    CAL_TITLE      VARCHAR2(100)    NOT NULL, 
    CAL_CONTENT    VARCHAR2(100)    NOT NULL, 
    CAL_TIME       VARCHAR2(20)     NOT NULL, 
    CAL_DATE       DATE             NOT NULL, 
    CONSTRAINT TB_CAL_PK PRIMARY KEY (CAL_NUM)
)

SELECT CAL_NUM, GROUP_NUM, CAL_TITLE, CAL_CONTENT, SUBSTR(CAL_TIME,9,4) CAL_TIME, CAL_DATE 
FROM TB_CAL WHERE GROUP_NUM = 1234 AND SUBSTR(CAL_TIME,1,8)='20200125' ORDER BY CAL_NUM DESC;

SELECT SUBSTR(CAL_TIME,9,4) FROM TB_CAL WHERE GROUP_NUM=1234;  	
  	
CREATE SEQUENCE TB_CAL_SEQ

DELETE TB_BOARD WHERE BOARD_GROUP_NUM =
(SELECT BOARD_GROUP_NUM FROM TB_BOARD WHERE BOARD_NUM = 70)
        
INSERT INTO TB_CAL VALUES 
  	(TB_CAL_SEQ.NEXTVAL, 1234, '테스팅', '테스트', '2020', SYSDATE)
  	
SELECT * FROM TB_CAL ORDER BY CAL_NUM ASC 	
SELECT CAL_TIME FROM TB_CAL WHERE CAL_TITLE = '사귄날' AND GROUP_NUM = 1234;

SELECT CAL_NUM, GROUP_NUM, CAL_TITLE, CAL_CONTENT, CAL_TIME, CAL_DATE 
  	FROM TB_CAL WHERE GROUP_NUM = 1234 AND SUBSTR(CAL_TIME,1,8)=20200125 ORDER BY CAL_NUM DESC
        
--커플그룹 테이블
--커플그룹번호 파트너아이디 내아이디
--0116 커플그룹번호는 회원정보테이블의 커플그룹번호와 참조관계
CREATE TABLE TB_GROUP(
    GROUP_NUM     NUMBER           NOT NULL, 
    PARTNER_ID    VARCHAR2(100)    NOT NULL, 
    USER_ID       VARCHAR2(100)    NOT NULL, 
    GROUP_CHECK   VARCHAR2(5)      NOT NULL,
    CONSTRAINT TB_GROUP_PK PRIMARY KEY (GROUP_NUM)
)

--연습을 위한 곳 ----------------------------
SELECT * FROM TB_GROUP
SELECT USER_ID, GROUP_NUM FROM TB_USER 
SELECT * FROM TB_USER where USER_ID = 'anma55@naver.com'
SELECT * FROM TB_GROUP WHERE (USER_ID = 'USER6@NAVER.COM' OR PARTNER_ID = 'USER6@NAVER.COM')
<<<<<<< HEAD
<<<<<<< HEAD
DELETE FROM TB_USER WHERE USER_ID = 'anma55@naver.com'
=======
<<<<<<< HEAD
=======
DELETE FROM TB_GROUP WHERE USER_ID = 'USER3@NAVER.COM'
>>>>>>> 진성/master
INSERT INTO TB_GROUP 
VALUES(2222, 'USER4@NAVER.COM', 'USER5@NAVER.COM', 'Y');
0
DELETE FROM TB_GROUP WHERE GROUP_NUM = 7

UPDATE TB_GROUP SET GROUP_CHECK = 'N' WHERE USER_ID = 'USER3@NAVER.COM'

UPDATE TB_USER SET USER_DEACT = 'N' WHERE USER_ID = 'USER6@NAVER.COM'
UPDATE TB_USER SET GROUP_NUM = NULL WHERE GROUP_NUM = 45


SELECT U.USER_ID, U.GROUP_NUM, G.PARTNER_ID, G.GROUP_NUM, G.GROUP_CHECK 
FROM TB_GROUP G JOIN TB_USER U 
ON U.USER_ID = G.USER_ID 
WHERE U.USER_ID = 'USER3@NAVER.COM'

INSERT INTO TB_USER VALUES('USER6@NAVER.COM','1234','USER','FEMALE','USER'
,'1234','USER6@NAVER.COM','N','USER',SYSDATE,SYSDATE,0,null,'EMPTY','EMPTY');
=======
WHERE U.USER_ID = 'USER2@NAVER.COM'


DROP SEQUENCE TB_GROUP_SEQ --아직 실행 안함 
---------------------------------------

CREATE SEQUENCE TB_GROUP_SEQ

--ALTER TABLE TB_GROUP
--    ADD CONSTRAINT FK_TB_GROUP_GROUP_NUM_TB_USER_ FOREIGN KEY (GROUP_NUM)
--        REFERENCES TB_USER (GROUP_NUM)

--결제내역 테이블
--회원아이디 보유티켓 사용티켓 결제내역
--0116 회원아이디는 회원정보의 회원아이디와 참조관계
CREATE TABLE TB_PAYMENT(
    USER_ID       VARCHAR2(100)    NOT NULL, 
    PM_TICKET     NUMBER           NULL, 
    PM_USED       NUMBER           NULL, 
    PM_HISTORY    NUMBER           NULL, 
    CONSTRAINT TB_PAYMENT_PK PRIMARY KEY (USER_ID)
)

--ALTER TABLE TB_PAYMENT
--    ADD CONSTRAINT FK_TB_PAYMENT_USER_ID_TB_USER_ FOREIGN KEY (USER_ID)
--        REFERENCES TB_USER (USER_ID)
 
        
--상담사페이지
--회원아이디(상담사) 인출티켓개수 보유티켓개수 내담자관리번호 상담진행여부 상담목적 일정관리 요일 시간 평가점수
--0116  클라이언트번호(고객번호)는 클라이언트 관리 테이블의 클라이언트번호와 참조관계
--		회원아이디는 회원정보의 회원아이디와 참조관계
CREATE TABLE TB_COUNSELOR(
    USER_ID                     VARCHAR2(100)     NOT NULL,
    COUNSELOR_TICKET_USED       NUMBER            NULL, 
    COUNSELOR_TICKET            NUMBER            NULL,
    CLIENT_NUM                  NUMBER            NULL,
    COUNSELOR_PROGRESS_CHECK    VARCHAR2(20)      NULL, 
    COUNSELOR_PURPOSE           VARCHAR2(1000)    NULL,
    COUNSELOR_SCHEDULE          VARCHAR2(20)      NULL, 
    COUNSELOR_DAY               VARCHAR2(10)      NULL, 
    COUNSELOR_TIME              VARCHAR2(20)      NULL, 
    COUNSELOR_SCORE             NUMBER            NULL, 
    CONSTRAINT TB_COUNSELOR_PK PRIMARY KEY (USER_ID)
)

CREATE SEQUENCE TB_COUNSELOR_SEQ

--ALTER TABLE TB_COUNSELOR
--    ADD CONSTRAINT FK_TB_COUNSELOR_CLIENT_NUM_TB FOREIGN KEY (CLIENT_NUM)
--        REFERENCES TB_CLIENT_MANAGEMENT (CLIENT_NUM)
--
--ALTER TABLE TB_COUNSELOR
--    ADD CONSTRAINT FK_TB_COUNSELOR_USER_ID_TB_US FOREIGN KEY (USER_ID)
--        REFERENCES TB_USER (USER_ID)
        
--내담자관리테이블
--내담자관리번호 커플그룹번호 회원아이디
--0116  커플그룹번호는 커플그룹테이블의 커플그룹번호와 참조관계
CREATE TABLE TB_CLIENT_MANAGEMENT(
    CLIENT_NUM    NUMBER           NOT NULL, 
    GROUP_NUM     NUMBER     NOT NULL, 
    USER_ID       VARCHAR2(100)    NOT NULL, 
    CONSTRAINT TB_CLIENT_MANAGEMENT_PK PRIMARY KEY (CLIENT_NUM)
)


CREATE SEQUENCE TB_CLIENT_MANAGEMENT_SEQ

--ALTER TABLE TB_CLIENT_MANAGEMENT
--    ADD CONSTRAINT FK_TB_CLIENT_MANAGEMENT_GROUP_ FOREIGN KEY (GROUP_NUM)
--        REFERENCES TB_GROUP (GROUP_NUM)

        
--연애말사전테이블
--사전글번호 회원아이디 키워드(제목) 남자어(내용2) 여자어(내용1) 신고여부 공감횟수(좋아요)
--0115  키워드에 유니크 제약조건 추가함
--0116  회원아이디는 회원테이블의 회원아이디와 참조관계
CREATE TABLE TB_DICTIONARY(
    DIC_NUM        NUMBER            NOT NULL, 
    USER_ID        VARCHAR2(100)     NOT NULL, 
    DIC_KEYWORD    VARCHAR2(1000)     NOT NULL, 
    DIC_MALE       VARCHAR2(2000)    NOT NULL, 
    DIC_FEMALE     VARCHAR2(2000)    NOT NULL, 
    DIC_FLAG       VARCHAR2(2)       NULL, 
    DIC_LIKE       NUMBER            NULL, 
    CONSTRAINT TB_DICTIONARY_PK PRIMARY KEY (DIC_NUM)
)

DROP TABLE TB_DICTIONARY

CREATE SEQUENCE TB_DICTIONARY_SEQ

ALTER TABLE TB_DICTIONARY ADD CONSTRAINT TB_DICTIONARY_UN UNIQUE (DIC_KEYWORD);


INSERT INTO TB_DICTIONARY VALUES(TB_DICTIONARY_SEQ.NEXTVAL,'USER@NAVER.COM','자니?','새벽감성 충만해서 니가 보고싶은데 넌 뭐하니?','집들어간다는 연락 뒤로 2시간 동안 톡이 없어서 굉장히 화난 상태',0,0);
	
SELECT * FROM TB_DICTIONARY ORDER BY DIC_LIKE DESC, DIC_FLAG



--좋아요 테이블
-- 회원 아이디, 사전키워드 번호
-- 두 컬럼 각각 회원정보테이블의 회원 아이디, 사전테이블의 사전키워드 번호와 참조관계
--0129 추가

CREATE TABLE TB_LIKE(
	USER_ID		VARCHAR2(100)		NOT NULL,
	DIC_NUM		NUMBER				NOT NULL
);



--ALTER TABLE TB_DICTIONARY
--    ADD CONSTRAINT FK_TB_DICTIONARY_USER_ID_TB_US FOREIGN KEY (USER_ID)
--        REFERENCES TB_USER (USER_ID);
        

--게시판테이블
--회원아이디 글번호 그룹번호 그룹순서 글탭번호 삭제여부 글제목 글내용 조회수 작성일 글타입 신고 신고유형
--0115  성별 컬럼 추가
--0116  회원아이디는 회원테이블의 회원아이디와 참조관계
CREATE TABLE TB_BOARD
(
    USER_ID               VARCHAR2(100)     NOT NULL,
    BOARD_GENDER		  VARCHAR2(6)       NOT NULL,
    BOARD_NUM             NUMBER            NOT NULL, 
    BOARD_GROUP_NUM       NUMBER            NOT NULL, 
    BOARD_GROUP_ORDER     NUMBER            NOT NULL, 
    BOARD_TAB             NUMBER            NOT NULL, 
    BOARD_DELETE_CHECK    CHAR(1)           NOT NULL, 
    BOARD_TITLE           VARCHAR2(20)      NOT NULL, 
    BOARD_CONTENT         VARCHAR2(4000)    NOT NULL, 
    BOARD_VIEW_COUNT      VARCHAR2(20)      NOT NULL, 
    BOARD_DATE            DATE              NOT NULL, 
    BOARD_TYPE            VARCHAR2(10)      NOT NULL, 
    BOARD_FLAG            VARCHAR2(4)       NOT NULL, 
    BOARD_FLAG_TYPE       VARCHAR2(20)      NULL,
    CONSTRAINT TB_BOARD_PK PRIMARY KEY (BOARD_NUM)
)

?,?,TB_BOARD_SEQ.NEXTVAL,TB_BOARD_GROUP_SEQ.NEXTVAL,1,0,N,?,?,0,SYSDATE,?,0,NULL

INSERT INTO TB_BOARD VALUES('ADMIN@NAVER.COM','MALE',TB_BOARD_SEQ.NEXTVAL,TB_BOARD_GROUP_SEQ.NEXTVAL
,1,0,'N','HOHOHO','YAYAYA','0',SYSDATE,'0','0',NULL);
INSERT INTO TB_BOARD VALUES('ADMIN@NAVER.COM','MALE',TB_BOARD_SEQ.NEXTVAL,1
,2,1,'N','RE TEST','YAYAYA','0',SYSDATE,'0','0',NULL);

SELECT * FROM TB_BOARD
SELECT * FROM TB_BOARD


DELETE TB_BOARD WHERE BOARD_NUM = 9

DROP TABLE TB_BOARD

CREATE SEQUENCE TB_BOARD_SEQ;
CREATE SEQUENCE TB_BOARD_GROUP_SEQ;

INSERT INTO TB_BOARD VALUES('ADMIN@NAVER.COM','MALE',TB_BOARD_SEQ.NEXTVAL,TB_BOARD_GROUP_SEQ.NEXTVAL,1,0,
'N','TEST','TEST','0',SYSDATE,'NORMAL','N','EMPTY');

INSERT INTO TB_BOARD VALUES('USER@NAVER.COM','MALE',TB_BOARD_SEQ.NEXTVAL,TB_BOARD_GROUP_SEQ.NEXTVAL,1,0,
'N','TEST1','TEST1','0',SYSDATE,'NORMAL','N','EMPTY');
INSERT INTO TB_BOARD VALUES('USER@NAVER.COM','MALE',TB_BOARD_SEQ.NEXTVAL,TB_BOARD_GROUP_SEQ.NEXTVAL,1,0,
'N','TEST2','TEST2','0',SYSDATE,'NORMAL','N','EMPTY');
INSERT INTO TB_BOARD VALUES('USER@NAVER.COM','MALE',TB_BOARD_SEQ.NEXTVAL,TB_BOARD_GROUP_SEQ.NEXTVAL,1,0,
'N','TEST3','TEST3','0',SYSDATE,'NORMAL','N','EMPTY');
INSERT INTO TB_BOARD VALUES('USER@NAVER.COM','MALE',TB_BOARD_SEQ.NEXTVAL,TB_BOARD_GROUP_SEQ.NEXTVAL,1,0,
'N','TEST4','TEST4','0',SYSDATE,'NORMAL','N','EMPTY');
INSERT INTO TB_BOARD VALUES('USER@NAVER.COM','MALE',TB_BOARD_SEQ.NEXTVAL,TB_BOARD_GROUP_SEQ.NEXTVAL,1,0,
'N','TEST5','TEST5','0',SYSDATE,'NORMAL','N','EMPTY');
INSERT INTO TB_BOARD VALUES('USER@NAVER.COM','MALE',TB_BOARD_SEQ.NEXTVAL,TB_BOARD_GROUP_SEQ.NEXTVAL,1,0,
'N','TEST6','TEST6','0',SYSDATE,'NORMAL','N','EMPTY');

SELECT * FROM TB_BOARD 
 	WHERE UPPER(BOARD_TITLE) LIKE '%'||UPPER('')||'%' AND USER_ID = 'USER@NAVER.COM'


SELECT * FROM TB_BOARD


--ALTER TABLE TB_BOARD
--    ADD CONSTRAINT FK_TB_BOARD_USER_ID_TB_USER_US FOREIGN KEY (USER_ID)
--        REFERENCES TB_USER (USER_ID)
        

--댓글,대댓글 테이블
--글번호 댓글번호 작성자 내용 그룹번호 댓글탭번호 작성일 삭제여부 신고 신고유형
--0115  댓글번호 컬럼 추가됨
--		댓글번호 시퀀스 추가
--		댓글그룹번호 시퀀스 추가
--0116  글번호는 게시판테이블의 글번호와 참조관계
--0125  WRITER ->USER_ID 변경
--		그룹오더,성별 컬럼 추가
--0127  신고유형별로 나눠서 확인할 테이블이 필요한데 그게 안됐음..
--		아쉬운 점
CREATE TABLE TB_RE_BOARD(
    USER_ID            VARCHAR2(20)    NOT NULL,
    RE_GENDER		   VARCHAR2(6)     NOT NULL,
    BOARD_NUM          NUMBER          NOT NULL,
    RE_NUM             NUMBER          NOT NULL, 
    RE_GROUP_NUM       NUMBER          NOT NULL, 
    RE_ORDER		   NUMBER		   NOT NULL,
    RE_TAB             NUMBER          NOT NULL,
    RE_DELETE_CHECK    VARCHAR2(4)     NOT NULL, 
    RE_CONTENT         VARCHAR2(2000)    NOT NULL, 
    RE_DATE            DATE            NOT NULL, 
    RE_FLAG            VARCHAR2(4)     NOT NULL, 
    RE_FLAG_TYPE       VARCHAR2(20)    NOT NULL,
     CONSTRAINT TB_RE_BOARD_PK PRIMARY KEY (RE_NUM)
)

INSERT INTO TB_RE_BOARD VALUES('USER@NAVER.COM','MALE',80,1,80,1,0,'N','TEST',SYSDATE,'0','EMPTY');

DROP TABLE TB_RE_BOARD

CREATE SEQUENCE TB_RE_BOARD_SEQ;
CREATE SEQUENCE TB_RE_BOARD_GROUP_SEQ;







--ALTER TABLE TB_RE_BOARD
--    ADD CONSTRAINT FK_TB_RE_BOARD_BOARD_NUM_TB_BO FOREIGN KEY (BOARD_NUM)
--        REFERENCES TB_BOARD (BOARD_NUM)

SELECT * FROM TB_BOARD

SELECT * FROM (
		SELECT * FROM (
		SELECT ROWNUM RNM,USER_ID,BOARD_GENDER,BOARD_NUM,BOARD_GROUP_NUM,BOARD_GROUP_ORDER,BOARD_TAB,BOARD_DELETE_CHECK,BOARD_TITLE,BOARD_CONTENT,BOARD_VIEW_COUNT,BOARD_DATE,BOARD_TYPE,BOARD_FLAG,BOARD_FLAG_TYPE
		FROM (SELECT * FROM TB_BOARD ORDER BY BOARD_GROUP_NUM DESC, BOARD_GROUP_ORDER)) WHERE RNM <=5) WHERE RNM >=1
	


--사진 경로 테이블
--일회용, PRIMARY KEY 없음
CREATE TABLE TB_PHOTO(
	USER_ID				VARCHAR2(2000) ,
	PHOTO_ORIGIN_TITLE	VARCHAR2(2000) NOT NULL,
	PHOTO_PATH			VARCHAR2(2000) NOT NULL
)

SELECT * FROM TB_PHOTO;


