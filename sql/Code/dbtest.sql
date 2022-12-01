 CREATE TABLE department(
        dptNo VARCHAR(10) NOT NULL PRIMARY KEY,
        dptName VARCHAR(30) NOT NULL,
        dptTel VARCHAR(13)
    );

  -- 학생 테이블 생성 
	CREATE TABLE student (
		stdNo VARCHAR(10) NOT NULL PRIMARY KEY,
		stdName VARCHAR(30) NOT NULL,
		stdYear INT DEFAULT 4 CHECK(stdYear >= 1 AND stdYear <= 4),
        stdAddress VARCHAR(50), 
		stdBirthDay DATE,
		dptNo VARCHAR(10) NOT NULL,
        CONSTRAINT FK_student_department FOREIGN KEY (dptNo) REFERENCES department (dptNo)
	);
    
    INSERT INTO department 
	VALUES  ('1', '국어과', '02-1234-1234'),
			('2', '수학과', '02-1111-1111'),
            ('3', '영어과', '02-2222-2222');
    
    INSERT INTO student 
	VALUES  ('2022001', '홍길동', 1, '서울시 강남구', '2020-07-11', '1'),   
			('2021001', '이몽룡', 2, '경기도 안양시', '2019-01-10', '2'),   
			('2020001', '성춘향', 3, '전북 남원시', '2018-05-05', '2'); 