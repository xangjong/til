
-- ALTER 테이블 수정 

-- ALTER TABLE ADD : 열 추가
-- ALTER TABLE ADD 열이름 타입(크기);
-- student 테이블에 stdTel 열 추가
ALTER TABLE student ADD stdTel VARCHAR(13);

describe student;

-- 여러 개의 열 추가 : stdAge, stddAddress2 열 추가
ALTER TABLE student ADD(stdAge VARCHAR(2), stdAddress2 VARCHAR(50));

-- 열의 데이터 형식 변경 : stdAge 열의 데이터 타입을 INT로 변경
ALTER TABLE student MODIFY stdAge INT;

-- 열의 제약조건 변경 : std Name을 NULL 허용으로 변경
ALTER TABLE student MODIFY stdName VARCHAR(20) NULL;

-- 열의 이름 변경 : stdTel에서 stdHp로 변경
-- 주의 : 데이터 타입 적으면 오류 
ALTER TABLE stduent RENAME COLUMN stdTel TO stdHp;

-- 열이름과 데이터 타입 같이 변경
ALTER TABLE student CHANGE stdAddress stdAddress1 VARCHAR(50);

-- 열 삭제 : stdHp 열 삭제
ALTER TABLE student DROP COLUMN stdHp;

-- 여러 개의 열 삭제
ALTER TABLE student DROP stdAge,
					DROP stdAddress1,
                    DROP stdAddress2;

DESCRIBE product;

ALTER TABLE product ADD COLUMN (prdStock INT(20), prdDate DATE);

ALTER TABLE product MODIFY COLUMN prdCompany VARCHAR(30) NOT NULL;

DESCRIBE publisher;

ALTER TABLE publisher ADD COLUMN (pubPhone VARCHAR(20), pubAddress VARCHAR(35));

ALTER TABLE publisher DROP COLUMN pubPhone;

-- -------------------------------------------------------------
/* 제약 조건 삭제 
	- 기본키 / 외래키 제약조건 삭제
    - 기본키 / 외래키 제약조건 추가
    - ON DELETE CASSCADE
    - CHECK 제약조건 추가 / 삭제
    - DEFAULT 제약조건 추가 / 삭제
    
*/ 
-- 기본키 / 외래키 삭제

-- 기본키 삭제 
-- department 테이블의 기본키 삭제
-- : student 테이블에서 외래키 제약조건이 설정되어 있으므로 
-- department의 기본키 삭제 시 오류 
-- -> 먼저 외래키 제약조건을 삭제하고 기본키 삭제 
-- department의 dptNo를 사용하고 있는 외래키로 사용하고 있는 테이블 : student와 professor

-- (1) department 테이블의 기본키 삭제
ALTER TABLE department DROP PRIMARY KEY;
-- 외래키 제약조건에 위배되어 기본키 삭제 안 됨

-- (2) -> 먼저 외래키 제약조건을 삭제하고 
-- student 테이블에서 외래키 제약조건 삭제

ALTER TABLE student 
	DROP CONSTRAINT FK_std_department;
    
-- professor 테이블에서 외래키 제약조건 삭제

ALTER TABLE professor
	DROP CONSTRAINT FK_pro_department;
 
-- (3) 이제 department 테이블의 기본키 삭제됨 
ALTER TABLE department drop primary key;

describe department;

-- ------------------------------ 
-- 기본키 제약조건 추가 
-- department 테이블 
alter table department 
	add constraint PK_department_dptCode
	primary key (dptCode);
 -- 또는  alter table department 
 --	add 
 --	primary key (dptCode);
    
    
-- 테이블에 설정된 제약조건 확인 
select * from information_schema.table_constraints 
where table_schema="sqldb";

select * from information_schema.table_constraints 
where table_schema="sqldb" and table_name ="department";

select * from information_schema.table_constraints 
where table_schema="sqldb" and table_name ="student";

select * from information_schema.table_constraints 
where table_schema="sqldb" and table_name ="professor";

-- 외래키 제약조건 추가 : stduent와 professor 테이블 
alter table student
	add constraint FK_student_department
    foreign key (dptCode) references department (dptCode);
    
alter table professor
	add constraint FK_professor_department
    foreign key (dptCode) references department (dptCode);
    
 -- ----------------------------   
 -- 외래키 이름 지정 안 할시 자동으로 외래키 이름 생성
CREATE TABLE book3 (
	booNo CHAR(10) NOT NULL PRIMARY KEY, -- 기본키 제약 조건 설정
    bookName VARCHAR(30) NOT NULL,
    bookPrice INT DEFAULT 10000 CHECK(bookPrice > 1000),
    bookDate DATE,
    pubNo CHAR(10) NOT NULL,
    FOREIGN KEY (pubNo) REFERENCES publisher (pubNo) -- 외래키 제약 조건 설정
);
select * from information_schema.table_constraints
where table_schema="sqldb" and table_name="book3";

describe book3;

-- ------------------------
-- on delete cascade
-- on delete cascade 제약 조건으로 외래키 제약조건을 설정해야 하므로 
-- 기존 외래키 제약조건 먼저 삭제 후 다시 설정 

select * from information_schema.table_constraints
where table_schema="sqldb" and table_name="student";

alter table student
	drop constraint FK_student_department;

-- on delete cascade 제약 조건으로 외래키 제약조건 다시 설정
alter table student 
	add constraint FK_student_department 
    foreign key (dptCode) references department(dptCode)
    on delete cascade;
-- ------------------------------------    
select * from information_schema.table_constraints
where table_schema="sqldb" and table_name="book";

-- check 제약조건 삭제
-- 현재 book 테이블의 check 제약조건 bookPrice > 1000으로 설정되어있음
-- 데이터 입력해서 확인 : 500 입력 시 오류 
-- 삭제 

alter table book drop constraint book_chk_1; 
-- 데이터 입력해서 확인 : 500 입력 가능

-- check 제약조건 추가
/* 
	주의 ! 기존 데이터가 새로 추가하는 제약조건에 위배되는지 확인
    - 위배될 경우 제약조건 추가 안 됨
    예 : 10,000이 입력되어 있는 경우 제약조건을 100,000 이상으로 설정하면 
		- 10,000이 제약조건에 위배되기 때문에 오류 발생
	--> 데이터 값을 변경하거나 행 자체 삭제

*/
-- 제약 조건을 
alter table book add check (bookPrice>1000);
-- 오류 --> 500 행 삭제 후 다시 추가 -> OK

-- -------------------------- 
-- default 추가 / 삭제 / 수정 
-- 데이터 입력 시 디폴트 10000으로 입력되는지 확인

-- default 변경 : 5000
alter table book modify bookPrice int default 5000;
-- 5000으로 입력되는지 확인

-- default 삭제
alter table book alter bookPrice drop default;
-- 또는 
alter table book alter column bookPrice drop default;

describe book;

-- 데이터 입력해서 확인 : bookPrice 값 안 넣음 --> 오류 
-- default 삭제 후 null 설정 안 하면 입력 시 디폴트 값 입력하라고 오류 
alter table book modify bookPrice int null;
-- 데이터 입력해서 확인 : bookPrice 값 안 넣음 --> OK
