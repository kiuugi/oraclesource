-- scott 권한 부여
GRANT CONNECT, resource TO scott;
GRANT CREATE VIEW TO scott;
-- 지금까지 한 일.
-- 오라클 설치 DBMS = 데이터베이스 서버(요청을 받아들이는곳) SQL Plus 응용 프로그램도 같이 설치됨.
-- DBeaver 섶치 - 오라클 서버 연결을 하고 SQL 문을 수행할 수 있도록 처리하는 편집기.
-- DBeaver = SQL Plus 대체 (편집기 역할을 하는 소프트웨어는 많이 존재함.)
-- 사용자 추가 - hr(오라클 공식 샘플 계정), scott(hr 계정의 단순화계정) 

--앞으로 할일. SQL - 데이터 베이스 서버에 질의(query)를 할 수 있는 언어
-- 데이터베이스 서버랑 소통하려면 SQL을 알아야 함.
-- SQL은 대소문자 구별하지 않음 - 단, 비밀번호는 대소문자 구별함.
-- 데이터베이스 ->자바 ->자바+데이터베이스 연동 프로그램 ->html + css + javascript + ajax -> spring boot -> 프로젝트

-- 데이터를 저장할 수 있는 저장공간 할당.
ALTER USER SCOTT DEFAULT TABLESPACE USERS;
ALTER USER SCOTT TEMPORARY TABLESPACE TEMP;
ALTER USER SCOTT QUOTA 10M ON USERS;

alter session set "_oracle_script"=true;

-- DBA 권한을 가진 사용자만 사용자를 생성하고 권한을 부여 가능.
-- SYSTEM, sys as sysdba 
-- CREATE USER 아이디 IDENTIFIED BY 비밀번호 ;
-- 공통 사용자 또는 롤 이름이 부적합합니다. // C## 를 아이디앞에붙임 오라클 21c xe버전에서 있는 요청사항
CREATE USER C##test IDENTIFIED BY test ;

-- CREATE SESSION 권한을 가지고 있지 않음; 로그온 거절
--권한부여 
-- SESSION, CREATE(USER, TABLE, SEQUENCE, VIEW, ...)
-- 권한 그룹 => 롤
-- CONNECT, RESOURCE
-- CONNECT(SESSION, CREATE TABLE, CREATE VIEW, ...)
-- RESOURCE(SEQUENCE, 프로시저, 테이블, ...)

-- GRANT 권한이름, ... TO 사용자아이디
-- GRANT 롤이름, ... TO 사용자아이디
GRANT CONNECT, resource TO C##test;

CREATE USER C##test2 IDENTIFIED BY test
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE TEMP
QUOTA 10M ON USERS;

GRANT CONNECT, resource TO C##test2;
-- 유저 생성, 사용할 공간, 공간 크기, 권한 부여

-- REVOKE 취소할 권한 이름, ... FROM 권한을 뺏을 유져 아이디

-- 비밀번호 변경
-- ALTER USER 유저아이디 IDENTIFIED BY 비밀번호;






























