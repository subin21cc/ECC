-- ---------------------------------------------------------------------
-- [5장] 집계와 서브쿼리 
-- ---------------------------------------------------------------------

-- (예제 5-1) sample의 행 개수 구하기
SELECT COUNT(*) FROM sample51;

-- (예제 5-5) DISTINCT로 중복 제거하기
SELECT DISTINCT name FROM sample51;

-- (예제 5-7) SUM으로 quantitiy열의 합계 구하기
SELECT SUM(quantity) FROM sample51;

-- (예제 5-10) MIN, MAX로 최솟값, 최댓값 구하기
SELECT MIN(quantity), MAX(quantity) FROM sample51;

-- (예제 5-14) HAVING을 사용해 검색
SELECT name, COUNT(name) FROM sample51 
GROUP BY name HAVING COUNT(name) = 1;

-- (예제 5-18) 괄호로 서브쿼리를 지정해 삭제
DELETE FROM sample54 WHERE a = (SELECT MIN(a) FROM sample54);

-- (예제 5-19) 서브쿼리의 패턴
-- 패턴 1) 하나의 값을 반환하는 패턴
SELECT MIN(a) FROM sample54;
-- 패턴 2) 복수의 행이 반환되지만 열은 하나인 패턴
SELECT no FROM sample54;
-- 패턴 3) 하나의 행이 반환되지만 열이 복수인 패턴
SELECT MIN(a), MAX(no) FROM sample54;
-- 패턴 4) 복수의 행, 복수의 열이 반환되는 패턴
SELECT no, a FROM sample54;

-- (예제 5-20) SELECT 구에서 서브쿼리 사용하기
SELECT
 (SELECT COUNT(*) FROM sample51) AS sq1,
 (SELECT COUNT(*) FROM sample54) AS sq2;

-- (예제 5-21) SET 구에서 서브쿼리 사용하기
UPDATE sample54 SET a = (SELECT MAX(a) FROM sample54);


-- ---------------------------------------------------------------------
-- [6장] 데이터베이스 객체 작성과 삭제
-- ---------------------------------------------------------------------

-- (예제 6-1) CREATE TABLE로 테이블 작성하기:
CREATE TABLE sample62 (
  no INTGER NOT NULL,
  a VARCHAR(30),
  b DATE);
