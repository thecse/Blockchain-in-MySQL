delimiter //
create procedure adduser(in user_id int, in full_name varchar(200))
begin
	insert into user values(user_id, full_name);
end //
