-- scott


-- 오라클은 사용자마다 데이터배이스가 개별로 생성된다.(Schemas)
--XE(오라클 XE 21.x 버전)
--ORCL 오라클의 다른 버전 다운로드 시 기본 데이터베이스 이름

-- SELECT(데이터 조회) 
-- SELECT(조회) (범위) FROM (조회하려는 데이터베이스) 
SELECT * FROM EMP e;
--(e = 없어도 무방)
-- * 전체 필드(컬럼)를 의미함
SELECT *FROM EMP;

SELECT EMPNO, ENAME, JOB FROM EMP e;

-- emp 테이블
-- empno(사원번호), ename(사원명), jop(직책), mgr(매니저번호), hiredate(고용일), sal(급여), comm(보너스)
-- deptno(부서번호)

--emp 테이블에서 사원번호, 매니저번호, 부서번호만 조회
SELECT
	EMPNO,
	MGR,
	DEPTNO
FROM
	EMP;
-- CTRL + SHIFT + F : 쿼리문 정렬
-- EMP 테이블에서 부서번호만(중복 데이터 제거) 조회 (DISTINCT 중복제거)
SELECT DISTINCT 
	DEPTNO
FROM
	EMP e ;
-- 데이터 출력 시 필드명 별칭 부여
SELECT 
	EMPNO AS 사원번호,--원칙상 AS를 붙여야하나 생략 가능
	MGR 매니저번호,
	DEPTNO "부서 번호" --별칭에 공백이 있는경우 (" ") 무조건 사용
FROM
	EMP;

--연봉 계산 /월급 * 12 + 수당/SAL * 12 + CPM
SELECT
	EMPNO, SAL, sal * 12 + comm AS "연봉"
FROM EMP e ;

--정렬 / order by (정렬 기준) 컬럼명 DESC(내림차순) or ASC(오름차순-defailt)
SELECT *
FROM EMP e 
ORDER BY SAL  DESC;

-- emp 테이블에서 empno, ename, sal 조회 (단, empno 내림차순)
SELECT
	empno,
	ename,
	sal
FROM
	EMP
ORDER BY EMPNO DESC ;

--전체조회, 부서번호 오름차순, sal 내림차순
SELECT *
FROM EMP e 
ORDER BY DEPTNO, SAL DESC ; --앞에 있는 DEPTNO 오름차순 정렬된 자료에서 SAL 내림차순 정렬

--조건부여/부서번호가 30번인 사원 조회, sal > 1000이상인 사원 조회
SELECT *
FROM EMP e 
WHERE DEPTNO = 30;

-- SELECT FROM WHERE 은 연달아서 나오고, ORDER BY는 뒤에 몰아넣는다.
SELECT *
FROM EMP e 
WHERE SAL  >= 1000
ORDER BY SAL ;

-- empno가 7782인 사원 조회 (=) 같다, 산술연산자(>, <, +, -, 등)가능
SELECT *
FROM EMP e 
WHERE EMPNO = 7782;

--deptno가 30이고 job이 SALESMAN인 사원조회
--데이터의 저장값(NUMBER),(VARCHAR2),(DATE)
SELECT *
FROM EMP e 
WHERE DEPTNO = 30 AND JOB = 'SALESMAN'; --오라클 명령어는 대소문자 구분x 데이터는 대소문자 구분함.
--JOB의 저장값이 문자열 이기 때문에 ''사용

--사원번호가 7499 이고 부서번호가 30인 사원 조회
SELECT *
FROM EMP e 
WHERE EMPNO =7499 AND DEPTNO =30;

--OR 이거나
--부서번호가 30 이거나 JOB이 SALESMAN 사원 조회
SELECT *
FROM EMP e 
WHERE  JOB = 'SALESMAN' OR DEPTNO =30;

--연봉이 36000 인 사원 조회(SAL *12+COMM=연봉) 
SELECT *
FROM EMP e 
WHERE  SAL *12+COMM =36000;

--문자의 크기 비교도 가능하다/산술연산 기호 기능
--알파벳 순서로 F 다음에 있는
SELECT *
FROM EMP e 
WHERE ENAME >='F';

--문자는 코드(유니코드 (utf-8))로 변환 됨./ A : 65, a : 97
--SAL이 3000이 아닌 사원 조회
SELECT *
FROM EMP e 
WHERE SAL != 3000; -- ~~ 이 아닌 : !=, <>, ^=

--JOB이 MANAGER OR SALESMAN OR CLERK
SELECT *
FROM EMP e 
WHERE JOB  = 'MANAGER' OR JOB ='SALESMAN' OR JOB ='CLERK';

-- IN
SELECT *
FROM EMP e 
WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK')

SELECT *
FROM EMP e 
WHERE JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK')

-- HIRDATE(고용일)가 1981 10 31 이후에 고용된 사원 조회
--날짜 데이터 산술 연산 가능, 날짜 데이터도 (' ') 사용
SELECT *
FROM EMP e 
WHERE HIREDATE >'1981-10-31';

-- BETWEEN A AND B
-- SAL 2000이상 3000이하인 사원 조회
SELECT *
FROM EMP e 
WHERE SAL 2000 BETWEEN AND 3000;









