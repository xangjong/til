-- 조인 : 여러 개의 테이블을 결합하여 조건에 맞는 행 검색 

-- 다양한 조인 문 표기 방식 (1)
-- where 조건 사용 
-- 양쪽 테이블에 공통되는 열 이름 앞에 테이블명 표기 (모호성을 없애기 위해서)
-- 테이블명 없으면 오류 발생
select client.clientNo, clientName, bsQty
from client, bookSale
where client.clientNo = bookSale.clientNo;
-- 2개의 테이블을 조인할 경우 : 제약 조건은 1개 
-- 3개의 테이블을 조인할 경우 : 제약 조건은 2개 

-- 다양한 조인 문 표기 방식 (2)
-- 양쪽 테이블에 공통되지는 않지만 모든 열 이름에 테이블명 붙임
-- 서버에서 찾고자 하는 열의 정확한 위치를 알려주므로 성능이 향상
SELECT client.clientNo, client.clientName, bookSale.bsQty
FROM client, bookSale
WHERE client.clientNo = bookSale.clientNo;

-- 다양한 조인 문 표기 방식 (3)
-- 테이블명 대신 별칭(Alias) 사용
SELECT C.clientNo, C.clientName, BS.bsQty
FROM client C, bookSale BS
WHERE C.clientNo = BS.clientNo;

-- 다양한 조인 문 표기 방식 (4)
-- JOIN ON 명시
SELECT C.clientNo, C.clientName, BS.bsQty
FROM bookSale BS
	JOIN client C
    ON C.clientNo = BS.clientNo;

-- 다양한 조인 문 표기 방식 (5)
-- INNER JOIN ON 명시 : 가장 많이 사용되는 방법으로 우리는 이 방법 사용
SELECT C.clientNo, C.clientName, BS.bsQty
FROM bookSale BS
	INNER JOIN client C
    ON C.clientNo = BS.clientNo;


-- 조인 예제
-- client 테이블과 bookSale 테이블 조인
-- 두 테이블의 공통으로 들어 있는 값의 의미는 
-- 한 번이라도 도서를 주문한 적이 있는 고객 
-- 2개 테이블 모든 열 표시 
select * from client C
	inner join bookSale BS
    on C.clientNo = BS.clientNo;
            
-- 필요한 열만 추출
-- 테이블명 대신 별칭(Alias) 사용
-- 한 번이라도 도서를 주문한 적이 있는 고객의 고객번호와 고객명 출력
SELECT C.clientNo, C.clientName 
FROM client C
	INNER JOIN booksale BS
	ON  C.clientNo = BS.clientNo;


-- 한 번이라도 도서를 주문한 적이 있는 고객의 고객번호와 고객명 출력
-- 중복되는 행은 한 번만 출력
-- 고객번호 오름차순 정렬
SELECT DISTINCT C.clientNo, C.clientName 
FROM client C
	INNER JOIN bookSale BS 
    ON C.clientNo = BS.clientNo 
ORDER BY C.clientNo;

-- 조인하는 2개의 테이블 위치 바꿔도 됨
SELECT DISTINCT C.clientNo, C.clientName 
FROM bookSale BS
	INNER JOIN  client C
    ON C.clientNo = BS.clientNo 
ORDER BY C.clientName; -- 고객명으로 오름차순 정렬


-- 3개의 테이블 결합 : 조인 조건 2개
-- 주문된 도서에 대하여 고객명과 도서명 출력
SELECT C.clientName, B.bookName
FROM bookSale BS
	INNER JOIN client C ON C.clientNo = BS.clientNo
    INNER JOIN book B ON B.bookNo = BS.bookNo;

-- 도서를 주문한 고객의 고객 정보, 주문 정보, 도서 정보 출력
-- 주문번호, 주문일, 고객번호, 고객명, 도서명, 주문수량
SELECT BS.bsNo, BS.bsDate, C.clientNo, C.clientName, B.bookName, BS.bsQty
FROM bookSale BS
	INNER JOIN client C ON C.clientNo = BS.clientNo
    INNER JOIN book B ON B.bookNo = BS.bookNo;

-- 고객별로 총 주문 수량 계산하여
-- 고객명과 총 주문 수량 출력
-- 총 주문 수량 기준 내림차순 정렬
SELECT C.clientName, SUM(bsQty) AS "총 주문 수량"
FROM booksale BS
	INNER JOIN client C ON C.clientNo = BS.clientNo
GROUP BY C.clientNo, C.clientName -- 오라클의 경우 GROUP BY 절에 반드시 C.clientName  있어야 함
ORDER BY 2 DESC;

SELECT C.clientName, SUM(bsQty) AS "총 주문 수량"
FROM booksale BS
	INNER JOIN client C ON C.clientNo = BS.clientNo
GROUP BY C.clientNo  -- MySQL인 경우 GROUP BY 절에 C.clientName 없어도 SELECT에 C.clientName 와도 됨
ORDER BY 2 DESC;

-- ORDER BY 사용
-- 주문된 도서의 주문일, 고객명, 도서명, 도서가격, 주문수량, 주문액 계산하여 출력
-- 주문일 오름차순 정렬
SELECT BS.bsDate, C.clientName, B.bookName, B.bookPrice, BS.bsQty, 
	   (B.bookPrice * BS.bsQty) AS "주문액"
FROM bookSale BS
	INNER JOIN client C ON BS.clientNo = C.clientNo
	INNER JOIN book B ON BS.bookNo = B.bookNo
 ORDER BY BS.bsDate; -- ORDER BY 1

-- 주문액 내림차순 정렬
SELECT BS.bsDate, C.clientName, B.bookName, B.bookPrice, BS.bsQty, 
	   (B.bookPrice * BS.bsQty) AS 주문액
FROM bookSale BS
	INNER JOIN client C ON BS.clientNo = C.clientNo
	INNER JOIN book B ON BS.bookNo = B.bookNo
 ORDER BY 주문액 DESC;

-- WHERE 절 추가
-- 2019년 ~ 현재까지 판매된 도서의 주문일, 고객명, 도서명, 도서가격

select Bs.bsDate, C.clientName, B.bookName, B.bookPrice, 
	(B.bookPrice * Bs.bsQty) as 주문액
from Client C 
	inner join bookSale Bs on C.clientNo = Bs.clientNo
    inner join book B on B.bookNo = Bs.bookNo
    where Bs.bsDate>= "2019-01-01" 
    order by 주문액 desc;
    
-- ----------------- 
    select Bs.bsDate, C.clientName, B.bookName, B.bookPrice, 
	(B.bookPrice * Bs.bsQty) as 주문액
from Client C 
	inner join bookSale Bs on C.clientNo = Bs.clientNo
    inner join book B on B.bookNo = Bs.bookNo
    where Bs.bsDate between '2019-01-01' and date()
    order by 주문액 desc;
    
    
--  조인 연습문제 
-- 1. 모든 도서에 대하여 도서의 도서번호, 도서명, 출판사명 출력
select B.bookNo, B.bookName, P.pubName
from book B 
	inner join publisher P on B.pubNo = P.pubNo;
    
-- 2. ‘서울 출판사'에서 출간한 도서의 도서명, 저자명, 출판사명 출력 (조건에 출판사명 사용)
select B.bookName, B.bookAuthor, P.pubName
from book B 
	inner join publisher P on B.pubNo = P.pubNo
    where P.pubName='서울 출판사';
    
-- 3. ＇종로출판사'에서 출간한 도서 중 판매된 도서의 도서명 출력 (중복된 경우 한 번만 출력) (조건에 출판사명 사용)
select distinct B.bookName
from book B 
	inner join bookSale Bs on Bs.bookNo = B.bookNo
	inner join publisher P on B.pubNo = P.pubNo
    where P.pubName='종로출판사';
    
-- 4. 도서가격이 30,000원 이상인 도서를 주문한 고객의 고객명, 도서명, 도서가격, 주문수량 출력
select C.clientName, B.bookName, B.bookPrice, Bs.bsQty 
from bookSale Bs
	inner join book B on Bs.bookNo= B.bookNo
    inner join Client C on C.clientNo= Bs.clientNo
   having bookprice>=30000;
   
-- 5. '안드로이드 프로그래밍' 도서를 구매한 고객에 대하여 도서명, 고객명, 성별, 주소 출력 (고객명으로 오름차순 정렬)
select B.bookName, C.clientName, C.clientGender, clientAddress
from bookSale Bs
	inner join book B on Bs.bookNo= B.bookNo
    inner join Client C on C.clientNo= Bs.clientNo
   having bookName='안드로이드 프로그래밍'
   order by C.clientName;
   
-- 6. ‘도서출판 강남'에서 출간된 도서 중 판매된 도서에 대하여 ‘총 매출액’ 출력 
-- 출판사명 추가 
select P.pubName, sum(B.bookPrice * Bs.bsQty) as 총매출액
from bookSale Bs
	inner join book B on Bs.bookNo= B.bookNo
    inner join publisher P on P.pubNo = B.pubNo
 where P.pubName='도서출판 강남';

-- 7. ‘서울 출판사'에서 출간된 도서에 대하여 판매일, 출판사명, 도서명, 도서가격, 주문수량, 주문액 출력
select Bs.bsDate, P.pubName, B.bookName, B.bookPrice, Bs.bsQty, (B.bookPrice * Bs.bsQty) as 주문액
from bookSale Bs
	inner join book B on Bs.bookNo= B.bookNo
    inner join publisher P on P.pubNo = B.pubNo
   where P.pubName='서울 출판사';
   
-- 8. 판매된 도서에 대하여 도서별로 도서번호, 도서명, 총 주문 수량 출력
select B.bookNo, B.bookName, sum(Bs.bsQty) as "총 주문 수량"
from bookSale Bs
	inner join book B on B.bookNo = Bs.bookNo
	group by B.bookNo;


-- 9. 판매된 도서에 대하여 고객별로 고객명, 총구매액 출력 ( 총구매액이 100,000원 이상인 경우만 해당)
	select C.clientName, sum(B.bookPrice * Bs.bsQty) as 총구매액
    from bookSale Bs
		inner join Client C on C.clientNo = Bs.clientNo
        inner join book B on B.bookNo = Bs.bookNo
        group by C.clientNo
        having 총구매액>=100000;
        
-- 10. 판매된 도서 중 ＇도서출판 강남'에서 출간한 도서에 대하여 고객명, 주문일, 도서명, 주문수량, 출판사명 출력 (고객명으로 오름차순 정렬)
select C.clientName, Bs.bsDate, B.bookName, Bs.bsQty, P.pubName
from booksale Bs 
	inner join Client C on C.clientNo = Bs.clientNo
    inner join book B on B.bookNo= Bs.bookNo
    inner join publisher P on P.pubNo = B.pubNo
    order by 1;

select * 
from client C 
	left outer join bookSale Bs
    on C.clientNo = Bs.clientNo
    order by C.clientNo;


-- 고객 중에서 한 번도 구매한 적이 없는 고객 출력 
select C.clientName
from client C 
	left outer join bookSale Bs
    on C.clientNo = Bs.clientNo
    where Bs.bsNo is null
    order by C.clientNo;
    
-- 도서 중에서 한 번도 판매된 적이 없는 도서 출력(도서번호, 도서명)
select B.bookNo, B.bookName
from book B
	left outer join bookSale Bs
    on B.bookNo = Bs.bookNo
    where Bs.bsNo is null
    order by B.bookNo;

-- 오른쪽(right) 테이블 기준
-- 오른쪽 테이블(bookSale) 데이터 모두 출력 
-- 왼쪽 테이블에서는 null이 아닌 고객의 의미 : 한 번이라도 주문한 적이 있는 고객 

select * 
from client C
	right outer join bookSale Bs 
    on C.clientNo = Bs.clientNo
    order by C.clientNo;
    
-- 한 번이라도 주문한 적이 있는 고객의 번호, 이름 출력 
-- 중복된 경우 한 번만 출력 

select distinct C.clientNo, C.clientName
from client C
	right outer join bookSale Bs 
    on C.clientNo = Bs.clientNo
    order by C.clientNo;
    
-- 완전 외부 조인 (full outer join)
-- mysql에서는 full outer join 지원하지 않음 
-- left join과 right join을 union해서 사용
select * 
	from client C 
    left join bookSale Bs
    on C.clientNo = Bs.clientNo
    
union 

select * from client C 
	right join bookSale Bs
    on C.clientNo = Bs.clientNo;
