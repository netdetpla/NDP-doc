create table port
(
	id int auto_increment
		primary key,
	ip_id int null,
	port int null,
	protocol varchar(4) null,
	service varchar(8) null,
	product varchar(64) null,
	version varchar(64) null
);

