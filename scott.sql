--SCOTT
--  emp (employee) 테이블 구성 보기
-- 필드명(열이름)   제약조건    데이터타입
-- EMPNO        NOT NULL    NUMBER(4)
--ENAME (사원명) JOB (직책) MGR (직속상관 번호) HIREDATE (입사일)  SAL(급여)   COMM(수당)  DEPTNO(부서번호)    
-- NUMBER : 소수점 자릿수를 포함해서 지정 가능 
-- NUMBER (4) = > 4자리 숫자까지 허용 뜻 ,    NUMBER (8,2) : 전체자리수는 8자리 이며 소수점 2자리 포함 한다는 의미-
--VARCHAR2 : 가변형 문자열 저장
--VARCHAR2 (10) :10BYTE 문자까지 저장 가능 
-- DATE (날짜)
DESC EMP ;
--DNAME (부서 명) LOC (부서위치)
DESC DEPT;
--GRADE (급여등급) LOSAL (최소급여액) HISAL ( 최대 급여액)
DESC SALGRADE;

-- select : 데이터 조회
--조회방식 :  셀렉션( 행단위로 조회) , 프로젝션(열단위로 조회), 조인(두 개 이상의 테이블을 사용하여 조회)
--SELECT 열이름 1, 열이름 2 ...
--FROM 테이블명 ;

--1. EMP 테이블의 전체 열을 조회하고 싶다.
SELECT
    empno,
    ename,
    sal
FROM
    emp;
    
    --2. DEPT 테이블 전체 조회
SELECT
    *
FROM
    dept;
    --3 . DEPT 테이블 안에 부선번호, 지역만 조회
    
     --select distinct - 중복제거
     
     -- 열이 여러개인 경우 묶어서 중복이냐 아니냐를 판단.
SELECT DISTINCT
    job,
    deptno
FROM
    emp;
    
    SELECT ename, sal * 12  AS yearly_salary
FROM emp;