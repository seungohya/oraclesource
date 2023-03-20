SELECT
    *
FROM
    employees;

SELECT
    first_name,
    last_name,
    job_id
FROM
    employees;

--사원번호 176 LASR NAME
--  연봉이 12000 이상 되는 직원들의 LAST NAME SALARY 조회
-- 연봉이 5000 에서 12000 범위가 아닌 사람들의 LAST NAME ,SALARY 조회

SELECT
    last_name
FROM
    employees
WHERE
    employee_id = 176;

SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary >= 12000;

SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary > 12000
    OR salary < 5000
ORDER BY
    salary;

SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    department_id IN ( 20, 50 )
ORDER BY
    department_id ASC,
    last_name ASC;

SELECT
    last_name,
    salary,
    commission_pct
FROM
    employees
WHERE
    commission_pct IS NOT NULL
ORDER BY
    salary DESC,
    commission_pct ASC;

SELECT
    *
FROM
    employees
WHERE
    salary NOT IN ( 2500, 3500, 7000 )
    AND job_id IN ( 'SA_REP', 'ST_CLERK' );

SELECT
    last_name,
    employee_id,
    hire_date
FROM
    employees
WHERE
    hire_date BETWEEN TO_DATE('2008-02-01', 'YYYY-MM-DD') AND TO_DATE('2008-05-01', 'YYYY-MM-DD')
ORDER BY
    hire_date DESC;

SELECT
    last_name,
    salary
FROM
    employees
WHERE
    department_id IN ( 20, 50 )
    AND salary BETWEEN 5000 AND 12000
ORDER BY
    salary ASC;

SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
--    EXTRACT(YEAR FROM hire_date) = 2004;
    hire_date LIKE '04%';

SELECT
    *
FROM
    employees
WHERE
    salary NOT BETWEEN 2000 AND 3000;

SELECT
    *
FROM
    employees
WHERE
    last_name LIKE '_____';
  
  --2004년도 입사자

SELECT
    employee_id,
    last_name
FROM
    employees
WHERE
    last_name LIKE '%U%';

SELECT
    *
FROM
    employees
WHERE
    last_name LIKE '___a%';

SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%'
    OR last_name LIKE '%e%'
ORDER BY
    last_name ASC;

SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%'
    AND last_name LIKE '%e%'
ORDER BY
    last_name ASC;

SELECT DISTINCT
    department_id
FROM
    employees
WHERE
        job_id = 'ST_CLERK'
    AND department_id IS NOT NULL;

SELECT
    employee_id,
    first_name,
    job_id,
    salary * commission_pct AS commission
FROM
    employees
WHERE
    commission_pct IS NOT NULL;