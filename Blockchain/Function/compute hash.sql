delimiter //
CREATE FUNCTION compute_hash(
	message_id int, 
    from_user_id int,
    to_user_id int,
    subject varchar(100),
    body varchar(1000),
    transaction_date_time timestamp,
    hash_version int) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
begin
		declare hashvalue varchar(100);
        if hash_version>0 then
					set hashvalue=sha2(concat(message_id, 
								from_user_id, 
                                to_user_id, subject, 
                                body, transaction_date_time), 256);
					
			end if;
            return hashvalue;
            end
            //