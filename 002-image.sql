create table image
(
	id int auto_increment
		primary key,
	image_name varchar(64) null,
	tag varchar(64) null,
	size varchar(32) null,
	upload_time varchar(64) null,
	file_name varchar(64) null,
	is_loaded int default 0 null,
	cpu int null,
	memory int null,
	bandwidth int null
);

