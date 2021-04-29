create table message(
	message_id int primary key,
    from_user_id int,
    to_user_id int,
    subject varchar(100),
    body varchar(1000),
    created_date_time datetime,
	message_hash varchar(1000),
    hash_version int,
    foreign key(from_user_id) references user(user_id),
    foreign key(to_user_id) references user(user_id)
    );
 