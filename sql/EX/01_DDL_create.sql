
-- 스키마 (데이터베이스 생성)
CREATE SCHEMA sqldb DEFAULT CHARACTER SET utf8;
CREATE SCHEMA sqldb2 DEFAULT CHARACTER SET utf8mb4;

-- 스키마 (데이터베이스 삭제)
DROP SCHEMA sqldb2;

use sqldb;

-- 상품 테이블 생성
-- 제약조건
	-- 기본키 : prdNo, NOT NULL
    -- prdName : NOT NULL로 설정

-- 기본키 제약조건 설정 방법1
CREATE TABLE product(
	prdNo CHAR(10) NOT NULL PRIMARY KEY,
    prdName VARCHAR(30) NOT NULL,
    prdPrice INT,
    prdCompany VARCHAR(30)
);

alter table product 
	add constraint PK_product_prdName
	primary key (prdName);

describe product;

-- 기본키 제약조건 설정 방법2
CREATE TABLE product2(
	prdNo CHAR(10) NOT NULL,
    prdName VARCHAR(30) NOT NULL,
    prdPrice INT,
    prdCompany VARCHAR(30),
    PRIMARY KEY(prdNo)
);

-- 기본키 제약조건 설정 방법3
CREATE TABLE product3(
	prdNo CHAR(10) NOT NULL,
    prdName VARCHAR(30) NOT NULL,
    prdPrice INT,
    prdCompany VARCHAR(30),
    CONSTRAINT PK_product_prdNo PRIMARY KEY(prdNo)
);
-- 복합키 : CONSTRAINT PK_product_prdNo PRIMARY KEY(prdNo, prdName)

-- -----------------------------------------------------------------

-- 외래키 제약조건 설정
/*
	출판사 (출판사번호, 출판사명, 전화, … )
	도서 (도서번호, 도서명, 가격, 발행일, 출판사번호(FK))

	(1) 출판사 테이블 생성
		-- 제약조건
			- 기본키 : pubNo, NOT NULL
            - pubName : NOT NULL
	(2) 도서 테이블 생성
		-- 제약조건
			- bookNo, NOT NULL
            - 외래키 : pubNo (참조 테이블과 기본키 지정)
            - bookPrice : 기본값 10000, 1000보다 크게 설정alter

*/

CREATE TABLE publisher (
	pubNo CHAR(10) NOT NULL PRIMARY KEY,
    pubName VARCHAR(30) NOT NULL
);

-- 외래키 생성 방법 (1)
CREATE TABLE book (
	bookNo CHAR(10) NOT NULL PRIMARY KEY,
    bookName VARCHAR(30) NOT NULL,
    bookPrice INT DEFAULT 10000 CHECK(bookPrice > 1000),
    bookDate DATE,
    pubNo CHAR(10) NOT NULL,
    CONSTRAINT FK_book_publisher FOREIGN KEY (pubNo) REFERENCES publisher (pubNo)
);

-- 외래키 생성 방법 (2)
CREATE TABLE book2 (
	booNo CHAR(10) NOT NULL PRIMARY KEY,
    bookName VARCHAR(30) NOT NULL,
    bookPrice INT DEFAULT 10000 CHECK(bookPrice > 1000),
    bookDate DATE,
    pubNo CHAR(10) NOT NULL,
    FOREIGN KEY (pubNo) REFERENCES publisher (pubNo)
);

-- 테이블 상제 정보 확인 : DESCRIBE
DESCRIBE book; 

CREATE TABLE book4 (
	booNo CHAR(10) NOT NULL PRIMARY KEY, -- 기본키 제약 조건 설정
    bookName VARCHAR(30) NOT NULL,
    bookPrice INT DEFAULT 10000 CHECK(bookPrice > 1000),
    bookDate DATE,
    pubNo CHAR(10) NOT NULL,
    FOREIGN KEY (pubNo) REFERENCES publisher (pubNo) -- 외래키 제약 조건 설정
);

CREATE TABLE department (
	dptCode CHAR(10) NOT NULL PRIMARY KEY,
    dptName VARCHAR(30) NOT NULL,
    dptPhone CHAR(20)
);

CREATE TABLE student (
	stdNo CHAR(10) NOT NULL PRIMARY KEY,
    stdName VARCHAR(30) NOT NULL,
    stdYear INT DEFAULT 4 CHECK(stdYear >= 1 and stdYear <= 4),
    stdAddress VARCHAR(30),
    stdBirthDate DATE,
    dptCode CHAR(10) NOT NULL,
    CONSTRAINT FK_std_department FOREIGN KEY (dptCode) REFERENCES department (dptCode)
);

CREATE TABLE professor (
	proNo CHAR(10) NOT NULL PRIMARY KEY,
    proName VARCHAR(30) NOT NULL,
    proPhone CHAR(20),
    dptCode CHAR(10) NOT NULL,
    CONSTRAINT FK_pro_department FOREIGN KEY (dptCode) REFERENCES department (dptCode)
);

CREATE TABLE course (
	courseCode CHAR(10) NOT NULL PRIMARY KEY,
    courseName VARCHAR(30) NOT NULL,
    courseCredit INT DEFAULT 3 CHECK (courseCredit >= 1 and courseCredit <= 6),
    proNo CHAR(10) NOT NULL,
    CONSTRAINT FK_course_professor FOREIGN KEY (proNo) REFERENCES professor (proNo)
);

create table scores(
	stdNo char(10) not null, 
    courseCode char(10) not null,
    score int default 0 not null check(score >=0 and score <= 100),
    grade char(10) not null,
	foreign Key (stdNo) references student(stdNo),
    foreign Key (courseCode) references course(courseCode),
    primary key(stdNo, courseCode)
);

create table scores(
	stdNo char(10) not null, 
    courseCode char(10) not null,
    score int default 0 not null check(score >=0 and score <= 100),
    grade char(10) not null,
    CONSTRAINT PK_scores_stdNo_courseCode primary key(stdNo, courseCode),
	CONSTRAINT FK_scroes_student foreign Key (stdNo) references student(stdNo),
    CONSTRAINT FK_scroes_course foreign Key (courseCode) references course(courseCode)    
);

-- 복합키 : 2개 속성으로 기본키 설정 주의
/*
	따로 설정하면 안 되고 (오류),
		stdNo char(10) not null PRIMARY KEY, 
		courseCode char(10) not null PRIMARY KEY,
	
    한꺼번에 설정해야 함
     CONSTRAINT PK_scores_stdNo_courseCode primary key(stdNo, courseCode),
*/
-- 다음과 같이 기본키 설정하면 오류 발생 
create table scores2(
	stdNo char(10) not null PRIMARY KEY, 
    courseCode char(10) not null PRIMARY KEY,
    score int default 0 not null check(score >=0 and score <= 100),
    grade char(10) not null,   
	CONSTRAINT FK_scroes_student foreign Key (stdNo) references student(stdNo),
    CONSTRAINT FK_scroes_course foreign Key (courseCode) references course(courseCode)    
);

-- 자동 증가
CREATE TABLE board (
	boradNo INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    boardTitle VARCHAR(30) NOT NULL,
    boardAuthor VARCHAR(20),
    boardContent VARCHAR(200) NOT NULL
);

CREATE TABLE board2 (
	boardNo INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    boardTitle VARCHAR(30) NOT NULL,
    boardAuthor VARCHAR(20),
    boardContent VARCHAR(200) NOT NULL
);


ALTER TABLE board2 AUTO_INCREMENT = 100;
SET @@auto_increment_increment=3;

set sql_safe_updates=0; 

SET @COUNT = 0;
UPDATE board2 SET boardNo = @COUNT:=@COUNT+1;

ALTER TABLE board2 AUTO_INCREMENT = 1;




