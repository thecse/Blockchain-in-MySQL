create table block(
	block_id int primary key,
    block_hash varchar(100),
    prev_block_id int,
    prev_block_hash varchar(100),
    transaction_count int,
    nonce int,
    difficulty int,
    block_signature varchar(1000),
    signature_version int,
    created_date_time datetime,
    foreign key(prev_block_id) references block(block_id)
    );
 