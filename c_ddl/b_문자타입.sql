# char 타입의 데이터를 입력
# char 고정크기 타입, 255바이트

insert into tb_type(t_char) values('Hello World');
select * from tb_type;

#varchar타입의 데이터를 입력
#varchar 가변길이데이터, 65535 byte
insert into tb_type(t_varchar) values('Hello world');
select * from tb_type;

#text
insert into tb_type(t_longtext) values ('Hello world');

rollback;