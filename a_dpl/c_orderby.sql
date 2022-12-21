# order by
# select 문에서 result set에 정렬하기 위해 사용하는 구문
# select문의 가장 마지막에 작성되고, 실행 순서도 가장 마지막

# select문 해석순서 : from -> where -> group by -> having -> select -> order by

# order by 작성
# asc(오름차순) desc(내림차순)
# 만약 칼럼에 null 이 있다면 default로 위에 배치 

# 사원들의 이름, 급여, 보너스를 조회하되 bonus로 오름차순 정렬하시오
select emp_name, salary, bonus , sal_level, dept_code
from employee 
#order by bonus asc;
#내림차순 정렬
#order by bonus desc;
#result set의 두번쨰 컬럼을 기준으로 내림차순 정렬
#order by salary desc;
#order by 2 desc; # 권장하지 않음
# 연봉레벨로 오름차순 정렬, 연봉레벨이 같다면 연봉으로 내림차순 정렬
#order by sal_level asc, salary desc;
#보너스로 오름차순 정렬, null은 뒤에 정렬
order by bonus is null asc, bonus asc;

