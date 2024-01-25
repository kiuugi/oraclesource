
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
WHERE SAL BETWEEN 2000 AND 3000;

SELECT *
FROM EMP e 
WHERE SAL NOT BETWEEN 2000 AND 3000;

-- LIKE 연산자와 와일드 카드(_, %)
-- _ : 문자 하나, % : 문자 개수는 무한대
-- 사원 이름이 S로 시작하는 사원 조회
SELECT *
FROM EMP e 
WHERE ENAME LIKE 'S%';

-- 사원 이름의 2번쨰 글자가 L인 사원 조회
SELECT *
FROM EMP e 
WHERE ENAME LIKE '_L%';

-- 사원 이름의 AM 문자가 포함된 사원 조회
SELECT *
FROM EMP e 
WHERE ENAME LIKE '%AM%';

--사원 이름에 AM 문자가 포함되는 않은 사원 조회
SELECT *
FROM EMP e 
WHERE ENAME NOT LIKE '%AM%';
----------
SELECT *
FROM EMP e ;
-- NULL : 값이 없는 상태 (값이 0은 아님) // '': 빈값 // ' ' : 스페이스바도 문자임

--comm 이 null인 사원 조회/null 비교 : IS ("="사용x)
SELECT *
FROM EMP e 
WHERE COMM IS NULL; 

--MGR NULL 인 사원 조회
SELECT *
FROM EMP e 
WHERE MGR IS NULL;

SELECT *
FROM EMP e 
WHERE MGR IS NOT NULL;

--집합 연산자 
--합집합(UNION, UNIONALL), 교집합(INTERSECT), 차집합(MINUS)

--부서 번호가 10 혹은 20사원 조회
--OR사용 또는 합집합으로도 가능
--집합연산자 UNION을 사용할 때 출력 열 개수, 타입 동일
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP e 
WHERE DEPTNO = 10
UNION  --두개의 구문을 합침(조회하는 열 갯수와 타입(테이블 안에있는 데이터 타입 // NUMBER, VARCHAR2)이 동일해야함)
SELECT EMPNO, ENAME, SAL, DEPTNO 
FROM EMP e 
WHERE DEPTNO = 20;

--
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP e 
WHERE DEPTNO = 10
UNION 
SELECT SAL , JOB , SAL, DEPTNO 
FROM EMP e 
WHERE DEPTNO = 20;

-- 결과값에 중복 제거
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP e 
WHERE DEPTNO = 10
UNION 
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP e 
WHERE DEPTNO = 10;

--중복된 결과 값 제거 않함 
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP e 
WHERE DEPTNO = 10
UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP e 
WHERE DEPTNO = 10;


--MINUS //차집합
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP e 
MINUS --뒤에있는 SELECT문을 빼고
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP e 
WHERE DEPTNO = 10;

--INTERSECT // 교집합
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP e 
INTERSECT 
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP e 
WHERE DEPTNO = 10;


--오라클 함수 (내장함수//오라클이 제공하는 함수)
--함수는 사용하는 DBMS 에 따라 다르게 제공
--1. 문자 함수
--대소문자 변경, 

SELECT *
FROM EMP e 
WHERE LOWER(ENAME) ='clark';

SELECT *
FROM EMP e 
WHERE ENAME =UPPER('clark');

-- UPPER(문자열) : 괄호 안 문자를 모두 대문자로 변환하여 반환
-- LOWER(문자열) : 괄호 안 문자를 모두 소문자로 변환하여 반환
--INIRCAP(문자열) : 괄호 안 첫번째 문자를 대분자로 변환하여 반환
SELECT ENAME , UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)  
FROM EMP e ;

--2. 문자열 길이 : LENGTH, LENGTHB
-- LENGTHB : 문자열에 사용된 바이드 수 반환
SELECT ENAME, LENGTH (ENAME), LENGTHB(ENAME) 
FROM EMP e ;
--함수 결과를 보고싶은데 테이블이 없으면 임시 테이블로 DUAL 사용
--(오라클xe버전에서) 한글은 문자 하나당 3byte 할당, 영어 1byte
SELECT  LENGTH('한글'), LENGTHB('한글')  FROM DUAL ;

--직책 이름이 6글자 이상인 사원 조회
SELECT *
FROM EMP e 
WHERE LENGTH (JOB) >= 6;

--3. 문자열 일부 추출 : SUBSTR(문자열데이터, 시작위치, 추출길이)
--추출 길이 생략시 시작위치부터 마지막까지출력.
--시작위치가 음수(-)라면 오른쪽 끝부터 시작.
SELECT JOB, SUBSTR(JOB,1,2), SUBSTR(JOB,3,2), SUBSTR(JOB,5)  
FROM EMP e ;

SELECT JOB, SUBSTR(JOB,-1,2), SUBSTR(JOB,-3,2), SUBSTR(JOB,-5)  
FROM EMP e ;

-- 4. INSTR(문자열데이터, 위치를 찾으려는 문자, 시작위치, 시작위치에서 몇번째 위치에 있는 문자를 찾을지)
-- 문자열 데이터 안에서 특정 문자 위치 찾기
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTER_1,
	   INSTR('HELLO, ORACLE!', 'L', 5) AS INSTER_2,
	   INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTER_3
FROM DUAL ;

--사원 이름에 S가 들어있는 사원 조회
--LIKE로도 가능
SELECT *
FROM EMP e 
WHERE INSTR(ENAME,'S') > 0;

--5. REPLACE : 특정 문자를 다른 문자로 변경
-- REPLACE(문자열 데이터, 찾는 문자, 변경할 문자)
SELECT '010-1234-5678' AS REPLACE_BEFPRE,
		REPLACE('010-1234-5678', '-', '') AS REPLACE_1,
		REPLACE('010-1234-5678', '-') AS REPLACE_2,
		REPLACE('010-1234-5678','-', '  ') AS REPLACE_3
FROM DUAL ;

-- 6. CONCAT : 두 문자열 데이터를 합하는 함수
--			CONCAT (문자열 데이터1, 문자열 데이터2) // 두가지만 가능
--SELECT CONCAT(EMPNO,ENAME), CONCAT(EMPNO,ENAME,JOB)  
--FROM EMP e 
--WHERE ENAME = 'SCOTT';

-- 7369 : SMITH
SELECT CONCAT(EMPNO,ENAME), CONCAT(EMPNO, CONCAT(' : ',ENAME)) 
FROM EMP e 
WHERE ENAME = 'SMITH';


-- || (연결할때 사용)
SELECT EMPNO|| ' : '||ENAME 
FROM EMP e 
WHERE ENAME = 'SMITH';

-- 7. TRIM : 공백 제거(기본)
-- TRIM(삭제옵션(선택), 삭제할문자) FROM 원본문자열
-- 'SMITH' = 'SMITH '
SELECT '[' || ' __Oracle__ ' || ']' AS  trim,
	   '[' || TRIM(' __Oracle__ ') || ']' AS  trim
FROM DUAL ;

SELECT '[' || ' __Oracle__ ' || ']' AS  trim,
	   '[' || TRIM(LEADING '_' FROM'__Oracle__') || ']' AS  TRIM_LEADING,
	   '[' || TRIM(TRAILING '_' FROM'__Oracle__') || ']' AS  TRIM_TRAILING,
	   '[' || TRIM(BOTH '_' FROM'__Oracle__') || ']' AS  TRIM_BOTH
FROM DUAL ;


SELECT  '[' || (' __Oracle__ ') || ']' AS  trim,
		'[' || TRIM(' __Oracle__ ') || ']' AS  trim,
		'[' || LTRIM(' __Oracle__ ') || ']' AS  trim,--왼쪽 공백제거
		'[' || RTRIM(' __Oracle__ ') || ']' AS  trim --오른쪽 공백제거
FROM DUAL;


--2. 숫자함수 : 숫자 데이터에 적용하는 함수
-- 반올림, 올림, 버림, 나머지 값, ...
-- ROUND, CEIL, FLOOR, TRUNC, MOD

--ROUND(숫자,반올림 위치) : 반올림
	   	--/-3-2-1.0123(자리수)
SELECT  ROUND(1234.5678) AS ROUND, 
		ROUND(1234.5678,0) AS ROUND1,
		ROUND(1234.5678,1) AS ROUND2,
		ROUND(1234.5678,2) AS ROUND3,
		ROUND(1234.5678,-1) AS ROUND_MINUS1,
		ROUND(1234.5678,-2) AS ROUND_MINUS2
FROM DUAL ;

--TRUNC(숫자, 버릴위치)
SELECT
	TRUNC(1234.5678) AS TRUNC,
	TRUNC(1234.5678, 0) AS TRUNC0,
	TRUNC(1234.5678, 1) AS TRUNC1,
	TRUNC(1234.5678, 2) AS TRUNC2,
	TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
	TRUNC(1234.5678, -2) AS TRUNC_MINUS2
FROM
	DUAL;

--CEIL, FLOOR : 지정한 숫자와 가까운 정수를 찾기
--CEIL : 가까운 정수중에서 지정한 숫자보다 큰 정수중 가장 작은 정수 반환
--FLOOR : 지정한 숫자보다 작은 정수 중 가장 큰 정수 반환
SELECT  CEIL (3.14), FLOOR(3.14), CEIL (-3.14), FLOOR(-3.14)
FROM DUAL;

--MOD : 나머지
SELECT 11/5, MOD(11,5)
FROM DUAL;

--3. 날짜 함수
-- 2023-01-24 OR 2023/01/24

-- 오늘날짜-- 오라클이 설치된 서버의 시스템 시간을 불러옴
SELECT SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP  
FROM DUAL ;

--날짜데이터 + 숫자 : 날짜 데이터보다 숫자만큼 이후의 날짜
SELECT SYSDATE ,SYSDATE +1,SYSDATE -1
FROM DUAL ;
--ADD_MONTHS(날짜,숫자) : 몇개월 이후의 날짜 구하기
SELECT SYSDATE, ADD_MONTHS(SYSDATE,3)  
FROM DUAL;

--입사 30주년이 되는 날짜 구하기
SELECT EMPNO ,ENAME ,HIREDATE ,ADD_MONTHS(HIREDATE,360)
FROM EMP e ;

--MONTHS_BETWEEN(날짜 ,날짜 ) : 두 개의 날짜데이터의 개월 수 차이 구하기
--고용일과 오늘날짜 차이
SELECT
	EMPNO ,
	ENAME ,
	HIREDATE ,
	SYSDATE ,
	MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTHS1,
	TRUNC (MONTHS_BETWEEN(SYSDATE , HIREDATE)) AS MONTHS2
FROM EMP e ;

--NEXT_DAY, LAST_DAY
--NEXT_DAY(날짜, 요일) : 특정 날짜를 기준으로 돌아오는 요일의 날짜 출력
--LAST_DAY(날짜) : 특정 날짜가 속한 달의 마지막 날짜 출력
SELECT SYSDATE ,NEXT_DAY(SYSDATE,'월요일'),LAST_DAY(SYSDATE)
FROM DUAL ;

-- 데이터 타입
-- NUMBER(숫자 자리수, 소수점 자리수 ) VARCHAR2(문자), DATE(날짜)
-- 자료형(데이터 타입) 변환(날짜->문자, 문자->숫자, ...)

--NUMBER + 문자숫자 : 자동 형변환으로 계산 처리.
SELECT EMPNO ,ENAME ,EMPNO + '500'
FROM EMP e 
WHERE ENAME ='FORD';

--에러 +할수 없는 형태가 왔기 때문에 자동 형변환이 이루어지지 않아 에러가 나옴
--SELECT EMPNO ,ENAME ,EMPNO + 'ABCD'
--FROM EMP e 
--WHERE ENAME ='FORD';

--명시적 형변환
--TO_CHAR(날짜(숫자)데이터, '출력되기를 원하는 문자형태') : 숫자, 날짜 데이터를 문자로 변환한다.
--TO_NUMBER(문자열, 숫자형식) : 문자 데이터를 숫자로 변환 
--TO_DATE() : 문자 데이터를 날짜로 변환

--Y : 연도, M : 월, D : 일 HH 시, MI : 분, SS : 초, HH24 : 시를 24시간으로 표기, AM(PM) : 오전, 오후 표기.
SELECT TO_CHAR(SYSDATE, 'YY/MM/DD') ,SYSDATE ,TO_CHAR(SYSDATE, 'YY/MM/DD HH12:MI SS AM')
FROM DUAL ;

SELECT 1300 - '1500', '1300' + 1500
FROM DUAL ;
--숫자에 , 라는 문자가 들어갔기때문에 에러
SELECT '1,300' + '1,500'
FROM DUAL ;
--9 : 숫자의 한 자리를 의미. 중간에,를 3자리마나 들어가는 "형식"을 알려주기 위한 과정

SELECT TO_NUMBER('1,300','9,999,999') + TO_NUMBER('1,500','9,999,999')
FROM DUAL ;
--0 : 빈 자리를 0으로 채움 (자릿값이 없으면 0으로 채움)
SELECT TO_CHAR(sal, '000,999,999.00') AS sall1, TO_CHAR(sal, '999,999.00') AS sall2
FROM EMP e ;

-- TO_DATE(문자,'인식될날짜형태') : 문자 데이터를 날짜 데이터로 변환
SELECT TO_DATE('2024-01-24') AS todate1, TO_DATE('20240124') AS todate2
FROM DUAL ;

SELECT TO_DATE('2024/01/24') - TO_DATE('2023-12-31')
FROM DUAL ;

-- NULL 처리 함수
-- NULL *(연산) 숫자 => NULL
-- NULL 다른 값으로 변경

SELECT EMPNO ,ENAME ,SAL ,COMM ,SAL+COMM 
FROM EMP e ;
-- NVL(널인지 검사할 열이름(데이터), 대체할 데이터)
SELECT EMPNO ,ENAME ,SAL ,COMM, 0 ,SAL+NVL(COMM, 0)
FROM EMP e ;

--NVL2(널인지 검사할 열이름(데이터), NULL이 아닌 경우 반환 데이터(계산식), NULL인 경우 반환 데이터(계산식))
SELECT EMPNO ,ENAME ,SAL, COMM  ,NVL2(COMM, 'O', 'X')  
FROM EMP e ;

--NVL2
--COMM이 널이면 연봉 = SAL * 12,NULL이 아니면 연봉 = SAL*12+COMM
SELECT EMPNO ,ENAME ,SAL, COMM  ,NVL2(COMM, SAL*12+COMM, SAL*12)  AS 연봉
FROM EMP e ;

-- JOB 이 MANAGER 라면 SAL * 1.1 
-- JOB 이 SALESMAN 라면 SAL * 1.05 
-- JOB 이 ANALYST 라면 SAL
-- 나머지 직무는 SAL * 1.03

--DCODE 함수 CASE 문
--DCODE(검사대상, 조건1, 조건1이 참일경우 반환할 결과, 조건2, 조건2 가 참일때 반환할 결과, ... , 조건1 ~ 조건n 일치하지 않는 경우 반환할 결과)
--CASE (검사대상) WHEN '조건1' THEN '조건1이 참일경우 반환할 결과' ... ELSE '조건1 ~ 조건n 일치하지 않는 경우 반환할 결과' END
SELECT
	EMPNO ,
	ENAME ,
	JOB ,
	SAL ,
	DECODE(JOB, 'MANAGER', SAL * 1.1, 'SALESMAN', SAL * 1.05, 'ANALYST', SAL , SAL * 1.03) AS UPSAL
FROM
	EMP e ;

SELECT
	EMPNO ,
	ENAME ,
	JOB ,
	SAL ,
	CASE job WHEN 'MANAGER'THEN SAL * 1.1
	 WHEN 'SALESMAN'THEN SAL * 1.05
	  WHEN 'ANALYSI'THEN SAL
	   ELSE SAL * 1.03
	END AS UPSAL2,
	DECODE(JOB, 'MANAGER', SAL * 1.1, 'SALESMAN', SAL * 1.05, 'ANALYST', SAL , SAL * 1.03) AS UPSAL
FROM
	EMP e ;

-- COMM NULL일때 '해당사항없음' 출력
-- COMM 0일때 '수당없음'
-- COMM > 0 일때' 수당 : COMM'
SELECT EMPNO , ENAME, COMM, 
	   CASE
		    WHEN COMM IS NULL THEN '해당사항없음'
			WHEN COMM = 0 THEN '수당없음'
		  	WHEN 0 < COMM THEN '수당 : ' || COMM  
	   END AS COMM_TEXT
FROM EMP e ;

--1.하루 근무시간 8시간 근무일수 21.5
SELECT EMPNO ,ENAME, SAL ,
		TRUNC(SAL /21.5, 2) AS DAY_PAY,
		ROUND((SAL / 21.5)/8, 1) AS TIME_PAY
FROM EMP e ;
----------------2.
SELECT EMPNO ,ENAME ,HIREDATE ,
		TO_CHAR(NEXT_DAY( ADD_MONTHS(HIREDATE, 3), '월요일'), 'YYYY-MM-DD') AS R_JOB,
		NVL(TO_CHAR(COMM),'N/A') AS COMM 
FROM EMP e ;
-----------3.
SELECT EMPNO ,ENAME ,MGR ,
		CASE WHEN MGR LIKE '75%' THEN '5555'
		WHEN MGR LIKE '76%' THEN '6666'
		WHEN MGR LIKE '77%' THEN '7777'
		WHEN MGR LIKE '78%' THEN '8888'
		WHEN MGR IS NULL THEN '0000'
		ELSE TO_CHAR (MGR) 
		END AS CHG_MGR
FROM EMP e ;
------------3. 간소화 SUBSTR(TO_CHAR(MGR(NUMBER값)),1,2)
SELECT
	EMPNO ,
	ENAME ,
	MGR ,
		CASE
		SUBSTR(TO_CHAR(NVL(MGR, 0)), 1, 2) 
		WHEN '75' THEN '5555'
		WHEN '76' THEN '6666'
		WHEN '77' THEN '7777'
		WHEN '78' THEN '8888'
		WHEN '0' THEN '0000'
		ELSE TO_CHAR (MGR) 
		END AS CHG_MGR
FROM EMP e ;

SELECT EMPNO ,ENAME ,MGR ,
       DECODE(SUBSTR(TO_CHAR(MGR), 1, 2) , NULL, '0000', '75', '5555', '76', '6666', '77', '7777', '78', '8888', SUBSTR(TO_CHAR(MGR),1)) AS CHG_MGR 
FROM EMP e ;

----행 하나를 처리하는 함수 : 단일 행 함수(지금까지 한 함수들)

--다중 행 함수 : 한번에 여러 행의 데이터를 처리하는 함수
--SUM(), AVG(), COUNT(), MEX(), MIN()
--에러 '단일 그룹의 그룹 함수가 아닙니다.' (여러 행이 나올 수 있는 컬럼을 추가한 경우)
SELECT SUM(SAL) ,TRUNC( AVG(SAL), 2) ,COUNT(SAL),MAX(SAL), MIN(SAL), MAX(SAL)-MIN(SAL) --,ENAME(단일 그룹의 그룹함수가 아닙니다.) 
FROM EMP e ;

--동일한 급여(값)를 제외
SELECT SUM(DISTINCT SAL) --전체 더하기
FROM EMP e ;

SELECT COUNT(*) 
FROM EMP e ;

--부서 번호 30번인 사원 수
SELECT COUNT(DEPTNO) , COUNT(*) 
FROM EMP e 
WHERE DEPTNO =30;

--부서 번호가 30인 사원 중에서 급여의 최대값
SELECT MAX(SAL) 
FROM EMP e 
WHERE DEPTNO =30;

--부서 번호가 20인 사원의 입사일 중에서 제일 최근 입사일, 제일 오래된 입사일 조회
SELECT MAX(HIREDATE) ,MIN(HIREDATE) 
FROM EMP e 
WHERE DEPTNO =20;

--부서 번호가 30인 사원 중에서 sal 중복값 제거한 후 평균
SELECT AVG(DISTINCT SAL) 
FROM EMP e 
WHERE DEPTNO =30;

--부서별 급여 합계
SELECT '10' AS DEPTNO SUM(SAL) 
FROM EMP e 
WHERE DEPTNO = 10
UNION 
SELECT '20' AS DEPTNO SUM(SAL) 
FROM EMP e 
WHERE DEPTNO = 20
UNION
SELECT '30' AS DEPTNO SUM(SAL) 
FROM EMP e 
WHERE DEPTNO = 30;

--결과 값을 원하는 열로 묶기 : GROUP BY //에러 GROUP BY 표현식이 아닙니다. GROUP BY 옆에오는 컬럼만 SELECT 절에 사용 가능
SELECT 보고싶은 컬럼(열이름)
FROM (테이블명)
WHERE (조건들 나열)
GROUP BY (그룹화할 열 이름) (HAVING 선택) 
ORDER BY (정렬조건)

--시스템 작동 순서 2 FROM -> 3 WHERE-> 4 GROUP BY-> HAVING-> 1 SELECT -> 5 ORDER BY

SELECT DEPTNO ,SUM(SAL)  
FROM EMP e 
GROUP BY DEPTNO ;

SELECT DEPTNO ,ROUND( AVG(SAL),3 )
FROM EMP e 
GROUP BY DEPTNO 
ORDER BY AVG(SAL); 

--부서번호, 직무별 급여 평균
SELECT DEPTNO ,JOB ,AVG(SAL) 
FROM EMP e 
GROUP BY DEPTNO ,JOB 
ORDER BY DEPTNO;

--HAVING : GROUP BY 절에 조건을 사용할 때
--부서별 직책의 평균 급여가 500 이상인 사원들의 부서번호, 직책, 부서별 직책 평균급여
SELECT DEPTNO ,JOB , AVG(SAL) 
FROM EMP e 
GROUP BY DEPTNO ,JOB  HAVING AVG(SAL) >=500
ORDER BY DEPTNO ,JOB ;

SELECT DEPTNO ,JOB , AVG(SAL) 
FROM EMP e 
WHERE SAL <=3000
GROUP BY DEPTNO ,JOB  HAVING AVG(SAL) >=2000
ORDER BY DEPTNO ,JOB ;

-- 같은 직무에 종사하는 사원이 3명 이상인 직무와 인원수 출력
SELECT JOB ,COUNT(EMPNO) 
FROM EMP e 
GROUP BY JOB HAVING COUNT(EMPNO)>=3
ORDER BY JOB;

--사원들의 입사연도를 기준으로 부서별 몇명이 입사했는지 조회
--년도 -- 부서번호 -- 입사인원수
SELECT TO_CHAR(HIREDATE, 'yyyy') , DEPTNO ,COUNT(*) AS 인원수
FROM EMP e 
GROUP BY TO_CHAR(HIREDATE,'yyyy') , DEPTNO 
ORDER BY DEPTNO;

SELECT TO_CHAR(HIREDATE, 'yyyy')  ,COUNT(*) AS 인원수
FROM EMP e 
GROUP BY TO_CHAR(HIREDATE,'yyyy') 

----------empno 행에 deptno 데이터가 밑으로 출력됨.
SELECT EMPNO
FROM EMP e 
UNION
SELECT DEPTNO 
FROM DEPT d ;
-----------
-- JOIN : 여러 테이블을 하나의 테이블처럼 사용하기 위해 사용
-- 1. 내부조인 (일치하는 값이 있는 경우)
--에러 열의 정의가 애매합니다.//별칭 사용.// DEPTNO가 EMP테이블에도 있고, DEPT 테이블에도 있기떄문.
SELECT ENAME, SAL, DEPTNO , DNAME ,LOC 
FROM EMP e ,DEPT d 
WHERE e.DEPTNO = d.DEPTNO ;

SELECT e.ENAME, e.SAL ,e.EMPNO , d.DNAME ,d.LOC 
FROM EMP e ,DEPT d 
WHERE e.DEPTNO = d.DEPTNO AND e.SAL >=3000;

--조인 조건을 주지 않을 경우 나올 수 있는 모든 조합이 결과로 출력됨
SELECT e.ENAME, e.SAL ,e.EMPNO , d.DNAME ,d.LOC 
FROM EMP e ,DEPT d ;

--SQL-99 표준 구문.
SELECT e.ENAME, e.SAL ,e.EMPNO , d.DNAME ,d.LOC 
FROM EMP e JOIN DEPT d ON e.DEPTNO = d.DEPTNO 
WHERE e.SAL >=3000;


--EMP, SALFRADE 비 등가(내부) 조인.
SELECT DISTINCT *
FROM EMP e ,SALGRADE s 
WHERE e.SAL BETWEEN s.LOSAL AND s.HISAL ;

--EMP, EMP 조인(SELF JOIN)
SELECT e.EMPNO,e.ename,e2.MGR ,e2.ENAME AS MGR_NAME 
FROM EMP e ,EMP e2 
WHERE e.MGR = e2.EMPNO ; -- mgr이 NULL 인 항목은 표시x

-- 2. 외부조인
--  1) 왼쪽 외부조인 : LEFT OUTER JOIN
--  2) 오른쪽 외부조인 : RIGHT OUTER JOIN
-- 일치하지 않는 정보를 어느 테이블 정보를 기준으로 표시할지 결정
SELECT e.EMPNO,e.ename,e.MGR ,e2.ENAME AS MGR_NAME 
FROM EMP e LEFT OUTER JOIN EMP e2 ON e.MGR = e2.EMPNO ;

SELECT e.EMPNO,e.ename,e.MGR ,e2.ENAME AS MGR_NAME 
FROM EMP e RIGHT OUTER JOIN EMP e2 ON e.MGR = e2.EMPNO ;

--각 부서별 평균 급여, 최대 급여, 최소 급여, 사원 수
-- 부서번호, 부서명(d), 평균 급여, 최대 급여, 최소 급여, 사원 수
SELECT e.DEPTNO, d.DNAME  ,MIN(sal), MAX(sal), AVG(sal), COUNT(*) 
FROM EMP e JOIN DEPT d ON e.DEPTNO =d.DEPTNO  
GROUP BY e.DEPTNO,d.DNAME ;

-- 세 개의 테이블 조인하기
SELECT *
FROM
	EMP e1
JOIN EMP e2 ON
	e1.empno = e2.EMPNO
JOIN EMP e3 ON
	e2.empno = E3.EMPNO ;
-- EMP 테이블 전체가 3번 출력됨.

--모든 부서 정보와 사원 정보를 출력
--부서번호, 사원 이름 순으로 정렬하여 출력
--부서번호, 부서명, 사원번호, 사원명, 직무명, 급여
--dept 테이블 기준으로 출력
SELECT d.DEPTNO , d.DNAME ,e.EMPNO ,e.ENAME, e.JOB ,e.SAL  
FROM DEPT d JOIN EMP e ON d.DEPTNO =e.DEPTNO --d테이블과,e테이블에 있는것중 같은것만 출력
ORDER BY d.DEPTNO ,e.ENAME ;

SELECT d.DEPTNO , d.DNAME ,e.EMPNO ,e.ENAME, e.JOB ,e.SAL  
FROM DEPT d LEFT OUTER JOIN EMP e ON d.DEPTNO =e.DEPTNO -- OUTER 생략가능
ORDER BY d.DEPTNO ,e.ENAME ;

SELECT d.DEPTNO , d.DNAME ,e.EMPNO ,e.ENAME, e.JOB ,e.SAL  
FROM EMP e  RIGHT JOIN DEPT d ON d.DEPTNO =e.DEPTNO -- OUTER 생략가능
ORDER BY d.DEPTNO ,e.ENAME ;

--모든 부서 정보와 사원 정보를 출력
--부서번호, 사원 이름 순으로 정렬하여 출력
--부서번호, 부서명, 사원번호, 사원명, 직무명, 급여, LOSAL, HISAL, GRADE
--dept 테이블 기준으로 출력
SELECT d.DEPTNO , d.DNAME ,e.EMPNO , e.ENAME, e.JOB ,e.SAL ,s.LOSAL ,s.HISAL ,s.GRADE  
FROM DEPT d LEFT JOIN EMP e ON d.DEPTNO =e.DEPTNO LEFT JOIN SALGRADE s ON e.SAL BETWEEN s.LOSAL AND s.HISAL
ORDER BY d.DEPTNO ,e.ENAME ;


SELECT
	d.DEPTNO ,
	d.DNAME ,
	e.EMPNO ,
	e.ENAME,
	e.JOB ,
	e.SAL ,
	s.LOSAL ,
	s.HISAL ,
	s.GRADE
FROM
	DEPT d
LEFT OUTER JOIN EMP e ON
	d.DEPTNO = e.DEPTNO
LEFT OUTER JOIN SALGRADE s ON
	e.SAL BETWEEN s.LOSAL AND s.HISAL
ORDER BY
	d.DEPTNO ,
	e.ENAME ;

asdfasdasfasdf






