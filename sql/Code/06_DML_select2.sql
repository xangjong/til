-- order by : 정렬 

-- 도서명 순으로 도서 검색 (기본 : 오름차순 (일반적으로 asc 생략))

select * from book 
order by bookName asc;

select * from book 
order by bookName; -- asc 생략 

select * from book 
order by bookName desc;

-- 한글 -> 영문 -> 숫자 순서로 출력 

select * from book
order by 
(case when ascii(substring(bookName, 1)) between 48 and 57 then 3
	  when ascii(substring(bookName, 1)) <122 then 2 else 1 end), bookName;
-- 영어 대문자 A ~ Z : 65 ~ 90
-- 	   소문자 a ~ z : 97 ~ 122 
-- 숫자 0 ~ 9 : 48 ~ 57

select * from book
order by 
(case when ascii(substring(bookName, 1)) between 48 and 57 then 3
	  when ascii(substring(bookName, 1)) <122 then 2 else 1 end), bookName desc;
      
-- 상위 n개만 출력 : limit n 
select * from book 
order by bookName 
limit 5;

-- 또는 offset 0 설정 ( offset 시작 위치) : 첫 번째부터 시작 
select * from book 
order by bookName 
limit 5 offset 0;

-- 또는 limit 시작, 출력 개수 
select * from book 
order by bookName 
limit 0, 5; -- 첫 번째부터 5개

select * from book 
order by bookName 
limit 10, 5; -- 11번째부터 5개

select * from book 
order by bookName 
limit 10, 7; -- 11번째부터 7개 (총 15개 이므로 15 이후 데이터 없으면 출력 안 됨)

-- 도서 테이블에서 재고 수량을 기준으로 내림차순 정렬하여 도서명, 저자, 재고 출력 
select bookName, bookAuthor, bookStock from book 
order by bookStock desc;

-- 2차 정렬 
-- 재고 수량이 동일한 경우, 저자명으로 오름차순 2차 정렬 
select bookName, bookAuthor, bookStock from book 
order by bookStock desc, bookAuthor asc; -- 1차 재고 내림차순, 2차 저자 오름차순 정렬

select bookName, bookAuthor, bookStock from book 
order by bookStock desc, bookAuthor; -- 생략해도 디폴트 값은 asc 

select bookName, bookAuthor, bookStock from book 
order by bookStock desc, bookAuthor desc; -- 1차 재고 수량 내림차순, 2차 저자 내림차순 정렬 

-- 집계 함수
-- SUM() : 합계
-- AVG() : 평균
-- COUNT() : 선택된 열의 행 수 (널 값은 제외)
-- COUNT(*) : 전체 행의 수
-- MAX() : 최대
-- MIN() : 최소

-- 도서 테이블에서 총 재고 수량 계산하여 출력
-- 열 이름 없이 출력 
select sum(bookStock) from book;

-- 열 이름 sum of bookStock으로 총 재고 수량 계산하여 출력 
select sum(bookStock) as "총 재고량" 
from book;

-- 열 이름으로 작은 따옴표도 사용 가능 
select sum(bookStock) as '총 재고량'
from book;

-- 열 이름에 공백이 들어 있지 않으면 따옴표 없어도 가능
select sum(bookStock) as 총재고량3
from book;

-- 도서판매 테이블에서 
-- 고객번호 2인 호날두가 주문한 총 주문 수량 계산하여 출력 
select sum(bsQty) from bookSale where clientNo='2'; 
select * from bookSale;

-- 호날두가 주문한 내역과 총 주문수량 합계 출력
-- 먼저 주문내열 결과 출력하고 그 아래에 합계 결과 출력
-- 2개의 쿼리를 합침 : UNION ALL 사용
SELECT clientNo, bsDate, bsQty
FROM bookSale
WHERE clientNo= '2'

UNION ALL

SELECT "합계" clientNo, bsDate, SUM(bsQty) AS bsQty
FROM bookSale
WHERE clientNo= '2';

SELECT * FROM bookSale;


-- 도서판매 테이블에서 최대/최소 주문수량 
select max(bsQty) as "최대 주문수량", min(bsQty) as "최소 주문수량" from bookSale;

-- 도서 테이블에서 도서의 가격 총액, 평균 가격, 최고가, 최저가 출력 
select sum(bookPrice) as "가격 총액", avg(bookPrice) as "평균 가격", max(bookPrice) as "최고가", min(bookPrice) as "최저가"
from book;

-- 열 이름에 공백이 들어 있지 않으면 따옴표 없어도 됨
select sum(bookPrice) 가격총액2, avg(bookPrice) 평균가격2, max(bookPrice) 최고가2, min(bookPrice) 최저가2
from book;

select sum(bookPrice) as "가격 총액", round(avg(bookPrice)) as "평균 가격", max(bookPrice) as "최고가", min(bookPrice) as "최저가"
from book;

select count(*) as "총 판매 건수"
from bookSale;

-- 도서 테이블에서 총 도서 수 (모든 행의 수)
select count(*) as "총 도서 수"
from book;

-- 고객 테이블에서 총 고객 수 (모든 행의 수)
select count(*) as "총 고객 수"
from client;

-- 고객 테이블에서 총 취미 개수 출력 
select count(clientHobby) as "총 취미 개수"
from client; -- 총 9개중 7개 출력 (null 값만 제외, 공백 포함) 
select clientHobby from client;

-- 고객 테이블의 취미 열에서 값이 들어 있는 행의 수 출력 
-- 5개 (null과 공백 제외)
select count(clientHobby) as "취미" 
from client 
where clientHobby not in('');

select count(clientHobby) as "취미"
from client 
where clientHobby != '';

-- 도서 판매 테이블에서 도서번호별로 주문수량 합계 출력 
-- group by 절에서 정렬 
select bookNo, sum(btsQty) as "주문량 합계"
from bookSale
group by bookNo;

-- order by 정렬 
select bookNo, sum(btsQty) as "주문량 합계"
from bookSale
group by bookNo
order by bookNo;

-- 또는 
select bookNo, sum(btsQty) as "주문량 합계"
from bookSale
group by bookNo
order by 1; -- 첫 번째 열로 정렬 

-- 두 번째 열 "주문량 합계로 정렬 
select bookNo, sum(btsQty) as "주문량 합계"
from bookSale
group by bookNo
order by 2; 

-- 주의! order by 다음 열 이름에 따옴표가 있으면 정렬 안 됨 
select bookNo, sum(btsQty) as "주문량 합계"
from bookSale
group by bookNo
order by "주문량 합계"; 

-- 공백 없는 열 이름으로 따옴표 없으면 정렬 가능 
select bookNo, sum(btsQty) as 주문량합계
from bookSale
group by bookNo
order by 주문량합계; 

-- 참고 : 열 이름에 따옴표 있으면 영어도 안 됨(큰 따옴표, 작은 따옴표 모두 안 됨)
select bookNo, sum(btsQty) as "sum of sale"
from bookSale
group by bookNo
order by "sum of sale";

--  rollup : 중간의 소합계와 총합계 출력 
select bookNo, sum(btsQty) as 주문량합계
from bookSale
group by bookNo
with rollup;

select bookNo, sum(btsQty) as 주문량합계
from bookSale
group by bookNo
with rollup
order by 주문량합계; -- with roolup은 group by절 다음에 옴 

-- having 절 
-- 도서 테이블에서 가격이 25000원 이상인 도서에 대하여 출판사별로 도서 (종류, 도서명)수 합계 출력 
select pubNo, count(*) from book 
where bookPrice>=25000
group by pubNo;

-- 출판사 별로 그룹화한 후 조건 추가 : having 조건  
-- 단 '도서 수 합계'가 2이상인 경우
select pubNo, count(*) from book 
where bookPrice>=25000
group by pubNo
having count(*) >=2;

-- 연습문제 
-- 1. 도서 테이블에서 가격 순으로 내림차순 정렬하여,  도서명, 저자, 가격 출력 (가격이 같으면 저자 순으로 오름차순 정렬)
select bookName, bookAuthor, bookPrice from book 
order by bookPrice desc, bookAuthor;

-- 2. 도서 테이블에서 저자에 '길동'이 들어가는 도서의 총 재고 수량 계산하여 출력
select sum(bookStock) as "총 재고 수량" from book
where bookAuthor like '%길동%';

-- 3. 도서 테이블에서 ‘서울 출판사' 도서 중 최고가와 최저가 출력 
select max(bookPrice) as 최고가 , min(bookPrice) as 최저가 from book
where pubNo='1';

-- 4. 도서 테이블에서 출판사별로 총 재고수량과 평균 재고 수량 계산하여 출력 (‘총 재고 수량’으로 내림차순 정렬)
select pubNo, sum(bookStock) as "총 재고수량" , round(avg(bookStock),2) as "총 평균 수량" 
from book 
group by pubNo
order by 2 desc;

-- 올림 : ceil()
select pubNo, sum(bookStock) as "총 재고수량" , ceil(avg(bookStock),2) as "총 평균 수량" 
from book 
group by pubNo
order by 2 desc;

-- 내림 : floor()
select pubNo, sum(bookStock) as "총 재고수량" , floor(avg(bookStock),2) as "총 평균 수량" 
from book 
group by pubNo
order by 2 desc;


-- 5. 도서판매 테이블에서 고객별로 ‘총 주문 수량’과 ‘총 주문 건수’ 출력. 단 주문 건수가 2이상인 고객만 해당
select * from bookSale;

select clientNo, sum(bsQty) as "총 주문 수량", count(*) as "총 주문 건수" from bookSale
group by clientNo
having  count(*)>=2; 
