delimiter //
CREATE procedure transaction_add(in message_id int, 
							in from_user_id int, 
                            in to_user_id int, 
                            in subject varchar(100),
                            in body varchar(1000))
begin
	declare message_hash varchar(1000);
	declare transaction_hash varchar(100);
	declare hash_version int;
	declare transaction_date_time timestamp;
    set transaction_date_time= current_timestamp();
    set hash_version=1;
    set transaction_hash = compute_hash(message_id, 
										from_user_id, to_user_id, 
                                        subject, body, transaction_date_time,
                                        hash_version);
	set message_hash=sha2(concat(from_user_id, to_user_id, subject,body), 256);
	start transaction;
	insert into message(message_id, from_user_id, to_user_id, subject, body, created_date_time,message_hash, hash_version) 
				values(message_id, from_user_id,  to_user_id, subject, body, transaction_date_time,message_hash, hash_version);
	insert into transaction(transaction_id, transaction_type_id, message_id, 
							transaction_hash, hash_version, transaction_date_time) 
					values (message_id, 1, message_id, transaction_hash, hash_version, transaction_date_time);
	commit;
    end
    //