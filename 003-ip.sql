create table ip
(
	id int not null
		primary key,
	ip varchar(64) null,
	os_version text null,
	hardware text null,
	lnglat_id int null,
	constraint ip_ip_uindex
		unique (ip)
);

