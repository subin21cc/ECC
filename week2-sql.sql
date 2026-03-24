-- ---------------------------------------------------------------------
-- [3장] 정렬과 연산 
-- ---------------------------------------------------------------------

-- (예제 3-1) age 열로 정렬하기
SELECT * FROM sample31;
-- age열의 값을 오름차순으로 정렬하기
SELECT * FROM sample31 ORDER BY age;

-- (예제3-2) DESC와 ASC
-- age열의 값을 DESC로 내림차순 정렬하기
SELECT * FROM sample31 ORDER BY age DESC;
-- age열의 값을 ASC로 오름차순 정렬하기
SELECT * FROM sample31 ORDER BY age ASC;

-- (예제3-8) a열과 b열로 정렬하기
SELECT * FROM sample32 ORDER BY a, b;

-- (예제3-12) LIMIT로 행수 제한하기
-- sample33에 LIMIT 3으로 상위 3건만 취득하기
SELECT * FROM sample33 LIMIT 3;

-- (예제3-15) LIMIT로 두 번째 페이지에 표시할 데이터 취득하기
-- sample33에서 LIMIT 3 OFFSET 3으로 두 번째 페이지 표시
SELECT * FROM sample33 LIMIT 3 OFFSET 3;

-- (예제3-17) SELECT 구로 금액 계산하기
-- 가격*수량으로 금액 계산하기
SELECT *, price * quantity FROM sample34;

-- (예제3-19) WHERE 구에서 계산, 검색하기
SELECT *, price * quantity AS amount FROM sample34 
						WHERE price * quantity >= 2000;

-- (예제3-20) ORDER BY 구에서 금액을 계산하고 내림차순으로 정렬하기
SELECT *, price * quantity AS amount FROM sample34 ORDER BY price * quantity DESC;

-- (예제3-22) ROUND로 반올림
SELECT amount, ROUND(amount) FROM sample341;

-- (예제3-23) ROUND함수의 두 번째 인수를 지정해, 소수점 둘째 자리를 반올림
SELECT amount, ROUND(amount, 1) FROM sample341;

-- (예제3-28) NULL값을 0으로 변환하기
SELECT a, CASE WHEN a IS NULL THEN 0 ELSE a END "a(null=0)" FROM sample37;


-- ---------------------------------------------------------------------
-- [4장] 데이터의 추가, 삭제, 갱신
-- ---------------------------------------------------------------------

-- (예제4-3) sample41 테이블에 행 추가하기
INSERT INTO sample41 VALUES(1, 'ABC', '2014-01-25');

-- (예제4-10) 암묵적으로 디폴트값을 가지는 행 추가하기
INSERT INTO sample411(no) VALUES(3);

-- (예제4-20) NULL 초기화
UPDATE sample41 SET a=NULL;

