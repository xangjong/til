-- 서브 쿼리

-- 고객 호날두의 주문 수량 조회
-- 1. client 테이블에서 고객명 '호날두'의 clientNo를 찾아서
-- 2. bookSale 테이블에서 이 clientNo에 해당되는 주문에 대해
-- 주문일, 주문수량 출력

SELECT bsDate, bsQty
FROM bookSale
WHERE clientNo = (SELECT clientNo
				  FROM client
				  WHERE clientName = '호날두');
                  
SELECT bsDate, bsQty
FROM bookSale
WHERE clientNo IN (SELECT clientNo
				  FROM client
				  WHERE clientName = '호날두');       
                  

-- 고객 '호날두'가 주문한 총 주문수량 출력
-- 1. client 테이블에서 고객명 '호날두'의 clientNo를 찾아서
-- 2. bookSale 테이블에서 이 clientNo가 주문한 주문수량 총합
SELECT SUM(bsQty) AS "총 주문수량"
FROM bookSale
WHERE clientNo = (	SELECT clientNo
					FROM client
					WHERE clientName = '호날두');
-- = 사용 : 서브쿼리 결과가 단일행으로 처리 : 호날두가 1명만 존재한다고 가정
-- 만약, 여러 명 존재할 경우 =을 사용하면 오류 발생
                    
-- 또는 IN 사용
SELECT SUM(bsQty) AS "총 주문수량"
FROM bookSale
WHERE clientNo IN (	SELECT clientNo
					FROM client
					WHERE clientName = '호날두');
-- IN 사용 : 서브쿼리 결과가 다중행(여러 행)으로 처리 : 호날두가 여러 명 존재한다고 가정
-- 1명만 존재해도 오류 없음 
-- 따라서, 서브쿼리 결과가 단일행인지 다중행인지 확실치 않을 경우에는 IN 사용하면 오류 없음
  
  -- 가장 비싼 도서의 도서명과 가격 출력 
  -- MAX(bookPrice)
  -- 1. MAX() 가격을 찾아서
  -- 2. 이 가격에 해당되는 도서의 도서명과 가격 출력
SELECT bookName, bookPrice
FROM book
WHERE bookPrice = (SELECT MAX(bookPrice)
					FROM book);

  
SELECT bookName, bookPrice
FROM book
WHERE bookPrice IN (SELECT MAX(bookPrice)
					FROM book); 
  
  
-- 단일 행 서브 쿼리 예 : 비교 연산자 사용
-- 1. 도서의 평균 가격보다 비싼 도서에 대해서
-- 2. 도서명, 가격 출력
SELECT bookName, bookPrice
FROM book
WHERE bookPrice > (SELECT AVG(bookPrice)
					FROM book);

-- 참고 : 평균 도서 가격  
SELECT ROUND(AVG(bookPrice))
FROM book; -- 26,400
     
 -- 단일행과 다중행의 의미 : 서브쿼리 결과가 단일행(1행)이냐 다중행(여러 행)이냐     
     
     
-- 다중 행 서브 쿼리 (IN / NOT IN)
-- 도서를 구매한 적이 있는 고객의 고객번호, 고객명 출력
-- '도서를 구매한 적이 있는 고객'의 의미 : bookSale 테이블에 존재하는 고객
-- 1. bookSale 테이블에서 고객번호 찾아서
-- 2. client 테이블에서 찾은 고객번호에 해당되는 고객을 찾아
-- 고객번호, 고객명 출력
SELECT clientNo, clientName
FROM client
WHERE clientNo IN (SELECT clientNo
				   FROM bookSale);
-- 서브쿼리 결과가 다중행 : 구매 고객이 여러 명 존재하기 때문에 

-- 한 번도 도서를 주문한적이 없는 고객의 고객번호, 고객명 출력
SELECT clientNo, clientName
FROM client
WHERE clientNo NOT IN (SELECT clientNo
                       FROM booksale);

-- 중첩 서브 쿼리
-- 도서명이 '안드로이드 프로그래밍'인 도서를 구매한 고객의 고객명 출력
-- 1. book 테이블에서 '안드로이드 프로그래밍'의 bookNo 찾아서
-- 2. bookSale 테이블에서 이 bookNo 해당되는 도서를 구매한 clientNo 찾아서
-- 3. client 테이블에서 이 clientNo에 해당되는 고객명 찾아서 출력
SELECT clientName 
FROM client 
WHERE clientNo IN (SELECT clientNo 
				   FROM booksale 
                   WHERE bookNo IN (SELECT bookNo 
									FROM book
                                    WHERE bookName = '안드로이드 프로그래밍'))
ORDER BY clientName;

-- IN (SELECT clientNo 에서 IN을 = 으로 하면 오류 발생 (고객번호가 2개이기 때문에)
SELECT clientName 
FROM client 
WHERE clientNo = (SELECT clientNo 
				   FROM booksale 
                   WHERE bookNo IN (SELECT bookNo 
									FROM book
                                    WHERE bookName = '안드로이드 프로그래밍')); -- 오류


-- 다중 행 서브 쿼리 (EXISTS / NOT EXISTS)
-- 서브 쿼리의 결과가 행을 반환하면 참이 되는 연산자
-- 도서를 구매한 적이 있는 고객
-- 1. bookSale 테이블에 조건에 해당되는 행이 존재하면 참 반환
-- 2. client 테이블에서 이 clientNo에 해당되는 고객의
-- 고객번호, 고객명 출력
-- IN 연산자 사용했을 때와 동일한 결과
SELECT clientNo, clientName
FROM client
WHERE EXISTS (SELECT clientNo
			  FROM bookSale
              WHERE client.clientNo = bookSale.clientNo);

-- NOT EXISTS
-- 한 번도 주문한 적이 없는 고객의 고객번호, 고객명 출력
-- 서브 쿼리에서 조건에 해당되는 행이 없으면 TRUE 반환
-- NOT IN 사용했을 때와 동일한 결과
SELECT clientNo, clientName
FROM client
WHERE NOT EXISTS (SELECT clientNo
				  FROM bookSale
				  WHERE client.clientNo = bookSale.clientNo);

-- NULL인 경우 IN과 EXIST 차이
-- clientHobby에 NULL 포함되어 있음
SELECT clientHobby FROM client;  
-- NULL : 2
-- 공백 : 2
-- 값 : 5    
      
-- EXISTS : 서브 쿼리 결과에 NULL 값 포함  
-- NULL 값을 가진 clientHobby도 포함하여 모든 clientNo 출력   
-- NULL과 공백 다 포함 : 9 
SELECT clientNo
FROM client
WHERE EXISTS (SELECT clientHobby
			  FROM client);
      
-- IN : 서브 쿼리 결과에 NULL 값 포함되지 않음   
-- NULL 값을 갖지 않는 clientNo 만 출력
-- NULL 값은 제외, 공백은 포함
SELECT clientNo
FROM client
WHERE clientHobby IN (SELECT clientHobby
					  FROM client);  
      
      
-- ALL
-- 검색 조건이 서브 쿼리의 결과의 모든 값에 만족하면 참이 되는 연산자
-- 2번 고객이 주문한 도서의 최고 주문수량 보다 더 많은 도서를 구입한 고객의
-- 고객번호, 주문번호, 주문수량 출력
SELECT clientNo, bsNo, bsQty
FROM bookSale
WHERE bsQty > ALL (SELECT bsQty
				   FROM bookSale
				   WHERE clientNo = '2');

SELECT bsQty  FROM bookSale  WHERE clientNo = '2'; -- 5, 2, 2


-- ANY 연산자
-- 2번 고객보다 한 번이라도 더 많은 주문을 한 적이 있는 고객의
-- 고객번호, 주문번호, 주문수량 출력
-- (최소 한 번이라도 크면 됨)
SELECT clientNo, bsNo, bsQty
FROM bookSale
WHERE bsQty > ANY (SELECT bsQty
				   FROM bookSale
				   WHERE clientNo = '2'); -- 2번 고객 자신도 포함

      
-- 2번 고객 자신은 제외
SELECT clientNo, bsNo, bsQty
FROM bookSale
WHERE clientNo != '2' AND bsQty > ANY (SELECT bsQty
				   FROM bookSale
				   WHERE clientNo = '2');      
      
-- 또는
SELECT clientNo, bsNo, bsQty
FROM bookSale
WHERE bsQty > ANY (SELECT bsQty
				   FROM bookSale
				   WHERE clientNo = '2')
	 AND clientNo != '2';         
      
SELECT clientNo, bsNo, bsQty
FROM bookSale
WHERE bsQty > SOME (SELECT bsQty
				   FROM bookSale
				   WHERE clientNo = '2')
	 AND clientNo != '2';     


/*
	서브 쿼리 연습문제 : 서브 쿼리 사용
		1. 호날두(고객명)가 주문한 도서의 총 구매량 출력
		2. ‘정보출판사’에서 출간한 도서를 구매한 적이 있는 고객명 출력
		3. 베컴이 주문한 도서의 최고 주문수량 보다 더 많은 도서를 구매한 고객명 출력
		4. 서울에 거주하는 고객에게 판매한 도서의 총 판매량 출력
*/

-- 1. 호날두(고객명)가 주문한 도서의 총 구매량 출력
SELECT SUM(bsQty)
FROM bookSale
WHERE clientNo = (SELECT clientNo
				  FROM client
			  	  WHERE clientName = '호날두');

SELECT SUM(bsQty)
FROM bookSale
WHERE clientNo IN (SELECT clientNo
				  FROM client
			  	  WHERE clientName = '호날두');


-- 2. ‘정보출판사’에서 출간한 도서를 구매한 적이 있는 고객명 출력
SELECT clientName
FROM client
WHERE clientNo IN (SELECT clientNo
				   FROM bookSale
				   WHERE bookNo IN (SELECT bookNo
									FROM book
									WHERE pubNo IN (SELECT pubNo
													FROM publisher
													WHERE pubName = '정보출판사')));


SELECT clientName
FROM client
WHERE clientNo IN (SELECT clientNo
				   FROM bookSale
				   WHERE bookNo IN (SELECT bookNo
									FROM book
									WHERE pubNo = (SELECT pubNo
													FROM publisher
													WHERE pubName = '정보출판사')));
                                                    
                                                    
-- 3. 베컴이 주문한 도서의 최고 주문수량 보다 더 많은 도서를 구매한 고객명 출력
SELECT clientName
FROM client
WHERE clientNo IN (SELECT clientNo
				   FROM bookSale
                   WHERE bsQty > ALL (SELECT bsQty
								      FROM bookSale
                                      WHERE clientNo = (SELECT clientNo
													    FROM client
                                                        WHERE clientName = '베컴')));                                                    

-- MAX() 사용                                               
SELECT clientName
FROM client
WHERE clientNo IN (SELECT clientNo
				   FROM bookSale
                   WHERE bsQty > (SELECT MAX(bsQty)
								  FROM bookSale
                                  WHERE clientNo = (SELECT clientNo
													FROM client
                                                    WHERE clientName = '베컴')));    
                                                    
                                                    
 -- 4. 서울에 거주하는 고객에게 판매한 도서의 총 판매량 출력
SELECT SUM(bsQty) AS "총판매량"
FROM bookSale
WHERE clientNo IN (SELECT clientNo
				   FROM client
                   WHERE clientAddress LIKE '%서울%');                                                   
                                                    
-- -----------------------------------------------------

-- 스칼라 서브 쿼리 예제
-- 고객별로 총 주문 수량 출력
SELECT clientNo, (SELECT clientName
				  FROM client
                  WHERE client.clientNo = bookSale.clientNo) AS "고객명", SUM(bsQty) AS "총주문액"
FROM bookSale
GROUP BY clientNo;

-- 인라인 뷰 서브 쿼리 예제
-- 도서 가격이 25,000원 이상인 도서에 대하여
-- 도서별로 도서명, 도서가격, 총판매수량, 총판매액 출력
-- 총판매액 기준으로 내림차순 정렬
SELECT bookName, bookPrice, 
	   SUM(bsQty) AS "총판매수량",
       SUM(bookPrice * bsQty) AS "총판매액"
FROM (SELECT bookNo, bookName, bookPrice
	  FROM book
	  WHERE bookPrice >= 25000) book, bookSale
WHERE book.bookNo = bookSale.bookNo
GROUP BY book.BookNo
ORDER BY 총판매액 DESC;

-- ---------------------------------------------------------------

-- 내장 함수

-- ROUND(값, 자릿수)
-- 자릿수 양수 값 : 소수점 오른쪽 자릿수
-- 자릿수 음수 값 : 소수점 왼쪽 자릿수

-- 고객별 평균 주문액을 백원 단위에서 반올림하여 출력 (천원 자리까지 출력)
SELECT clientNo, ROUND(AVG(bookPrice * bsQty)) AS "평균 주문액",
				 ROUND(AVG(bookPrice * bsQty), 0) AS "1자리까지 출력",
                 ROUND(AVG(bookPrice * bsQty), -1) AS "10자리까지 출력",
                 ROUND(AVG(bookPrice * bsQty), -2) AS "100자리까지 출력",
                 ROUND(AVG(bookPrice * bsQty), -3) AS "1000자리까지 출력"
FROM book, bookSale
WHERE book.bookNo = bookSale.bookNo
GROUP BY clientNo;

-- 순위 출력 함수
-- RANK() : 값의 순위 반환 (동일 순위 개수만큼 증가)
-- DENSE_RANK() : 값의 순위 반환 (동일 순위 상관 없이 1 증가)
-- ROW_NUMBER() : 행의 순위 반환

SELECT bookPrice,
	   RANK() OVER (ORDER BY bookPrice DESC) "RANK",
       DENSE_RANK() OVER (ORDER BY bookPrice DESC) "DENSE_RANK",
       ROW_NUMBER() OVER (ORDER BY bookPrice DESC) "ROW_NUMBER"
FROM book;


/*
	문자 함수
		REPLACE() : 문자열을 치환하는 함수
		CHAR_LENGTH() : 글자의 수를 반환하는 함수
		LENGTH() : 바이트 수 반환하는 함수
		SUBSTR() : 지정한 길이만큼의 문자열을 반환하는 함수
*/

-- REPLACE() : 문자열을 치환하는 함수
-- 실제 데이터는 변경되지 않음
-- 도서명에 '안드로이드'가 포함된 도서에 대해
-- 'Android'로 변경해서 출력
SELECT bookNo, REPLACE(bookName, '안드로이드', 'Android') bookName, bookAuthor, bookPrice
FROM book
WHERE bookName LIKE '%안드로이드%';

SELECT bookNo,  bookName FROM book; -- 실제 데이터는 변경되지 않음


-- CHAR_LENGTH() : 글자의 수를 반환하는 함수
-- LENGTH() : 바이트 수 반환하는 함수
-- '서울 출판사'에서 출간한 도서의 도서명과 도서명의 글자 수, 바이트 수, 출판사명 출력
-- utf8에서 한글은 3바이트
SELECT B.bookName AS "도서명",
	   LENGTH(B.bookName) AS "바이트 수",
       CHAR_LENGTH(B.bookName) AS "길이",
       P.pubName AS "출판사"
FROM book B
	INNER JOIN publisher P ON B.pubNo = P.pubNo
WHERE P.pubName = '서울 출판사';

-- SUBSTR() : 지정한 길이만큼의 문자열을 반환하는 함수
-- SUBSTR(전체문자열, 시작, 길이)

-- 저자에서 성만 출력
SELECT SUBSTR(bookAuthor, 1, 1) AS "성"
FROM book;

-- 저자에서 이름만 출력
SELECT SUBSTR(bookAuthor, 2, 2) AS "이름"
FROM book;               

-- 연습문제
-- 1. 저자 중에서 성이 '손'인 모든 저자 출력
SELECT bookAuthor
FROM book
WHERE SUBSTR(bookAuthor, 1, 1) = '손';


-- 2. 저자 중에서 같은 성을 가진 사람이 몇 명이나 되는지 알아보기 위해
--    성별로 그룹지어 인원수 출력
--    성, 인원수 출력
SELECT SUBSTR(bookAuthor, 1, 1) "성", COUNT(*) "인원 수"
FROM book
GROUP BY SUBSTR(bookAuthor, 1, 1);
            
SELECT SUBSTR(bookAuthor, 1, 1) "성", COUNT(*) "인원 수"
FROM book
GROUP BY 성;                
                
--  현재 날짜와 시간 출력
SELECT DATE(NOW()), TIME(NOW());  -- 2022-06-08  /  13:31:14

SELECT NOW();  -- 2022-06-08 13:30:56              
                
-- 연 월 일 출력
SELECT YEAR(CURDATE()), MONTH(CURDATE()), DAYOFMONTH(CURDATE());                
SELECT CURDATE();             
                
-- 시간 분 초 마이크로초 출력
SELECT HOUR(CURTIME()), 
	  MINUTE(CURRENT_TIME()), 
      SECOND(CURRENT_TIME()), 
      MICROSECOND(CURRENT_TIME());

SELECT DATEDIFF('2022-01-01', NOW()), TIMEDIFF('23:23:59', '12:11:10');
SELECT DATEDIFF(NOW(), '2022-01-01'), TIMEDIFF('23:23:59', '12:11:10'); -- 동일
              
 -- LOAD_FILE() 함수 
 -- 테이블 생성
 CREATE TABLE flower (
	flowerNo VARCHAR(10) NOT NULL PRIMARY KEY,
    flowerName VARCHAR(30),
    flowerInfo LONGTEXT,
    flowerImage LONGBLOB
 );
              
INSERT INTO flower VALUES ('f001', '장미',
			LOAD_FILE('/Users/xangjong/Documents/dbWorkspce/file/rose.txt'),
            LOAD_FILE('/Users/xangjong/Documents/dbWorkspce/file/rose.jpg'));              

-- secure-file-priv=”C:/dbWorkspace/file” 경로 확인
SHOW variables LIKE 'secure_file_priv';
SHOW variables LIKE 'max_allowed_packet';

CREATE TABLE movie (
	movieId VARCHAR(10) NOT NULL PRIMARY KEY,
    movieTitle VARCHAR(30),
    movieDirector VARCHAR(20),
    movieStar VARCHAR(20),
    movieScript LONGTEXT,
    movieFilm LONGBLOB
);

INSERT INTO movie VALUES ('1', '쉰들러 리스트', '스필버그', '리암 니슨',
		LOAD_FILE('/Users/xangjong/Documents/dbWorkspce/file/Schindler.txt'), 
        LOAD_FILE('/Users/xangjong/Documents/dbWorkspce/file/Schindler.mp4'));
          
              
-- 파일 내보내기
-- LONGTEXT 타입의 영화 대본 데이터를 텍스트 파일로 내보내기  
SELECT movieScript FROM movie WHERE movieId='1'
	INTO OUTFILE '/Users/xangjong/Documents/dbWorkspce/file/Schindler_out2.txt'; -- 이 방법 사용 안 함(출력 상태 문제)
    
SELECT movieScript FROM movie WHERE movieId='1'
	INTO OUTFILE '/Users/xangjong/Documents/dbWorkspce/file/Schindler_out2.txt'
    LINES TERMINATED BY '\\n';  -- 줄바꿈 문자 지정   
    
-- 바이너리 파일로 내보내기
SELECT movieScript FROM movie WHERE movieId='1'
	INTO DUMPFILE '/Users/xangjong/Documents/dbWorkspce/file/Schindler_out.mp4';
    
-- 도서 테이블 데이터를 텍스트 파일로 내보내기 
SELECT * FROM book
	INTO OUTFILE '/Users/xangjong/Documents/dbWorkspce/file/book_out.txt';
    
SELECT * FROM book
	INTO OUTFILE '/Users/xangjong/Documents/dbWorkspce/file/book_out2.csv'; 
 
-- 테이블 복사 : 기본 키 제약조건 복사 안 됨
-- 복사 후 기본키 제약조건 설정해야 함

 -- book 테이블 전체를 new_book1 테이블로 복사
 CREATE TABLE new_book1 AS
 SELECT * FROM book;
 
 SELECT * FROM new_book1;
 DESCRIBE new_book1;
 
 -- new_book1 테이블에 기본키 제약조건 추가
 -- PK_new_book1_bookNo
 alter table new_book1
	add constraint PK_new_book1_bookNo 
    primary key(bookNo);

 
 -- 테이블 복사2 : 새 테이블로 일부만 복사
 -- WHERE 절에서 조건 설정
 CREATE TABLE new_book2 AS
 SELECT * FROM book WHERE bookDate >= '2020-01-01';
 
 SELECT * FROM new_book2;
 DESCRIBE new_book2;
 
 -- new_book1 테이블에 기본키 제약조건 추가
 -- PK_new_book1_bookNo
 alter table new_book2
	add constraint PK_new_book2_bookNo 
    primary key(bookNo);
 

-- 테이블 복사 3 : 기존 테이블로 데이터만 복사

-- (1) new_book2 테이블의 데이터 삭제하고
DELETE FROM new_book2;
 SELECT * FROM new_book2;

-- (2) 기존의 book 테이블에서 데이터만 new_book2 테이블로 복사
INSERT INTO new_book2 
SELECT * FROM book;

-- bookSale 테이블에서 새 테이블 new_bookSale 테이블 복사
-- 단 주문수량이 5개 이상인 행만 복사
CREATE TABLE new_bookSale AS
SELECT * FROM bookSale WHERE bsQty >= 5;

ALTER TABLE new_bookSale
  ADD CONSTRAINT PK_new_bookSale_bsNo
  PRIMARY KEY (bsNo);

 SELECT * FROM new_bookSale;
 DESCRIBE new_bookSale;

-- 다른 데이터베이스에 있는 테이블 복사
CREATE TABLE product AS
SELECT  * FROM sqldb2.product; -- 스키마명.테이블명

ALTER TABLE product
  ADD CONSTRAINT PK_product_prdNo
  PRIMARY KEY (prdNo);
  
SELECT * FROM product;
 DESCRIBE product;