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
SELECT
    '      이것이         ',
    TRIM('         이것이         ')
FROM
    dual;

SELECT
    empno,
    ename,
    hiredate,
    add_months(hiredate, 600)
FROM
    emp;

SELECT
    empno,
    ename,
    hiredate
FROM
    emp
WHERE
    months_between(sysdate, hiredate) < 540;

SELECT
    sysdate                AS current_date,
    add_months(sysdate, 6) AS date_in_6_months
FROM
    dual;

SELECT
    empno,
    ename,
    hiredate,
    sysdate,
    trunc(months_between(hiredate, sysdate)) AS months1,
    trunc(months_between(sysdate, hiredate)) AS months2,
    trunc(months_between(sysdate, hiredate)) AS months3
FROM
    emp;

--4) next_day(날짜, 요일): 특정 날짜를 기준으로 돌아오는 요일의 날짜 출력
--last_day(날짜): 특정 날짜가 속한 달의 마지막 날짜를 출력
SELECT
    sysdate,
    next_day(sysdate, 'FRIDAY'),
    last_day(sysdate)
FROM
    dual;

SELECT
    sysdate,
    round(sysdate, 'CC')   AS format_cc,
    round(sysdate, 'YYYY') AS format_yyyy,
    round(sysdate, 'DDD')  AS format_ddd,
    round(sysdate, 'HH')   AS format_hh
FROM
    dual;

SELECT
    round(sysdate, 'cc')
FROM
    dual;
    
    --형변환 함수 : 자료형을 형 변환
    -- number, varchar2 , date 

SELECT
    empno,
    ename,
    empno + '500'
FROM
    emp
WHERE
    ename = 'FORD';

SELECT
    empno,
    ename,
    to_char(empno)
    || 'ABCD' AS empno_abcd
FROM
    emp
WHERE
    ename = 'FORD';

SELECT
    empno,
    ename,
    TO_NUMBER(sal) + nvl(TO_NUMBER(comm),
                         0) AS total_pay
FROM
    emp;

--MON, MONTH,
SELECT
    to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') AS current_datetime,
    to_char(sysdate, 'YYYY')                  AS current_datetime,
    to_char(sysdate, 'MM')                    AS current_datetime,
    to_char(sysdate, 'DD')                    AS current_datetime,
    to_char(sysdate, 'HH12:MI:SS AM ')        AS current_datetime
FROM
    dual;

SELECT
    round(AVG(TO_NUMBER(sal))) AS avg_salary
FROM
    emp;

SELECT
    to_char(round(AVG(TO_NUMBER(sal))),
            '999,999,999')
    || ' 만원' AS avg_salary_with_currency
FROM
    emp;

SELECT
    concat(to_char(sal, '999,999,999'),
           '만원') AS sal_with_unit
FROM
    emp;

SELECT
    empno,
    ename,
    decode(job, 'MANAGER', 'Manager', 'SALESMAN', 'Sales',
           'CLERK', 'Clerical', 'Other') AS job_title
FROM
    emp;

SELECT
    empno,
    ename,
    job,
    sal,
    CASE job
        WHEN 'MANAGER'  THEN
            sal * 1.1
        WHEN 'SALESMAN' THEN
            sal * 1.05
        WHEN 'ANALYST'  THEN
            sal
        ELSE
            sal * 1.03
    END AS new_salary
FROM
    emp;

SELECT
    empno,
    ename,
    job,
    sal,
    to_char(sal * decode(job, 'MANAGER', 1.1, 'SALESMAN', 1.05,
                         'ANALYST', 1, 1.03),
            'L999,999,999') AS new_salary
FROM
    emp
ORDER BY
    job DESC;

SELECT
    empno,
    ename,
    job,
    sal,
    CASE
        WHEN comm IS NULL THEN
            '해당사항 없음'
        WHEN comm = 0 THEN
            '수당없음'
        WHEN comm > 0 THEN
            '수당 : ' || comm
    END AS comm_text
FROM
    emp;

SELECT
    empno,
    ename,
    job,
    sal,
    CASE
        WHEN comm IS NULL THEN
            '해당사항 없음'
        WHEN comm = 0 THEN
            '수당없음'
        WHEN comm > 0 THEN
            '수당 : ' || comm
    END                     AS comm_text,
    to_char(sal * decode(job, 'MANAGER', 1.1, 'SALESMAN', 1.05,
                         'ANALYST', 1, 1.03),
            'L999,999,999') AS new_salary
FROM
    emp
ORDER BY
    job DESC;

SELECT
    empno,
    ename,
    sal,
    trunc(sal / 21.5, 2)     AS day_pay,
    round(sal / 21.5 / 8, 1) AS time_pay
FROM
    emp;

SELECT
    empno,
    ename,
    hiredate,
    to_char(next_working_day, 'DD-MM-YYYY') AS r_job,
    CASE
        WHEN comm IS NULL THEN
            'n/a'
        ELSE
            to_char(comm, '$999,999.99')
    END                                     AS comm_text
FROM
    (
        SELECT
            empno,
            ename,
            hiredate,
            next_day(add_months(hiredate, 3) - 1,
                     'FRIDAY') AS next_working_day,
            comm
        FROM
            emp
    );

SELECT
    empno,
    ename,
    job,
    mgr,
    coalesce(
        CASE substr(mgr, 1, 2)
            WHEN '75' THEN
                '5555'
            WHEN '76' THEN
                '6666'
            WHEN '77' THEN
                '7777'
            WHEN '78' THEN
                '8888'
        END,
        '0000') AS chg_mgr
FROM
    emp;

SELECT
    empno,
    ename,
    job,
    mgr,
    decode(substr(mgr, 1, 2),
           '75',
           '5555',
           '76',
           '6666',
           '77',
           '7777',
           '78',
           '8888',
           '0000') AS chg_mgr
FROM
    emp;

SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
WHERE
    sal <= 3000
GROUP BY
    deptno,
    job
HAVING
    AVG(sal) >= 2000
ORDER BY
    deptno,
    job;
--SELECT 절: "DEPTNO", "JOB", "AVG(SAL)" 컬럼을 선택합니다. "AVG(SAL)"은 각 그룹의 평균 급여를 계산한 결과입니다.
--FROM 절: "EMP" 테이블을 대상으로 쿼리를 수행합니다.
--WHERE 절: "SAL"이 3000 이하인 레코드들만을 선택합니다.
--GROUP BY 절: "DEPTNO"와 "JOB"으로 그룹화합니다.
--HAVING 절: 평균 "SAL" 값이 2000 이상인 그룹들만을 선택합니다.
--ORDER BY 절: "DEPTNO"와 "JOB" 순으로 결과를 정렬합니다.

SELECT
    deptno,
    trunc(AVG(sal)) AS avg_sal,
    MAX(sal)        AS max_sal,
    MIN(sal)        AS min_sal,
    COUNT(*)        AS count_deptno
FROM
    emp
GROUP BY
    deptno;

SELECT
    job,
    COUNT(*) AS emp_count
FROM
    emp
GROUP BY
    job
HAVING
    COUNT(*) >= 3;

SELECT
    EXTRACT(YEAR FROM hiredate) AS hire_year,
    deptno,
    COUNT(*)                    AS emp_count
FROM
    emp
GROUP BY
    EXTRACT(YEAR FROM hiredate),
    deptno;

SELECT
    to_char(hiredate, 'YYYY') AS hire_year,
    deptno,
    COUNT(*)                  AS emp_count
FROM
    emp
GROUP BY
    to_char(hiredate, 'YYYY'),
    deptno;
    
    --서브쿼리
    --sql 문을 실행하는데 필요한 데이터를 추가로 조회하기 위해 sql문 내부에서 사용하는 select 문

--SELECT 조회할 열
--FROM 테이블명
--WHERE 조건식(SELECT 조회할 열 FROM 테이블 WHERE 조건식)

SELECT
    sal
FROM
    emp
WHERE
    ename = 'JONES'; --2975


SELECT
    sal
FROM
    emp
WHERE
    sal > 2975;

SELECT
    sal
FROM
    emp
WHERE
    ename = 'JONES'
    OR sal > (
        SELECT
            MAX(sal)
        FROM
            emp
        WHERE
            sal <= 2975
    );
    
    --사원이름이 allen 인 사원의 추가 수당보다 많은 추가수당을 받는 사원 조회
SELECT
    *
FROM
    emp
WHERE
    comm > (
        SELECT
            comm
        FROM
            emp
        WHERE
            ename = 'ALLEN'
    );

SELECT
    *
FROM
    emp
WHERE
    hiredate < (
        SELECT
            hiredate
        FROM
            emp
        WHERE
            ename = 'WARD'
    );
    
    --20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원정보및
    --부서정보 조회
    -- 사원번호, 사원명, 직무, 급여, 부서번호, 부서명, 지역
SELECT
    e.empno,
    e.ename,
    e.job,
    e.sal,
    d.deptno,
    d.dname,
    d.loc
FROM
         emp e
    INNER JOIN dept d ON e.deptno = d.deptno
WHERE
        e.sal > (
            SELECT
                AVG(sal)
            FROM
                emp
            WHERE
                deptno = 20
        )
    AND e.deptno = 20;

SELECT
    e.empno,
    e.ename,
    e.job,
    e.sal,
    d.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
        e.deptno = 20
    AND e.sal <= (
        SELECT
            AVG(sal)
        FROM
            emp
    );

SELECT
    deptno,
    MAX(sal)
FROM
    emp
GROUP BY
    deptno;

SELECT
    e.empno,
    e.ename,
    e.sal,
    e.deptno
FROM
         emp e
    INNER JOIN (
        SELECT
            deptno,
            MAX(sal) AS max_sal
        FROM
            emp
        GROUP BY
            deptno
    ) max_sal_per_dept ON e.deptno = max_sal_per_dept.deptno
WHERE
    e.sal = max_sal_per_dept.max_sal;

SELECT
    e.empno,
    e.ename,
    e.sal,
    e.deptno
FROM
         emp e
    INNER JOIN dept d ON e.deptno = d.deptno
GROUP BY
    e.empno,
    e.ename,
    e.sal,
    e.deptno
HAVING
    e.sal = MAX(e.sal)
            OVER(PARTITION BY e.deptno);

SELECT
    e.empno,
    e.ename,
    e.sal,
    e.deptno
FROM
         emp e
    INNER JOIN dept d ON e.deptno = d.deptno
WHERE
    e.sal = (
        SELECT
            MAX(sal)
        FROM
            emp
        WHERE
            deptno = e.deptno
    );

SELECT
    *
FROM
    emp
WHERE
    sal IN (
        SELECT
            MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );

SELECT
    *
FROM
    emp
WHERE
    sal < SOME (
        SELECT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );

SELECT
    *
FROM
    emp
WHERE
    sal < ANY (
        SELECT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );

SELECT
    *
FROM
    emp
WHERE
    EXISTS (
        SELECT
            dname
        FROM
            dept
        WHERE
            deptno = 10
    );

SELECT
    e.*,
    d.*
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
    e.job = (
        SELECT
            job
        FROM
            emp
        WHERE
            ename = 'ALLEN'
    );

SELECT
    e.*,
    d.*
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND e.job = (
        SELECT
            job
        FROM
            emp
        WHERE
            ename = 'ALLEN'
    );

SELECT
    e.*,
    d.*,
    s.grade
FROM
    emp      e,
    dept     d,
    salgrade s
WHERE
        e.sal > (
            SELECT
                AVG(sal)
            FROM
                emp
        )
    AND e.deptno = d.deptno
    AND e.sal BETWEEN s.losal AND s.hisal
ORDER BY
    e.sal DESC,
    e.empno ASC;

SELECT
    *
FROM
    emp
WHERE
    ( deptno, sal ) IN (
        SELECT
            deptno, MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );

SELECT
    ename,
    sal
FROM
    (
        SELECT
            ename,
            sal
        FROM
            emp
        WHERE
            sal > 50000
    ) high_paid_employees;

SELECT
    empno,
    ename,
    job,
    sal,
    (
        SELECT
            grade
        FROM
            salgrade
        WHERE
            e.sal BETWEEN losal AND hisal
    ) AS salgrade,
    deptno,
    (
        SELECT
            dname
        FROM
            dept
        WHERE
            e.deptno = dept.deptno
    ) AS dname
FROM
    emp e;

SELECT
    emp.empno,
    emp.ename,
    emp.sal,
    emp.deptno
FROM
    emp,
    (
        SELECT
            deptno,
            AVG(sal) AS avg_sal
        FROM
            emp
        GROUP BY
            deptno
    ) dept_sal_avg
WHERE
        emp.deptno = dept_sal_avg.deptno
    AND emp.sal > dept_sal_avg.avg_sal;


SELECT empno, ename, job, sal,
(SELECT grade FROM salgrade WHERE e.sal BETWEEN losal AND hisal) AS salgrade, deptno,

(SELECT dname FROM dept WHERE ( e.deptno = dept.deptno )  as dname
FROM emp e;

SELECT e.empno,e.ename,e.job, d.deptno,d.dname,d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno AND e.deptno = 10 AND not EXISTS (
    SELECT *
    FROM emp
    WHERE deptno = 30 AND job = e.job
);

SELECT e.empno, e.ename, e.sal, sg.grade, e.deptno
FROM emp e, salgrade sg
WHERE e.sal > (
    SELECT MAX(sal)
    FROM emp
    WHERE job = 'SALESMAN'
) AND e.sal BETWEEN sg.losal AND sg.hisal

ORDER BY e.empno ASC;

SELECT e.empno, e.ename, e.sal, sg.grade, e.deptno
FROM emp e , salgrade sg
WHERE e.sal > all(
    SELECT sal
    FROM emp
    WHERE job = 'SALESMAN'
) AND e.sal BETWEEN sg.losal AND sg.hisal
ORDER BY e.empno ASC;
