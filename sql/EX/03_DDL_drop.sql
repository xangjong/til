/*
		테이블 삭제
		- DROP TABLE;
		- 테이블 구조와 데이터 모두 삭제
        - (데이터만 삭제 시 DELETE 문 사용 - DML)
	
    테이블 삭제 시 주의
		- 외래키 제약조건이 설정되어 있는 기준 테이블 삭제 시 오류
        - 외래키 제약조건이 설정되어 있는 테이블 먼저 삭제 후
        - 외래키 제약조건 삭제 후 
        - 기준 테이블 삭제 가능
        
	-- 테이블 삭제 시 외래키 제약조건 확인할 필요 없도록 설정 : 바로 삭제되도록
		SET FOREIGN_KEY_CHECKS = 0; 
        -- 외래키 제약조건 검사 해제하고 테이블 바로 삭제
		
    -- 외래키 제약조건 검사하도록 재설정   
		SET FOREIGN_KEY_CHECKS = 1;
        
*/
-- publisher 테이블 삭제 : 외래키 제약조건 위배 오류 
drop table publisher;

-- 테이블 삭제 시 외래키 제약조건 확인할 필요 없도록 설정 : 바로 삭제 되도록 
set foreign_key_checks =1;

create table publisher ( 
	pubNo char(10) not null primary key,
	pubName varchar(30) not null,
	pubTel varchar(30) not null
);



