# 날짜타입

insert into tb_type(t_date, t_time, t_datetime, t_timestamp)
values('22-12-23', '12:00:01', '22-12-23 12:00:01', '22-12-23 12:00:01');

select * from tb_type;

#datetime과 timestamp의 차이
# timestamp는 db서버의 timezone을 참조한다.
# 글로벌 서비스를 만들건, 또는 해외의 클라우드 DB를 사용하는 경우 timestamp를 사용하는게 좋다.

#timezoned을 변경하여 확인
set @@session.time_zone = '+00:00';
select t_datetime, t_timestamp from tb_type;

rollback;