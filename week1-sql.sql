-- ---------------------------------------------------------------------
-- [1장] 데이터베이스와 SQL 
-- ---------------------------------------------------------------------

-- 1. 기존에 같은 이름의 실습 테이블이 있다면 삭제 (반복 실행 방지)
DROP TABLE IF EXISTS sample_db;

-- 2. 실습용 테이블 생성 (DDL: CREATE)
-- 5강에서 언급된 다양한 자료형(INTEGER, VARCHAR, DATE)을 활용하여 테이블 구조를 정의합니다.
CREATE TABLE sample_db (
    no INTEGER,
    name VARCHAR(20),
    age INTEGER,
    city VARCHAR(20),
    registration_date DATE,
    memo VARCHAR(50)
);

-- 3. 실습용 데이터 삽입 (DML: INSERT)
INSERT INTO sample_db (no, name, age, city, registration_date, memo) 
VALUES (1, '홍길동', 25, 'Seoul', '2026-03-16', '데이터베이스 첫걸음');

INSERT INTO sample_db (no, name, age, city, registration_date, memo) 
VALUES (2, '김철수', 30, 'Busan', '2026-03-17', 'SQL 공부 중');

INSERT INTO sample_db (no, name, age, city, registration_date, memo) 
VALUES (3, '이영희', 22, 'Seoul', '2026-03-18', NULL); -- 6강: NULL 값 실습용

INSERT INTO sample_db (no, name, age, city, registration_date, memo) 
VALUES (4, '박민수', 35, 'Incheon', '2026-03-19', '100% 노력파'); -- 8강: 이스케이프 실습용

INSERT INTO sample_db (no, name, age, city, registration_date, memo) 
VALUES (5, '최수빈', 28, 'Jeju', '2026-03-20', 'Hello World!');

-- ---------------------------------------------------------------------
-- [2장] 테이블에서 데이터 검색 (본격적인 SELECT 실습)
-- ---------------------------------------------------------------------

-- [4강] Hello World 실행하기
-- 모든 열 가져오기
SELECT * FROM sample_db;

-- [5강] 테이블 구조 참조하기
-- 테이블의 컬럼 정보 확인
DESC sample_db;

-- [6강] 검색 조건 지정하기
-- 1. 특정 열만 지정해서 가져오기
SELECT name, age FROM sample_db;

-- 2. WHERE 구를 이용한 조건 검색 (나이가 25인 데이터)
SELECT * FROM sample_db WHERE age = 25;

-- 3. 값이 서로 다른 경우 (<> 연산자)
SELECT * FROM sample_db WHERE city <> 'Seoul';

-- 4. NULL 값 검색 (IS NULL / IS NOT NULL)
SELECT * FROM sample_db WHERE memo IS NULL;
SELECT * FROM sample_db WHERE memo IS NOT NULL;

-- 5. 비교 연산자 사용 (나이가 30 이상인 사람)
SELECT * FROM sample_db WHERE age >= 30;

-- [7강] 조건 조합하기
-- 1. AND 조건 (서울에 살면서 나이가 25 이상인 사람)
SELECT * FROM sample_db WHERE city = 'Seoul' AND age >= 25;

-- 2. OR 조건 (번호가 1이거나 2인 사람)
SELECT * FROM sample_db WHERE no = 1 OR no = 2;

-- 3. NOT 조건 (서울에 살지 않는 사람)
SELECT * FROM sample_db WHERE NOT city = 'Seoul';

-- [8강] 패턴 매칭에 의한 검색
-- 1. 전방 일치 ('김'으로 시작하는 이름)
SELECT * FROM sample_db WHERE name LIKE '김%';

-- 2. 부분 일치 (메모에 '데이터'라는 단어가 포함된 사람)
SELECT * FROM sample_db WHERE memo LIKE '%데이터%';

-- 3. 후방 일치 (메모가 '!'로 끝나는 사람)
SELECT * FROM sample_db WHERE memo LIKE '%!';

-- 4. 이스케이프 처리 ('%' 기호 자체를 검색)
-- (데이터 중 '100% 노력파'를 찾기 위해 \% 사용)
SELECT * FROM sample_db WHERE memo LIKE '%100\%%';
