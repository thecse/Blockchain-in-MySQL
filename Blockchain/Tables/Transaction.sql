create table transaction(
	transaction_id int primary key,
    transaction_type_id int,
    message_id int,
    transaction_hash varchar(1000),
    hash_version int,
    block_id int,
    transaction_date_time datetime,
    foreign key (transaction_type_id) references transaction_type(transaction_type_id),
    foreign key (message_id) references message(message_id),
    foreign key (block_id) references block(block_id)
    );