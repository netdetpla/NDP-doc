create table task
(
	id int auto_increment
		primary key,
	tid int not null,
	task_name varchar(128) null,
	image_id int null,
	param text null,
	priority int null,
	task_status int default 20000 null
);

