
CREATE TABLE publisher (
	pubNo CHAR(10) NOT NULL PRIMARY KEY,
    pubName VARCHAR(30) NOT NULL
);

CREATE TABLE book (
	bookNo CHAR(10) NOT NULL PRIMARY KEY,
    bookName VARCHAR(30) NOT NULL,
    bookPrice INT DEFAULT 10000 CHECK(bookPrice > 1000),
    bookDate DATE,
    pubNo CHAR(10) NOT NULL,
    CONSTRAINT FK_book_publisher FOREIGN KEY (pubNo) REFERENCES publisher (pubNo)
);

-- publisher 데이터 입력 
insert into publisher (pubNo, pubName) values('1', '서울 출판사');
insert into publisher (pubNo, pubName) values('2', '강남 출판사');
insert into publisher (pubNo, pubName) values('3', '종로 출판사');

-- publisher 테이블 내용 조회 alter 
select * from publisher;
select * from book;

insert into book (bookNo, bookName, bookPrice, bookDate, pubNo)
	values ('1', '자바', 20000, '2022-01-03', '1');
    
insert into book (bookNo, bookName, bookPrice, bookDate, pubNo)
	values ('2', '자바 스크립트', 23000, '2022-01-03', '3');
    
-- 여러 개의 데이터를 한 번에 insert
insert into book (bookNo, bookName, bookPrice, bookDate, pubNo)
	values 	('3', '자바 스크립트', 35000, '2022-07-03', '2'), 
			('4', '알고리즘', 13000, '2022-08-03', '3'),
			('5', '웹 프로그래밍', 22000, '2022-09-03', '1');
-- 모든 열에 데이터 입력 시 열 이름 생략 : 여러 개 한 번에 insert
insert into book 
	values 	('6', '자바 스크립트', 35000, '2022-07-03', '2'), 
			('7', '알고리즘', 13000, '2022-08-03', '3'),
			('8', '웹 프로그래밍', 22000, '2022-09-03', '1');

CREATE TABLE student (
	stdNo CHAR(10) NOT NULL PRIMARY KEY,
    stdName VARCHAR(30) NOT NULL,
    stdYear INT DEFAULT 4 CHECK(stdYear >= 1 and stdYear <= 4)
);
CREATE TABLE course (
	courseCode CHAR(10) NOT NULL PRIMARY KEY,
    courseName VARCHAR(30) NOT NULL,
    proNo CHAR(10) NOT NULL
);

select * from student;
select * from course;

insert into student 
values ('1', '홍길동',1),
		('2', '이몽룡',2),
        ('3', '성춘향',1);

insert into course 
values ('1', '국문과', '1'),
		('2', '영어과', '2'),
        ('3', '철학과', '3');

create table product ( 
	prdNo varchar(10) not null primary key,
    prdName varchar(20) default null,
    prdPrice int default null,
    prdMaker varchar(30) default null,
    prdColor varchar(10) default null,
    ctgNo varchar(10)
);

describe product;
select * from product; 

INSERT INTO product VALUES 
	(1001,'삼성 냉장고 비스포크',1620000,'삼성전자','새틴 코럴',1), 
	(1002,'LG 디오스 와인셀러',1367000,'LG전자','검정',1),
	(1003,'QLED 8K TV',2175000,'삼성전자','블랙',1),
	(1004,'올레드 TV 55',799000,'LG전자','검정',1),
	(1005,'UHD 커브드 65인치',2250000,'삼성전자','은색',1),
	(1006,'유아용 세발 자전거',76000,'삼천리 자전거','빨강',3),
	(1007,'로드 사이클 자전거',150000,'알톤','검정',3),
	(1008,'여성용 클래식 자전거',100000,'알톤','핑크',3),
	(1009,'갤럭시북',1390000,'도시바','은색',2),
	(1010,'HP 게이밍 노트북',1200000,'HP','흰색',2),
	(1011,'65인치 LED 모니터',299000,'LG전자','검정',2),
	(1012,'광시야각 LED 모니터',195000,'삼성전자','흰색',2),
	(1013,'등산배낭 옵티마',68000,'밀레','자주',4),
	(1014,'35L 등산배낭',49000,'(주)셀파','노랑',4),
	(1015,'원터치 자동 텐트',58000,'이지트래블러','그린',4),
	(1016,'그늘막 텐트',33000,'밀레','그린',4);

-- 기본키 제약조건 추가하기 전에 text 타입을 VARCHAR(10)로 변경
-- 변경하지 않으면 text 길이가 없다는 오류 발생
ALTER TABLE product MODIFY prdNo VARCHAR(10) NOT NULL;

-- 기본키 제약조건 추가
ALTER TABLE product	
	ADD CONSTRAINT PK_product_prdNo
    PRIMARY KEY (prdNo);

-- 모든 텍스트 타입을 VARCHAR 타입으로 변경
ALTER TABLE product MODIFY prdName VARCHAR(20), 
					MODIFY prdMaker VARCHAR(30), 
					MODIFY prdColor VARCHAR(10), 
					MODIFY ctgNo VARCHAR(10);

-- 상품번호가 5인 행의 상품명을 ‘UHD TV’로 수정
UPDATE product SET prdName='UHD TV' WHERE prdNo = '5';

SELECT * FROM product;

-- 상품명이 ‘그늘막 텐트’인 행 삭제
DELETE FROM product WHERE prdName='그늘막 텐트';

-- book 실습 예제

describe book;
select * from book;

insert into book values ('9', 'Java 프로그래밍', 30000, '2022-03-10', '1'), 
						('10', '파이썬 데이터 과학', 24000, '2021-02-05', '2');
                        
update book set bookPrice=45000 where bookName='자바';  
delete from book where bookDate >= '2021-01-01' and  bookDate<='2021-12-31';


-- customer 실습 예제 
create table customer ( 
	custNo char(10) not null primary key,
    custName char(10) default null , 
    custNum varchar(20) default null
    
);

describe customer;
select * from customer;
alter table customer modify custNum varchar(20) not null;

-- 3. 고객 테이블에 ‘성별’, ‘나이’ 열 추가
alter table customer add (custAge int, custGen char(10));

-- 4. 고객 테이블에 데이터 삽입 3개
insert into customer values ('1', '홍길동', '010-1234-5678', 31, '남'),
							('2', '김길동', '010-9789-5678', 25, '남'),
                            ('3', '이길동', '010-3456-5678', 19, '여');

-- 5. 고객명이 ‘홍길동’인 고객의 전화번호 값 수정 (값은 임의로
update customer set  custNum = '010-3789-3920' where custName='홍길동';

-- 6. 나이가 20살 미만인 고객 삭제
delete from customer where custAge <20;