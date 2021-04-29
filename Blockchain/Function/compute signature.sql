delimiter //
CREATE FUNCTION compute_signature( block_id int, 
							 prev_block_id int,
                             transaction_count int,
                             nonce int,
                             difficulty varbinary(4),
                             created_date_time timestamp,
                             signature_version int
                            ) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
begin

declare sign varchar(100);
     if signature_version>0 then
		set sign= sha2(concat(block_id, transaction_count,
							nonce, difficulty, 
                            created_date_time), 256);
	end if;
    return sign;
end
//