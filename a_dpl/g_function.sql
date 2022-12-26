# FUNCTION
# 1. 문자 관련 함수
# legnth, char_length, substr, instr, concat, replace, trim, lpad, rpad
select length('멀티캠퍼스'), length('multicampus'),
char_length('멀티캠퍼스'),char_length('multicampus')
from dual;

#substr
select substr('multicampus',2);
select substr('rmulticampus',2,4);
select substr('multicampus',-5);
select substr('multicampus',-5,4);

# employee 테이블에서 성별이 남자인 직원들만 조회
select emp_name, emp_no 
from employee
where substr(emp_no, 8,1)in(1,3);

# employee 테이블에서 60년대생인 사원들을 출력하시오
select emp_name, emp_no 
from employee
where substr(emp_no,1,1) like '6%';

#instr
select instr('multicampus','A');

select emp_name, email, substr(email,1,instr(email, '@')-1)
from employee;

#concat
select concat('multicampus', 'mysql', 'easy');
select 'multicampus', 'mysql', 'easy';

# replace
select replace('Multicampus Mysql','M', 'AGG');

# trim
select trim('     multicampus     ');
select trim('z' from 'zzzzzzmulticampuszzzzzz');
select trim(leading 'z' from 'zzzzzzzzzmulticampuszzzzzzzz');
select trim(trailing 'z' from 'zzzzzzzzzmulticampuszzzzzzzz');
select trim(both 'z' from 'zzzzzzzzzmulticampuszzzzzzzz');

# lpad, rpad
select lpad('multicampus', 20, '#');
select rpad('multicapmus', 20, '#');
select rpad(email,30,'#') from employee

#EMPLOYEE 테이블에서 사원명과 주민번호를 조회하시오
#단 주민번호는 생년월일까지만 표시하고 '-'  다음 자리수는 모두 '*'로 바꿔 출력하시오
# EX) 001111-1111111 => 001111-*******
# 3가지 방법으로 풀어보십시오 

select emp_name, rpad(substr(emp_no,1,7),13,'*')
from employee; 
select emp_name, concat(substr(emp_no,1,7),'******')
from employee; 
select emp_name, lpad('******',13,substr(emp_no,1,7))
from employee; 

select emp_name, replace(emp_no, substr(emp_no,8),'******') from employees;

# 2. 숫자 관련 함수
# abs, mod, floor, round, ceil, truncate

#abs
select 

# round
 
 #ceil
 select ceil(10.15);
 
 #truncate
 select truncate(10,55, 1);
 select truncate(10.55, -1);
 
 # 3. 날짜 관련 함수
 # now, datediff, data_add, date_sub, timestampdiff, date, month, year
 
 # now
 select now();
 
 #date_add
 select date_add(now(), interval '1 1:1:1' day_second);
 select date_add(now(), interval 1 day);
 
 # employee 테이블에서 사원들의 입사일로 부터 30개월 이후의 날짜를 조회하시오.
 select hire_date, date_add(hire_date, interval 30 month) from employee; 
 
 # datediff
 # employee 테이블에 사람들의 근무일자를 구해보다.
 # 퇴사한 사람은 뺴자
 select emp_name, datediff(now(), hire_date)
 from employee
 where ent_yn = 'N';
 
 # employee 테이블에서 근속연수를 구하자
 # 퇴사한 사람은 빼자
 select emp_name, timestampdiff(year, hire_date, now())
 from employee;
 
 # year, month, date, hour, minute, second
 select 
 year(now())
 ,  month(now())
 ,  day(now())
 ,  hour(now())
 ,  minute(now())
 ,  second(now());
 
 # 형변환 함수
 # cast
select cast('2022-12-21' as date);
select cast('2022-12-21' as year);
select cast(cast('2022-12-21' as datetime) as time);

# null 처리 
# ifnull

# 실습
# 1. employee 테이블에서 d5 부서의 직원의 이름, 연봉, 보너스를 추가한 연봉을 조회하시오.alter
# 연봉의 별칭은 [연봉] 보너스를 포함한 연봉의 별칭은 [총 연봉]으로 합니다.
# 총 연봉에 null이 나오는 것은 신경쓰지 마세요 

select emp_name, salary*12 as 연봉, salary * (1+ifnull(bonus,0)) * 12 as '총 연봉'
from employee
where dept_code = 'D5' or salary >= 3000000;

# case-when-then
#[표현식]
# case when 조건식 then 결과값
#	   when 조건식 then 결과값
#	   when 조건식 then 결과값
#end
select emp_name, sal_level
, case when salary >= 6000000 and salary < 1000000 then 'S1'
	   when salary >= 5000000 then 'S2'
	   when salary >= 4000000 then 'S3'
	   when salary >= 3000000 then 'S4'
	   when salary >= 2000000 then 'S5'
       when salary >= 1000000 then 'S6'
       else 'S7'
end as sal_level2
from employee;
