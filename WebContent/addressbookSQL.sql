show databases;
show tables;
use addressbook;

show tables;

create table book (
	id int(11) not null auto_increment,
	name varchar(15) not null,
	email varchar(50) default null,
	comdept varchar(20) not null,
	birth varchar(10) not null,
	tel varchar(20) not null,
	memo varchar(100) not null,
	primary key(id)
)ENGINE=InnoDB default character set=utf8;

desc book;

select * from book;

flush privileges;

