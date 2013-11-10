delimiter //
create procedure object_insert(IN object_type_id_i integer,
							   OUT object_id_o integer)
begin
	insert into Object(ObjectTypeId) values (object_type_id_i);
	select last_insert_id() into object_id_o;
end; //
delimiter ;
