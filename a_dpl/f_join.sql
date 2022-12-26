# join
# 관계형 데이터베이스에서는 데이터의 중복을 최소화하고, 이상현상을 방지하기 위
# 연관된 데이터들을 분리하여 저장하도록 설계한다.
# 필요할 떄 테이블간 join을 통해 원하는 형태의 데이터를 조회한다.

# 모든 직원의 직원번호, 이름, 부서콛, 부서명을 조회
select emp_id emp_name, dept_code
,(select dept_title from DEPARTMENT where dept_id = e.dept_code) as 부서명
from employee e;

select *
from employee e
join department d on(e.dept_code = d.dept_id);

# join 
# cross join, inner join, outter join(left join, right join, full outer join
# cross join
# 	cross join : 조인 조건절의 결과가 무조건 참인 join
#	30만개의 상품데이터와 300만개의 주문 대이터를 cross join하면 ,,, 9000억 개 => DB 사망, 
select *
from employee cross join department
order by emp_id;

# 2. inner join(equals join, 등가 조인)
# 사번, 이럼, 직급코드, 직급명을 출력하시오
select emp_id, emp_name, job_code, job_name
from employee 
join job j using(job_code);

select emp_id, emp_name, e.job_code, job_name
from employee e
join job j on(e.job_code = j.job_code);

# 여러 테이블 join하기
# 모든 사원들의 사번, 이름, 부서명, 근무지이름을 출력하시오
select emp_id, emp_name, dept_title, local_name
from employee
join DEPARTMENT on(DEPT_code = dept_id)
join location on(local_id = local_code);

# ASIA 지역에서 근무하는 급여 500만원 미안의 직원들을 조회
# ASIA 지역 : ASIA1, ASIA2, ASIA3

select emp_name, local_name , salary
from employee
join department on(dept_code = dept_id)
join location on(location_id = local_code);
where salary < 5000000
and local_name like 'ASIA%';

# outer join
# 특정 테이블을 기준으로 join을 수행
# 특정 테이블을 기준으로 join 조건절이 false를 반환하더라도 특정 테이블의 컬럼은 result set에 포함시킨다.
# left join, right join, full outer join

# 부서별 사원수를 조회해보자.
select dept_id, dept_title, count(emp_id)
from department
left join employee on(dept_code = dept_id)
group by dept_id, dept_title
order by dept_id;

select dept_id, dept_title, count(emp_id)
from department 
right join employee on(dept_code = dept_id)
group by dept_id, dept_title
order by dept_id;



# full outher join : let join + right join
# union : 합집합
# 두 result set의 합집합을 반환

select dept_code, dept_title, count(emp_id)
from department
left join employee on(dept_code = dept_id)
group by dept_id, dept_title
order by dept_id;
union
select dept_code, dept_title, count(emp_id)
from department 
right join employee on(dept_code = dept_id)
group by dept_id, dept_title
order by dept_id;

# self join
# 자기 자신과 join
# employee 테이블에서 이름, 부서코드, 관리자 사번, 관리자 이름을 출력하세요
select e.emp_name, dept_code, manager_id
,(select emp_name from employee where emp_id = e.manager_id)
from employee e;

select e.emp_name, e.dept_code, e.manager_id, e2.emp_name
from employee e
left join employee e2 on(e2.emp_id = e.manager_id)
order by e2.emp_name;

