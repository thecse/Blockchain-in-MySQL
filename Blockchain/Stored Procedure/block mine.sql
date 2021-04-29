delimiter //
CREATE PROCEDURE block_mine(in difficulty int, in block_id int)
begin
		declare prev_block_id int;
        declare created_date_time timestamp;
        declare signature binary(255);
        declare nonce int;
        set nonce=floor(rand(difficulty)*10);
        set prev_block_id=block_id-1;
        set created_date_time = current_timestamp();
        
            set signature = compute_signature(block_id,
							prev_block_id, block_id-1,
                            nonce, difficulty,
                            created_date_time, 1);
		
        update block set block_signature=signature, nonce=nonce, 
						difficulty=difficulty where block.block_id = block_id;
end
//