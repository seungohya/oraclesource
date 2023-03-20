SELECT
    *
FROM
    emp
ORDER BY
    deptno,
    sal DESC;


--[실습] emp 테이블의 모든 열 출력
--empno => employee_no
--ename => employee_name
--mgr => manager
-- sal => salary
-- comm => commission
--deptno => department_no
--부서 번호를 기준으로 내림차순으로 정렬하되 부서번호가 같다면
--사원 이름을 기준으로 오름차순 정렬
SELECT
    *
FROM
    emp
ORDER BY
    deptno DESC,
    ename ASC;

SELECT
    *
FROM
    emp
WHERE
    deptno = 30;

SELECT
    *
FROM
    emp
WHERE
    empno = 7782;

SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';
    
    -- 사원번호가 7499 부서번호가 30

SELECT
    *
FROM
    emp
WHERE
        empno = 7499
    AND deptno = 30;

SELECT
    *
FROM
    emp
WHERE
    deptno = 30
    OR job = 'CLERK';
    
    
  

--산술연산자 : +, -, *, /, mod(나머지- 표준은 아님(오라클에서만 제공))
--비교연산자 :>, >>, <, <=
--등가비교연산자 : =,!=, <◇, ^= (!=, <>, ^= : A값과 B값이 다를 경우 true, 같은 경우 false) 논리부정연산자: NOT
--IN 연산자
--BETWEEN A AND B 연산자
--LIKE연산자와 와일드 카드(_, %)
--IS NULL 연산자
--집합연산자 : UNION(합집합-중복제거), UNION ALL(합집합-중복포함), MINUS(차집합), INTERSECT(교집합)



--연산자 우선순위 
--1) 산술연산자 *,
--2) 산술연산자 +,
--3) 비교연산자
--4) IS NULL, IS NOT NULL, LIKE, IN
--5) BETWEEN A AND B
--6) NOT
--7) AND
--8) OR
--우선순위를 줘야 한다면 소괄호 사용 추천
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;

SELECT
    *
FROM
    emp
WHERE
    ename >= 'F';

SELECT
    *
FROM
    emp
WHERE
    ename <= 'FORZ';

-- JOB 이 MANAGER OR SALESMAN OR CLERK 사원 조회
SELECT
    *
FROM
    emp
WHERE
    job IN ( 'MANAGER', 'SALESMAN', 'CLERK' );

SELECT
    *
FROM
    emp
WHERE
    NOT sal = 3000;

SELECT
    *
FROM
    emp
WHERE
    job NOT IN ( 'MANAGER', 'SALESMAN', 'CLERK' );

SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 10, 20 );

SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%';

SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM%';

-- UNION (동일한 결과값인 경우 중복 제거) UNION ALL (중복제거 안함) :  합집합
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION ALL
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;
    
    
    --MINUS (차집합)
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
MINUS
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 20
INTERSECT
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%S';

SELECT
    empno,
    ename,
    sal
FROM
    emp
WHERE
        job = 'SALESMAN'
    AND deptno = 30
ORDER BY
    sal DESC;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno IN ( 20, 30 )
    AND sal > 2000;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
        deptno = 20
    AND sal > 2000
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
        deptno = 30
    AND sal > 2000;

SELECT
    empno,
    sal,
    deptno
FROM
    emp
WHERE
    ename LIKE '%E%'
    AND deptno = 30
    AND sal BETWEEN 1000 AND 2000;

SELECT
    *
FROM
    emp
WHERE
    comm IS NULL
    AND mgr IS NOT NULL
    AND job IN ( 'MANAGER', 'CLERK' )
    AND ename NOT LIKE '_L%';
    
    -- 오라클 함수
    -- 오라클에서 기본으로 제공하는 내장 함수와 사용자가 필요에 의해 직접 정의한 사용자 정의 함수
    
--1. upper , lower, initcap

SELECT
    ename,
    upper(ename),
    lower(ename),
    initcap(ename)
FROM
    emp;

SELECT
    *
FROM
    emp
WHERE
    ename LIKE upper('%FORD%');

SELECT
    ename,
    length(ename)
FROM
    emp
WHERE
    length(ename) >= 5;
    
-- 사원 이름의 길이가 5이상인 사원 조회

--한글일 때
--dual : sys가 소유하는 테이블(임시 연산이나 함수의 결과 값 확인하는 용도)
--length, lengthb(문자가 사용하는 바이트 수)
--영어 : 문자1 => 1byte, 한글 : 문자 1 => 3 byte

SELECT
    length('한글'),
    lengthb('한글'),
    lengthb('ab')
FROM
    dual;


--3) SUBSTR(문자열데이터, 시작위치, 추출길이): 추출길이 생략 가능
--문자열 일부 추출

SELECT
    job,
    substr(job, 1, 2),
    substr(job, 3, 2),
    substr(job, 5)
FROM
    emp;

SELECT
    ename,
    substr(ename, 3)
FROM
    emp;
    
-- 3) INSTR : 문자열 데이터 안에서 특정 문자 위치 찾기
--INSTR(대상문자열, 위치를 찾으려는 문자열, 대상문자열에서 찾기를 시작할 위치(선택), 시작위치에서 찾으려는 문자가 몇번째인지 지정(선택))\

--hello, oracle 문자열에서 l문자열 찾기
SELECT
    instr('HELLO, ORACLE!', 'L')       AS instr_1,
    instr('HELLO, ORACLE!', 'L', 5)    AS instr_2,
    instr('HELLO, ORACLE!', 'L', 2, 2) AS instr_3
FROM
    dual;
    
    -- replace : 특정문자를 다른 문자로 변경해주는역할
-- replace (문자열 데이터, 찾는문자, 변경문자)

SELECT
    replace('Hello World', 'World', 'Bing')
FROM
    dual;

SELECT
    replace('010-1234-5678', '-', '')
FROM
    dual;

SELECT
    'Hello World' AS str,
    CASE
        WHEN instr('Hello World', 'as') > 0 THEN
            '포함'
        ELSE
            '미포함'
    END           AS result
FROM
    dual;

SELECT
    replace('이것이 Oracle 이다.', '이것이', 'This is')
FROM
    dual;
    
--    concat : 두 문자열 데이터 합치기

SELECT
    concat(empno, ename)
FROM
    emp;

--trim, ltrim,rtrim,: 공백제거
select  '      이것이         ' , trim ('         이것이         ')from dual;
    
