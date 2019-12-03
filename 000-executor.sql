create table ndp.executor
(
	id int auto_increment
		primary key,
	exec_ip varchar(64) null,
	task_id int null,
	status int null
);

