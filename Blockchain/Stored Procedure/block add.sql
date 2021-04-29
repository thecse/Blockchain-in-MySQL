delimiter //
CREATE PROCEDURE block_add(in block_id int)
begin
	declare prev_block_id int;
    declare signature_version int;
    
    set signature_version = 1;
    if block_id>1 then 
			set prev_block_id = block_id-1;  
            
            insert into block (block_id, prev_block_id, transaction_count, signature_version, created_date_time)
			values (block_id, prev_block_id, block_id, signature_version, current_timestamp());
            update transaction set block_id=block_id where transaction_id=block_id;
	
    else 
		insert into block(block_id, transaction_count, signature_version, created_date_time) values(block_id, block_id, signature_version, current_timestamp());
		update transaction set block_id=block_id where transaction_id=block_id;
    end if;
    end
    //