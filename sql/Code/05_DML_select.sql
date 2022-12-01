describe publisher;
select * from publisher;

create table publisher (
	pubNo varchar(10) not null primary key, 
    pubName varchar(30)
);

describe book;
select * from book;

create table book (
	bookNo char(10) not null primary key,
    bookName varchar(30),
    bookAuthor varchar(20),
    bookPrice int,
    bookDate date,
    bookStock int,
    pubNo varchar(10) not null,
    CONSTRAINT FK_book_publisher FOREIGN KEY (pubNo) REFERENCES publisher (pubNo)
);

describe client;
select * from client;

create table client (
	clientNo char(10) not null primary key, 
    clientName varchar(20),
    clientPhone varchar(25),
    clientAddress varchar(35),
    clientBirth date,
    clientHobby varchar(20),
    clientGender varchar(5)
);


describe booksale;
select * from booksale;

create table booksale(
	bsNo varchar(10) not null primary key,
    bsDate date,
    bsQty int,
    clientNo varchar(10) not null,
    bookNo varchar(10) not null,
    CONSTRAINT FK_book_booksale FOREIGN KEY (bookNo) REFERENCES book (bookNo),
    CONSTRAINT FK_client_booksale FOREIGN KEY (clientNo) REFERENCES client (clientNo)
);

INSERT INTO publisher VALUES ('1','서울 출판사'),('2','도서출판 강남'),('3','종로출판사');

INSERT INTO book VALUES ('1001','데이터베이스 이론','홍길동',22000,'2018-11-11',5,'3'),
('1002','자바 프로그래밍','이몽룡',25000,'2020-12-12',4,'1'),
('1003','인터넷프로그래밍','성춘향',30000,'2019-02-10',10,'2'),
('1004','안드로이드 프로그래밍','변학도',23000,'2017-10-10',2,'1'),
('1005','안드로이드 앱','강길동',26000,'2019-01-11',5,'2'),
('1006','MS SQL SERVER','박지성',35000,'2019-03-25',7,'3'),
('1007','HTML & CSS','손홍민',18000,'2021-05-30',3,'1'),
('1008','MFC 입문','류현진',20000,'2014-12-12',5,'1'),
('1009','안드로이드 게임 제작','나길동',33000,'2017-10-31',5,'2'),
('1010','C++객체지향 프로그래밍','김길동',24000,'2016-04-20',2,'3'),
('1011','JSP 웹 프로그래밍','김연아',27000,'2021-10-23',8,'1'),
('1012','해커들의 해킹 기법','손연재',32000,'2017-07-07',1,'2'),
('1013','자료구조','홍길동',19000,'2019-01-20',4,'1'),
('1014','웹 해킹과 침해사고 분석','성춘향',35000,'2017-11-25',5,'2'),
('1015','자바스크립 & jQuery','홍길동',27000,'2018-10-22',2,'2'),
('1016','알고리즘','김철수',25000,'2021-10-10',10,'1');

INSERT INTO client VALUES ('1','메시','010-1111-1111','서울','1987-06-24','축구','남'),
('2','호날두','010-2222-2222','천안','1984-02-05',NULL,'남'),
('3','샤라포바','010-3333-3333','제주','1987-04-19',NULL,'여'),
('4','베컴','010-4444-4444','안양','1994-05-02','영화','남'),
('5','네이마르','010-5555-5555','수원','1992-02-05','게임','남'),
('6','윌리엄스','010-6666-6666','서울','1981-09-26','테니스','여'),
('7','음바페','010-7777-7777','천안','1991-01-07',' ','남'),
('8','마네','010-8888-8888','부산','1982-04-22','','남'),
('9','루니','010-9999-9999','서울','1996-10-24','등산','남');

INSERT INTO booksale VALUES ('1','2020-04-05',2,'3','1006'),
('2','2021-10-11',1,'7','1004'),('3','2018-02-20',5,'2','1009'),
('4','2020-07-10',4,'1','1011'),('5','2018-09-09',2,'2','1002'),
('6','2020-02-09',2,'4','1003'),('7','2019-04-16',2,'2','1002'),
('8','2021-06-02',9,'7','1005'),('9','2019-07-25',1,'8','1004');


-- book 테이블에서 모든 행 검색하여 출력
-- 모든(*) 열
SELECT * FROM book;

-- 도서명과 가격만 검색하여 출력
SELECT bookName, bookPrice FROM book;

-- 저자만 검색하여 출력
SELECT bookAuthor FROM book;

-- 중복되는 행은 한 번만 출력해서 저자만 검색하여 출력 
SELECT DISTINCT bookAuthor FROM book;

-- ---------------------------------------------------
-- 비교 (==, <, >, <=, >=, !=)

-- 저자가 '홍길동'인 도서의 도서명, 저자 출력 
select bookName, bookAuthor from book
where bookAuthor = '홍길동';

-- --가격이 30000원 이상인 도서의 도서명, 가격, 재고 출력 
select bookName, bookPrice, bookStock from book 
where bookPrice >=30000;

-- 재고가 3~5개 사이인 도서의 도서명, 재고 출력 
select bookName, bookStock from book
where bookStock between 3 and 5;

-- (2) select bookName, bookStock from book
-- where bookStock >= 3 and bookstock <=5;

-- 리스트에 포함 (in, not in) 
-- 출판사 명이 '서울 출판사' 와 '도서 출판 강남'인 도서의 alter
-- 도서명, 출판사 번호 출력 
select bookName, pubNo from book 
where pubNo in ('1' ,'2');

-- 출판사 명이 '도서출판 강남' (pubNo='2')가 아닌 도서의 도서명, 출판사 출력 
select bookName, pubNo from book 
where pubNo not in ('2');

-- null

-- 먼저 client 테이블 확인 : null 값 없음 
select * from client;

-- null로 설정 
update client set clientHobby=null
where clientName in ('호날두', '샤라포바');

update client set clientHobby=null
where clientName='호날두';

update client set clientHobby=null
where clientName='샤라포바';

select clientName, clientHobby from client; 

-- 취미에 NULL 값이 들어 있는 행만 출력
select clientName, clientHobby from client
where clientHobby is null; 

-- 취미에 NULL 값이 아닌 행만 출력
select clientName, clientHobby from client
where clientHobby is not null; 

-- 취미에 공백이 들어 있는 행만 출력, 스페이스 (개 수 상관 없음)
select clientName, clientHobby from client
where clienthobby = '';

select clientName, clientHobby from client
where clienthobby = '     ';

select * from book where bookAuthor = '홍길동' and bookStock>=3;

select * from book where bookAuthor = '성춘향' or bookAuthor = '홍길동';

select * from book where bookAuthor in ('성춘향', '홍길동');

 -- 패턴 매칭 (like)
 
 -- 출판사 테이블에서 출판사 명에 '출판사'가 포함된 모든 행 출력 
 
 select * from publisher where pubName like '%출판사%';
 
 -- 고객 테이블에서 출생년도가 1990년대인 모든 고객 출력  
select clientName, clientBirth from client where clientBirth like '199%';

-- 고객 이름이 4글자인 모든 고객 출력 

select * from client where clientName like '____';

-- 도서 테이블에서 도서명에 '안드로이드가 들어 있지 않는 도서의 도서명 출력
select * from book where bookName not like ('%안드로이드%');



-- -----------연습 예제 ------------------------------
describe client;
select * from client;

-- 1. 고객 테이블에서 고객명, 생년월일, 성별 출력
select clientName, clientBirth, clientGender from client; 

-- 2. 고객 테이블에서 주소만 검색하여 출력 (중복되는 주소는 한번만 출력)
select distinct clientAddress from client;

-- 3. 고객 테이블에서 취미가 '축구'이거나 '등산'인 고객의 고객명, 취미 출력
select clientName, clientHobby from client where (clientHobby = '축구' or clientHobby = '등산');
select clientName, clientHobby from client where clientHobby in('축구', '등산');

-- 4. 도서 테이블에서 저자의 두 번째 위치에 '길'이 들어 있는 저자명 출력 (중복되는 저자명은 한번만 출력)
select distinct bookAuthor from book where bookAuthor like '_길%';

-- 5. 도서 테이블에서 발행일이 2019년인 도서의 도서명, 저자, 발행일 출력
select bookName, bookAuthor, bookDate from book where (bookDate >='2019.01.01' and bookDate<'2019.12.31');
select bookName, bookAuthor, bookDate from book where bookDate like '2019%';
select bookName, bookAuthor, bookDate from book where bookDate between '2019.01.01' and '2019.12.31';

-- 6. 도서판매 테이블에서 고객번호1, 2를 제외한 모든 판매 데이터 출력
select  distinct * from bookSale where clientNo not in('1','2');

-- 7. 고객 테이블에서 취미가 NULL이 아니면서 주소가 '서울'인 고객의 고객명, 주소, 취미 출력
select clientName, clientAddress, clientHobby from client where (clientHobby is not null and clientAddress='서울');

-- 8. 도서 테이블에서 가격이 25,000원 이상이면서 저자 이름에 '길동'이 들어가는 도서의 도서명, 저자, 가격, 재고 출력
select bookName, bookAuthor, bookPrice, bookStock from book where bookPrice>=25000 and bookAuthor like '%길동%';

-- 9. 도서 테이블에서 가격이 20,000 ~ 25,000원인 모든 도서 출력 
select * from book where (bookPrice >=20000 and bookPrice<=25000);
select * from book where bookPrice between 20000 and 25000;

-- 10. 도서 테이블에서 저자명에 '길동'이 들어 있지 않는 도서의 도서명, 저자 출력
select bookName, bookAuthor from book where bookAuthor not like '%길동%';

select * from bookSale;
describe bookSale;
