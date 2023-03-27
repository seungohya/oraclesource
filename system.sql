--
2. 테이블 수정: ALTER -1) 열 추가: ADD
ALTER TABLE emp_temp2 ADD HP varchar2(20);
--2) 열 이름 변경 : RENAME
ALTER TABLE emp_temp2 RENAME COLUMN HP TO TEL;

ALTER TABLE EMP_TEMP2 MODIFY EMPNO NUMBER (5);

CREATE TABLE member (
id char(8),
name nvarchar2(10),
addr nvarchar2(50),
nation char(4),
email varchar2(50),
age number(7,2)
);
-- bigo 열 추가
ALTER TABLE member ADD bigo nvarchar2(20);
ALTER TABLE member MODIFY (name nchar(20));
ALTER TABLE member RENAME COLUMN bigo TO remark;
ALTER TABLE member MODIFY (nation VARCHAR2(20));

-- 값 추가
INSERT INTO member (id, name, addr, nation, email, age, remark)
VALUES ('12345678', '홍길동', '서울시 강남구', '대한민국', 'hong@test.com', 30.5, '여기에 비고를 작성하세요.');
DELETE FROM member WHERE nation = '한국';



--데이터 베이스 객체
--테이블, 인덱스, 뷰, 데이터 사전, 시퀀스, 시노님, 프로시저, 함수, 패키지, 트리거
--생성: create, 수정: alter, 삭제: drop
--인덱스: 더 빠른 검색을 도와줌
--인덱스 : 사용자가 직접 특정 테이블 열에 지정 가능 , 기본키 (혹은 unique key) 를 생성하면 인덱스로 지정
-- creat index 인덱스 이름 on 테이블명 (인덱스로 사용할 열이름)

create index idx_emp_sal on emp(sal);

select * from emp;

drop index idx_emp_sal;

select * from (select empno, ename,job,deptno from emp where deptno = 20);

CREATE VIEW emp_view AS
SELECT empno, ename, job, deptno
FROM emp
WHERE deptno = 20;


select * from emp_view;

create view vm_emp_read
as select empno,ename, job from emp with read only;

insert into vm_emp_read values (8888,'baek','sales');

select rownum, e.*
from emp e;

SELECT rownum, e.*
FROM (
  SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
  FROM emp
  ORDER BY sal DESC
) e
WHERE rownum <= 10;


CREATE SEQUENCE seq_emp_id
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 99999
NOCYCLE
CACHE 20;

create table dept_sequence as select * from dept where 1<>1;
CREATE SEQUENCE seq_dept_sequence
START WITH 10
INCREMENT BY 10
MINVALUE 0
MAXVALUE 90
NOCYCLE
CACHE 2;

insert into dept_sequence (deptno, dname, loc)
values (seq_dept_sequence.nextval, 'database', 'seoul');

select * from dept_sequence;

drop sequence seq_dept_sequence;

create table dept_sequence as select * from dept where 1<>1;
CREATE SEQUENCE seq_dept_sequence
START WITH 10
INCREMENT BY 3
MINVALUE 0
MAXVALUE 99
CYCLE
CACHE 2;

select seq_dept_sequence.currval
from dual;

grant public to 'scott';

create table empidx as select * from emp where 1<>1;

DROP SEQUENCE seq_dept_sequence;
rollback;
-- SEOUL 부서 추가
INSERT INTO dept (deptno, dname, loc) VALUES (seq_dept_sequence.nextval, 'DATABASE', 'SEOUL');

-- BUSAN 부서 추가
INSERT INTO dept (deptno, dname, loc) VALUES (seq_dept_sequence.nextval, 'WEB', 'BUSAN');

-- ILSAN 부서 추가
INSERT INTO dept_sequence (deptno, dname, loc) VALUES (seq_dept_sequence.nextval, 'MOBILE', 'ILSAN');
select * from dept_sequence;


CREATE TABLE DEPT_CONST ( deptno NUMBER(2) NOT NULL, dname VARCHAR2(14) NOT NULL,
loc VARCHAR2(13) NOT NULL, constraint deptconst_deptno_pk
 PRIMARY KEY(deptno), constraint deptconst_deptno_unq UNIQUE(dname),
constraint deptconst_loc_nn CHECK(loc IS NOT NULL) );

CREATE TABLE EMP_CONST (
  EMPNO NUMBER(2) CONSTRAINT EMPCONST_EMPNO_PK PRIMARY KEY,
  ENAME VARCHAR2(10) CONSTRAINT EMPCONST_ENAME_NN CHECK (ENAME IS NOT NULL),
  JOB VARCHAR2(9),
  TEL VARCHAR2(20) CONSTRAINT EMPCONST_TEL_UNQ UNIQUE,
  HIREDATE DATE,
  SAL NUMBER(7,2) CHECK (SAL BETWEEN 1000 AND 9999),
  COMM NUMBER(7,2),
  DEPTNO INTEGER(2) CONSTRAINT EMPCONST_DEPTNO_FK REFERENCES DEPT_CONST(DEPTNO)
);

